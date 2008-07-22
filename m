Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6M4Nm5q028292
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 00:23:48 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6M4NaC9011286
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 00:23:37 -0400
Subject: Re: [linux-lvm] Wisdom of multiple disks in one VG
From: Ross Boylan <ross@biostat.ucsf.edu>
In-Reply-To: <1216674897.20588.14.camel@behemoth.csg.stercomm.com>
References: <1216674096.7888.5.camel@corn.betterworld.us>
	<1216674897.20588.14.camel@behemoth.csg.stercomm.com>
Date: Mon, 21 Jul 2008 21:23:22 -0700
Message-Id: <1216700602.7888.37.camel@corn.betterworld.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2008-07-21 at 16:14 -0500, Chris Cox wrote:
> On Mon, 2008-07-21 at 14:01 -0700, Ross Boylan wrote:
> > If I have a Volume Group with partitions from 2 different physical disks
> > on it, and I confine my logical volumes to particular physical disks,
> > will I be able to recover the logical volumes on disk 1 if disk 2 fails?
> 
> What is a disk?  If a disk means a LUN off of a hw RAID'd subsystem,
> then you already have a level of protection.  You know what I mean?
I think so.  That's not what I mean by "physical disks," by which I
meant the things you can buy and stick into a slot in the case.  My
understanding is that a LUN is a virtual drive present to the world by
the RAID system.

I'm talking about separate physical disk drives.  I'm still not clear
after reading your response (including below) whether disk 2 failing
will make the LV's on disk 1 unusable (i.e., not relatively
straightforward to recover), but it sounds as if that's the case.

> 
> In that case, if all of the "disks" in a PV already have some kind
> of RAID protection, then there isn't too much of an issue.
> 
> So.. in my opinion.... LVM on top of RAID'd disks.
Thanks.  I hadn't actually appreciated that RAID needed to be done below
LVM (I was somewhat thrown off by experience with EVMS and the fact that
one can stripe in LVM).

> 
> > 
> > I have several disks, but they are all different sizes and so don't seem
> > like good candidates for a scheme with redundancy (e.g., RAID 5).
> 
> Ok.
> 
> > Because of my concern that combining disks into the same volume group
> > would mean a failure of 1 would effectively wipe them all out, I have so
> > far used separate VG's for each disk.  However, this is awkward.
> 
> True.  I think you simply have to bite the bullet and decide if
> getting matched storage (for RAID) or somehow some kind of RAID'd
> infrastructure is something you just have to pay for... otherwise, you
> probably just live with the risk... or go with separation like you are 
> now (still risky, but not all eggs in one basket).
Maybe the separate VGs for separate disks doesn't buy me much.
Individual disk failures will still take some stuff with them.  Either I
have backups (I do), in which case I can recover, and could recover even
if all my VGs fail, or I don't, in which case I'm sunk anyway.

There are of course issues of recovery speed with the different
approaches, but that doesn't mean I'm getting much extra safety by
keeping distinct VGs.
> 
> > 
> > So, my general question is what the best approach would be in this
> > situation, multiple disks of much different sizes.  The existing disks
> > all have separate VG's on them.  The biggest disk is empty so far.
> 
> Since reliability seems important to you... I'd go with the separated
> scheme you mentioned.  Sorry.. there really isn't a silver bullet for
> this scenario.  Even so... you can't really say you have reliability,
> you've somewhat improved the situation with separation to help
> mitigate the damage, but without something like RAID, you're ultimately
> going to lose something (not speaking about the value of backups of
> course).
Real RAID is probably something I should consider, since my backups are
on my disks until I burn them to DVD, monthly.  The worst case scenario
in this setup is pretty bad.  I should also keep the on disk backups on
separate disks, in multiple copies, etc.


Thanks for your advice.
Ross
