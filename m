Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104272359.RAA06618@lynx.turbolabs.com>
Subject: Re: [linux-lvm] badblocks handling with LVM
Date: Fri, 27 Apr 2001 17:59:33 -0600 (MDT)
In-Reply-To: <01042519594802.31687@lyta> from "Russell Coker" at Apr 25, 2001 07:59:48 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Andreas Dilger <adilger@turbolinux.com>

Russel Coker writes:
> On Monday 23 April 2001 12:08, Andreas Dilger wrote:
> > As long as the bad blocks are not in the first ~250kB of the partition/disk
> > then LVM doesn't care about it.  However, reiserfs doesn't yet support bad
> > blocks in the filesystem (this is currently under development AFAIK), so
> > this will not help you.
> 
> The problem is that when you move LV's around and make snapshots the bad 
> blocks on the underlieing media will move.  Therefore I think that management 
> of bad blocks possibly should be done in the LVM.

As long as the LVM metadata and the snapshotted blocks themselves don't hit
more bad blocks, the snapshot itself will be fine.  ext2 just allocates all
of the bad blocks to a file, and presumably this file gets no I/O, so just
doing a snapshot of a filesystem with bad blocks is not an issue.

This leaves several other alternatives:
- New LV has bad blocks: no different than bad blocks in a partition, so
  a new ext2 filesystem can handle this via badblocks(8).
- Extended LV has bad blocks in added PEs: you can run badblocks(8) on the
  newly allocated part of the LV (specify a start block) before fs extend
  (can't use e2fsadm in this case).
- pvmove a filesystem to PEs with bad blocks: you are mostly screwed.  If
  you _really_ wanted, you could run badblocks on the PEs (added to a temp
  LV), keep a list of bad blocks, add them to the ext2 filesystem (with
  appropriate math for their new offset inside the LV, etc) before the PE
  is moved, but it is very ugly.  As someone else suggested, you could
  simply add the entire PE to "lvbad", and simply not use them.  If you
  have so many PEs with bad sectors that it uses up a large part of your
  device, it is time to get a new disk (or use RAID with 2 semi-bad disks
  and hope that they don't have 2 bad sectors in the same place).

Cheers, Andreas
-- 
Andreas Dilger                               TurboLabs filesystem development
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
