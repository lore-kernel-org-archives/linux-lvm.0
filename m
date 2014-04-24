Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3O9cYVm016117
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2014 05:38:35 -0400
Message-ID: <5358DB99.6020607@redhat.com>
Date: Thu, 24 Apr 2014 11:38:33 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <016e01cf504d$68e3b0d0$3aab1270$@edu>	<5342A6A9.6060104@redhat.com>	<5345703E.2050401@ucdavis.edu>	<5346A663.502@redhat.com>	<006a01cf5b33$47f5bb20$d7e13160$@edu>	<53564F0C.3080402@redhat.com>
	<007b01cf5e5a$d1293500$737b9f00$@edu>	<535772FA.3060205@gmail.com>
	<014801cf5f14$e7ccff70$b766fe50$@edu>
In-Reply-To: <014801cf5f14$e7ccff70$b766fe50$@edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't mount LVM RAID5 drives
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 23.4.2014 18:56, Ryan Davis napsal(a):
> Hi Zdenek,
>

> I was running some analysis tools on some genomic data stored on the LV.  I

Ooops - looks like Nobel price won't be this year ?

> I shutdown the system and then physically moved the server to a new location
> and upon booting up the system for the first time in the new location I

So you have physically took whole machine 'as-is' (with all cables, disks...)
you haven't touched anything inside the box - you just basically plugged it
into a different power socket ?

There was no machine hw upgrade/change and no software upgrade meanwhile right ?


> received the following error when it tried to mount /dev/vg_data/lv_home:
>
> The superblock could not be read or does not describe
> a correct ext2fs.
> device-mapper: reload ioctl failed invalid argument

Since the  lvmdump contained only very tiny bit portion of your 
/var/log/messages -  could you grab a bigger piece (I assume it's been rotated)

Package it and post a link so I could check myself what has been logged.
Ideally make sure the log contains all info from last  successful boot and 
home mount  (might be long time if you do not reboot machine often)


> The system dumped me to a rescue prompt and I looked at dmesg:
>
> device-mapper table device 8:33 too small for target

This is crucial error message -  lvm2 has detected major problem,
PV got smaller and can't be used - admin needs to resolve the problem.

Since I've already seen some cheap raid5 arrays are able to demolish itself 
easily via reshape.

I assume it will be mandatory to collect messages related to output of your 
hardware card - there mostly likely will be some message pointing to
the moment, when the array went mad...



> They then had me do the following that I reported in the initial post:
>
> [root hobbes ~]# mount  -t ext4 /dev/vg_data/lv_home /home
>
> mount: wrong fs type, bad option, bad superblock on /dev/vg_data/lv_home,

Surely this will not work.



> [root hobbes ~]# fsck.ext4 -v /dev/sdc1

Definitelly can't be used this way -   LV does it's own mapping and
has it own disk headers - so you would need to use proper offset
to start at right place here.

> To answer your questions:
>
>> Obviously your device  /dev/sdc1  had   7812456381 sectors.
>> (Very strange to have odd number here....)
>
> This was setup by manufacturer

I'm afraid it's not here the problem lvm - but rather hw array.

The next thing you should capture and post a link to is this:

grab first MB of your  /dev/sdc1

dd if=/dev/sdc1 of=/tmp/grab bs=1M count=1

And send it - it should contain ring buffer with lvm2 metadata -
and it might give us some clue how your disks actually look like
since when array goes 'mad' - it typically destroys data - so
we will see garbage in the place of ring buffer instead sequence of metadata 
(though you have there only few entries - which might not be enough to make 
any judgement...) - but anyway  worth a try...

>
>> So we MUST start from the moment you tell us what you did to your system
> that suddenly your device is 14785 blocks shorter (~8MB) ?

I just doubt those 14785 had been lost from the end of you drive - but those
missing sectors could be located across your whole device
(array has changed its geometry??)

Then you have to contact your HW raid5 provider - to do their analysis
(since their format is typically proprietary - which is IMHO the major reason 
to never use it to me.....)

I assume the key thing for solution is to 'restore' the original geometry of 
your raid5 array (without reinitialization of your array)
(so the size will again report the original value)

> /home is controlled by a 3ware card:
>
>
>
> Unit UnitType Status %RCmpl %V/I/M Stripe Size(GB) Cache AVrfy
>
> ----------------------------------------------------------------------------
> --
>
> u0 RAID-5 OK - - 256K 3725.27 RiW ON
>
> u1 SPARE OK - - - 1863.01 - OFF
>
>
>
> VPort Status Unit Size Type Phy Encl-Slot Model
>
> ----------------------------------------------------------------------------
> --
>
> p0 OK u0 1.82 TB SATA 0 - WDC WD2000FYYZ-01UL
>
> p1 OK u1 1.82 TB SATA 1 - WDC WD2002FYPS-01U1
>
> p2 OK u0 1.82 TB SATA 2 - WDC WD2002FYPS-01U1
>
> p3 OK u0 1.82 TB SATA 3 - WDC WD2002FYPS-01U1
>
>
>> Have you repartitioned/resized  it  (fdisk,gparted) ?
>
> No, just did some fdisk -l
>
>
>> I just hope you have not tried to play directly with your /dev/sdc  device
> (Since in some emails it seems you try to execute various command directly
> on >this device)
>
> Besides the commands above and mentioned in these posts I have not tried
> anything on /dev/sdc1.
>
>
> I have had issues with the RAID5 in the past with bad drives.  Could
> something have happened during the shutdown since the issues arose after
> that?

Yes - replacing invalid drive might have had impact on the raid5 array 
geometry - but as said above - 3ware provider and its support team needs to do 
the analysis here.

Zdenek
