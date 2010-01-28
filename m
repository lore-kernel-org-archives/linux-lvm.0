Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0SLHvPU008543
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 16:17:57 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0SLHfqY011445
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 16:17:42 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e34.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id o0SLBX1I018840
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 14:11:33 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	o0SLHPXg088188
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 14:17:28 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id o0SLHLOG017697
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 14:17:21 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o0SLHLYk017673
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 14:17:21 -0700
Date: Thu, 28 Jan 2010 13:17:20 -0800
From: malahal@us.ibm.com
Message-ID: <20100128211720.GA23619@us.ibm.com>
References: <824411.76784.qm@web87113.mail.ird.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <824411.76784.qm@web87113.mail.ird.yahoo.com>
Subject: Re: [linux-lvm] alternative to pvmove on root volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

chris procter [chris-procter@talk21.com] wrote:
> (resent, it didn't seem to come through last time)
> 
> Hi,
> 
> I'm trying to migrate our servers from an old EVA to a
> shiney new netapp san if possible without downtime. For most of the
> volumes I can present in luns from the new san and use pvmove to juggle
> the data around but several servers have the root volume on the EVA and
> pvmove has a nasty habit of deadlocking the machine when used on root
> volumes.
> 
> I've been working on the technique mentioned on http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions   but after a bit of thought it seems it might be better to do the following:
> 
> 0) add /dev/new_lun to the volume group
> 1) lvconvert -m 1 /dev/myvg/lvol00 /dev/new_lun
> 2) wait for the mirror to sync
> 
> now we have RAID1 mirror copy of lvol00 on /dev/old_lun and /dev/new_lun so:
> 
> 3) lvconvert -m 0 /dev/myvg/lvol00 /dev/old_lun
> Breaks
> the RAID in favour of new_lun and gets rid of the old leaving us with a
> basic (non-mirrored) linear lvol entire on the new_lun.
> 
> 4) Rinse and repeat for all the other lvols on old_lun   (which you can get from "dmsetup table")
> 
> 5) vgreduce myvg /dev/old_lun
> 
> 
> Its less elegant then pvmove but my initial testing seems to suggest it does actually work and doesn't cause deadlocks.

Have you tried pvmove for the same and found deadlocks? If not, your
test doesn't mean anything!

> However
> given that pvmove also works by mirroring I'm not convinced I haven't
> just been lucky so far .  So does anyone have any ideas or even better
> experiance on whether this is likely to work or am I setting myself up
> for a world of pain if I try it on a live server?

Yes, pvmove works very similar. It will create a mirror for each segment
one at a time, so it may have to create lot more mirrors depending on
your configuration. If it ends up needing more 'lvconverts' (suspends),
then the probability of failure (deadlock) will increase.

--Malahal.
