Return-Path: <mason@suse.com>
Date: Wed, 21 Feb 2001 12:07:31 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <2169260000.982775251@tiny>
In-Reply-To: <200102211644.f1LGiee31545@webber.adilger.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Wednesday, February 21, 2001 09:44:39 AM -0700 Andreas Dilger
<adilger@turbolinux.com> wrote:

> Given that the VFS support for the *unlockfs methods is included in 2.4.1,
> this should probably become something like:
> 
> /* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
> #if LINUX_KERNEL_VERSION >= KERNEL_VERSION(2,4,1)
> #define	LVM_VFS_ENHANCEMENT
> #else
> /* Need to apply a kernel patch to add lockfs/unlockfs VFS methods */
> /* #define	LVM_VFS_ENHANCEMENT */
> #endif
> 

I like this idea.

> Also, if the sync_supers_lockfs() method is changed to call write_super()
> if write_super_lockfs() doesn't exist, like:
> 

The fsync_dev_lockfs call does this for us, if there is no
write_super_lockfs provided, fsync_dev_lockfs is effectively the same as
calling fsync_dev.

-chris
