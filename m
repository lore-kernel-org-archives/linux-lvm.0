Message-ID: <1069800061.3fc3da7d2b6db@netmail.pipex.net>
From: mfty45@dial.pipex.com
Subject: Re: [linux-lvm] LVM2 on 2.4.22. (Fedora core 1 with nptl) 
References: <014d01c3b2f8$be15a930$100119ac@hydro>
In-Reply-To: <014d01c3b2f8$be15a930$100119ac@hydro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Wed Nov 26 08:57:20 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks Lucca and others for responding to my previous request for help.

I am now trying to apply the kernel patches to Fedora Core 1 (2.4.22-
1.2115.nptl). I am using the latest version, downloaded from the sistina.com 
web site (device-mapper-1.00.07 and LVM2.2.00.08). I have massaged the ioctl 
patches, as suggested, and they have applied successfully. There were a few 
mismatches, but they were obvious and easily resolved.

Doing a patch --dry-run -Np1... of thelinux-2.4.22- VFS-lock patch I get this:
patching file drivers/md/lvm.c
Reversed (or previously applied) patch detected!  Skipping patch.
3 out of 3 hunks ignored -- saving rejects to file drivers/md/lvm.c.rej

However, when I look at the source code, this patch is NOT applied - at least 
the way I understand it. I have included both the patch and the relevant 
snippets from the source code below.  I would appreciate it if someone can 
confirm for me that my understanding is correct and that the patch program is 
lying to me. In applying the ioctl patches when it told me some of the patches 
were already applied I checked and they were, so I don't understand why it 
would get it wrong now! If my understanding is correct and the patch has not 
been applied, I will make the changes to the source manually. If anyone has any 
better ideas or explanations I would appreciate hearing them.

Thanks in advance for your help.

P.S. When (if) I get all the patches in, a compiled and bootable kernel and LVM 
seems to be working, I am happy to do a diff between the two kernel source 
trees to create patches for Fedora Core 1, if that would be of interest. Never 
created patches before, so I may need some help. Also, any use of the patches 
would be at your own risk, etc. 

The patch in the linux.2.4.22-VFS-lock.patch file is:
===== drivers/md/lvm.c 1.19 vs edited =====
--- 1.19/drivers/md/lvm.c	Wed Feb  5 21:53:36 2003
+++ edited/drivers/md/lvm.c	Mon Jun  2 14:19:16 2003
@@ -229,9 +229,6 @@
 #define DEVICE_OFF(device)
 #define LOCAL_END_REQUEST
 
-/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
-/* #define	LVM_VFS_ENHANCEMENT */
-
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -2171,12 +2168,8 @@
 	if (lv_ptr->lv_access & LV_SNAPSHOT) {
 		lv_t *org = lv_ptr->lv_snapshot_org, *last;
 
-		/* sync the original logical volume */
-		fsync_dev(org->lv_dev);
-#ifdef	LVM_VFS_ENHANCEMENT
 		/* VFS function call to sync and lock the filesystem */
 		fsync_dev_lockfs(org->lv_dev);
-#endif
 
 		down_write(&org->lv_lock);
 		org->lv_access |= LV_SNAPSHOT_ORG;
@@ -2201,11 +2194,9 @@
 	else
 		set_device_ro(lv_ptr->lv_dev, 1);
 
-#ifdef	LVM_VFS_ENHANCEMENT
 /* VFS function call to unlock the filesystem */
 	if (lv_ptr->lv_access & LV_SNAPSHOT)
 		unlockfs(lv_ptr->lv_snapshot_org->lv_dev);
-#endif
 
 	lvm_gendisk.part[MINOR(lv_ptr->lv_dev)].de =
 	    lvm_fs_create_lv(vg_ptr, lv_ptr);
 	    
The relevant snipets from the source file are:
Hunk 1:
#define DEVICE_OFF(device)
#define LOCAL_END_REQUEST

/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
#define	LVM_VFS_ENHANCEMENT

#include <linux/config.h>
#include <linux/module.h>
#include <linux/kernel.h>

Hunk 2:
	if (lv_ptr->lv_access & LV_SNAPSHOT) {
		lv_t *org = lv_ptr->lv_snapshot_org, *last;

		/* sync the original logical volume */
		fsync_dev(org->lv_dev);
#ifdef	LVM_VFS_ENHANCEMENT
		/* VFS function call to sync and lock the filesystem */
		fsync_dev_lockfs(org->lv_dev);
#endif

		down_write(&org->lv_lock);
		org->lv_access |= LV_SNAPSHOT_ORG;
		
Hunk 3:
	else
		set_device_ro(lv_ptr->lv_dev, 1);

#ifdef	LVM_VFS_ENHANCEMENT
/* VFS function call to unlock the filesystem */
	if (lv_ptr->lv_access & LV_SNAPSHOT)
		unlockfs(lv_ptr->lv_snapshot_org->lv_dev);
#endif

	lvm_gendisk.part[MINOR(lv_ptr->lv_dev)].de =
	    lvm_fs_create_lv(vg_ptr, lv_ptr);
