From: pamvdam@ramoth.xs4all.nl
Date: Sat, 17 Jun 2000 02:49:51 +0200
Subject: [linux-lvm] LVM patch for linux-xfs-2.4
Message-ID: <20000617024951.A15926@ladystrange.bluehorizon.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=LQksG6bCIzRHxTLp
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii


Hi!

I'm currenlty hacking the latest XFS tree from SGI which is based on
linux kernel 2.4test1 with LVM. Except for the XFS addition this
kernel has more customizations. One of them, stops the LVM tools from working.

Symptoms: vgscan, pvscan, pvcreate and friends aren't able to recogneize
	  any PV's or disks/partitions any more.

The SGI xfs-2.4test1 tree has also an addition which adds some extra fields
to /proc/partitions.

[/proc/partitions]
------------------

shadylady:~# cat /proc/partitions
major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect wuse running use aveq

------------------

The file lvm_dir_cache.c contains routines to parse only 4 fields of this file
and rapidly goes out of sync.

The attached patch solves the problem for all future /proc/partitions additions
unless the format of the first 4 would be changed.

Best regards,

	Pascal van Dam






--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm_dir_cache.c-xfs-patch"

--- 0.8final/tools/lib/lvm_dir_cache.c	Tue Feb 22 03:09:32 2000
+++ 0.8final-xfs/tools/lib/lvm_dir_cache.c	Sat Jun 17 01:27:28 2000
@@ -60,6 +60,7 @@
    char minor[20] = { 0, };
    char blocks[20] = { 0, };
    char devname[30] = { 0, };
+   char procline[127] ;
    static char *devdir[] = {
       "/dev/ida",
       "/dev/ide/hd",
@@ -85,7 +86,8 @@
    if ( dir_cache == NULL) {
       if ( ( proc = fopen ( "/proc/partitions", "r")) != NULL) {
          while ( !feof ( proc)) {
-             fscanf ( proc, " %s %s %s %s\n", major, minor, blocks, devname);
+	     fgets ( procline, 127, proc) ;
+             sscanf ( procline, " %s %s %s %s\n", major, minor, blocks, devname);
              if ( atoi ( major) > 0 && atoi ( major) != LVM_BLK_MAJOR) {
                 lvm_add_dir_cache ( "/dev", devname);
              }

--LQksG6bCIzRHxTLp--
