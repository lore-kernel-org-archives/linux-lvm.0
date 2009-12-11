Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBBNAsnU031091
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 18:10:54 -0500
Received: from mail-px0-f185.google.com (mail-px0-f185.google.com
	[209.85.216.185])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBBNAc32025979
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 18:10:38 -0500
Received: by pxi15 with SMTP id 15so967235pxi.23
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 15:10:38 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 12 Dec 2009 00:10:38 +0100
Message-ID: <691e2b620912111510u5655f5cfn329895332ba681f4@mail.gmail.com>
From: Johan Gardell <gardin@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Re: Re: Problems with dissapearing PV when mounting
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

Ok, but why is that? I haven't changed anything on the LV. The output of
lvdisplay -m shows that i have physical volumes extents right? (but
/dev/gardin does not exist at all)

lvdisplay -m
  --- Logical volume ---
  LV Name                /dev/Dreamhack/dreamhacklv
  VG Name                Dreamhack
  LV UUID                Mr9moa-cLBU-YUwm-c5jl-LNeK-sftm-l4fn6Q
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                1,23 TiB
  Current LE             321866
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           254:0

  --- Segments ---
  Logical extent 0 to 321865:
    Type		linear
    Physical volume	/dev/sdb2
    Physical extents	0 to 321865


  --- Logical volume ---
  LV Name                /dev/gardin/root
  VG Name                gardin
  LV UUID                av0y4y-2iyJ-3oHM-7M10-U1LD-HePf-95yDUn
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                928,00 GiB
  Current LE             237568
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           254:1

  --- Segments ---
  Logical extent 0 to 118509:
    Type		linear
    Physical volume	/dev/sda5
    Physical extents	0 to 118509

  Logical extent 118510 to 237567:
    Type		linear
    Physical volume	/dev/sdc
    Physical extents	0 to 119057


  --- Logical volume ---
  LV Name                /dev/gardin/swap_1
  VG Name                gardin
  LV UUID                XUNjtq-OluL-ntqJ-q3Ek-ER32-PPKb-Q6Sc1V
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,59 GiB
  Current LE             663
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           254:2

  --- Segments ---
  Logical extent 0 to 662:
    Type		linear
    Physical volume	/dev/sda5
    Physical extents	118510 to 119172

Thanks in regards
Johan Gardell

>
> Message: 3
> Date: Thu, 10 Dec 2009 10:40:53 -0800
> From: malahal@us.ibm.com
> Subject: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when
> � � � �mounting (Stuart D. Gathman)
> To: linux-lvm@redhat.com
> Message-ID: <20091210184053.GA6645@us.ibm.com>
> Content-Type: text/plain; charset=us-ascii
>
> Johan Gardell [gardin@gmail.com] wrote:
>> The output from
>> dmsetup table
>> � gardin-swap_1:
>> � gardin-root:
>> � Dreamhack-dreamhacklv: 0 2636726272 linear 8:34 384
>
> The above output clearly shows that gardin-root and gardin-swap_1 have
> empty tables. I remember there was a fix that cleaned up empty tables
> like above but that won't help you. You need to figure out the reason
> for 'device mapper lookup failure' messages.
>
>> >> [22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
>> >> lookup failed
>> >> [22723.980395] device-mapper: ioctl: error adding target to table
>> >> [22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
>> >> lookup failed
>> >> [22724.001158] device-mapper: ioctl: error adding target to table
>
> The above messages are direct reason for not "really" creating
> gardin-root or gardin-swap_1 logical volumes. �If you know the
> underlying PV's that make up gardin-root LV, try reading from them using
> 'dd'. If you can read, then the most likely problem is that someone else
> has opened them. It may be hard to find though. You need to go through
> usual culprits by running, 'cat /proc/mounts', 'cat /proc/swaps' etc. Is
> EVMS using them by any chance..., maybe mdraid...
>
>> >> mount doesn't give any messages in dmesg
>> >>
>> >> lvs shows:
>> >> ? LV ? ? ? ? ?VG ? ? ? ?Attr ? LSize ? Origin Snap% ?Move Log Copy% ?Convert
>> >> ? dreamhacklv Dreamhack -wi-ao ? 1,23t
>> >> ? root ? ? ? ?gardin ? ?-wi-d- 928,00g
>> >> ? swap_1 ? ? ?gardin ? ?-wi-d- ? 2,59g
>> >>
>> >> if i try to mount with:
>> >> ? mount -t reiserfs /dev/mapper/gardin-root /mnt/tmp
>> >>
>> >> i get this in dmesg:
>> >> ? [23113.711247] REISERFS warning (device dm-1): sh-2006
>> >> read_super_block: bread failed (dev dm-1, block 2, size 4096)
>> >> ? [23113.711257] REISERFS warning (device dm-1): sh-2006
>> >> read_super_block: bread failed (dev dm-1, block 16, size 4096)
>> >> ? [23113.711261] REISERFS warning (device dm-1): sh-2021
>> >> reiserfs_fill_super: can not find reiserfs on dm-1
>> >
>> > Looks like you have some kind of LV here. What is the output of the
>> > following two commands:
>
> Your 'dmsetup table' output shows why the mount failed. You have an LV
> created with no mapping.
>
> Thanks, Malahal.
>
>
>
