Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105152124.f4FLOmis021456@webber.adilger.int>
Subject: Re: [linux-lvm] Software RAID and LVM hangs
In-Reply-To: <Pine.LNX.4.31.0105151507530.2334-100000@dgently.hh.suse.de>
 "from Jens Bruckmann at May 15, 2001 03:20:51 pm"
Date: Tue, 15 May 2001 15:24:46 -0600 (MDT)
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

Jens Bruckmann writes:
> I have problems using software-RAID and LVM. We have connected two HP
> XP256 via two fiber channel controllers and want to mirror from one
> storage-box to the other. So I set up a RAID1-device /dev/md0 which
> mirrors from one LUN of the 1st box to another LUN in the 2nd box. After
> that, I set up a VG on that device with one LV.
> 
> So far, all works fine.
> 
> Then we tested, what happens, if one link to one of the two boxes fails
> and we saw, that the software raid does not continue working if one link
> is down. As I understand, the RAID1 should go on working on the second
> copy and do a resync after the failed connection returns (that's what I
> know from HP-UX with MirrorDisk/UX).
> 
> In /proc/mdstat you cannot see any hint, that one link is broken.
> 
> Do you have any solutions for this behaviour. Otherwise it would not make
> any sense to use the software-raid in a high-availability environment.

This should probably be sent to the RAID list, and not the LVM list.  It
does not really have anything to do with LVM.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
