Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i742ETa07896
	for <linux-lvm@redhat.com>; Tue, 3 Aug 2004 22:14:29 -0400
Received: from edmi.com.au (203-173-42-55.perm.iinet.net.au [203.173.42.55])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i742EQe1009405
	for <linux-lvm@redhat.com>; Tue, 3 Aug 2004 22:14:27 -0400
Received: from christianh by edmi.com.au (MDaemon.PRO.v7.1.2.R)
	with ESMTP id md50000057838.msg
	for <linux-lvm@redhat.com>; Wed, 04 Aug 2004 12:14:16 +1000
From: "Christian Hack" <christianh@edmi.com.au>
Date: Wed, 4 Aug 2004 12:14:15 +1000
Message-ID: <019f01c479c8$bdd353e0$1c01010a@christianh>
MIME-Version: 1.0
In-Reply-To: <20040803145835.GE8694@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] RE: Linux LVM pvmove -i trouble
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
To: linux-lvm@redhat.com

I emailed Heinz directly since I couldn't subscribe to the list. First hit
in Google for "LVM mailing list" returns http://linux.msede.com/lvm_mlist/
which looks all fine and dandy, has up to date archives and instructions to
subscribe which are obviously wrong. Perhaps the owner could point
subscribers to the correct page below.

He replied directly also, so I'm moving this to the mailing list for
posterity.

> > I dug your email out of the archives since the linux-lvm 
> list seems totally
> > screwed up right now. I can't subscribe to the mailing list due to
> > majordomo@msede.com not working properly and pretending to be
> > majordomo@marxmeier.com. 
> 
> You hit a very old URL ther.
> Use http://www.redhat.com/mailman/listinfo/linux-lvm please.
> 
> > Anyway I have a dying drive with one PE that is bad on it. 
> I am trying to
> > remove this last PE so I can remove the PV from the VG. I 
> used pvmove to get
> > all but this bad PE off it with no troubles. "pvmove -i" 
> keeps bailing out
> > with this error: 
> > 
> > [root@mythtv tools]# ./pvmove -i /dev/hdd
> > pvmove -- moving physical extents in active volume group 
> "myth_volume_group"
> > pvmove -- WARNING: if you lose power during the move you may need
> >         to restore your LVM metadata from backup!
> > pvmove -- do you want to continue? [y/n] y
> > 
> /dev/myth_volume_group/group::/dev/myth_volume_group/myth_logi
> cal_volume:
> > 1640 174981504, 0343 195035520
> > pvmove -- ERROR "Input/output error" copying extent from "/dev/hdd"
> > 
> > pvmove -- ERROR "Input/output error" moving physical extents
> > 
> > I have tried all combinations of pvmove, -i , 
> --ignore_read_errors etc but
> > it seems to simply ignore this option. I upgraded to 1.0.8 
> with the same
> > result. I see in the 1.0.8 notes it mentions:
> > 
> > "If you run 'pvmove' and run into device errors, you must 
> first run 'vgscan'
> > before attempting 'pvmove -i'"
> 
> '-i' ignores read errors and tries to read as much data off the source
> device it can.
> *But* it can't ignore a write error to the destination device 
> of course.
> Maybe that's your problem here ?
> 
> > 
> > I did this with no success. I'm not even sure how vgscan 
> would achieve this
> > anyway.
> 
> It scans the changed metadata in and creates /etc/lvmtab* in order to
> have the cached copy in sync with the ondosk copies for 
> proper tool runs.
> 
> > 
> > FYI I'm getting these sorts of errors in the logs
> > 
> > Aug  3 17:26:22 mythtv kernel: hdd: dma_intr: error=0x40 {
> > UncorrectableError }, LBAsect=175022778, high=10, low=7250618,
> > sector=175022721
> > Aug  3 17:26:22 mythtv kernel: end_request: I/O error, dev 
> 16:40 (hdd),
> > sector 175022721
> > Aug  3 17:26:25 mythtv kernel: hdd: dma_intr: status=0x51 { 
> DriveReady
> > SeekComplete Error }
> > Aug  3 17:26:25 mythtv kernel: hdd: dma_intr: error=0x40 {
> > UncorrectableError }, LBAsect=175022778, high=10, 
> low=7250618, sector=1750
> 
> Hrm, no write io error on the destination device.
> Try running pvmove woth option v to see waht happens.

pvmove -i -vv /dev/hdd gives me this:

[root@mythtv mnt]# pvmove -i -vv /dev/hdd
pvmove -- checking name of source physical volume "/dev/hdd"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/hdd"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "myth_volume_group" from lvmtab
pvmove -- checking volume group consistency of "myth_volume_group"
pvmove -- searching for source physical volume "/dev/hdd" in volume group
"myth_volume_group"
pvmove -- building list of possible destination physical volumes
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "myth_volume_group"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move extents away from physical volume "/dev/hdd"
pvmove -- checking for enough free physical extents in "myth_volume_group"
lv: /dev/myth_volume_group/myth_logical_volume[1]  old_dev: 22:64  new_dev:
03:67  old_pe_sector: 174981504  new_pe_sector: 222953856
pvmove -- opening output physical volume "/dev/hdb3"
pvmove -- llseeking input physical volume "/dev/hdd"
pvmove -- llseeking output physical volume "/dev/hdb3"
pvmove -- /dev/hdd [PE 1334 [myth_logical_volume [LE 3121]] -> /dev/hdb3 [PE
1700] [1/1]
pvmove -- copying extent from
/dev/hdd::/dev/myth_volume_group/myth_logical_volume(0x1640):174981504 to
/dev/hdb3(0x0343):222953856 on disk
/dev/myth_volume_group/group::/dev/myth_volume_group/myth_logical_volume:
1640 174981504, 0343 222953856
pvmove -- ERROR "Input/output error" copying extent from "/dev/hdd"

pvmove -- ERROR "Input/output error" moving physical extents

> > How can I remove this PE. I don't care about the data 
> that's on it. I just
> > want to get the failing drive out of the VG.
> 
> In case pvmove fails, only with surgery on the metadata -or- using
> the LVM2 tools which are capable to handle partital VGs and 
> remove invalid PVs.
> The later is the preferred way for obvious reasons.

Anyone else have suggestions before I go and get the LVM2 tools since pvmove
-i should be working for me?

CH
