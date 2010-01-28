Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0SKBG0j022375
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 15:11:16 -0500
Received: from n20.bullet.mail.ukl.yahoo.com (n20.bullet.mail.ukl.yahoo.com
	[87.248.110.137])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o0SKB1pM008852
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 15:11:03 -0500
Message-ID: <824411.76784.qm@web87113.mail.ird.yahoo.com>
Date: Thu, 28 Jan 2010 20:11:00 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] alternative to pvmove on root volume
Reply-To: chris procter <chris@chrisprocter.co.uk>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

(resent, it didn't seem to come through last time)

Hi,

I'm trying to migrate our servers from an old EVA to a
shiney new netapp san if possible without downtime. For most of the
volumes I can present in luns from the new san and use pvmove to juggle
the data around but several servers have the root volume on the EVA and
pvmove has a nasty habit of deadlocking the machine when used on root
volumes.

I've been working on the technique mentioned on http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions   but after a bit of thought it seems it might be better to do the following:

0) add /dev/new_lun to the volume group
1) lvconvert -m 1 /dev/myvg/lvol00 /dev/new_lun
2) wait for the mirror to sync

now we have RAID1 mirror copy of lvol00 on /dev/old_lun and /dev/new_lun so:

3) lvconvert -m 0 /dev/myvg/lvol00 /dev/old_lun
Breaks
the RAID in favour of new_lun and gets rid of the old leaving us with a
basic (non-mirrored) linear lvol entire on the new_lun.

4) Rinse and repeat for all the other lvols on old_lun   (which you can get from "dmsetup table")

5) vgreduce myvg /dev/old_lun


Its less elegant then pvmove but my initial testing seems to suggest it does actually work and doesn't cause deadlocks.

However
given that pvmove also works by mirroring I'm not convinced I haven't
just been lucky so far .  So does anyone have any ideas or even better
experiance on whether this is likely to work or am I setting myself up
for a world of pain if I try it on a live server?

All opinions and advice gratefully received :)

chris


      
