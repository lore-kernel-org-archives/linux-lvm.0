Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2B1Lj826944
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 20:21:45 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2B1Li07009944
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 20:21:44 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id 02EEF7127
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 20:21:44 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01250-02 for <linux-lvm@redhat.com>;
	Wed, 10 Mar 2004 20:21:43 -0500 (EST)
Received: from tleilax.ix.dyndns.org (tleilax.ix.dyndns.org [192.168.1.3])
	by salusa.poochiereds.net (Postfix) with ESMTP id 3AC264FA6
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 20:21:43 -0500 (EST)
From: Jeff Layton <jtlayton@poochiereds.net>
Content-Type: multipart/mixed; boundary="=-07Tp/sZFp7ItasWcCCQe"
Message-Id: <1078968102.3348.20.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] Patch for Miguel Cabeca's lvm2create_initrd script
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar 10 20:19:18 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--=-07Tp/sZFp7ItasWcCCQe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Ok -- I think I have it now (for real this time :-). I've overhauled the
mechanism for cleaning up device entries:

1) we first remove /rootvol/dev/mapper
2) mknod a /rootvol/dev/mapper/control device file
3) chroot to /rootvol, mount /proc, run /sbin/vgmknodes, and umount
/proc

This should make all the correct device entries and vg symlinks under
/dev, and should allow the initrd images to cope with the renumbering of
major/minor numbers, as I've found sometimes happens on kernel upgrades.

Attached is a patch to Miguel's original script. The current one is
available from:

http://poochiereds.net/svn/lvm2create_initrd

As always, comments and/or patches are welcome.
-- 
Jeff Layton <jtlayton@poochiereds.net>

--=-07Tp/sZFp7ItasWcCCQe
Content-Disposition: attachment; filename=lvm2create_initrd.patch
Content-Type: text/x-patch; name=lvm2create_initrd.patch; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Index: lvm2create_initrd.sh
===================================================================
--- lvm2create_initrd.sh	(revision 70)
+++ lvm2create_initrd.sh	(working copy)
@@ -77,7 +77,7 @@
 
 # include in the path some dirs from the real root filesystem
 # for chroot, blockdev
-PATH="/sbin:/bin:/usr/sbin:/usr/bin:/lib/lvm-200"
+PATH="/sbin:/bin:/usr/sbin:/usr/bin:/lib/lvm-200:/initrd/bin:/initrd/sbin"
 PRE="initrd:"
 
 echo "$PRE Remounting / read/write"
@@ -144,6 +144,26 @@
 echo "$PRE Umounting /proc"
 umount /proc
 
+# make /rootvol/proc if it doesn't exist
+if [ ! -d /rootvol/proc ]; then
+    mkdir /rootvol/proc
+fi
+ 
+# remove old /dev/mapper directory
+echo "$PRE Removing old /dev/mapper directory on $rootvol"
+rm -rf /rootvol/dev/mapper
+ 
+# create /dev/mapper/control device on /rootvol
+if test -n "$MAJOR" -a -n "$MINOR" ; then
+    echo "$PRE Creating /dev/mapper/control device on $rootvol"
+    mkdir -p -m 755 /rootvol/dev/mapper
+    mknod -m 600 /rootvol/dev/mapper/control c $MAJOR $MINOR
+fi
+ 
+echo "$PRE Creating LVM2 devices on $rootvol"
+cd /rootvol
+( chroot . sh -c 'mount -t proc none /proc; /sbin/vgmknodes; umount /proc' )
+ 
 echo "$PRE Changing roots"
 cd /rootvol
 mkdir -p initrd

--=-07Tp/sZFp7ItasWcCCQe--
