Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2A25H827723
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 21:05:17 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2A25G07010640
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 21:05:16 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id 7D271BD1F
	for <linux-lvm@redhat.com>; Tue,  9 Mar 2004 21:05:15 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01227-02 for <linux-lvm@redhat.com>;
	Tue, 9 Mar 2004 21:05:15 -0500 (EST)
Received: from tleilax.ix.dyndns.org (tleilax.ix.dyndns.org [192.168.1.3])
	by salusa.poochiereds.net (Postfix) with ESMTP id ECF834D5F
	for <linux-lvm@redhat.com>; Tue,  9 Mar 2004 21:05:14 -0500 (EST)
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <403E8A0E.9070308@ist.utl.pt>
References: <403E8A0E.9070308@ist.utl.pt>
Content-Type: multipart/mixed; boundary="=-rRt/pUDtiCHV8sZCf/Jb"
Message-Id: <1078884314.2919.16.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] Patch for Miguel =?ISO-8859-1?Q?Cabe=E7a's?= lvm2create_initrd
 script
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
Date: Tue Mar  9 21:03:04 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--=-rRt/pUDtiCHV8sZCf/Jb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,
 I recently upgraded the kernel on my box and had an awful time getting
my old initrd image that relies on change_root() to work. I switched to
Miguel's new script and it works great, though I had to make a couple of
tweaks:

 The first one is pretty minor. I have /usr set up as a separate
partition, and debian puts chroot in /usr/sbin. Luckily, chroot is also
a busybox function, so I simply added /initrd/sbin and /initrd/bin to
the PATH so that it could find a working chroot after pivot_root occurs.

 The second one is an ugly hack, and I'm definitely open to better ways
of handling it. After my kernel upgrade (from 2.6.1 to 2.6.4-rc2), the
major number of the device mapper devices on my system changed. So, I
added a hack to copy the contents of the ramdisk /dev/mapper directory
to the /dev/mapper directory on the lvm2 root filesystem, prior to the
pivot_root. It works for me, but I'd love to hear about better ways of
handling this.

I've attached a patch to this email, or you can get the updated script
from:

http://poochiereds.net/svn/lvm2create_initrd

-- 
Jeff Layton <jtlayton@poochiereds.net>

--=-rRt/pUDtiCHV8sZCf/Jb
Content-Disposition: attachment; filename=lvm2create_initrd.patch
Content-Type: text/x-patch; name=lvm2create_initrd.patch; charset=iso-8859-15
Content-Transfer-Encoding: 7bit

Index: lvm2create_initrd.sh
===================================================================
--- lvm2create_initrd.sh        (revision 70)
+++ lvm2create_initrd.sh        (working copy)
@@ -77,7 +77,7 @@
                                                                                
 # include in the path some dirs from the real root filesystem
 # for chroot, blockdev
-PATH="/sbin:/bin:/usr/sbin:/usr/bin:/lib/lvm-200"
+PATH="/sbin:/bin:/usr/sbin:/usr/bin:/lib/lvm-200:/initrd/bin:/initrd/sbin"
 PRE="initrd:"
                                                                                
 echo "$PRE Remounting / read/write"
@@ -141,6 +141,10 @@
        return 0
 fi
                                                                                
+echo "$PRE Copying /dev/mapper devices to $rootvol"
+cd /dev
+tar cf - ./mapper | ( cd /rootvol/dev; tar xvf - )
+
 echo "$PRE Umounting /proc"
 umount /proc
                                                                                

--=-rRt/pUDtiCHV8sZCf/Jb--
