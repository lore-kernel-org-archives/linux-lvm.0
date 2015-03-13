Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2DGIcFb002365
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2015 12:18:38 -0400
Received: from mailrelay1.lanline.com (mailrelay1.lanline.com [216.187.10.17])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2DGIX0R026300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2015 12:18:34 -0400
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay1.lanline.com (8.14.5/8.14.5) with ESMTP id t2DGIWOs022974
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2015 12:18:32 -0400 (EDT)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id t2DGIRp5003463
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2015 12:18:27 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <21763.3541.906206.871703@quad.stoffel.home>
Date: Fri, 13 Mar 2015 12:18:29 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <7038545.HonGYRpauu@libor-nb>
References: <2134825.VZEVSUbKJK@libor-nb> <9916933.1FBSnvlGeW@libor-nb>
	<21761.51911.473617.291778@quad.stoffel.home>
	<7038545.HonGYRpauu@libor-nb>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Removing disk from raid LVM
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


Hi Libor,

I think you're in big trouble here, but you might be able to fix this
by removing the new disk you added using 'vgreduce', or simply by
shutting down the system, pulling the disk and rebooting.

Then I would try to do:

  lvchange --resync <vg>/<lv>

In your case, I think you could try:

  lvchange --resync vgPecDisk2/lvBackupPc_rimage_1

and see how that works.  I'm looking at the steps documented here:

  http://wiki.gentoo.org/wiki/LVM#Replacing_a_failed_physical_volume

which seems to be much more of what you want.  


But!!!!  I still find this process of using LVM RAID5 LVs to be error
prone, not very resilient to failures, and a pain to manage.  It would
be much much much better to build a RAID5 MD RAID array, then put your
VG and LVs on top of that.

You would be a more resilient system, esp since MD RAID is *actively*
supported by Neil Brown the developer, and it works very very well.
It has more and better features than the RAID5 implementation in LVM.
Honestly, none of this would be happening if you just ran it the way I
(and many others) suggest.  

I still don't understand your reasoning here.  But please let me know
if the 'lvchange --resync' works or not.

John


>>>>> "Libor" == Libor Klep�� <libor.klepac@bcom.cz> writes:

Libor> Hello John,

Libor> just a quick question, I'll respond on rest later.

Libor> I tried to read data from one of old LVs.

Libor> To be precise, I tried to read rimage_* directly.

Libor> #dd if=vgPecDisk2-lvBackupPc_rimage_0 of=/mnt/tmp/0 bs=10M count=1

Libor> 1+0 records in

Libor> 1+0 records out

Libor> 10485760 bytes (10 MB) copied, 0.802423 s, 13.1 MB/s

Libor> # dd if=vgPecDisk2-lvBackupPc_rimage_1 of=/mnt/tmp/1 bs=10M count=1

