Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102211855.f1LItGq04889@webber.adilger.net>
Subject: Re: [linux-lvm] snapshot of Reiserfs
In-Reply-To: <2169260000.982775251@tiny> from Chris Mason at "Feb 21, 2001 12:07:31
 pm"
Date: Wed, 21 Feb 2001 11:55:14 -0700 (MST)
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

Chris, you write:
> On Wednesday, February 21, 2001 09:44:39 AM -0700 Andreas Dilger
> <adilger@turbolinux.com> wrote:
> > Given that the VFS support for the *unlockfs methods is included in 2.4.1,
> > this should probably become something like:
> > 
> > /* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
> > #if LINUX_KERNEL_VERSION >= KERNEL_VERSION(2,4,1)
> > #define     LVM_VFS_ENHANCEMENT
> > #else
> > /* Need to apply a kernel patch to add lockfs/unlockfs VFS methods */
> > /* #define  LVM_VFS_ENHANCEMENT */
> > #endif
> > 
> 
> I like this idea.

Note that I thought the fsync_dev_lockfs() code was added to 2.4.1 when
reiserfs was added.  However, it appears that only the *lockfs pointers
were added to the super_operations, and the actual code that uses them
was NOT added.  This means we can't do the above until fsync_dev_lockfs()
is actually there.

> > Also, if the sync_supers_lockfs() method is changed to call write_super()
> > if write_super_lockfs() doesn't exist, like:
> 
> The fsync_dev_lockfs call does this for us, if there is no
> write_super_lockfs provided, fsync_dev_lockfs is effectively the same as
> calling fsync_dev.

Except that fsync_dev() calls the write_super() method, and fsync_dev_lockfs()
only calls the write_super_lockfs() method if it exists - it does not call
write_super() if write_super_lockfs() does not exist.  If it were changed as
I suggest, then the two would be the same.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
