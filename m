Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GFKYa7014911
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 11:20:34 -0400
Received: from will.fastenal.com (will.fastenal.com [205.243.112.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5GFKQIB029673
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 11:20:26 -0400
Message-ID: <4492CC31.9060909@fastenal.com>
Date: Fri, 16 Jun 2006 10:20:17 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and Device Mapper
References: <5485940d0606152014i4f309594o70efbe2568641b2a@mail.gmail.com>	
	<4492B150.8070604@fastenal.com>
	<5485940d0606160814v2b7396a5ld96eb69e96bafe71@mail.gmail.com>
In-Reply-To: <5485940d0606160814v2b7396a5ld96eb69e96bafe71@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: C'est Pierre <cestpierre@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>



C'est Pierre wrote:
> On 6/16/06, Kelly Sauke <ksauke@fastenal.com> wrote:
>> Add "a|/dev/mapper/mpath.*|" to the filter= line of your lvm.conf as
>> such.
>>
>> filter = [ "a|/dev/sda2|", "a|/dev/mapper/mpath.*|", "r/.*/" ]
>>
>> Then make sure your types= variable has device-mapper in it.
>>
>>  types = [ "device-mapper", 1 ]
>>
>> That should be all you need.
>>
> 
> 
> Hello Kelly,
> 
> That kinda worked out. I tried your example as-is, and it still shows
> 'Found duplicate PV' messages and additionally it said "vg sucessfully
> created" but in fact, when I issue a vgdisplay, it doesn't show the vg
> created.
> 

Try excluding all of your sd paths in the filter line.  If you look at my
example, it seems my local disk /dev/sda2, my mpath devices and then it hides
everything else.  Thats how I got the 'Found duplicate PV' errors to go away.

After setting that, run an lvmdiskscan to verify that its seeing your multipath
devices and excuding the sd devices.




> As soon as I changed from types = [ "device-mapper", 1 ] to types = [
> "device-mapper", 16 ] as stated on lvm.conf's man page, the vgdisplay
> command recognized the VG clusterfs. Soon after I tried to create a LV
> on the VG clusterfs and it doesn't create the /dev/clusterfs/.* but it
> does create /dev/mapper/clusterfs-ora1, however, I looked around and
> found the util 'vgmknodes' and that seemed to create, however, I am
> not still able to create a filesystem on it and the "Found duplicate
> PV" messages still appear. Here's the output:
> # vgdisplay
>  Found duplicate PV 1lzBc6Ym2fFM4DPBbftbz96SkoeEA8Lh: using /dev/dm-5
> not /dev/sda2
>  Found duplicate PV 1lzBc6Ym2fFM4DPBbftbz96SkoeEA8Lh: using
> /dev/dm-3p2 not /dev/sda2
>  Found duplicate PV 1lzBc6Ym2fFM4DPBbftbz96SkoeEA8Lh: using /dev/sdb2
> not /dev/sda2
>  (erased the other VG)
>  --- Volume group ---
>  VG Name               clusterfs
>  System ID
>  Format                lvm2
>  Metadata Areas        1
>  Metadata Sequence No  2
>  VG Access             read/write
>  VG Status             resizable
>  MAX LV                0
>  Cur LV                1
>  Open LV               0
>  Max PV                0
>  Cur PV                1
>  Act PV                1
>  VG Size               50.00 GB
>  PE Size               4.00 MB
>  Total PE              12799
>  Alloc PE / Size       25 / 100.00 MB
>  Free  PE / Size       12774 / 49.90 GB
>  VG UUID               QxEuzf-SJMU-mmlo-c4mr-6SLs-AU6X-X8A6Fi
> 
> 
> # lvdisplay
>  (skipped the others)
>  --- Logical volume ---
>  LV Name                /dev/clusterfs/ora1
>  VG Name                clusterfs
>  LV UUID                hAt2Tx-Tf2U-oD10-3W77-sIo6-Q3nf-5fG3AT
>  LV Write Access        read/write
>  LV Status              available
>  # open                 0
>  LV Size                100.00 MB
>  Current LE             25
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     0
>  Block device           253:8
> 
> 
> 
> # mkfs.ext3  /dev/clusterfs/ora1
> mke2fs 1.38 (30-Jun-2005)
> mkfs.ext3: Device size reported to be zero.  Invalid partition
> specified, or
>        partition table wasn't reread after running fdisk, due to
>        a modified partition being busy and in use.  You may need to reboot
>        to re-read your partition table.
> 
> 

I have no suggestions on this one.  I've never encountered this error.  It might
be as easy as just deleting the lv and trying again.


> Any more sugestions?
> 
> Thank you very much Kelly/Luca
> 
> 
> 
>> C'est Pierre wrote:
>> > Hello,
>> >
>> > I've setup multipath with multipath-tools and I guess everything is OK
>> > there. However, I can't get lvm to recognize the multipath'ed devices:
>> >
>> > # dmsetup ls
>> > 3600508b40010130d00006000011c0000p1     (253, 4)
>> > system-lv03     (253, 2)
>> > system-lv01     (253, 1)
>> > system-lv00     (253, 0)
>> > dm-3p2  (253, 7)
>> > dm-3p1  (253, 6)
>> >
>> > cabtagdb01:~ # fdisk -l /dev/dm-3
>> >
>> > Disk /dev/dm-3: 53.6 GB, 53687091200 bytes
>> > 64 heads, 32 sectors/track, 51200 cylinders
>> > Units = cylinders of 2048 * 512 = 1048576 bytes
>> >
>> >     Device Boot      Start         End      Blocks   Id  System
>> > /dev/dm-3p1               1           1        1008   83  Linux
>> > /dev/dm-3p2               2       51200    52427776   8e  Linux LVM
>> > cabtagdb01:~ # fdisk -l /dev/mapper/3600508b40010130d00006000011c0000
>> >
>> > Disk /dev/mapper/3600508b40010130d00006000011c0000: 53.6 GB,
>> 53687091200
>> > bytes
>> > 64 heads, 32 sectors/track, 51200 cylinders
>> > Units = cylinders of 2048 * 512 = 1048576 bytes
>> >
>> >                                         Device Boot      Start
>> > End      Blocks   Id  System
>> > /dev/mapper/3600508b40010130d00006000011c0000p1               1
>> >   1        1008   83  Linux
>> > /dev/mapper/3600508b40010130d00006000011c0000p2               2
>> > 51200    52427776   8e  Linux LVM
>> >
>> >
>> > # pvcreate /dev/dm-3p2
>> >  Device /dev/dm-3p2 not found.
>> >
>> > # pvcreate /dev/mapper/3600508b40010130d00006000011c0000p2
>> >  Device /dev/mapper/3600508b40010130d00006000011c0000p2 not found.
>> >
>> > Does anyone have any guess on what the problem might be? I seem to be
>> > one-step from getting this solved and I am going through these
>> > hassles.
>> >
>> > Thank you,
>> > Pierre
>> >