Libor> dd: reading `vgPecDisk2-lvBackupPc_rimage_1': Input/output error

Libor> 0+0 records in

Libor> 0+0 records out

Libor> 0 bytes (0 B) copied, 0.00582503 s, 0.0 kB/s

Libor> #dd if=vgPecDisk2-lvBackupPc_rimage_2 of=/mnt/tmp/2 bs=10M count=1

Libor> 1+0 records in

Libor> 1+0 records out

Libor> 10485760 bytes (10 MB) copied, 0.110792 s, 94.6 MB/s

Libor> #dd if=vgPecDisk2-lvBackupPc_rimage_3 of=/mnt/tmp/3 bs=10M count=1

Libor> 1+0 records in

Libor> 1+0 records out

Libor> 10485760 bytes (10 MB) copied, 0.336518 s, 31.2 MB/s

Libor> As you can see, three parts are ok (and output files do contain *some* data) one rimage is missing
Libor> (well, there is symlink to dm-33 dev node, but it says IO error)

Libor> Is there a way to kick this rimage out and to use those three remaining rimages?

Libor> LV was started

Libor> #lvchange -ay --partial -v vgPecDisk2/lvBackupPc

Libor> Configuration setting "activation/thin_check_executable" unknown.

Libor> PARTIAL MODE. Incomplete logical volumes will be processed.

Libor> Using logical volume(s) on command line

Libor> Activating logical volume "lvBackupPc" exclusively.

Libor> activation/volume_list configuration setting not defined: Checking only host tags for vgPecDisk2/
Libor> lvBackupPc

Libor> Loading vgPecDisk2-lvBackupPc_rmeta_0 table (253:29)

Libor> Suppressed vgPecDisk2-lvBackupPc_rmeta_0 (253:29) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc_rimage_0 table (253:30)

Libor> Suppressed vgPecDisk2-lvBackupPc_rimage_0 (253:30) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc_rmeta_1 table (253:33)

Libor> Suppressed vgPecDisk2-lvBackupPc_rmeta_1 (253:33) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc_rimage_1 table (253:34)

Libor> Suppressed vgPecDisk2-lvBackupPc_rimage_1 (253:34) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc_rmeta_2 table (253:35)

Libor> Suppressed vgPecDisk2-lvBackupPc_rmeta_2 (253:35) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc_rimage_2 table (253:36)

Libor> Suppressed vgPecDisk2-lvBackupPc_rimage_2 (253:36) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc_rmeta_3 table (253:37)

Libor> Suppressed vgPecDisk2-lvBackupPc_rmeta_3 (253:37) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc_rimage_3 table (253:108)

Libor> Suppressed vgPecDisk2-lvBackupPc_rimage_3 (253:108) identical table reload.

Libor> Loading vgPecDisk2-lvBackupPc table (253:109)

Libor> device-mapper: reload ioctl on failed: Invalid argument

Libor> #dmesg says

Libor> [747203.140882] device-mapper: raid: Failed to read superblock of device at position 1

Libor> [747203.149219] device-mapper: raid: New device injected into existing array without 'rebuild'
Libor> parameter specified

Libor> [747203.149906] device-mapper: table: 253:109: raid: Unable to assemble array: Invalid superblocks

Libor> [747203.150576] device-mapper: ioctl: error adding target to table

Libor> [747227.051339] device-mapper: raid: Failed to read superblock of device at position 1

Libor> [747227.062519] device-mapper: raid: New device injected into existing array without 'rebuild'
Libor> parameter specified

Libor> [747227.063612] device-mapper: table: 253:109: raid: Unable to assemble array: Invalid superblocks

Libor> [747227.064667] device-mapper: ioctl: error adding target to table

Libor> [747308.206650] quiet_error: 62 callbacks suppressed

Libor> [747308.206652] Buffer I/O error on device dm-34, logical block 0

Libor> [747308.207383] Buffer I/O error on device dm-34, logical block 1

Libor> [747308.208069] Buffer I/O error on device dm-34, logical block 2

Libor> [747308.208736] Buffer I/O error on device dm-34, logical block 3

Libor> [747308.209383] Buffer I/O error on device dm-34, logical block 4

Libor> [747308.210020] Buffer I/O error on device dm-34, logical block 5

Libor> [747308.210647] Buffer I/O error on device dm-34, logical block 6

Libor> [747308.211262] Buffer I/O error on device dm-34, logical block 7

Libor> [747308.211868] Buffer I/O error on device dm-34, logical block 8

Libor> [747308.212464] Buffer I/O error on device dm-34, logical block 9

Libor> [747560.283263] quiet_error: 55 callbacks suppressed

Libor> [747560.283267] Buffer I/O error on device dm-34, logical block 0

Libor> [747560.284214] Buffer I/O error on device dm-34, logical block 1

Libor> [747560.285059] Buffer I/O error on device dm-34, logical block 2

Libor> [747560.285633] Buffer I/O error on device dm-34, logical block 3

Libor> [747560.286170] Buffer I/O error on device dm-34, logical block 4

Libor> [747560.286687] Buffer I/O error on device dm-34, logical block 5

Libor> [747560.287151] Buffer I/O error on device dm-34, logical block 6

Libor> Libor

Libor> On �t 12.�b�ezna�2015 13:20:07 John Stoffel wrote:

>> Interesting, so maybe it is working, but from looking at the info

>> you've provided, it's hard to know what happened. I think it might be

>> time to do some testing with some loopback devices so you can setup

>> four 100m disks, then put them into a VG and then do some LVs on top

>> with the RAID5 setup. Then you can see what happens when you remove a

>> disk, either with 'vgreduce' or by stopping the VG and then removing

>> a single PV, then re-starting the VG.

>> 

>> Thinking back on it, I suspect the problem was your vgcfgrestore. You

>> really really really didn't want to do that, because you lied to the

>> system. Instead of four data disks, with good info, you now had three

>> good disks, and one blank disk. But you told LVM that the fourth disk

>> was just fine, so it started to use it. So I bet that when you read

>> from an LV, it tried to spread the load out and read from all four

>> disks, so you'd get Good, good, nothing, good data, which just totally

>> screwed things up.

>> 

>> Sometimes you were ok I bet because the parity data was on the bad

>> disk, but other times it wasn't so those LVs go corrupted because 1/3

>> of their data was now garbage. You never let LVM rebuild the data by

>> refreshing the new disk.

>> 

>> Instead you probably should have done a vgreduce and then vgextend

>> onto the replacement disk, which probably (maybe, not sure) would have

>> forced a rebuild.

>> 

>> 

>> But I'm going to say that I think you were making a big mistake design

>> wise here. You should have just setup an MD RAID5 on those four

>> disks, turn that one MD device into a PV, put that into a VG, then

>> created your LVs on top of there. When you noticed problems, you

>> would simple fail the device, shutdown, replace it, then boot up and

>> once the system was up, you could add the new disk back into the RAID5

>> MD device and the system would happily rebuild in the background.

>> 

>> Does this make sense? You already use MD for the boot disks, so why

>> not for the data as well? I know that LVM RAID5 isn't as mature or

>> supported as it is under MD.

>> 

>> John

>> 

>> 

Libor> but when i use

>> 

Libor> # lvs -a | grep Vokapo

>> 

Libor> output is

>> 

Libor> lvBackupVokapo vgPecDisk2 rwi-aor- 128.00g

>> 

Libor> [lvBackupVokapo_rimage_0] vgPecDisk2 iwi-aor- 42.67g

>> 

Libor> [lvBackupVokapo_rimage_1] vgPecDisk2 iwi-aor- 42.67g

>> 

Libor> [lvBackupVokapo_rimage_2] vgPecDisk2 iwi-aor- 42.67g

>> 

Libor> [lvBackupVokapo_rimage_3] vgPecDisk2 iwi-aor- 42.67g

>> 

Libor> [lvBackupVokapo_rmeta_0] vgPecDisk2 ewi-aor- 4.00m

>> 

Libor> [lvBackupVokapo_rmeta_1] vgPecDisk2 ewi-aor- 4.00m

>> 

Libor> [lvBackupVokapo_rmeta_2] vgPecDisk2 ewi-aor- 4.00m

>> 

Libor> [lvBackupVokapo_rmeta_3] vgPecDisk2 ewi-aor- 4.00m

>> 

Libor> what are these parts then?

>> 

Libor> it was created using

>> 

Libor> # lvcreate --type raid5 -i 3 -L 128G -n lvBackupVokapo vgPecDisk2

>> 

Libor> (with tools 2.02.104)

>> 

Libor> I was not sure about number of stripes

>> 

Libor> Libor

>> 

Libor> On �t 12.�b�ezna�2015 10:53:56 John Stoffel wrote:

>> 

Libor> here it comes.

>> 

>> >> Great, this is a big help, and it shows me that you are NOT using

>> >>

>> >> RAID5 for your backup volumes. The first clue is that you have 4 x

>> >>

>> >> 3tb disks and you only have a VG with 10.91t (terabytes) of useable

>> >>

>> >> space, with a name of 'vgPecDisk2'.

>> >>

>> >>

>> >>

>> >> And then none of the LVs in this VG are of type RAID5, so I don't

>> >>

>> >> think you actually created them properly. So when you lost one of the

>> >>

>> >> disks in your VG, you immediately lost any LVs which had extents on

>> >>

>> >> that missing disk. Even though you did a vgcfgrestore, that did NOT

>> >>

>> >> restore the data.

>> >>

>> >>

>> >>

>> >> You really need to redo this entirely. What you WANT to do is this:

>> >>

>> >>

>> >>

>> >> 0. copy all the remaining good backups elsewhere. You want to empty

>> >>

>> >> all of the disks in the existing vgPecDisk2 VG.

>> >>

>> >>

>> >>

>> >> 1. setup an MD RAID5 using the four big disks.

>> >>

>> >>

>> >>

>> >> mdadm --create -l 5 -n 4 --name vgPecDisk2 /dev/sda /dev/sdb /dev/sdd

>> >>

>> >> /dev/sdg

>> >>

>> >>

>> >>

>> >> 2. Create the PV on there

>> >>

>> >>

>> >>

>> >> pvcreate /dev/md/vgPecDisk2

>> >>

>> >>

>> >>

>> >> 3. Create a new VG ontop of the RAID5 array.

>> >>

>> >>

>> >>

>> >> vgcreate vgPecDisk2 /dev/md/vgPecDisk2

>> >>

>> >>

>> >>

>> >> 3. NOW you create your LVs on top of this

>> >>

>> >>

>> >>

>> >> lvcreate ....

>> >>

>> >>

>> >>

>> >>

>> >>

>> >> The problem you have is that none of your LVs was ever created with

>> >>

>> >> RAID5. If you want to do a test, try this:

>> >>

>> >>

>> >>

>> >> lvcreate -n test-raid5 --type raid5 --size 5g --stripes 4 vgPecDisk2

>> >>

>> >>

>> >>

>> >> and if it works (which it probably will on your system, assuming your

>> >>

>> >> LVM tools have support for RAID5 in the first please, you can then

>> >>

>> >> look at the output of the 'lvdisplay test-raid5' command to see how

>> >>

>> >> many devices and stripes (segments) that LV has.

>> >>

>> >>

>> >>

>> >> None of the ones you show have this. For example, your lvBackupVokapo

>> >>

>> >> only shows 1 segment. Without multiple segments, and RAID, you can't

>> >>

>> >> survive any sort of failure in your setup.

>> >>

>> >>

>> >>

>> >> This is why I personally only ever put LVs ontop of RAID devices if I

>> >>

>> >> have important data.

>> >>

>> >>

>> >>

>> >> Does this help you understand what went wrong here?

>> >>

>> >>

>> >>

>> >> John

>> 

Libor> I think i have all PV not on top of raw partitions. System is on

>> 

>> >> mdraid and backup PVs are Libor> directly on disks, without partitions.

>> 

Libor> I think that LVs:

>> 

>> 

>> 

Libor> lvAmandaDaily01old

>> 

>> 

>> 

Libor> lvBackupPc

>> 

>> 

>> 

Libor> lvBackupRsync

>> 

>> 

>> 

Libor> are old damaged LVs, i left for experimenting on.

>> 

>> 

>> 

Libor> These LVs are some broken parts of old raid?

>> 

>> 

>> 

Libor> lvAmandaDailyAuS01_rimage_2_extracted

>> 

>> 

>> 

Libor> lvAmandaDailyAuS01_rmeta_2_extracted

>> 

>> 

>> 

Libor> LV lvAmandaDailyBlS01 is also from before crash, but i didn't try to

>> 

>> >> repair it (i think)

>> 

Libor> Libor

>> 

>> 

>> 

Libor> ---------------

>> 

>> 

>> 

Libor> cat /proc/mdstat (mdraid used only for OS)

>> 

>> 

>> 

Libor> Personalities : [raid1] [raid10] [raid6] [raid5] [raid4]

>> 

>> 

>> 

Libor> md1 : active raid1 sde3[0] sdf3[1]

>> 

>> 

>> 

Libor> 487504704 blocks super 1.2 [2/2] [UU]

>> 

>> 

>> 

Libor> bitmap: 1/4 pages [4KB], 65536KB chunk

>> 

>> 

>> 

Libor> md0 : active raid1 sde2[0] sdf2[1]

>> 

>> 

>> 

Libor> 249664 blocks super 1.2 [2/2] [UU]

>> 

>> 

>> 

Libor> bitmap: 0/1 pages [0KB], 65536KB chunk

>> 

>> 

>> 

Libor> -----------------

>> 

>> 

>> 

Libor> cat /proc/partitions

>> 

>> 

>> 

Libor> major minor #blocks name

>> 

>> 

>> 

Libor> 8 80 488386584 sdf

>> 

>> 

>> 

Libor> 8 81 498688 sdf1

>> 

>> 

>> 

Libor> 8 82 249856 sdf2

>> 

>> 

>> 

Libor> 8 83 487635968 sdf3

>> 

>> 

>> 

Libor> 8 48 2930266584 sdd

>> 

>> 

>> 

Libor> 8 64 488386584 sde

>> 

>> 

>> 

Libor> 8 65 498688 sde1

>> 

>> 

>> 

Libor> 8 66 249856 sde2

>> 

>> 

>> 

Libor> 8 67 487635968 sde3

>> 

>> 

>> 

Libor> 8 0 2930266584 sda

>> 

>> 

>> 

Libor> 8 16 2930266584 sdb

>> 

>> 

>> 

Libor> 9 0 249664 md0

>> 

>> 

>> 

Libor> 9 1 487504704 md1

>> 

>> 

>> 

Libor> 253 0 67108864 dm-0

>> 

>> 

>> 

Libor> 253 1 3903488 dm-1

>> 

>> 

>> 

Libor> 8 96 2930266584 sdg

>> 

>> 

>> 

Libor> 253 121 4096 dm-121

>> 

>> 

>> 

Libor> 253 122 34955264 dm-122

>> 

>> 

>> 

Libor> 253 123 4096 dm-123

>> 

>> 

>> 

Libor> 253 124 34955264 dm-124

>> 

>> 

>> 

Libor> 253 125 4096 dm-125

>> 

>> 

>> 

Libor> 253 126 34955264 dm-126

>> 

>> 

>> 

Libor> 253 127 4096 dm-127

>> 

>> 

>> 

Libor> 253 128 34955264 dm-128

>> 

>> 

>> 

Libor> 253 129 104865792 dm-129

>> 

>> 

>> 

Libor> 253 11 4096 dm-11

>> 

>> 

>> 

Libor> 253 12 209715200 dm-12

>> 

>> 

>> 

Libor> 253 13 4096 dm-13

>> 

>> 

>> 

Libor> 253 14 209715200 dm-14

>> 

>> 

>> 

Libor> 253 15 4096 dm-15

>> 

>> 

>> 

Libor> 253 16 209715200 dm-16

>> 

>> 

>> 

Libor> 253 17 4096 dm-17

>> 

>> 

>> 

Libor> 253 18 209715200 dm-18

>> 

>> 

>> 

Libor> 253 19 629145600 dm-19

>> 

>> 

>> 

Libor> 253 38 4096 dm-38

>> 

>> 

>> 

Libor> 253 39 122335232 dm-39

>> 

>> 

>> 

Libor> 253 40 4096 dm-40

>> 

>> 

>> 

Libor> 253 41 122335232 dm-41

>> 

>> 

>> 

Libor> 253 42 4096 dm-42

>> 

>> 

>> 

Libor> 253 43 122335232 dm-43

>> 

>> 

>> 

Libor> 253 44 4096 dm-44

>> 

>> 

>> 

Libor> 253 45 122335232 dm-45

>> 

>> 

>> 

Libor> 253 46 367005696 dm-46

>> 

>> 

>> 

Libor> 253 47 4096 dm-47

>> 

>> 

>> 

Libor> 253 48 16777216 dm-48

>> 

>> 

>> 

Libor> 253 49 4096 dm-49

>> 

>> 

>> 

Libor> 253 50 16777216 dm-50

>> 

>> 

>> 

Libor> 253 51 16777216 dm-51

>> 

>> 

>> 

Libor> 253 52 4096 dm-52

>> 

>> 

>> 

Libor> 253 53 4194304 dm-53

>> 

>> 

>> 

Libor> 253 54 4096 dm-54

>> 

>> 

>> 

Libor> 253 55 4194304 dm-55

>> 

>> 

>> 

Libor> 253 56 4194304 dm-56

>> 

>> 

>> 

Libor> 253 57 4096 dm-57

>> 

>> 

>> 

Libor> 253 58 11186176 dm-58

>> 

>> 

>> 

Libor> 253 59 4096 dm-59

>> 

>> 

>> 

Libor> 253 60 11186176 dm-60

>> 

>> 

>> 

Libor> 253 61 4096 dm-61

>> 

>> 

>> 

Libor> 253 62 11186176 dm-62

>> 

>> 

>> 

Libor> 253 63 4096 dm-63

>> 

>> 

>> 

Libor> 253 64 11186176 dm-64

>> 

>> 

>> 

Libor> 253 65 33558528 dm-65

>> 

>> 

>> 

Libor> 253 2 4096 dm-2

>> 

>> 

>> 

Libor> 253 3 125829120 dm-3

>> 

>> 

>> 

Libor> 253 4 4096 dm-4

>> 

>> 

>> 

Libor> 253 5 125829120 dm-5

>> 

>> 

>> 

Libor> 253 6 4096 dm-6

>> 

>> 

>> 

Libor> 253 7 125829120 dm-7

>> 

>> 

>> 

Libor> 253 8 4096 dm-8

>> 

>> 

>> 

Libor> 253 9 125829120 dm-9

>> 

>> 

>> 

Libor> 253 10 377487360 dm-10

>> 

>> 

>> 

Libor> 253 20 4096 dm-20

>> 

>> 

>> 

Libor> 253 21 12582912 dm-21

>> 

>> 

>> 

Libor> 253 22 4096 dm-22

>> 

>> 

>> 

Libor> 253 23 12582912 dm-23

>> 

>> 

>> 

Libor> 253 24 4096 dm-24

>> 

>> 

>> 

Libor> 253 25 12582912 dm-25

>> 

>> 

>> 

Libor> 253 26 4096 dm-26

>> 

>> 

>> 

Libor> 253 27 12582912 dm-27

>> 

>> 

>> 

Libor> 253 28 37748736 dm-28

>> 

>> 

>> 

Libor> 253 66 4096 dm-66

>> 

>> 

>> 

Libor> 253 67 122335232 dm-67

>> 

>> 

>> 

Libor> 253 68 4096 dm-68

>> 

>> 

>> 

Libor> 253 69 122335232 dm-69

>> 

>> 

>> 

Libor> 253 70 4096 dm-70

>> 

>> 

>> 

Libor> 253 71 122335232 dm-71

>> 

>> 

>> 

Libor> 253 72 4096 dm-72

>> 

>> 

>> 

Libor> 253 73 122335232 dm-73

>> 

>> 

>> 

Libor> 253 74 367005696 dm-74

>> 

>> 

>> 

Libor> 253 31 416489472 dm-31

>> 

>> 

>> 

Libor> 253 32 4096 dm-32

>> 

>> 

>> 

Libor> 253 75 34955264 dm-75

>> 

>> 

>> 

Libor> 253 78 4096 dm-78

>> 

>> 

>> 

Libor> 253 79 34955264 dm-79

>> 

>> 

>> 

Libor> 253 80 4096 dm-80

>> 

>> 

>> 

Libor> 253 81 34955264 dm-81

>> 

>> 

>> 

Libor> 253 82 104865792 dm-82

>> 

>> 

>> 

Libor> 253 92 4096 dm-92

>> 

>> 

>> 

Libor> 253 93 17477632 dm-93

>> 

>> 

>> 

Libor> 253 94 4096 dm-94

>> 

>> 

>> 

Libor> 253 95 17477632 dm-95

>> 

>> 

>> 

Libor> 253 96 4096 dm-96

>> 

>> 

>> 

Libor> 253 97 17477632 dm-97

>> 

>> 

>> 

Libor> 253 98 4096 dm-98

>> 

>> 

>> 

Libor> 253 99 17477632 dm-99

>> 

>> 

>> 

Libor> 253 100 52432896 dm-100

>> 

>> 

>> 

Libor> 253 76 4096 dm-76

>> 

>> 

>> 

Libor> 253 77 50331648 dm-77

>> 

>> 

>> 

Libor> 253 83 4096 dm-83

>> 

>> 

>> 

Libor> 253 84 50331648 dm-84

>> 

>> 

>> 

Libor> 253 85 4096 dm-85

>> 

>> 

>> 

Libor> 253 86 50331648 dm-86

>> 

>> 

>> 

Libor> 253 87 4096 dm-87

>> 

>> 

>> 

Libor> 253 88 50331648 dm-88

>> 

>> 

>> 

Libor> 253 89 150994944 dm-89

>> 

>> 

>> 

Libor> 253 90 4096 dm-90

>> 

>> 

>> 

Libor> 253 91 44740608 dm-91

>> 

>> 

>> 

Libor> 253 101 4096 dm-101

>> 

>> 

>> 

Libor> 253 102 44740608 dm-102

>> 

>> 

>> 

Libor> 253 103 4096 dm-103

>> 

>> 

>> 

Libor> 253 104 44740608 dm-104

>> 

>> 

>> 

Libor> 253 105 4096 dm-105

>> 

>> 

>> 

Libor> 253 106 44740608 dm-106

>> 

>> 

>> 

Libor> 253 107 134221824 dm-107

>> 

>> 

>> 

Libor> -------------------------------

>> 

>> 

>> 

Libor> pvs -v

>> 

>> 

>> 

Libor> Scanning for physical volume names

>> 

>> 

>> 

Libor> PV VG Fmt Attr PSize PFree DevSize PV UUID

>> 

>> 

>> 

Libor> /dev/md1 vgPecDisk1 lvm2 a-- 464.92g 0 464.92g

>> 

>> >> MLqS2b-iuvt-7ES8-rPHo-SPwm-Liiz-TUtHLI

>> 

Libor> /dev/sda vgPecDisk2 lvm2 a-- 2.73t 1.20t 2.73t

>> 

>> >> 0vECyp-EndR-oD66-va0g-0ORd-cS7E-7rMylw

>> 

Libor> /dev/sdb vgPecDisk2 lvm2 a-- 2.73t 1.20t 2.73t

>> 

>> >> 5ZhwR7-AClb-oEsi-s2Zi-xouM-en0Z-ZQ0fwr

>> 

Libor> /dev/sdd vgPecDisk2 lvm2 a-- 2.73t 2.03t 2.73t

>> 

>> >> RI3dhw-Ns0t-BLyN-BQd5-vDx0-ucHb-X8ntkO

>> 

Libor> /dev/sdg vgPecDisk2 lvm2 a-- 2.73t 1.23t 2.73t

>> 

>> >> yaohhB-dkF6-rQRk-dBsL-JHS7-8KOo-eYSqOj

>> 

Libor> -------------------------------

>> 

>> 

>> 

Libor> pvdisplay

>> 

>> 

>> 

Libor> --- Physical volume ---

>> 

>> 

>> 

Libor> PV Name /dev/md1

>> 

>> 

>> 

Libor> VG Name vgPecDisk1

>> 

>> 

>> 

Libor> PV Size 464.92 GiB / not usable 1.81 MiB

>> 

>> 

>> 

Libor> Allocatable yes (but full)

>> 

>> 

>> 

Libor> PE Size 4.00 MiB

>> 

>> 

>> 

Libor> Total PE 119019

>> 

>> 

>> 

Libor> Free PE 0

>> 

>> 

>> 

Libor> Allocated PE 119019

>> 

>> 

>> 

Libor> PV UUID MLqS2b-iuvt-7ES8-rPHo-SPwm-Liiz-TUtHLI

>> 

>> 

>> 

Libor> --- Physical volume ---

>> 

>> 

>> 

Libor> PV Name /dev/sdd

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> PV Size 2.73 TiB / not usable 2.00 MiB

>> 

>> 

>> 

Libor> Allocatable yes

>> 

>> 

>> 

Libor> PE Size 4.00 MiB

>> 

>> 

>> 

Libor> Total PE 715396

>> 

>> 

>> 

Libor> Free PE 531917

>> 

>> 

>> 

Libor> Allocated PE 183479

>> 

>> 

>> 

Libor> PV UUID RI3dhw-Ns0t-BLyN-BQd5-vDx0-ucHb-X8ntkO

>> 

>> 

>> 

Libor> --- Physical volume ---

>> 

>> 

>> 

Libor> PV Name /dev/sda

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> PV Size 2.73 TiB / not usable 1022.00 MiB

>> 

>> 

>> 

Libor> Allocatable yes

>> 

>> 

>> 

Libor> PE Size 4.00 MiB

>> 

>> 

>> 

Libor> Total PE 714884

>> 

>> 

>> 

Libor> Free PE 315671

>> 

>> 

>> 

Libor> Allocated PE 399213

>> 

>> 

>> 

Libor> PV UUID 0vECyp-EndR-oD66-va0g-0ORd-cS7E-7rMylw

>> 

>> 

>> 

Libor> --- Physical volume ---

>> 

>> 

>> 

Libor> PV Name /dev/sdb

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> PV Size 2.73 TiB / not usable 1022.00 MiB

>> 

>> 

>> 

Libor> Allocatable yes

>> 

>> 

>> 

Libor> PE Size 4.00 MiB

>> 

>> 

>> 

Libor> Total PE 714884

>> 

>> 

>> 

Libor> Free PE 315671

>> 

>> 

>> 

Libor> Allocated PE 399213

>> 

>> 

>> 

Libor> PV UUID 5ZhwR7-AClb-oEsi-s2Zi-xouM-en0Z-ZQ0fwr

>> 

>> 

>> 

Libor> --- Physical volume ---

>> 

>> 

>> 

Libor> PV Name /dev/sdg

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> PV Size 2.73 TiB / not usable 2.00 MiB

>> 

>> 

>> 

Libor> Allocatable yes

>> 

>> 

>> 

Libor> PE Size 4.00 MiB

>> 

>> 

>> 

Libor> Total PE 715396

>> 

>> 

>> 

Libor> Free PE 321305

>> 

>> 

>> 

Libor> Allocated PE 394091

>> 

>> 

>> 

Libor> PV UUID yaohhB-dkF6-rQRk-dBsL-JHS7-8KOo-eYSqOj

>> 

>> 

>> 

Libor> -----------------------------

>> 

>> 

>> 

Libor> vgs -v

>> 

>> 

>> 

Libor> VG Attr Ext #PV #LV #SN VSize VFree VG UUID

>> 

>> 

>> 

Libor> vgPecDisk1 wz--n- 4.00m 1 3 0 464.92g 0

>> 

>> >> Dtbxaa-KySR-R1VY-Wliy-Lqba-HQyt-7PYmnv

>> 

Libor> vgPecDisk2 wz--n- 4.00m 4 20 0 10.91t 5.66t

>> 

>> >> 0Ok7sE-Eo1O-pbuT-LX3D-dluI-25dw-cr9DY8

>> 

Libor> --------------------------------

>> 

>> 

>> 

Libor> vgdisplay

>> 

>> 

>> 

Libor> --- Volume group ---

>> 

>> 

>> 

Libor> VG Name vgPecDisk1

>> 

>> 

>> 

Libor> System ID

>> 

>> 

>> 

Libor> Format lvm2

>> 

>> 

>> 

Libor> Metadata Areas 1

>> 

>> 

>> 

Libor> Metadata Sequence No 9

>> 

>> 

>> 

Libor> VG Access read/write

>> 

>> 

>> 

Libor> VG Status resizable

>> 

>> 

>> 

Libor> MAX LV 0

>> 

>> 

>> 

Libor> Cur LV 3

>> 

>> 

>> 

Libor> Open LV 3

>> 

>> 

>> 

Libor> Max PV 0

>> 

>> 

>> 

Libor> Cur PV 1

>> 

>> 

>> 

Libor> Act PV 1

>> 

>> 

>> 

Libor> VG Size 464.92 GiB

>> 

>> 

>> 

Libor> PE Size 4.00 MiB

>> 

>> 

>> 

Libor> Total PE 119019

>> 

>> 

>> 

Libor> Alloc PE / Size 119019 / 464.92 GiB

>> 

>> 

>> 

Libor> Free PE / Size 0 / 0

>> 

>> 

>> 

Libor> VG UUID Dtbxaa-KySR-R1VY-Wliy-Lqba-HQyt-7PYmnv

>> 

>> 

>> 

Libor> --- Volume group ---

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> System ID

>> 

>> 

>> 

Libor> Format lvm2

>> 

>> 

>> 

Libor> Metadata Areas 8

>> 

>> 

>> 

Libor> Metadata Sequence No 476

>> 

>> 

>> 

Libor> VG Access read/write

>> 

>> 

>> 

Libor> VG Status resizable

>> 

>> 

>> 

Libor> MAX LV 0

>> 

>> 

>> 

Libor> Cur LV 20

>> 

>> 

>> 

Libor> Open LV 13

>> 

>> 

>> 

Libor> Max PV 0

>> 

>> 

>> 

Libor> Cur PV 4

>> 

>> 

>> 

Libor> Act PV 4

>> 

>> 

>> 

Libor> VG Size 10.91 TiB

>> 

>> 

>> 

Libor> PE Size 4.00 MiB

>> 

>> 

>> 

Libor> Total PE 2860560

>> 

>> 

>> 

Libor> Alloc PE / Size 1375996 / 5.25 TiB

>> 

>> 

>> 

Libor> Free PE / Size 1484564 / 5.66 TiB

>> 

>> 

>> 

Libor> VG UUID 0Ok7sE-Eo1O-pbuT-LX3D-dluI-25dw-cr9DY8

>> 

>> 

>> 

Libor> ------------------------------

>> 

>> 

>> 

Libor> lvs -v

>> 

>> 

>> 

Libor> Finding all logical volumes

>> 

>> 

>> 

Libor> LV VG #Seg Attr LSize Maj Min KMaj KMin Pool Origin Data% Meta% Move

>> 

>> >> Copy% Log Convert LV UUID

>> 

Libor> lvSwap vgPecDisk1 1 -wi-ao-- 3.72g -1 -1 253 1

>> 

>> >> Jo9ie0-jKfo-Ks6Q-TsgK-skvM-qJio-Ar5WWe

>> 

Libor> lvSystem vgPecDisk1 1 -wi-ao-- 64.00g -1 -1 253 0

>> 

>> >> ZEdPxL-Wn5s-QapH-BzdZ-4Os7-eV0g-SVwNoD

>> 

Libor> lvTmp vgPecDisk1 1 -wi-ao-- 397.20g -1 -1 253 31

>> 

>> >> JjgNKC-ctgq-VDz3-BJbn-HZHd-W3s2-XWxUT9

>> 

Libor> lvAmandaDaily01 vgPecDisk2 1 rwi-aor- 100.01g -1 -1 253 82

>> 

>> >> lrBae6-Yj5V-OZUT-Z4Qz-umsu-6SGe-35SJfK

>> 

Libor> lvAmandaDaily01old vgPecDisk2 1 rwi---r- 1.09t -1 -1 -1 -1

>> 

>> >> nofmj3-ntya-cbDi-ZjZH-zBKV-K1PA-Sw0Pvq

>> 

Libor> lvAmandaDailyAuS01 vgPecDisk2 1 rwi-aor- 360.00g -1 -1 253 10

>> 

Libor> fW0QrZ-sa2J-21nM-0qDv-nTUx-Eomx-3KTocB

>> 

>> 

>> 

Libor> lvAmandaDailyAuS01_rimage_2_extracted vgPecDisk2 1 vwi---v- 120.00g

>> 

>> >> -1 -1 -1 -1 Libor> Ii0Hyk-A2d3-PUC3-CMZL-CqDY-qFLs-yuDKwq

>> 

Libor> lvAmandaDailyAuS01_rmeta_2_extracted vgPecDisk2 1 vwi---v- 4.00m -1

>> 

>> >> -1 -1 -1 Libor> WNq913-IM82-Cnh0-dmPb-BzWE-KJNP-H84dmS

>> 

Libor> lvAmandaDailyBlS01 vgPecDisk2 1 rwi---r- 320.00g -1 -1 -1 -1

>> 

Libor> fJTCsr-MF1S-jAXo-7SHc-Beyf-ICMV-LJQpnt

>> 

>> 

>> 

Libor> lvAmandaDailyElme01 vgPecDisk2 1 rwi-aor- 144.00g -1 -1 253 89

>> 

Libor> 1Q0Sre-CnV1-wqPZ-9bf0-qnW6-6nqt-NOlxyp

>> 

>> 

>> 

Libor> lvAmandaDailyEl01 vgPecDisk2 1 rwi-aor- 350.00g -1 -1 253 74

>> 

Libor> Sni0fy-Bf1V-AKXS-Qfd1-qmFC-MUwY-xgCw22

>> 

>> 

>> 

Libor> lvAmandaHoldingDisk vgPecDisk2 1 rwi-aor- 36.00g -1 -1 253 28

>> 

Libor> e5pr0g-cH2I-dMHd-lwsi-JRR0-0D0P-67eXLY

>> 

>> 

>> 

Libor> lvBackupElme2 vgPecDisk2 1 rwi-aor- 350.00g -1 -1 253 46

>> 

>> >> Ee9RAX-ycZ8-PNzl-MUvg-VjPl-8vfW-BjfaQ9

>> 

Libor> lvBackupPc vgPecDisk2 1 rwi---r- 640.01g -1 -1 -1 -1

>> 

>> >> KaX4sX-CJsU-L5Ac-85OA-74HT-JX3L-nFxFTZ

>> 

Libor> lvBackupPc2 vgPecDisk2 1 rwi-aor- 600.00g -1 -1 253 19

>> 

>> >> 2o9JWs-2hZT-4uMO-WJTd-ByMH-ugd9-3iGfke

>> 

Libor> lvBackupRsync vgPecDisk2 1 rwi---r- 256.01g -1 -1 -1 -1

>> 

>> >> cQOavD-85Pj-yu6X-yTpS-qxxT-XBWV-WIISKQ

>> 

Libor> lvBackupRsync2 vgPecDisk2 1 rwi-aor- 100.01g -1 -1 253 129

>> 

>> >> S4frRu-dVgG-Pomd-5niY-bLzd-S2wq-KxMPhM

>> 

Libor> lvBackupRsyncCCCrossserver vgPecDisk2 1 rwi-aor- 50.00g -1 -1 253 100

>> 

Libor> ytiis9-T1Pq-FAjT-MGhn-2nKd-zHFk-ROzeUf

>> 

>> 

>> 

Libor> lvBackupVokapo vgPecDisk2 1 rwi-aor- 128.00g -1 -1 253 107

>> 

>> >> pq67wa-NjPs-PwEx-rs1G-cZxf-s5xI-wkB9Ag

>> 

Libor> lvLXCElMysqlSlave vgPecDisk2 1 rwi-aor- 32.00g -1 -1 253 65

>> 

>> >> 2fh6ch-2y5s-N3Ua-1Q1u-XSfx-JViq-x6dwut

>> 

Libor> lvLXCIcinga vgPecDisk2 1 rwi---r- 32.00g -1 -1 -1 -1

>> 

>> >> 2kYSPl-HONv-zuf0-dhQn-1xI3-YVuU-brbumU

>> 

Libor> lvLXCJabber vgPecDisk2 1 rwi-aom- 4.00g -1 -1 253 56 100.00

>> 

>> >> AAWI1f-fYFO-2ewM-YvfP-AdC4-bXd8-k2NiZZ

>> 

Libor> lvLXCWebxMysqlSlave vgPecDisk2 1 rwi-aom- 16.00g -1 -1 253 51 100.00

>> 

Libor> m2dzFv-axwm-2Ne6-kJkN-a3zo-E8Ai-qViTae

>> 

>> 

>> 

Libor> -----------------------------

>> 

>> 

>> 

Libor> lvdisplay

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk1/lvSwap

>> 

>> 

>> 

Libor> LV Name lvSwap

>> 

>> 

>> 

Libor> VG Name vgPecDisk1

>> 

>> 

>> 

Libor> LV UUID Jo9ie0-jKfo-Ks6Q-TsgK-skvM-qJio-Ar5WWe

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-02-20 12:22:52 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 2

>> 

>> 

>> 

Libor> LV Size 3.72 GiB

>> 

>> 

>> 

Libor> Current LE 953

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 256

>> 

>> 

>> 

Libor> Block device 253:1

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk1/lvSystem

>> 

>> 

>> 

Libor> LV Name lvSystem

>> 

>> 

>> 

Libor> VG Name vgPecDisk1

>> 

>> 

>> 

Libor> LV UUID ZEdPxL-Wn5s-QapH-BzdZ-4Os7-eV0g-SVwNoD

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-02-20 12:23:03 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 64.00 GiB

>> 

>> 

>> 

Libor> Current LE 16384

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 256

>> 

>> 

>> 

Libor> Block device 253:0

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk1/lvTmp

>> 

>> 

>> 

Libor> LV Name lvTmp

>> 

>> 

>> 

Libor> VG Name vgPecDisk1

>> 

>> 

>> 

Libor> LV UUID JjgNKC-ctgq-VDz3-BJbn-HZHd-W3s2-XWxUT9

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-06-10 06:47:09 +0200

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 397.20 GiB

>> 

>> 

>> 

Libor> Current LE 101682

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 256

>> 

>> 

>> 

Libor> Block device 253:31

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvLXCWebxMysqlSlave

>> 

>> 

>> 

Libor> LV Name lvLXCWebxMysqlSlave

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID m2dzFv-axwm-2Ne6-kJkN-a3zo-E8Ai-qViTae

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-02-21 18:15:22 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 16.00 GiB

>> 

>> 

>> 

Libor> Current LE 4096

>> 

>> 

>> 

Libor> Mirrored volumes 2

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 256

>> 

>> 

>> 

Libor> Block device 253:51

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDaily01old

>> 

>> 

>> 

Libor> LV Name lvAmandaDaily01old

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID nofmj3-ntya-cbDi-ZjZH-zBKV-K1PA-Sw0Pvq

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-02-24 21:03:49 +0100

>> 

>> 

>> 

Libor> LV Status NOT available

>> 

>> 

>> 

Libor> LV Size 1.09 TiB

>> 

>> 

>> 

Libor> Current LE 286722

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDailyBlS01

>> 

>> 

>> 

Libor> LV Name lvAmandaDailyBlS01

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID fJTCsr-MF1S-jAXo-7SHc-Beyf-ICMV-LJQpnt

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-03-18 08:50:38 +0100

>> 

>> 

>> 

Libor> LV Status NOT available

>> 

>> 

>> 

Libor> LV Size 320.00 GiB

>> 

>> 

>> 

Libor> Current LE 81921

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvLXCJabber

>> 

>> 

>> 

Libor> LV Name lvLXCJabber

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID AAWI1f-fYFO-2ewM-YvfP-AdC4-bXd8-k2NiZZ

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-03-20 15:19:54 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 4.00 GiB

>> 

>> 

>> 

Libor> Current LE 1024

>> 

>> 

>> 

Libor> Mirrored volumes 2

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 256

>> 

>> 

>> 

Libor> Block device 253:56

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvBackupPc

>> 

>> 

>> 

Libor> LV Name lvBackupPc

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID KaX4sX-CJsU-L5Ac-85OA-74HT-JX3L-nFxFTZ

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-07-01 13:22:50 +0200

>> 

>> 

>> 

Libor> LV Status NOT available

>> 

>> 

>> 

Libor> LV Size 640.01 GiB

>> 

>> 

>> 

Libor> Current LE 163842

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvLXCIcinga

>> 

>> 

>> 

Libor> LV Name lvLXCIcinga

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID 2kYSPl-HONv-zuf0-dhQn-1xI3-YVuU-brbumU

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-08-13 19:04:28 +0200

>> 

>> 

>> 

Libor> LV Status NOT available

>> 

>> 

>> 

Libor> LV Size 32.00 GiB

>> 

>> 

>> 

Libor> Current LE 8193

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvBackupRsync

>> 

>> 

>> 

Libor> LV Name lvBackupRsync

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID cQOavD-85Pj-yu6X-yTpS-qxxT-XBWV-WIISKQ

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-09-17 14:49:57 +0200

>> 

>> 

>> 

Libor> LV Status NOT available

>> 

>> 

>> 

Libor> LV Size 256.01 GiB

>> 

>> 

>> 

Libor> Current LE 65538

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDaily01

>> 

>> 

>> 

Libor> LV Name lvAmandaDaily01

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID lrBae6-Yj5V-OZUT-Z4Qz-umsu-6SGe-35SJfK

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-04 08:26:46 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 100.01 GiB

>> 

>> 

>> 

Libor> Current LE 25602

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:82

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvBackupRsync2

>> 

>> 

>> 

Libor> LV Name lvBackupRsync2

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID S4frRu-dVgG-Pomd-5niY-bLzd-S2wq-KxMPhM

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-04 19:17:17 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 100.01 GiB

>> 

>> 

>> 

Libor> Current LE 25602

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:129

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvBackupPc2

>> 

>> 

>> 

Libor> LV Name lvBackupPc2

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID 2o9JWs-2hZT-4uMO-WJTd-ByMH-ugd9-3iGfke

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-04 23:13:51 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 600.00 GiB

>> 

>> 

>> 

Libor> Current LE 153600

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:19

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvBackupElme2

>> 

>> 

>> 

Libor> LV Name lvBackupElme2

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID Ee9RAX-ycZ8-PNzl-MUvg-VjPl-8vfW-BjfaQ9

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-04 23:21:44 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 350.00 GiB

>> 

>> 

>> 

Libor> Current LE 89601

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:46

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvLXCElMysqlSlave

>> 

>> 

>> 

Libor> LV Name lvLXCElMysqlSlave

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID 2fh6ch-2y5s-N3Ua-1Q1u-XSfx-JViq-x6dwut

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-05 16:36:42 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 32.00 GiB

>> 

>> 

>> 

Libor> Current LE 8193

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:65

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDailyAuS01_rimage_2_extracted

>> 

>> 

>> 

Libor> LV Name lvAmandaDailyAuS01_rimage_2_extracted

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID Ii0Hyk-A2d3-PUC3-CMZL-CqDY-qFLs-yuDKwq

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-02-25 09:55:03 +0100

>> 

>> 

>> 

Libor> LV Status NOT available

>> 

>> 

>> 

Libor> LV Size 120.00 GiB

>> 

>> 

>> 

Libor> Current LE 30721

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDailyAuS01_rmeta_2_extracted

>> 

>> 

>> 

Libor> LV Name lvAmandaDailyAuS01_rmeta_2_extracted

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID WNq913-IM82-Cnh0-dmPb-BzWE-KJNP-H84dmS

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2014-02-25 09:55:03 +0100

>> 

>> 

>> 

Libor> LV Status NOT available

>> 

>> 

>> 

Libor> LV Size 4.00 MiB

>> 

>> 

>> 

Libor> Current LE 1

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDailyAuS01

>> 

>> 

>> 

Libor> LV Name lvAmandaDailyAuS01

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID fW0QrZ-sa2J-21nM-0qDv-nTUx-Eomx-3KTocB

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-05 17:49:47 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 360.00 GiB

>> 

>> 

>> 

Libor> Current LE 92160

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:10

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaHoldingDisk

>> 

>> 

>> 

Libor> LV Name lvAmandaHoldingDisk

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID e5pr0g-cH2I-dMHd-lwsi-JRR0-0D0P-67eXLY

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-05 18:48:36 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 36.00 GiB

>> 

>> 

>> 

Libor> Current LE 9216

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:28

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDailyEl01

>> 

>> 

>> 

Libor> LV Name lvAmandaDailyEl01

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID Sni0fy-Bf1V-AKXS-Qfd1-qmFC-MUwY-xgCw22

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-05 19:00:26 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 350.00 GiB

>> 

>> 

>> 

Libor> Current LE 89601

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:74

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvBackupRsyncCCCrossserver

>> 

>> 

>> 

Libor> LV Name lvBackupRsyncCCCrossserver

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID ytiis9-T1Pq-FAjT-MGhn-2nKd-zHFk-ROzeUf

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-05 22:39:09 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 50.00 GiB

>> 

>> 

>> 

Libor> Current LE 12801

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:100

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvAmandaDailyElme01

>> 

>> 

>> 

Libor> LV Name lvAmandaDailyElme01

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID 1Q0Sre-CnV1-wqPZ-9bf0-qnW6-6nqt-NOlxyp

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-05 22:49:05 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 144.00 GiB

>> 

>> 

>> 

Libor> Current LE 36864

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:89

>> 

>> 

>> 

Libor> --- Logical volume ---

>> 

>> 

>> 

Libor> LV Path /dev/vgPecDisk2/lvBackupVokapo

>> 

>> 

>> 

Libor> LV Name lvBackupVokapo

>> 

>> 

>> 

Libor> VG Name vgPecDisk2

>> 

>> 

>> 

Libor> LV UUID pq67wa-NjPs-PwEx-rs1G-cZxf-s5xI-wkB9Ag

>> 

>> 

>> 

Libor> LV Write Access read/write

>> 

>> 

>> 

Libor> LV Creation host, time pec, 2015-03-05 22:54:23 +0100

>> 

>> 

>> 

Libor> LV Status available

>> 

>> 

>> 

Libor> # open 1

>> 

>> 

>> 

Libor> LV Size 128.00 GiB

>> 

>> 

>> 

Libor> Current LE 32769

>> 

>> 

>> 

Libor> Segments 1

>> 

>> 

>> 

Libor> Allocation inherit

>> 

>> 

>> 

Libor> Read ahead sectors auto

>> 

>> 

>> 

Libor> - currently set to 1024

>> 

>> 

>> 

Libor> Block device 253:107

>> 

>> 

>> 

Libor> -----------------------

>> 

Libor> Dne St 11.�b�ezna�2015 11:57:43, John Stoffel napsal(a):

>> >> >> Libor,

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >> Can you please post the output of the following commands, so that we

>> >> >>

>> >> >>

>> >> >>

>> >> >> can understand your setup and see what's really going on here. More

>> >> >>

>> >> >>

>> >> >>

>> >> >> info is better than less!

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >> cat /proc/partitions

>> >> >>

>> >> >>

>> >> >>

>> >> >> pvs -v

>> >> >>

>> >> >>

>> >> >>

>> >> >> pvdisplay

>> >> >>

>> >> >>

>> >> >>

>> >> >> vgs -v

>> >> >>

>> >> >>

>> >> >>

>> >> >> vgdisplay

>> >> >>

>> >> >>

>> >> >>

>> >> >> lvs -v

>> >> >>

>> >> >>

>> >> >>

>> >> >> lvdisplay

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >> and if you have PVs which are NOT on top of raw partitions, then

>> >> >>

>> >> >>

>> >> >>

>> >> >> include cat /proc/mdstat as well, or whatever device tool you have.

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >> Basically, we're trying to understand how you configured your setup

>> >> >>

>> >> >>

>> >> >>

>> >> >> from the physical disks, to the volumes on them. I don't care much

>> >> >>

>> >> >>

>> >> >>

>> >> >> about the filesystems, they're going to be inside individual LVs I

>> >> >>

>> >> >>

>> >> >>

>> >> >> assume.

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >> John

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >>

>> >> >> _______________________________________________

>> >> >>

>> >> >>

>> >> >>

>> >> >> linux-lvm mailing list

>> >> >>

>> >> >>

>> >> >>

>> >> >> linux-lvm@redhat.com

>> >> >>

>> >> >>

>> >> >>

>> >> >> https://www.redhat.com/mailman/listinfo/linux-lvm

>> >> >>

>> >> >>

>> >> >>

>> >> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

>> 

Libor> _______________________________________________

>> 

Libor> linux-lvm mailing list

>> 

Libor> linux-lvm@redhat.com

>> 

Libor> https://www.redhat.com/mailman/listinfo/linux-lvm

>> 

Libor> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

>> 

>> >> _______________________________________________

>> >>

>> >> linux-lvm mailing list

>> >>

>> >> linux-lvm@redhat.com

>> >>

>> >> https://www.redhat.com/mailman/listinfo/linux-lvm

>> >>

>> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

>> 

Libor> _______________________________________________

Libor> linux-lvm mailing list

Libor> linux-lvm@redhat.com

Libor> https://www.redhat.com/mailman/listinfo/linux-lvm

Libor> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

>> 

>> _______________________________________________

>> linux-lvm mailing list

>> linux-lvm@redhat.com

>> https://www.redhat.com/mailman/listinfo/linux-lvm

>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Libor> _______________________________________________
Libor> linux-lvm mailing list
Libor> linux-lvm@redhat.com
Libor> https://www.redhat.com/mailman/listinfo/linux-lvm
Libor> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
