Return-Path: <lvm-bugs-admin@sistina.com>
Return-Path: <steffen.stempel@security.kpnqwest.com>
Message-ID: <3A5B5DC3.3BE6439F@security.kpnqwest.com>
Date: Tue, 09 Jan 2001 19:51:47 +0100
From: "Dr. Steffen Stempel" <steffen.stempel@security.kpnqwest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Resent-To: linux-lvm@sistina.com
Subject: [linux-lvm] Bug in LVM tools 0.9
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm-bugs@sistina.com

Hi,

I've discovered some minor and one serious bug in the LVM-0.9
distribution.
The environment I'm using LVM is:
 - linux-2.4.0 with reiserfs patch applied
 - LVM 0.9 (I've tried debian packages and the source code)
 - a Raid-1 MD device is used as a physical volume

Problems detected:

1. lvm tools have a problem with physical volumes on /dev/md?
   As far as I've figured out, at least the functions pv_get_size
   doesn't handle md devices properly. They try to access the
   partition table just as if the device is an ordinary.
   I've done a "quick and very dirty" patch to check for "/dev/md"
   at the beginning of the device name. It would be fancier to check
   for the major device number of /dev/md? ....

   Another problem with /dev/md devices is in vg_read_from_pv.c:
   if pv_read returns LVM_EPV_READ_MD_DEVICE the function
   vg_read_from_pv should not fail.
   This problem is also solved by the patch

2. at least ``vgchange'' dumps core with segemntation fault if the
   device node for one of the physical volumes can't be accessed. This
   is independent from the /dev/md? problem.

3. The debian pacjet for 0.9 installs a broken /etc/init.d/lvm script:
   Binaries are installed in /usr/sbin, the lvm script looks form
   them in /sbin.

Please note that the patch I've included was indended to make lvm work
in my environment. There might be additional locations which need some
modification in order to make lvm tools work with md devices.

Hope these hints help you to improve lvm - it's very nice work!

Best regards

Steffen Stempel

----------------------------------------------------------------------

diff -cr 0.9/tools/lib/pv_get_size.c 0.9-patched/tools/lib/pv_get_size.c
*** 0.9/tools/lib/pv_get_size.c Mon Nov 13 01:20:11 2000
--- 0.9-patched/tools/lib/pv_get_size.c Sat Jan  6 21:08:33 2001
***************
*** 88,93 ****
--- 88,104 ----
     }
  
     if ( ( cache_entry = lvm_dir_cache_find ( dev_name)) != NULL) {
+      if (!strncmp(dev_name,"/dev/md",7) && isdigit(dev_name[7])) {
+        if ( ( pv_handle = open ( dev_name, O_RDONLY)) == -1) {
+        ret = -LVM_EPV_GET_SIZE_OPEN;
+        }
+        else {
+        ioctl ( pv_handle, BLKGETSIZE, &ret);
+        close(pv_handle);
+        }
+        goto pv_get_size_end;
+      }
+ 
        if ( lvm_check_partitioned_dev ( cache_entry->st_rdev) == TRUE) {
           st_rdev = cache_entry->st_rdev -
                     ( cache_entry->st_rdev %
Only in 0.9-patched/tools/lib: pv_get_size.c~
diff -cr 0.9/tools/lib/vg_read_from_pv.c
0.9-patched/tools/lib/vg_read_from_pv.c
*** 0.9/tools/lib/vg_read_from_pv.c     Mon Nov 13 01:26:33 2000
--- 0.9-patched/tools/lib/vg_read_from_pv.c     Sat Jan  6 21:41:17 2001
***************
*** 32,37 ****
--- 32,38 ----
     static vg_disk_t vg_this;
     pv_t pv_this;
     pv_t *pv_this_ptr = &pv_this;
+    int h;
  
  
  #ifdef DEBUG
***************
*** 45,51 ****
        goto vg_read_from_pv_end;
     }
  
!    if ( pv_read ( pv_name, &pv_this_ptr, NULL) == 0) {
        /* read the VG info */
        if ( ( pv_handle = open ( pv_name, O_RDONLY)) == -1)
           ret = -LVM_EVG_READ_OPEN;
--- 46,53 ----
        goto vg_read_from_pv_end;
     }
  
!    if ( (h=pv_read ( pv_name, &pv_this_ptr, NULL)) == 0 ||
!       h == -LVM_EPV_READ_MD_DEVICE ) {
        /* read the VG info */
        if ( ( pv_handle = open ( pv_name, O_RDONLY)) == -1)
           ret = -LVM_EVG_READ_OPEN;
