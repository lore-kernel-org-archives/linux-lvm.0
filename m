Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8ACo7331669
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 08:50:07 -0400
Received: from locomotive.unixthugs.org (locomotive.csh.rit.edu
	[129.21.60.149])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i8ACo670005661
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 08:50:06 -0400
Received: from suse.com (checkpoint-out.gate.uni-erlangen.de [131.188.28.69])
	by locomotive.unixthugs.org (Postfix) with ESMTP id 9364E30738
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 08:47:23 -0400 (EDT)
Message-ID: <4141A25C.70701@suse.com>
Date: Fri, 10 Sep 2004 08:47:24 -0400
From: Jeff Mahoney <jeffm@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040500080904010907060305"
Subject: [linux-lvm] [PATCH] Fix for hanging resize on root filesystem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------040500080904010907060305
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hello all -

I recently ran across a bug that was initially suspected to be a
reiserfs bug, but turned out to be (I feel) a problem with the LVM
userspace utilities.

When a user has their root filesystem on an LV and attempts to resize
the LV, the kernel will deadlock while trying to update the atime on the
device node.

The following sequence causes the lockup:
open /dev/somedisk
suspend the dm instance
~   -> *_write_super_lockfs flushes and disallows new transactions
read from /dev/somedisk
~   -> if needed, update atime
~     -> dirty inode
~      -> tries to start transaction and waits for transactions to be
~         allowed again (waits forever, unless the LV is unlocked by
~         another process, which will cease the deadlock but cause the
~         lvresize operation to occur with the dm device active)

The attach patch causes dev_open_flags to add the O_NOATIME to the
open flags, which will avoid the deadlock by not updating the atime.


Note that the resize on the root LV, when using ext3, will succeed most
of the time. This _isn't_ because of correctness, but because it manages
to perform the operations without crossing a 1-second interval. If a
delay is introduced between one of the reads, for example, it will also
deadlock.

The reason I feel this isn't a kernel bug, but rather a userspace bug,
is that the LVM code explicitly suspends the device, and then performs
operations with implicit writes associated with them. The reads/writes
from the device are totally valid, but the inode atime update isn't. The
kernel behavior is as expected.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBQaJcLPWxlyuTD7IRAgmzAJ4h28KLAjeKopQ8/OUkVa7Xg96yTACeL5YI
Z2YrBse1UMvAJEfFMeXKAA8=
=YfD4
-----END PGP SIGNATURE-----

--------------040500080904010907060305
Content-Type: text/x-patch;
 name="lvm2-noatime.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvm2-noatime.patch"

diff -rup LVM2.2.00.15/lib/device/dev-io.c LVM2.2.00.15-devel/lib/device/dev-io.c
--- LVM2.2.00.15/lib/device/dev-io.c	2004-04-16 14:43:29.000000000 -0400
+++ LVM2.2.00.15-devel/lib/device/dev-io.c	2004-09-09 06:35:23.073233392 -0400
@@ -300,6 +300,11 @@ int dev_open_flags(struct device *dev, i
 		flags |= O_DIRECT;
 #endif
 
+#ifndef O_NOATIME
+# define O_NOATIME       01000000
+#endif
+        flags |= O_NOATIME;
+
 	if ((dev->fd = open(name, flags, 0777)) < 0) {
 		log_sys_error("open", name);
 		return 0;

--------------040500080904010907060305--
