Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012302036.eBUKaMZ04514@webber.adilger.net>
Subject: Re: [linux-lvm] OK to backup physical volume to tape?
In-Reply-To: <3A4D0C25.A4BB534B@xenotrope.com> "from Mits Yanagihashi at Dec
 29, 2000 05:11:49 pm"
Date: Sat, 30 Dec 2000 13:36:22 -0700 (MST)
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Mits writes:
> I have one tape drive that can store 33 GB (uncompressed).  I want to
> backup 130 GB over a 5 day week.  I want my users to see two directories
> "/dir1" and "/dir2", but my tape cannot fit a full dump of either one
> directory.
> 
> This is what I want to do:
> 
> 1. Divide /dev/sda into 5 partitions of 26 GB each.  Make each partition
> a physical volume.  
> 
> 2. Make one volume group.  Add two logical volumes (that together use
> the 5 physical volumes) to the volume group.
> 
> 3. My users can use the two logical volumes (dir1 and /dir2, which may
> be 52 and 78 GB respectively).  Each night a full backup of one physical
> volume, and incrementals of the other four physical volumes are written
> to tape.  One tape can store 26 GB, and still have space for incremental
> backups of the other physical volumes.
> 
> My question is, is it safe to backup the physical volume (i.e. dump
> /dev/sda1 to tape)?  Or are there complications with file system
> state/meta information?

I would definitely NOT back up individual PVs if they are part of a
single filesystem.  There is no way to restore this properly if they
are corrupted, and no way to do incremental backups of the other raw
partitions.

You could use "dump" to do incremental backups of the whole filesystem.
You would need to start with a FULL (level 0) backup at some time. Then
only do incremental backups (level 1) until it fills a whole tape. To
restore, you need to restore the full backup, and the most recent level 1
incremental tape.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
