Message-ID: <39560230.BD4B8131@mpi-hd.mpg.de>
Date: Sun, 25 Jun 2000 14:59:28 +0200
From: Stefan Helfert <Stefan.Helfert@mpi-hd.mpg.de>
MIME-Version: 1.0
Subject: [linux-lvm] Patch lvmcreate_initrd
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Dear all,

sorry if this is old stuff but I did not find any reference in the
archive.

When trying to install a root partition with lvm and reiserfs on a
notebook, I found that the lvmcreate_initrd script is building a
unusable initrd:
[initrd]./linuxrc needs /bin/mount and /bin/umount, but those won't be
copied.

System: SuSE 6.4, but I rechecked this against the lvm_0.8final.tgz.

With this patch, everything is working fine:
(since my kernel as the SuSE standard kernel does have lvm included in
the kernel, not as module, the script complains about the missing lvm.o.
This could be detected, also...)


Stefan

--- lvmcreate_initrd    Tue Feb 22 03:09:33 2000
+++ lvmcreate_initrd.new        Sun Jun 25 10:56:44 2000
@@ -37,7 +37,7 @@
 DEVRAM=/dev/ram1
 INITRD=/boot/initrd.gz
 INITRDSIZE=8192
-INITRDFILES="/sbin/modprobe /sbin/vgchange /sbin/vgscan /bin/bash
/bin/sh /bin/rm /sbin/insmod /sbin/modprobe /dev/*
/lib/modules/${VERSION}/modules.dep /lib/modules/${VERSION}/block/lvm.o"
+INITRDFILES="/sbin/modprobe /sbin/vgchange /sbin/vgscan /bin/bash
/bin/sh /bin/rm /bin/mount /bin/umount /sbin/insmod /sbin/modprobe
/dev/* /lib/modules/${VERSION}/modules.dep
/lib/modules/${VERSION}/block/lvm.o"
 TMP=/tmp/mnt.$$

 trap "
-- 
I wish there was a knob on the TV to turn up the intelligence. 
There's a knob called brightness, but it doesn't seem to work. 
                                                     Gallagher
