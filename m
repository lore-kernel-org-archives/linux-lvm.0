Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104140028.f3E0SNqE014656@webber.adilger.int>
Subject: Re: [linux-lvm] What is the the maximum logical volume size?
In-Reply-To: <200104131745.f3DHjGa17509@lvadp.fc.hp.com> "from Andrew Patterson
 at Apr 11, 2001 03:58:09 pm"
Date: Fri, 13 Apr 2001 18:28:23 -0600 (MDT)
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

Andrew PAtterson writes:
> I am tring to figure out what the maximum logical volume size is.

It may be 1 TB or it may be 2TB.  Depends on whether all of the code
in use use uses unsigned longs for block numbers, or if some use signed
longs.  2TB is the outer limit for now (unless you start playing games
inside LVM, to have 4kB hard sector size, and remap to the disk 512 byte
sector size).

Does it really matter?  This is PER LV, so if you really need to have an
LV that large, give it a try and let us know what works.  I've seen a
report of someone with a 1 TB device (some kind of HW RAID, not LVM)
under Linux, so I know that works, but I haven't seen larger yet.

I wouldn't want to be keeping all of my eggs in such a large basket.  I'd
much rather have several smaller filesystems, especially since you STILL
need to fsck on occasion (don't let reiserfs journaling fool you, you can
still have SW/HW problems that will corrupt the filesystem).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
