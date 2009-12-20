Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBKDabIo016434
	for <linux-lvm@redhat.com>; Sun, 20 Dec 2009 08:36:37 -0500
Received: from mail-pz0-f184.google.com (mail-pz0-f184.google.com
	[209.85.222.184])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBKDaLKe000813
	for <linux-lvm@redhat.com>; Sun, 20 Dec 2009 08:36:22 -0500
Received: by pzk14 with SMTP id 14so2911575pzk.23
	for <linux-lvm@redhat.com>; Sun, 20 Dec 2009 05:36:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20091217234212.938778E090A@hormel.redhat.com>
References: <20091217234212.938778E090A@hormel.redhat.com>
Date: Sun, 20 Dec 2009 14:36:21 +0100
Message-ID: <691e2b620912200536u3ac4fff6v9203ee435470f1b1@mail.gmail.com>
From: Johan Gardell <gardin@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 70, Issue 6
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
To: linux-lvm@redhat.com

Hi!

I was able to use dd to read from the two PVs, so i started looking in
the /proc/* files as you said:

/proc/mounts:
rootfs / rootfs rw 0 0
none /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
none /proc proc rw,nosuid,nodev,noexec,relatime 0 0
udev /dev tmpfs rw,relatime,size=10240k,mode=755 0 0
/dev/disk/by-uuid/56b77d5f-64e8-4392-be98-81a17a4c895d / reiserfs
rw,relatime,notail 0 0
tmpfs /lib/init/rw tmpfs rw,nosuid,relatime,mode=755 0 0
tmpfs /dev/shm tmpfs rw,nosuid,nodev,relatime 0 0
devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
/dev/mapper/Dreamhack-dreamhacklv /home reiserfs rw,relatime 0 0

and in /proc/swap
Filename				Type		Size	Used	Priority
/dev/sdb3                               partition	1951888	0	-1

Which did not give much, but i looked in /proc/mdstat as well
Personalities :
md127 : inactive sdc[1](S) sda[0](S)
      4514 blocks super external:imsm

unused devices: <none>

Doesn't that mean the PVs are mapped to the md127 device? (the
/dev/md127 device exists as well)
I googled some and found that mdadm --remove /dev/md127 /dev/sdc and
the same for the other device should remove the devices from the raid,
but i just want to check with you so that i don't toast my data.. :P
Could this be the issue?

Thanks in regards :)
Johan Gardell

2009/12/18  <linux-lvm-request@redhat.com>:
>> Message: 3
>> Date: Thu, 10 Dec 2009 10:40:53 -0800
>> From: malahal@us.ibm.com
>> Subject: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when
>> � � � �mounting (Stuart D. Gathman)
>> To: linux-lvm@redhat.com
>> Message-ID: <20091210184053.GA6645@us.ibm.com>
>> Content-Type: text/plain; charset=us-ascii
>>
>> Johan Gardell [gardin@gmail.com] wrote:
>>> The output from
>>> dmsetup table
>>> � gardin-swap_1:
>>> � gardin-root:
>>> � Dreamhack-dreamhacklv: 0 2636726272 linear 8:34 384
>>
>> The above output clearly shows that gardin-root and gardin-swap_1 have
>> empty tables. I remember there was a fix that cleaned up empty tables
>> like above but that won't help you. You need to figure out the reason
>> for 'device mapper lookup failure' messages.
>>
>>> >> [22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
>>> >> lookup failed
>>> >> [22723.980395] device-mapper: ioctl: error adding target to table
>>> >> [22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
>>> >> lookup failed
>>> >> [22724.001158] device-mapper: ioctl: error adding target to table
>>
>> The above messages are direct reason for not "really" creating
>> gardin-root or gardin-swap_1 logical volumes. �If you know the
>> underlying PV's that make up gardin-root LV, try reading from them using
>> 'dd'. If you can read, then the most likely problem is that someone else
>> has opened them. It may be hard to find though. You need to go through
>> usual culprits by running, 'cat /proc/mounts', 'cat /proc/swaps' etc. Is
>> EVMS using them by any chance..., maybe mdraid...
>>
>>> >> mount doesn't give any messages in dmesg
>>> >>
>>> >> lvs shows:
>>> >> ? LV ? ? ? ? ?VG ? ? ? ?Attr ? LSize ? Origin Snap% ?Move Log Copy% ?Convert
>>> >> ? dreamhacklv Dreamhack -wi-ao ? 1,23t
>>> >> ? root ? ? ? ?gardin ? ?-wi-d- 928,00g
>>> >> ? swap_1 ? ? ?gardin ? ?-wi-d- ? 2,59g
>>> >>
>>> >> if i try to mount with:
>>> >> ? mount -t reiserfs /dev/mapper/gardin-root /mnt/tmp
>>> >>
>>> >> i get this in dmesg:
>>> >> ? [23113.711247] REISERFS warning (device dm-1): sh-2006
>>> >> read_super_block: bread failed (dev dm-1, block 2, size 4096)
>>> >> ? [23113.711257] REISERFS warning (device dm-1): sh-2006
>>> >> read_super_block: bread failed (dev dm-1, block 16, size 4096)
>>> >> ? [23113.711261] REISERFS warning (device dm-1): sh-2021
>>> >> reiserfs_fill_super: can not find reiserfs on dm-1
>>> >
>>> > Looks like you have some kind of LV here. What is the output of the
>>> > following two commands:
>>
>> Your 'dmsetup table' output shows why the mount failed. You have an LV
>> created with no mapping.
>>
>> Thanks, Malahal.
>>
>>
>>
>
>
>
> ------------------------------
>
> Message: 2
> Date: Fri, 11 Dec 2009 16:55:40 -0800
> From: malahal@us.ibm.com
> Subject: Re: [linux-lvm] Re: Re: Re: Problems with dissapearing PV
> � � � �when � �mounting (Stuart D. Gathman)
> To: linux-lvm@redhat.com
> Message-ID: <20091212005540.GA2562@us.ibm.com>
> Content-Type: text/plain; charset=us-ascii
>
> Johan Gardell [gardin@gmail.com] wrote:
>> Ok, but why is that? I haven't changed anything on the LV. The output of
>> lvdisplay -m shows that i have physical volumes extents right? (but
>> /dev/gardin does not exist at all)
>
> "lvdisplay -m" shows what is in LVM metadata. The LVs just fail to
> activate in your case (root and swap_1). Since the LVM commands
> (lvdisplay) are able to read the metadata without any errors, I would
> assume that *some other software* on your machine openede the needed PVs
> before LVM did, so LVM is unable to activate the LVs (aka unable to load
> the mapping tables).
>
> Thanks, Malahal.
>
>
>
> ------------------------------
>
> Message: 3
> Date: Mon, 14 Dec 2009 14:45:21 +0100 (CET)
> From: Thomas Voegtle <tv@lio96.de>
> Subject: [linux-lvm] lvcreate does not respect units?
> To: linux-lvm@redhat.com
> Message-ID: <alpine.LNX.2.00.0912141234240.14618@er-systems.de>
> Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
>
>
>
> Hi,
>
>
> I ran in a problem while creating a lv with units in powers of 1000.
>
> I looked up the free space with vgdisplay:
>
> root@(none):~# vgdisplay --units G | grep Size
> vgdisplay �VG Size � � � � � � � 25.70 GB
> vgdisplay �PE Size � � � � � � � 0.00 GB
> vgdisplay �Alloc PE / Size � � � 0 / 0 GB
> vgdisplay �Free �PE / Size � � � 6127 / 25.70 GB
>
>
> And then I tried to create the lv a little bit smaller, like this:
>
> root@(none):~# lvcreate -L 25.50G datavolume -n datavolume
> lvcreate �Insufficient free extents (6127) in volume group datavolume:
> 6528 required
>
>
> You even get the same message using a small g:
>
>
> root@(none):~# lvcreate -L 25.50g datavolume -n datavolume
> lvcreate �Insufficient free extents (6127) in volume group datavolume:
> 6528 required
>
>
> So it seems lvcreate does not respect the unit in power of 1000?
>
> I used 2.02.56.
>
>
>
> ------------------------------
>
> Message: 4
> Date: Mon, 14 Dec 2009 14:00:58 +0000
> From: Alasdair G Kergon <agk@redhat.com>
> Subject: Re: [linux-lvm] lvcreate does not respect units?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <20091214140057.GA14009@agk-dp.fab.redhat.com>
> Content-Type: text/plain; charset=us-ascii
>
> On Mon, Dec 14, 2009 at 02:45:21PM +0100, Thomas Voegtle wrote:
>> vgdisplay �Free �PE / Size � � � 6127 / 25.70 GB
>
>> root@(none):~# lvcreate -L 25.50g datavolume -n datavolume
>> lvcreate �Insufficient free extents (6127) in volume group datavolume:
>> 6528 required
>
>> So it seems lvcreate does not respect the unit in power of 1000?
>
> Use either:
> � lvcreate -l 6127
> or
> � lvcreate -l 100%FREE
>
> Alasdair
>
>
>
> ------------------------------
>
> Message: 5
> Date: Mon, 14 Dec 2009 15:28:24 +0100 (CET)
> From: Thomas Voegtle <tv@lio96.de>
> Subject: Re: [linux-lvm] lvcreate does not respect units?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <alpine.LNX.2.00.0912141527510.25221@er-systems.de>
> Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
>
> On Mon, 14 Dec 2009, Alasdair G Kergon wrote:
>
>> On Mon, Dec 14, 2009 at 02:45:21PM +0100, Thomas Voegtle wrote:
>>> vgdisplay �Free �PE / Size � � � 6127 / 25.70 GB
>>
>>> root@(none):~# lvcreate -L 25.50g datavolume -n datavolume
>>> lvcreate �Insufficient free extents (6127) in volume group datavolume:
>>> 6528 required
>>
>>> So it seems lvcreate does not respect the unit in power of 1000?
>>
>> Use either:
>> � lvcreate -l 6127
>> or
>> � lvcreate -l 100%FREE
>
>
> Yes, thanks. I know.
>
>
> But I thought you guys would like to hear from bugs?
>
> Why is it possible to use vgdisplay with units power of 1000, if you
> cant use lvcreate with that kind of units?
>
> The lvcreate man page says:
>
> � � �-L, --size LogicalVolumeSize[bBsSkKmMgGtTpPeE]
>
>
>
> ------------------------------
>
> Message: 6
> Date: Mon, 14 Dec 2009 14:45:19 +0000
> From: Alasdair G Kergon <agk@redhat.com>
> Subject: Re: [linux-lvm] lvcreate does not respect units?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <20091214144519.GC14009@agk-dp.fab.redhat.com>
> Content-Type: text/plain; charset=us-ascii
>
> On Mon, Dec 14, 2009 at 03:28:24PM +0100, Thomas Voegtle wrote:
>> Why is it possible to use vgdisplay with units power of 1000, if you
>> cant use lvcreate with that kind of units?
>> The lvcreate man page says:
>> � � �-L, --size LogicalVolumeSize[bBsSkKmMgGtTpPeE]
>
> For input, it ignores case.
>
> I've not felt particularly happy about changing that as it could change the
> behaviour of existing scripts, and typically, people pay little attention
> to the case of units when they are typing.
>
> But should we change this in time for RHEL6?
>
> Any more opinions?
>
> Alasdair
>
>
>
> ------------------------------
>
> Message: 7
> Date: Mon, 14 Dec 2009 17:21:31 +0100 (CET)
> From: Thomas Voegtle <tv@lio96.de>
> Subject: Re: [linux-lvm] lvcreate does not respect units?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <alpine.LNX.2.00.0912141719030.31679@er-systems.de>
> Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
>
> On Mon, 14 Dec 2009, Alasdair G Kergon wrote:
>
>> On Mon, Dec 14, 2009 at 03:28:24PM +0100, Thomas Voegtle wrote:
>>> Why is it possible to use vgdisplay with units power of 1000, if you
>>> cant use lvcreate with that kind of units?
>>> The lvcreate man page says:
>>> � � �-L, --size LogicalVolumeSize[bBsSkKmMgGtTpPeE]
>>
>> For input, it ignores case.
>>
>> I've not felt particularly happy about changing that as it could change the
>> behaviour of existing scripts, and typically, people pay little attention
>> to the case of units when they are typing.
>
> Ah, ok, I agree.
>
>
>> But should we change this in time for RHEL6?
>>
>> Any more opinions?
>
>
> Why don't you just do something like si_unit_consistency again, but this
> time for input? Or something similiar?
>
>
>
> ------------------------------
>
> Message: 8
> Date: Thu, 17 Dec 2009 18:41:23 -0500
> From: "Brian J. Murrell" <brian@interlinx.bc.ca>
> Subject: [linux-lvm] brainfart: lilo'd a PV
> To: linux-lvm@redhat.com
> Message-ID: <1261093282.21162.564.camel@pc.interlinx.bc.ca>
> Content-Type: text/plain; charset="utf-8"
>
> I managed to write a lilo block (lilo) to the start of a PV which I have
> on /dev/sda (note, /dev/sda is a whole disk PV, unpartitioned).
>
> However, looking at a number of different PVs here, it appears that the
> LVM data starts at 0x200 with: "LABELONE". �i.e.:
>
> # hexdump -C /dev/sdc3
> 00000000 �00 00 00 00 00 00 00 00 �00 00 00 00 00 00 00 00 �|................|
> *
> 00000200 �4c 41 42 45 4c 4f 4e 45 �01 00 00 00 00 00 00 00 �|LABELONE........|
> ...
> # hexdump -C /dev/sdb
> 00000000 �00 00 00 00 00 00 00 00 �00 00 00 00 00 00 00 00 �|................|
> *
> 000001b0 �00 00 00 00 00 00 00 00 �dc 59 0f 10 cf c9 00 00 �|.........Y......|
> 000001c0 �00 00 00 00 00 00 00 00 �00 00 00 00 00 00 00 00 �|................|
> *
> 00000200 �4c 41 42 45 4c 4f 4e 45 �01 00 00 00 00 00 00 00 �|LABELONE........|
> ...
> # hexdump -C /dev/sda
> 00000000 �fa eb 31 12 00 00 4c 49 �4c 4f 16 08 10 00 01 00 �|..1...LILO......|
> ...
> 00000180 �30 e4 cd 13 eb 91 e8 93 �fe 44 69 73 6b 20 72 65 �|0........Disk re|
> 00000190 �61 64 20 65 72 72 6f 72 �0d 0a 00 00 00 00 00 00 �|ad error........|
> 000001a0 �00 00 00 00 00 00 00 00 �00 00 00 00 00 00 00 00 �|................|
> 000001b0 �00 00 00 00 00 00 00 00 �c6 08 1a 45 cf c9 00 00 �|...........E....|
> 000001c0 �00 00 00 00 00 00 00 00 �00 00 00 00 00 00 00 00 �|................|
> *
> 000001f0 �00 00 00 00 00 00 00 00 �00 00 00 00 00 00 55 aa �|..............U.|
> 00000200 �4c 41 42 45 4c 4f 4e 45 �01 00 00 00 00 00 00 00 �|LABELONE........|
>
> Is that correct?
>
> Is there anything I should do to repair this or is my brainfart benign
> to this PV?
>
> Thanx!
>
> b.
>
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: not available
> Type: application/pgp-signature
> Size: 197 bytes
> Desc: This is a digitally signed message part
> Url : https://www.redhat.com/archives/linux-lvm/attachments/20091217/49feb21d/attachment.bin
>
> ------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> End of linux-lvm Digest, Vol 70, Issue 6
> ****************************************
>
