Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5C0DYu28587
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2005 20:13:34 -0400
Received: from mxsf34.cluster1.charter.net (mxsf34.cluster1.charter.net
	[209.225.28.159])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5C0DXlL030873
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2005 20:13:33 -0400
Received: from mxip02a.cluster1.charter.net (mxip02a.cluster1.charter.net
	[209.225.28.132])
	by mxsf34.cluster1.charter.net (8.12.11/8.12.11) with ESMTP id
	j5C0DN65005249
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2005 20:13:23 -0400
From: jayz <jayz1@charter.net>
Date: Sat, 11 Jun 2005 18:13:25 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200506111813.25975.jayz1@charter.net>
Subject: [linux-lvm] LVM problem with LV
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
To: linux-lvm@redhat.com

I am having trouble with accessing the logical volume. I was starting to  add 
a forth drive to the lvm group. I went through the steps outlined in the How 
To document. Everything seemed fine the only thing that I had left to do is 
extend the file system on to the added drive. I walked away from my machine 
for a day or so and when I came back my motherboard was having trouble (would 
not even boot). I replaced the mb and reinstalled Linux on a non-LVM drive. I 
believe where my mistake was when I reformated the forth drive that I was 
adding to the system to a non LVM format with out doing a lvreduce (or is it 
vgreduce). It looks as if the volume group is intact but I'm not sure how to 
get it to a state where lvdisplay recognizes it so that it can be mounted. 
Any suggestions??

lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/ide/host2/bus1/target0/lun0/part1 [      93.16 GB] Primary  
LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host2/bus0/target0/lun0/part1 [     114.50 GB] Primary  
LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host2/bus0/target1/lun0/part1 [     114.50 GB] Primary  
LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host0/bus1/target0/lun0/part1 [     189.92 GB] Primary  
LINUX native partition [0x83]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part1 [       5.85 GB] Primary  
LINUX native partition [0x83]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part2 [      12.79 GB] DOS 
extended partition [0x05]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part5 [     494.16 MB] 
Extended  [0x82]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part6 [      12.31 GB] 
Extended LINUX native partition [0x83]
lvmdiskscan -- 5 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 8 partitions
lvmdiskscan -- 3 LVM physical volume partitions

lvscan -- no volume groups found

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "Public-Lan" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/disc"  is in no VG  
[12 GB]
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/part1"  is associated 
to unknown VG "Public-Lan" (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/disc"  is in no VG  
[12.03 GB]
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1"  is associated 
to unknown VG "Public-Lan" (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/disc"  is in no VG  
[12.03 GB]
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1"  is associated 
to unknown VG "Public-Lan" (run vgscan)
pvscan -- total: 6 [358.22 GB] / in use: 3 [322.16 GB] / in no VG: 3 [36.06 
GB]

--- Physical volume ---
PV Name               /dev/ide/host2/bus1/target0/lun0/part1
VG Name               Public-Lan
PV Size               93.16 GB [195371505 secs] / NOT usable 16.18 MB [LVM: 
147 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              5961
Free PE               0
Allocated PE          5961
PV UUID               REJhOK-Nz1F-uYib-VIaT-GW0W-OhAp-ox8Epq


--- Physical volume ---
PV Name               /dev/ide/host2/bus0/target0/lun0/part1
VG Name               Public-Lan
PV Size               114.50 GB [240121665 secs] / NOT usable 16.18 MB [LVM: 
152 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              7326
Free PE               0
Allocated PE          7326
PV UUID               xfRQNU-dw1X-Dmic-JQIx-tI6X-Qe9w-KeIcfk


--- Physical volume ---
PV Name               /dev/ide/host2/bus0/target1/lun0/part1
VG Name               Public-Lan
PV Size               114.50 GB [240121665 secs] / NOT usable 16.18 MB [LVM: 
152 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              7326
Free PE               0
Allocated PE          7326
PV UUID               Kd9Y5q-TnDo-LB1v-Jphw-LFyY-TP2P-dqK9k3
