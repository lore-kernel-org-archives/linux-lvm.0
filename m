Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m38JAjva006753
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 15:10:45 -0400
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m38JAY5V007748
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 15:10:34 -0400
Received: from [192.168.2.102] ([72.91.189.21]) by vms173005.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0JZ000FUQSZHDD71@vms173005.mailsrvcs.net> for
	linux-lvm@redhat.com; Tue, 08 Apr 2008 14:04:29 -0500 (CDT)
Date: Tue, 08 Apr 2008 15:10:05 -0400
From: Gerry Reno <greno@verizon.net>
Message-id: <47FBC30D.6060107@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] FC6+LVM2 over RAID: drive failed and LVM hung
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hopefully someone can shed some light on how to proceed with solving an 
LVM hang problem.

Yesterday I get an email that one of the drives did not pass the self-check.

In /var/log/messages I see these lines related to the drive issue:

================================================================================
Apr  7 17:57:03 grp-01-10-01 smartd[2444]: Device: /dev/hdm, FAILED 
SMART self-check. BACK UP DATA NOW!
Apr  7 17:57:03 grp-01-10-01 smartd[2444]: Sending warning via mail to 
root ...
Apr  7 17:57:03 grp-01-10-01 smartd[2444]: Warning via mail to root: 
successful
Apr  7 18:05:51 grp-01-10-01 kernel: hdm: task_out_intr: status=0x51 { 
DriveReady SeekComplete Error }
Apr  7 18:05:52 grp-01-10-01 kernel: hdm: task_out_intr: error=0x10 { 
SectorIdNotFound }, LBAsect=238863867, high=14, low=3982843, 
sector=238863903
Apr  7 18:05:52 grp-01-10-01 kernel: ide: failed opcode was: unknown
Apr  7 18:05:57 grp-01-10-01 kernel: hdm: task_out_intr: status=0x51 { 
DriveReady SeekComplete Error }
Apr  7 18:06:00 grp-01-10-01 kernel: hdm: task_out_intr: error=0x10 { 
SectorIdNotFound }, LBAsect=238814880, high=14, low=3933856, 
sector=238814887
Apr  7 18:06:00 grp-01-10-01 kernel: ide: failed opcode was: unknown

^^^^^^^^ LOTS OF THESE LINES IN LOG ^^^^^^^^^

Apr  8 02:05:10 grp-01-10-01 kernel: raid1: hdm2: rescheduling sector 
54264480
...
Apr  8 02:05:21 grp-01-10-01 kernel: raid1:md0: read error corrected (8 
sectors at 54264480 on hdm2)
Apr  8 02:05:22 grp-01-10-01 kernel: raid1: hdc2: redirecting sector 
54264480 to another mirror  <<===== I DO NOT UNDERSTAND THIS MESSAGE.  
THE FAILING DRIVE hdm IS THE OTHER MIRROR FOR hdc2 ????
...
Apr  8 03:02:35 grp-01-10-01 kernel: raid1: hdm2: rescheduling sector 
30555792
...
Apr  8 03:02:36 grp-01-10-01 kernel: raid1: Disk failure on hdm2, 
disabling device.
Apr  8 03:02:37 grp-01-10-01 kernel:    Operation continuing on 1 devices
Apr  8 03:02:37 grp-01-10-01 kernel: raid1: hdc2: redirecting sector 
30555792 to another mirror   <<===== AND NOW THERE IS NO OTHER MIRROR !
Apr  8 03:02:37 grp-01-10-01 kernel: RAID1 conf printout:
Apr  8 03:02:37 grp-01-10-01 kernel:  --- wd:1 rd:2
Apr  8 03:02:37 grp-01-10-01 kernel:  disk 0, wo:0, o:1, dev:hdc2
Apr  8 03:02:37 grp-01-10-01 kernel:  disk 1, wo:1, o:0, dev:hdm2
Apr  8 03:02:37 grp-01-10-01 kernel: RAID1 conf printout:
Apr  8 03:02:37 grp-01-10-01 kernel:  --- wd:1 rd:2
Apr  8 03:02:37 grp-01-10-01 kernel:  disk 0, wo:0, o:1, dev:hdc2
Apr  8 03:27:03 grp-01-10-01 smartd[2444]: Device: /dev/hdm, FAILED 
SMART self-check. BACK UP DATA NOW!
Apr  8 03:27:03 grp-01-10-01 smartd[2444]: Device: /dev/hdm, 1 Currently 
unreadable (pending) sectors
Apr  8 03:27:03 grp-01-10-01 smartd[2444]: Sending warning via mail to 
root ...

^^^^^^^^ LOTS OF THESE LINES IN LOG ^^^^^^^^^
================================================================================


So I check /proc/mdstat and yes the md0 raid1 array shows only 1 active 
drive, hdc2.

So I take a backup and then shutdown the system.  I pull the bad drive 
out and put in a new drive and reboot. 

The system boots up until it gets to the LVM part and then just hangs@
this message:
================================================================================
...
Setting Hostname
Setting up Logical Volume Management  (boot hangs right here, icon stops 
spinning, cursor is locked)
================================================================================

So my setup consists of two Linux RAID arrays, a raid5 (md1) and a raid1 
(md0) array.
The drive partition that went bad (hdm2) is part of md0 and another 
partition (hdm1) also acts as a spare for md1.

There is an LVM VG over each array.  So we have VolumeGroup00 and 
VolumeGroup01.


How should I tackle this problem?  I tried rescue mode but then there 
are no VG's and I only see one of the arrays, md0.


????

Thanks,
Gerry
