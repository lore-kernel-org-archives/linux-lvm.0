Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6LLFCDX022784
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 17:15:12 -0400
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6LLExLK027920
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 17:15:00 -0400
Received: from IWDUBCORMSG001.sci.local (iwdubcormsg001.sci.local
	[10.105.142.31])
	by boamail2.stercomm.com (Postfix) with ESMTP id 4E6E433C61
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 17:14:58 -0400 (EDT)
Subject: Re: [linux-lvm] Wisdom of multiple disks in one VG
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <1216674096.7888.5.camel@corn.betterworld.us>
References: <1216674096.7888.5.camel@corn.betterworld.us>
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jul 2008 16:14:57 -0500
Message-Id: <1216674897.20588.14.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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

On Mon, 2008-07-21 at 14:01 -0700, Ross Boylan wrote:
> If I have a Volume Group with partitions from 2 different physical disks
> on it, and I confine my logical volumes to particular physical disks,
> will I be able to recover the logical volumes on disk 1 if disk 2 fails?

What is a disk?  If a disk means a LUN off of a hw RAID'd subsystem,
then you already have a level of protection.  You know what I mean?

In that case, if all of the "disks" in a PV already have some kind
of RAID protection, then there isn't too much of an issue.

So.. in my opinion.... LVM on top of RAID'd disks.

> 
> I have several disks, but they are all different sizes and so don't seem
> like good candidates for a scheme with redundancy (e.g., RAID 5).

Ok.

> Because of my concern that combining disks into the same volume group
> would mean a failure of 1 would effectively wipe them all out, I have so
> far used separate VG's for each disk.  However, this is awkward.

True.  I think you simply have to bite the bullet and decide if
getting matched storage (for RAID) or somehow some kind of RAID'd
infrastructure is something you just have to pay for... otherwise, you
probably just live with the risk... or go with separation like you are 
now (still risky, but not all eggs in one basket).

> 
> So, my general question is what the best approach would be in this
> situation, multiple disks of much different sizes.  The existing disks
> all have separate VG's on them.  The biggest disk is empty so far.

Since reliability seems important to you... I'd go with the separated
scheme you mentioned.  Sorry.. there really isn't a silver bullet for
this scenario.  Even so... you can't really say you have reliability,
you've somewhat improved the situation with separation to help
mitigate the damage, but without something like RAID, you're ultimately
going to lose something (not speaking about the value of backups of
course).
