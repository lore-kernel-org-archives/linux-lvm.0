Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB7IlE35014594
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 13:47:14 -0500
Received: from mail-px0-f183.google.com (mail-px0-f183.google.com
	[209.85.216.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB7Il4ff007084
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 13:47:05 -0500
Received: by pxi13 with SMTP id 13so2176380pxi.24
	for <linux-lvm@redhat.com>; Mon, 07 Dec 2009 10:47:04 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 7 Dec 2009 19:47:04 +0100
Message-ID: <691e2b620912071047jaf3e752m3a49fadbf6a3ae5f@mail.gmail.com>
From: Johan Gardell <gardin@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Re: Problems with dissapearing PV when mounting
	(Stuart D. Gathman)
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Ok, added a filter to remove /dev/fd0. But i still get
[22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
lookup failed
[22723.980395] device-mapper: ioctl: error adding target to table
[22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
lookup failed
[22724.001158] device-mapper: ioctl: error adding target to table

It doesn't mention fd0 as far as i understand?

Yes, if i remember correctly, the partition im trying to read on the
vg gardin is called root. The filesystem is ReiserFS. My current root
on the vg Dreamhack is also a ReiserFS, so i have all the modules
loaded.

mount doesn't give any messages in dmesg

lvs shows:
  LV          VG        Attr   LSize   Origin Snap%  Move Log Copy%  Convert
  dreamhacklv Dreamhack -wi-ao   1,23t
  root        gardin    -wi-d- 928,00g
  swap_1      gardin    -wi-d-   2,59g

if i try to mount with:
  mount -t reiserfs /dev/mapper/gardin-root /mnt/tmp

i get this in dmesg:
  [23113.711247] REISERFS warning (device dm-1): sh-2006
read_super_block: bread failed (dev dm-1, block 2, size 4096)
  [23113.711257] REISERFS warning (device dm-1): sh-2006
read_super_block: bread failed (dev dm-1, block 16, size 4096)
  [23113.711261] REISERFS warning (device dm-1): sh-2021
reiserfs_fill_super: can not find reiserfs on dm-1

//Johan

2009/12/7  <linux-lvm-request@redhat.com>:
> Send linux-lvm mailing list submissions to
> � � � �linux-lvm@redhat.com
>
> To subscribe or unsubscribe via the World Wide Web, visit
> � � � �https://www.redhat.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
> � � � �linux-lvm-request@redhat.com
>
> You can reach the person managing the list at
> � � � �linux-lvm-owner@redhat.com
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
>
>
> Today's Topics:
>
> � 1. Re: Questions regarding LVM (malahal@us.ibm.com)
> � 2. Re: Questions regarding LVM (Ray Morris)
> � 3. Re: Questions regarding LVM (Stuart D. Gathman)
> � 4. Problems with dissapearing PV when mounting (Johan Gardell)
> � 5. Re: Problems with dissapearing PV when mounting
> � � �(Stuart D. Gathman)
> � 6. LVM crash maybe due to a drbd issue (Maxence DUNNEWIND)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Thu, 3 Dec 2009 10:42:19 -0800
> From: malahal@us.ibm.com
> Subject: Re: [linux-lvm] Questions regarding LVM
> To: linux-lvm@redhat.com
> Message-ID: <20091203184219.GA29968@us.ibm.com>
> Content-Type: text/plain; charset=us-ascii
>
> Vishal Verma -X (vishaver - Embedded Resource Group at Cisco) [vishaver@cisco.com] wrote:
>> � �1. � � � Under scenario where, several hard-drives are part of LVM volume
>> � �group and if one of hard-disk gets corrupted then would whole volume group
>> � �be inaccessible ?
>
> No.
>
>> � �What would be impact on volume group's filesystem ?
>
> A volume group may have several file system images. You should have no
> problem in accessing logical volumes (or file systems on them) that
> don't include the corrupted/failed disk. Obviously, logical volumes that
> include the corrupted/failed disk will have problems unless it is
> a mirrored logical volume!
>
>> � �2. � � � From stability perspective, which version of LVM is better on
>> � �Linux kernel 2.6.x, LVM2 or LVM1 ?
>
> I would go with LVM2.
>
>
>
> ------------------------------
>
> Message: 2
> Date: Thu, 03 Dec 2009 12:43:56 -0600
> From: Ray Morris <support@bettercgi.com>
> Subject: Re: [linux-lvm] Questions regarding LVM
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <1259865836.6713.13@raydesk1.bettercgi.com>
> Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
>
>> 1. � � � Under scenario where, several hard-drives are part of LVM
>> volume group and if one of hard-disk gets corrupted then would whole
>> volume group be inaccessible ?
>
>
> See the --partial option. �See also vgcfgrestore. (rtfm)
> Basically, if the drive is merely "corrupted" as you said,
> there could be some currupted data. �If the drive is missing
> or largely unuseable those extents are gone, so LVs with
> important extents on that PV would have serious problems,
> but LVs with no extents on that PV should be fine. �"Important"
> extents means, for example, if a 400GB LV which is only 10%
> full has only it's last couple on extents on the missing PV
> that may not be a major problem, if no data is stored there
> yet. �On the other hand, the first extent of the filesystem
> probably contains very important information about the
> filesystem as a whole, so if that first extent is unuseable
> you're probably reduced to greping the LV, or using an automated
> search tool that basically greps the LV - the same type of
> tools used for undelete or corrupted disks without LVM.
>
>> What would be impact on volume group's filesystem ?
>
> � �VGs don't have filesystems. �LVs do. This is the same
> question as "if I'm NOT using LVM and parts of my drive go
> bad what is the effect on the filesystem?" The ability to
> salvage files from the filesystems of affected LVs depends
> on how many extents are missing or corrupted, which extents
> those are, and what type of filesystem is used.
>
> � �So in summary, LVM doesn't change much in terms of the
> affect of a bad disk. �You should still have really solid
> backups and probably use RAID.
> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
> On 12/03/2009 12:22:11 PM, Vishal Verma -X (vishaver - Embedded
> Resource Group at Cisco) wrote:
>> Hello all,
>>
>>
>>
>> � � I am new to this mailing list. I have few questions regarding
>> Linux
>> LVM, would appreciate if LVM gurus could answer.
>>
>>
>>
>>
>>
>> 1. � � � Under scenario where, several hard-drives are part of LVM
>> volume group and if one of hard-disk gets corrupted then would whole
>> volume group be inaccessible ?
>>
>> What would be impact on volume group's filesystem ?
>>
>>
>>
>> 2. � � � From stability perspective, which version of LVM is better on
>> Linux kernel 2.6.x, LVM2 or LVM1 ?
>>
>>
>>
>> Regards,
>>
>> Vishal
>>
>>
>>
>>
>
> ------quoted attachment------
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Thu, 3 Dec 2009 13:50:52 -0500 (EST)
> From: "Stuart D. Gathman" <stuart@bmsi.com>
> Subject: Re: [linux-lvm] Questions regarding LVM
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <Pine.LNX.4.64.0912031342400.13455@bmsred.bmsi.com>
> Content-Type: TEXT/PLAIN; charset=US-ASCII
>
> On Thu, 3 Dec 2009, Vishal Verma -X (vishaver - Embedded Resource Group at Cisco) wrote:
>
>> 1. � � � Under scenario where, several hard-drives are part of LVM
>> volume group and if one of hard-disk gets corrupted then would whole
>> volume group be inaccessible ?
>
> Short answer: it depends
>
> Long answer: For raw plain hard drives, only logical volumes using the
> affected drive are inaccessible. �Think of LVM as managing fancy run-time
> expandable partitions. �You may wish to ensure that the LVM metadata (the LVM
> equivalent of the partition table) is stored in multiple locations, or
> frequently backed up from /etc/lvm.
>
> More often, the "drives" that are part of LVM are software or hardware RAID
> drives. �In addition, Linux LVM supports mirroring (RAID1) at the LV level
> - although not yet as smoothly as other LVM systems.
>
>> What would be impact on volume group's filesystem ?
>
> Same as with any other partition that goes south.
>
>> 2. � � � From stability perspective, which version of LVM is better on
>> Linux kernel 2.6.x, LVM2 or LVM1 ?
>
> LVM2
>
> --
> � � � � � � �Stuart D. Gathman <stuart@bmsi.com>
> � �Business Management Systems Inc. �Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
>
>
> ------------------------------
>
> Message: 4
> Date: Sun, 6 Dec 2009 19:47:55 +0100
> From: Johan Gardell <gardin@gmail.com>
> Subject: [linux-lvm] Problems with dissapearing PV when mounting
> To: linux-lvm@redhat.com
> Message-ID:
> � � � �<691e2b620912061047i13bd740eq947dc2a67086e439@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Hi all!
>
> I am having some troubles with mounting a vg consisting of two PVs.
> After booting, the partition /dev/sdb5 does not pop up (but 1-3 does
> and 4th is a swap). If i issue partprobe -s it does show up though.
>
> partprobe shows:
>
> /dev/sda: msdos partitions 1 2 3
> /dev/sdb: msdos partitions 1 2 <5>
> /dev/sdc: msdos partitions 1 3 2
>
> I don't know what <> means but that is one of the PVs
>
> If i, after issuing partprobe, use pvscan it shows:
> �PV /dev/sdc2 � VG Dreamhack � lvm2 [1,23 TiB / 0 � �free]
> �PV /dev/sdb5 � VG gardin � � �lvm2 [465,52 GiB / 0 � �free]
> �PV /dev/sdd � �VG gardin � � �lvm2 [465,76 GiB / 704,00 MiB free]
> �Total: 3 [2,14 TiB] / in use: 3 [2,14 TiB] / in no VG: 0 [0 � ]
>
> vgscan:
> �Reading all physical volumes. �This may take a while...
> �Found volume group "Dreamhack" using metadata type lvm2
> �Found volume group "gardin" using metadata type lvm2
>
> But the problems appear when:
> vgchange -ay gardin
> �device-mapper: reload ioctl failed: Invalid argument
> �device-mapper: reload ioctl failed: Invalid argument
> �2 logical volume(s) in volume group "gardin" now active
>
> Where dmesg shows:
> [31936.135588] device-mapper: table: 254:1: linear: dm-linear: Device
> lookup failed
> [31936.135592] device-mapper: ioctl: error adding target to table
> [31936.150572] device-mapper: table: 254:2: linear: dm-linear: Device
> lookup failed
> [31936.150576] device-mapper: ioctl: error adding target to table
> [31940.024525] end_request: I/O error, dev fd0, sector 0
>
> And trying to mount the vg:
> mount /dev/mapper/gardin-root /mnt/tmp
> �mount: you must specify the filesystem type
>
> I have googled some but can't find much about this issue, does anyone
> have any ideas how i can obtain the data stored on the disk? Because i
> really need it..
>
> I am running debian squeeze with a 2.6.30-2-686 kernel, the partitions
> were originally created under debian lenny (don't know the kernel
> version back then though)
>
> lvm version shows:
> �LVM version: � � 2.02.54(1) (2009-10-26)
> �Library version: 1.02.39 (2009-10-26)
> �Driver version: �4.14.0
>
> Thanks in regards
> //Johan
>
>
>
> ------------------------------
>
> Message: 5
> Date: Sun, 6 Dec 2009 21:22:13 -0500 (EST)
> From: "Stuart D. Gathman" <stuart@bmsi.com>
> Subject: Re: [linux-lvm] Problems with dissapearing PV when mounting
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <Pine.LNX.4.64.0912062114210.24919@bmsred.bmsi.com>
> Content-Type: TEXT/PLAIN; charset=US-ASCII
>
> On Sun, 6 Dec 2009, Johan Gardell wrote:
>
>> But the problems appear when:
>> vgchange -ay gardin
>> � device-mapper: reload ioctl failed: Invalid argument
>> � device-mapper: reload ioctl failed: Invalid argument
>> � 2 logical volume(s) in volume group "gardin" now active
>>
>> Where dmesg shows:
>> [31936.135588] device-mapper: table: 254:1: linear: dm-linear: Device
>> lookup failed
>> [31936.135592] device-mapper: ioctl: error adding target to table
>> [31936.150572] device-mapper: table: 254:2: linear: dm-linear: Device
>> lookup failed
>> [31936.150576] device-mapper: ioctl: error adding target to table
>> [31940.024525] end_request: I/O error, dev fd0, sector 0
>
> The fd0 error means you need to exclude /dev/fd0 from the vgscan in
> /etc/lvm/lvm.conf (or wherever Debian puts it). �Start to worry
> if you get I/O errors on sdb or sdc.
>
>> And trying to mount the vg:
>> mount /dev/mapper/gardin-root /mnt/tmp
>> � mount: you must specify the filesystem type
>
> You need to show us the output of 'lvs'. �(Even if it just spits out an error.)
>
> Is there an LV named "root"? �I think so, since it would say "special device
> does not exist" if not. �But what kind of filesystem did it have
> on it? �Maybe it is not an auto-detected one, or you need to load
> the filesystem driver. �Does mount report I/O error if it gets one
> trying to identify the filesystem?
>
> --
> � � � � � � �Stuart D. Gathman <stuart@bmsi.com>
> � �Business Management Systems Inc. �Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
>
>
> ------------------------------
>
> Message: 6
> Date: Mon, 7 Dec 2009 17:40:18 +0100
> From: Maxence DUNNEWIND <maxence@dunnewind.net>
> Subject: [linux-lvm] LVM crash maybe due to a drbd issue
> To: drbd-user@lists.linbit.com
> Message-ID: <20091207164018.GV21917@dunnewind.net>
> Content-Type: text/plain; charset="iso-8859-1"
>
> Hi,
>
> I'm using drbd with lv LVM. The layout is :
> drbd -> lv -> vg -> pv . I'm trying to do a vgchange -ay on the underlying lv,
> which is hanging and use 50% of a cpu. An echo w > /proc/sysrq-trigger gives me
> an interesting thing :
>
> Dec �7 13:35:26 z2-3 kernel: [8617743.246522] SysRq : Show Blocked State
> Dec �7 13:35:26 z2-3 kernel: [8617743.246548] � task � � � � � � � � � � � �PC
> stack � pid father
> Dec �7 13:35:26 z2-3 kernel: [8617743.246561] pdflush � � � D ffff8800280350c0
> 0 14401 � � �2
> Dec �7 13:35:26 z2-3 kernel: [8617743.246564] �ffff88012f04f8d0 0000000000000046
> ffff88000150b808 ffffffff80215d6a
> Dec �7 13:35:26 z2-3 kernel: [8617743.246566] �ffff88000150b7d0 00000000000120c0
> 000000000000e250 ffff88012f0ac770
> Dec �7 13:35:26 z2-3 kernel: [8617743.246569] �ffff88012f0aca60 0000000000000003
> 0000000000000086 ffffffff8023bc87
> Dec �7 13:35:26 z2-3 kernel: [8617743.246571] Call Trace:
> Dec �7 13:35:26 z2-3 kernel: [8617743.246578] �[<ffffffff80215d6a>] ?
> native_sched_clock+0x2e/0x5b
> Dec �7 13:35:26 z2-3 kernel: [8617743.246582] �[<ffffffff8023bc87>] ?
> try_to_wake_up+0x212/0x224
> Dec �7 13:35:26 z2-3 kernel: [8617743.246585] �[<ffffffff8024accf>] ?
> lock_timer_base+0x26/0x4c
> Dec �7 13:35:26 z2-3 kernel: [8617743.246589] �[<ffffffff804b4500>] ?
> schedule+0x9/0x1d
> Dec �7 13:35:26 z2-3 kernel: [8617743.246592] �[<ffffffff804b46eb>] ?
> schedule_timeout+0x90/0xb6
> Dec �7 13:35:26 z2-3 kernel: [8617743.246594] �[<ffffffff8024adc8>] ?
> process_timeout+0x0/0x5
> Dec �7 13:35:26 z2-3 kernel: [8617743.246596] �[<ffffffff804b46e6>] ?
> schedule_timeout+0x8b/0xb6
> Dec �7 13:35:26 z2-3 kernel: [8617743.246598] �[<ffffffff804b3ac3>] ?
> io_schedule_timeout+0x66/0xae
> Dec �7 13:35:26 z2-3 kernel: [8617743.246601] �[<ffffffff802a26f0>] ?
> congestion_wait+0x66/0x80
> Dec �7 13:35:26 z2-3 kernel: [8617743.246604] �[<ffffffff8025473e>] ?
> autoremove_wake_function+0x0/0x2e
> Dec �7 13:35:26 z2-3 kernel: [8617743.246607] �[<ffffffff802d9836>] ?
> writeback_inodes+0x9a/0xce
> Dec �7 13:35:26 z2-3 kernel: [8617743.246610] �[<ffffffff8029888c>] ?
> wb_kupdate+0xc8/0x121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246613] �[<ffffffff802994d7>] ?
> pdflush+0x159/0x23b
> Dec �7 13:35:26 z2-3 kernel: [8617743.246615] �[<ffffffff802987c4>] ?
> wb_kupdate+0x0/0x121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246617] �[<ffffffff8029937e>] ?
> pdflush+0x0/0x23b
> Dec �7 13:35:26 z2-3 kernel: [8617743.246620] �[<ffffffff80254382>] ?
> kthread+0x54/0x80
> Dec �7 13:35:26 z2-3 kernel: [8617743.246622] �[<ffffffff80210aca>] ?
> child_rip+0xa/0x20
> Dec �7 13:35:26 z2-3 kernel: [8617743.246638] �[<ffffffffa02df103>] ?
> handle_halt+0x0/0x12 [kvm_intel]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246641] �[<ffffffff80256fa5>] ?
> hrtimer_cancel+0xc/0x16
> Dec �7 13:35:26 z2-3 kernel: [8617743.246643] �[<ffffffff8025432e>] ?
> kthread+0x0/0x80
> Dec �7 13:35:26 z2-3 kernel: [8617743.246645] �[<ffffffff80210ac0>] ?
> child_rip+0x0/0x20
> Dec �7 13:35:26 z2-3 kernel: [8617743.246655] lvchange � � �D ffff88002804f0c0
> 0 �4969 � � �1
> Dec �7 13:35:26 z2-3 kernel: [8617743.246657] �ffff88000150b7d0 ffffffff804b4484
> 0000000000000096 ffff880084255948
> Dec �7 13:35:26 z2-3 kernel: [8617743.246659] �0000000000000001 00000000000120c0
> 000000000000e250 ffff88000145c040
> Dec �7 13:35:26 z2-3 kernel: [8617743.246662] �ffff88000145c330 0000000180254747
> ffff8800382154d0 ffffffff802348e4
> Dec �7 13:35:26 z2-3 kernel: [8617743.246664] Call Trace:
> Dec �7 13:35:26 z2-3 kernel: [8617743.246667] �[<ffffffff804b4484>] ?
> thread_return+0x3e/0xb1
> Dec �7 13:35:26 z2-3 kernel: [8617743.246670] �[<ffffffff802348e4>] ?
> __wake_up_common+0x44/0x73
> Dec �7 13:35:26 z2-3 kernel: [8617743.246672] �[<ffffffff804b4500>] ?
> schedule+0x9/0x1d
> Dec �7 13:35:26 z2-3 kernel: [8617743.246685] �[<ffffffffa0275491>] ?
> inc_ap_bio+0xde/0x12e [drbd]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246687] �[<ffffffff8025473e>] ?
> autoremove_wake_function+0x0/0x2e
> Dec �7 13:35:26 z2-3 kernel: [8617743.246698] �[<ffffffffa027768a>] ?
> drbd_make_request_26+0x36f/0x485 [drbd]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246701] �[<ffffffff8033d537>] ?
> generic_make_request+0x288/0x2d2
> Dec �7 13:35:26 z2-3 kernel: [8617743.246704] �[<ffffffff8035318f>] ?
> delay_tsc+0x26/0x57
> Dec �7 13:35:26 z2-3 kernel: [8617743.246706] �[<ffffffff8033d647>] ?
> submit_bio+0xc6/0xcd
> Dec �7 13:35:26 z2-3 kernel: [8617743.246709] �[<ffffffff802dd14b>] ?
> submit_bh+0xe3/0x103
> Dec �7 13:35:26 z2-3 kernel: [8617743.246711] �[<ffffffff802df619>] ?
> __block_write_full_page+0x1d6/0x2ac
> Dec �7 13:35:26 z2-3 kernel: [8617743.246713] �[<ffffffff802de3e1>] ?
> end_buffer_async_write+0x0/0x116
> Dec �7 13:35:26 z2-3 kernel: [8617743.246716] �[<ffffffff802e1624>] ?
> blkdev_get_block+0x0/0x57
> Dec �7 13:35:26 z2-3 kernel: [8617743.246718] �[<ffffffff80297e82>] ?
> __writepage+0xa/0x25
> Dec �7 13:35:26 z2-3 kernel: [8617743.246720] �[<ffffffff802985cc>] ?
> write_cache_pages+0x206/0x322
> Dec �7 13:35:26 z2-3 kernel: [8617743.246722] �[<ffffffff80215db6>] ?
> read_tsc+0xa/0x20
> Dec �7 13:35:26 z2-3 kernel: [8617743.246725] �[<ffffffff80297e78>] ?
> __writepage+0x0/0x25
> Dec �7 13:35:26 z2-3 kernel: [8617743.246727] �[<ffffffff802e3e9f>] ?
> __blockdev_direct_IO+0x99a/0xa41
> Dec �7 13:35:26 z2-3 kernel: [8617743.246729] �[<ffffffff802e3e9f>] ?
> __blockdev_direct_IO+0x99a/0xa41
> Dec �7 13:35:26 z2-3 kernel: [8617743.246732] �[<ffffffff80298724>] ?
> do_writepages+0x20/0x2d
> Dec �7 13:35:26 z2-3 kernel: [8617743.246734] �[<ffffffff80292a73>] ?
> __filemap_fdatawrite_range+0x4c/0x57
> Dec �7 13:35:26 z2-3 kernel: [8617743.246736] �[<ffffffff80292aa4>] ?
> filemap_write_and_wait_range+0x26/0x52
> Dec �7 13:35:26 z2-3 kernel: [8617743.246738] �[<ffffffff802932ca>] ?
> generic_file_aio_read+0xd7/0x54f
> Dec �7 13:35:26 z2-3 kernel: [8617743.246749] �[<ffffffffa027b84a>] ?
> drbd_open+0x63/0x6d [drbd]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246752] �[<ffffffff802c0b1b>] ?
> do_sync_read+0xce/0x113
> Dec �7 13:35:26 z2-3 kernel: [8617743.246754] �[<ffffffff802bf4c4>] ?
> __dentry_open+0x16f/0x260
> Dec �7 13:35:26 z2-3 kernel: [8617743.246756] �[<ffffffff802c3e26>] ?
> cp_new_stat+0xe9/0xfc
> Dec �7 13:35:26 z2-3 kernel: [8617743.246758] �[<ffffffff8025473e>] ?
> autoremove_wake_function+0x0/0x2e
> Dec �7 13:35:26 z2-3 kernel: [8617743.246761] �[<ffffffff802e1907>] ?
> block_ioctl+0x38/0x3c
> Dec �7 13:35:26 z2-3 kernel: [8617743.246763] �[<ffffffff802cc016>] ?
> vfs_ioctl+0x21/0x6c
> Dec �7 13:35:26 z2-3 kernel: [8617743.246765] �[<ffffffff802cc48c>] ?
> do_vfs_ioctl+0x42b/0x464
> Dec �7 13:35:26 z2-3 kernel: [8617743.246767] �[<ffffffff802c1585>] ?
> vfs_read+0xa6/0xff
> Dec �7 13:35:26 z2-3 kernel: [8617743.246770] �[<ffffffff802c169a>] ?
> sys_read+0x45/0x6e
> Dec �7 13:35:26 z2-3 kernel: [8617743.246773] �[<ffffffff8020fa42>] ?
> system_call_fastpath+0x16/0x1b
> Dec �7 13:35:26 z2-3 kernel: [8617743.246779] Sched Debug Version: v0.09,
> 2.6.30-1-amd64 #1
> Dec �7 13:35:26 z2-3 kernel: [8617743.246780] now at 8617743246.777559 msecs
> Dec �7 13:35:26 z2-3 kernel: [8617743.246781] � .jiffies
> : 6449328107
> Dec �7 13:35:26 z2-3 kernel: [8617743.246783] � .sysctl_sched_latency
> : 40.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246784] � .sysctl_sched_min_granularity
> : 8.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246786] � .sysctl_sched_wakeup_granularity
> : 10.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246787] � .sysctl_sched_child_runs_first
> : 0.000001
> Dec �7 13:35:26 z2-3 kernel: [8617743.246788] � .sysctl_sched_features
> : 113917
> Dec �7 13:35:26 z2-3 kernel: [8617743.246790]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246790] cpu#0, 3000.452 MHz
> Dec �7 13:35:26 z2-3 kernel: [8617743.246792] � .nr_running � � � � � � � � � �:
> 2
> Dec �7 13:35:26 z2-3 kernel: [8617743.246793] � .load � � � � � � � � � � � � �:
> 4145
> Dec �7 13:35:26 z2-3 kernel: [8617743.246794] � .nr_switches � � � � � � � � � :
> 185493369405
> Dec �7 13:35:26 z2-3 kernel: [8617743.246795] � .nr_load_updates � � � � � � � :
> 239239723
> Dec �7 13:35:26 z2-3 kernel: [8617743.246796] � .nr_uninterruptible � � � � � �:
> 55617
> Dec �7 13:35:26 z2-3 kernel: [8617743.246798] � .next_balance � � � � � � � � �:
> 6449.328222
> Dec �7 13:35:26 z2-3 kernel: [8617743.246799] � .curr->pid � � � � � � � � � � :
> 16194
> Dec �7 13:35:26 z2-3 kernel: [8617743.246800] � .clock � � � � � � � � � � � � :
> 8617743246.431307
> Dec �7 13:35:26 z2-3 kernel: [8617743.246802] � .cpu_load[0] � � � � � � � � � :
> 3121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246803] � .cpu_load[1] � � � � � � � � � :
> 3121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246804] � .cpu_load[2] � � � � � � � � � :
> 3121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246805] � .cpu_load[3] � � � � � � � � � :
> 3121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246806] � .cpu_load[4] � � � � � � � � � :
> 3121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246807]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246808] cfs_rq[0]:/
> Dec �7 13:35:26 z2-3 kernel: [8617743.246809] � .exec_clock � � � � � � � � � �:
> 0.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246810] � .MIN_vruntime � � � � � � � � �:
> 352176404.012861
> Dec �7 13:35:26 z2-3 kernel: [8617743.246812] � .min_vruntime � � � � � � � � �:
> 352176404.012861
> Dec �7 13:35:26 z2-3 kernel: [8617743.246813] � .max_vruntime � � � � � � � � �:
> 352176404.012861
> Dec �7 13:35:26 z2-3 kernel: [8617743.246814] � .spread � � � � � � � � � � � �:
> 0.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246816] � .spread0 � � � � � � � � � � � :
> 0.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246817] � .nr_running � � � � � � � � � �:
> 2
> Dec �7 13:35:26 z2-3 kernel: [8617743.246818] � .load � � � � � � � � � � � � �:
> 4145
> Dec �7 13:35:26 z2-3 kernel: [8617743.246819] � .nr_spread_over � � � � � � � �:
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246820] � .shares � � � � � � � � � � � �:
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246821]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246822] rt_rq[0]:
> Dec �7 13:35:26 z2-3 kernel: [8617743.246823] � .rt_nr_running � � � � � � � � :
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246824] � .rt_throttled � � � � � � � � �:
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246825] � .rt_time � � � � � � � � � � � :
> 0.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246826] � .rt_runtime � � � � � � � � � �:
> 950.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246827]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246828] runnable tasks:
> Dec �7 13:35:26 z2-3 kernel: [8617743.246829] � � � � � � task � PID
> tree-key �switches �prio � � exec-runtime � � � � sum-exec � � � �sum-sleep
> Dec �7 13:35:26 z2-3 kernel: [8617743.246830]
> ----------------------------------------------------------------------------------------------------------
> Dec �7 13:35:26 z2-3 kernel: [8617743.246832] � � � � �kswapd0 � 219
> 352176404.012861 79827478108 � 115 � � � � � � � 0 � � � � � � � 0
> 0.000000 � � � � � � � 0.000000 � � � � � � � 0.000000 /
> Dec �7 13:35:26 z2-3 kernel: [8617743.246843] R � � � � � bash 16194
> 352176364.023477 � � �5733 � 120 � � � � � � � 0 � � � � � � � 0
> 0.000000 � � � � � � � 0.000000 � � � � � � � 0.000000 /
> Dec �7 13:35:26 z2-3 kernel: [8617743.246848]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246849] cpu#1, 3000.452 MHz
> Dec �7 13:35:26 z2-3 kernel: [8617743.246850] � .nr_running � � � � � � � � � �:
> 3
> Dec �7 13:35:26 z2-3 kernel: [8617743.246851] � .load � � � � � � � � � � � � �:
> 1024
> Dec �7 13:35:26 z2-3 kernel: [8617743.246852] � .nr_switches � � � � � � � � � :
> 227249168097
> Dec �7 13:35:26 z2-3 kernel: [8617743.246854] � .nr_load_updates � � � � � � � :
> 236708707
> Dec �7 13:35:26 z2-3 kernel: [8617743.246855] � .nr_uninterruptible � � � � � �:
> -55614
> Dec �7 13:35:26 z2-3 kernel: [8617743.246856] � .next_balance � � � � � � � � �:
> 6449.328121
> Dec �7 13:35:26 z2-3 kernel: [8617743.246857] � .curr->pid � � � � � � � � � � :
> 32275
> Dec �7 13:35:26 z2-3 kernel: [8617743.246859] � .clock � � � � � � � � � � � � :
> 8617743246.856932
> Dec �7 13:35:26 z2-3 kernel: [8617743.246860] � .cpu_load[0] � � � � � � � � � :
> 3072
> Dec �7 13:35:26 z2-3 kernel: [8617743.246861] � .cpu_load[1] � � � � � � � � � :
> 3072
> Dec �7 13:35:26 z2-3 kernel: [8617743.246862] � .cpu_load[2] � � � � � � � � � :
> 3072
> Dec �7 13:35:26 z2-3 kernel: [8617743.246863] � .cpu_load[3] � � � � � � � � � :
> 3072
> Dec �7 13:35:26 z2-3 kernel: [8617743.246864] � .cpu_load[4] � � � � � � � � � :
> 3072
> Dec �7 13:35:26 z2-3 kernel: [8617743.246865]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246866] cfs_rq[1]:/
> Dec �7 13:35:26 z2-3 kernel: [8617743.246867] � .exec_clock � � � � � � � � � �:
> 0.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246869] � .MIN_vruntime � � � � � � � � �:
> 367012701.328887
> Dec �7 13:35:26 z2-3 kernel: [8617743.246870] � .min_vruntime � � � � � � � � �:
> 367012741.328887
> Dec �7 13:35:26 z2-3 kernel: [8617743.246871] � .max_vruntime � � � � � � � � �:
> 367012701.328887
> Dec �7 13:35:26 z2-3 kernel: [8617743.246873] � .spread � � � � � � � � � � � �:
> 0.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246874] � .spread0 � � � � � � � � � � � :
> 14836337.316026
> Dec �7 13:35:26 z2-3 kernel: [8617743.246875] � .nr_running � � � � � � � � � �:
> 1
> Dec �7 13:35:26 z2-3 kernel: [8617743.246876] � .load � � � � � � � � � � � � �:
> 3072
> Dec �7 13:35:26 z2-3 kernel: [8617743.246878] � .nr_spread_over � � � � � � � �:
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246879] � .shares � � � � � � � � � � � �:
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246880]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246880] rt_rq[1]:
> Dec �7 13:35:26 z2-3 kernel: [8617743.246881] � .rt_nr_running � � � � � � � � :
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246882] � .rt_throttled � � � � � � � � �:
> 0
> Dec �7 13:35:26 z2-3 kernel: [8617743.246883] � .rt_time � � � � � � � � � � � :
> 0.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246885] � .rt_runtime � � � � � � � � � �:
> 950.000000
> Dec �7 13:35:26 z2-3 kernel: [8617743.246886]
> Dec �7 13:35:26 z2-3 kernel: [8617743.246886] runnable tasks:
> Dec �7 13:35:26 z2-3 kernel: [8617743.246887] � � � � � � task � PID
> tree-key �switches �prio � � exec-runtime � � � � sum-exec � � � �sum-sleep
> Dec �7 13:35:26 z2-3 kernel: [8617743.246888]
> ----------------------------------------------------------------------------------------------------------
> Dec �7 13:35:26 z2-3 kernel: [8617743.246891] � � � � � � �kvm 32275
> 367012741.340210 76292027847 � 120 � � � � � � � 0 � � � � � � � 0
> 0.000000 � � � � � � � 0.000000 � � � � � � � 0.000000 /
> Dec �7 13:35:26 z2-3 kernel: [8617743.246896] �drbd16_receiver 30799
> 367012701.341954 123640574974 � 120 � � � � � � � 0 � � � � � � � 0
> 0.000000 � � � � � � � 0.000000 � � � � � � � 0.000000 /
> Dec �7 13:35:26 z2-3 kernel: [8617743.246901]
>
>
> In the second stack trace, I can see a call to drbd_make_request_26, then to
> inc_ap_bio which seems to be blocked.
>
> Anyway, the drbddevice using this lv is down, so it shouldn't block the lvchange
> (I checked with drbdsetup /dev/drbdXX show, only the syncer part is shown).
>
> If someone has any informations about this bug ? Should I report it �(I will
> also mail it on lvm mailing list).
>
> Cheers,
>
> Maxence
>
> --
> Maxence DUNNEWIND
> Contact : maxence@dunnewind.net
> Site : http://www.dunnewind.net
> 06 32 39 39 93
> GPG : 18AE 61E4 D0B0 1C7C AAC9 �E40D 4D39 68DB 0D2E B533
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: not available
> Type: application/pgp-signature
> Size: 197 bytes
> Desc: Digital signature
> Url : https://www.redhat.com/archives/linux-lvm/attachments/20091207/8723fd71/attachment.bin
>
> ------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> End of linux-lvm Digest, Vol 70, Issue 2
> ****************************************
>
