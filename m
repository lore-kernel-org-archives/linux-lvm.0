Message-Id: <4.2.0.58.20000803111053.016d5600@127.0.0.1>
Date: Thu, 03 Aug 2000 11:33:14 -0500
From: "William L. Jones" <jones@tacc.cc.utexas.edu>
Subject: [linux-lvm] Yet another patch to lvm_dir_cache.c
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



linux-2.4-test5 problem.

lvm_dir_cache.c has a minor problem when it scans the output of 
/proc/partitions. It does not correctly skip the rest of the line.  The 
following patch fixes this problem:


[root@xfs lib]# diff -c lvm_dir_cache.c.orig lvm_dir_cache.c
*** lvm_dir_cache.c.orig        Mon Feb 21 20:09:32 2000
--- lvm_dir_cache.c     Thu Aug  3 11:11:04 2000
***************
*** 83,91 ****
      }

      if ( dir_cache == NULL) {
!       if ( ( proc = fopen ( "/proc/partitions", "r")) != NULL) {
            while ( !feof ( proc)) {
!              fscanf ( proc, " %s %s %s %s\n", major, minor, blocks, devname);
                if ( atoi ( major) > 0 && atoi ( major) != LVM_BLK_MAJOR) {
                   lvm_add_dir_cache ( "/dev", devname);
                }
--- 83,91 ----
      }

      if ( dir_cache == NULL) {
!       if (( proc = fopen ( "/proc/partitions", "r")) != NULL) {
            while ( !feof ( proc)) {
!              fscanf ( proc, " %s %s %s %s%*[^\n]s\n", major, minor, 
blocks, devname);
                if ( atoi ( major) > 0 && atoi ( major) != LVM_BLK_MAJOR) {
                   lvm_add_dir_cache ( "/dev", devname);
                }
