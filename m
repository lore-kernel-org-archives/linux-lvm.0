Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012111835.eBBIZDs07974@webber.adilger.net>
Subject: Re: [linux-lvm] How do you mount a snapshot?
In-Reply-To: <20001210224808.B3772@archimedes.oak.suse.com> "from David Gould
 at Dec 10, 2000 10:48:08 pm"
Date: Mon, 11 Dec 2000 11:35:13 -0700 (MST)
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

David Gould writes:
> On Fri, Dec 08, 2000 at 09:30:50PM +0100, Christian Limpach wrote:
> > > Ok, so we are agreeing, it does not work on ext2 either unless you sync
> > > and do not write between the sync and the snapshot. Doable, but not
> > exactly
> > > "safe".
> > 
> > hmm, I think it works for ext2 because you can always mount an ext2
> > filesystem even if it's in an inconsistent state.  This is what happens
> > everytime when your machine panics and you need to fsck your disks during
> > the reboot, the root filesystem is mounted read-only...  It's my
> 
> Ok, but then you have an inconsistant filesystem. Which is not exactly
> what I think of as "works" or "safe". My point was that snapshots are
> great, but don't make the problem of consistancy magically disappear.

Actually, the LVM snapshot code does an fsync_dev() call right before
the snapshot is created, so the window in which the filesystem can
become inconsistent is very small.  For ext2 this is relatively safe,
because fsync_dev() will flush everything to disk.  For ext3 and reiserfs,
the fsync_dev() isn't enough because it may only flush the data to the
journal, and these filesystems will (currently) refuse to mount with a
dirty journal on a read-only device.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
