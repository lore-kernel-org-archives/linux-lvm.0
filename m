Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102211644.f1LGiee31545@webber.adilger.net>
Subject: Re: [linux-lvm] snapshot of Reiserfs
In-Reply-To: <20010221085959.C568@tykepenguin.com> from Patrick Caulfield at
 "Feb 21, 2001 08:59:59 am"
Date: Wed, 21 Feb 2001 09:44:39 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Patrick writes:
> On Tue, Feb 20, 2001 at 11:19:51PM -0500, lvm@winux.com wrote:
> > I am using LVM 0.9.1 beta 5 on Linux 2.4.1 with Reiserfs.
> > I have applied both of the following patches:
> > 
> > 0.9.1_beta5/PATCHES/lvm-0.9.1_beta5-2.4.1.patch
> > 0.9.1_beta5/PATCHES/linux-2.4.1-VFS-lock.patch
> > 
> > Snapshots created when the filesystem is active cannot be mounted.
> > If I `umount' the filesystem before creating the snapshot, all is well.
> 
> Did you remember to uncomment LVM_VFS_ENHANCEMENT in lvm.c ?

Given that the VFS support for the *unlockfs methods is included in 2.4.1,
this should probably become something like:

/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
#if LINUX_KERNEL_VERSION >= KERNEL_VERSION(2,4,1)
#define	LVM_VFS_ENHANCEMENT
#else
/* Need to apply a kernel patch to add lockfs/unlockfs VFS methods */
/* #define	LVM_VFS_ENHANCEMENT */
#endif

Also, if the sync_supers_lockfs() method is changed to call write_super()
if write_super_lockfs() doesn't exist, like:


 		lock_super(sb);
 		if (sb->s_dev && (!dev || dev == sb->s_dev))
-			if (sb->s_op && sb->s_op->write_super_lockfs)
-				sb->s_op->write_super_lockfs(sb);
+			if (sb->s_op) {
+				if (sb->s_op->write_super_lockfs)
+					sb->s_op->write_super_lockfs(sb);
+				else if (sb->s_op->write_super)
+					sb->s_op->write_super(sb);
+			}
 		unlock_super(sb);
	}


then in lvm_do_lv_create we only need to call either fsync_dev() OR
fsync_dev_lockfs(), instead of calling both like is currently done.

#ifdef	LVM_VFS_ENHANCEMENT
		/* VFS call to sync and lock the filesystem (if possible) */
		fsync_dev_lockfs(org->lv_dev);
#else
		/* sync the original logical volume */
		fsync_dev(org->lv_dev);
#endif

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
