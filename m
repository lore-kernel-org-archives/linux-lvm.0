Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3MGkBp30650
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 12:46:11 -0400
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3MGkA99017078
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 12:46:10 -0400
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <40875353.8020104@gbrmpa.gov.au>
References: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org>
	<40875353.8020104@gbrmpa.gov.au>
Message-Id: <1082652373.9271.29.camel@arthur.cbd.careercast.com>
Mime-Version: 1.0
Date: Thu, 22 Apr 2004 09:46:14 -0700
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

On Wed, 2004-04-21 at 22:08, Glen Harris wrote:
> Clint Byrum wrote:
> > Just curious, but what kind of rebuild time do you see on that 1.25TB 
> > RAID5 volume?
> 
> Adding a single 250Gb 5400RPM Maxtor disk to the 5-disk RAID5 took just
> over 30 hours. For future disks, we'll be adding them in multiples - if
> we can get pvresize working, of course. The box can take 12 disks.
> 

I've taken the route of only ever adding 3 or more disks. My system is
similar, a backup server that does rsyncing and archiving of older data.
Whenever we need more space (seems about every 8 - 12 months), we add
disks, pvmove (dunno how well pvmove works in lvm2.. which we just went
to) the data off of the old PV, and then take the old disks out for use
as offsite backup disks (tapes suck! ;) 

I recently migrated about 300GB of data off our old really slow 4x100GB
PATA drives onto some nice new 250GB SATA drives on an Escalade
controller. Unfortunately, those 100GB drives were the last of the
non-LVM data we had on the box, so I don't know how long it would have
taken to pvmove.

So I guess what I'm getting at is, why grow a RAID5 slowly, 1 disk at a
time, when disks are *so* cheap? Get 3 or 4 more giant disks, toss 'em
in, RAID5 'em up, and add their PV to the VG of your choice. Thats what
makes LVM so nice! :)

> We're willing to take the time penalty, and in return get more space, as
> this box is a rsync server. The servers rsync to this box quickly overnight,
> then it backs up to the tape library in the early morning/during the day.
> This is a (relatively)cheap backup solution, and as such, doesn't need the
> on-line resiliancy of the file or database servers.
> 
> For the file/IMAP/Oracle servers with their Sun SCSI FC raid box, we're
> running several raids as needs grow and aggregating them with the metadisk
> software.
> 

Sounds like the expensive version of my solution. ;-)


Side Note: if anyone knows of a cheap way to hotswap PATA disks, I'd
like to hear about it. Right now I stick 'em in a crappy old box with
those $2 removable IDE tray things, and have to reboot that box whenever
I'm done copying stuff to the disks. No big deal, but it seems kinda
cheesy. :-P
