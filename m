Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6J5Uja15230
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 01:30:45 -0400
Received: from mail.gurulabs.com (mail.gurulabs.com [67.137.148.7])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6J5Uhe1002808
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 01:30:43 -0400
Subject: Re: [linux-lvm] Cleanly removing a PV from an LV or, how do I get
	more available extents?
From: Dax Kelson <dax@gurulabs.com>
In-Reply-To: <40F99EDF.3070005@menalto.com>
References: <40F99EDF.3070005@menalto.com>
Message-Id: <1090215038.3929.6.camel@mentorng.gurulabs.com>
Mime-Version: 1.0
Date: Sun, 18 Jul 2004 23:30:38 -0600
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 2004-07-17 at 15:49, Bharat Mediratta wrote:
> I've been happily using LVM for a couple of months now to aggregate a 
> bunch of disks together into one logical drive for a Debian box that I 
> use as an over-the-network backup of my various other boxen.  Thus far, 
> it's been great.
> 
> Recently however, I started getting parity errors on one of the drives 
> that's in my logical volume.  It's a tiny drive that I threw in there 
> merely because I had it, and its loss will not be missed.  I just want 
> to remove it altogether and pretend like it never existed.  I'd like to 
> preserve the data that's on the drive, if possible, but if not -- I'm ok 
>   with losing it, since that data will come back next time I run my backups.
> 
> I read the FAQ, the HOWTO and scanned the mailing list archives and it 
> appears that I need to do a pvmove to get the data off of that drive, 
> and then a vgreduce to remove it from the volume group.  Unfortunately, 
> when I try to do the pvmove, I get:
> 
> % pvmove /dev/sdb
> No extents available for allocation
> 
> I'm assuming that this means that there's nowhere to move the data that 
> is on /dev/sdb.  I further assume this means that I need some free 
> physical extents somewhere.  This is where I'm confused.  When I set up 
> LVM, I allocated all of my spare drives to it.  So I have a 271GB
> logical volume of which I'm using only 32GB.  So I know that I have free 
> space to move the data around; I just don't know how to do it.

Your logical volume is 100% used by the filesystem. It sounds like the
filesystem isn't full though, but LVM doesn't know that.

You need to shrink your filesystem, then shrink your LV, then use
pvmove.

Dax Kelson
Guru Labs
