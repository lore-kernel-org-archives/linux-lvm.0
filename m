Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103170430.f2H4Udr19402@webber.adilger.int>
Subject: Re: [linux-lvm] LVM vs. /proc/partitions
In-Reply-To: <Pine.LNX.4.30.0103161936340.4654-100000@flowers.house.larsshack.org>
 from Lars Kellogg-Stedman at "Mar 16, 2001 07:43:15 pm"
Date: Fri, 16 Mar 2001 21:30:39 -0700 (MST)
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

Lars Kellogg-Stedman writes:
> I have a single logical volume configured on my system.  I'm running 2.4.2
> w/ lvm 0.9.1beta6, devfs, and SGI's xfs patches.  /proc/partition looks
> like this (I've only included the first four columns for brevity):
> 
>   9 0 8887040 md0
>   58 0 8884224 lvma
>   8 0 4444462 scsi/host0/bus0/target1/lun0/disc
>   8 16 4444462 scsi/host0/bus0/target2/lun0/disc
>   [...]
> 
> The problem here is obvious -- there isn't a device file, anywhere, called
> 'lvma'.  There is, on the other hand, /dev/vg0/vol0.  Would making the
> value displayed in /proc/partitions match the (devfs) device node require
> significant work?

The problem is not directly with LVM, but with the fact that Linus doesn't
like the way that LVM set the device name (I don't know why, really).  In
any case, there is code in the 2.2 LVM patch which lets you enable LVM_NAME
and sets the name, but it needs some code in genhd.c or similar to work.
It is totally a "clean code" issue and not a technical one.  Maybe one
of the Sistina folk will add the LVM_NAME part back as a patch fragment
for 2.4?

There was another patch floating around to re-work the device naming, but
I can't find it right now.  I'm not sure if anyone has made an effort to
get that patch in to Linus at all.  It was somewhat nicer than the LVM_NAME
code, as it allowed each block device to generate its own names (a good
idea, IMHO).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
