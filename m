Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3NGuAHt012365
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2014 12:56:10 -0400
Received: from msa2.ucdavis.edu (msa2.ucdavis.edu [128.120.32.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3NGu77F024390
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2014 12:56:08 -0400
From: "Ryan Davis" <rrdavis@ucdavis.edu>
References: <016e01cf504d$68e3b0d0$3aab1270$@edu>	<5342A6A9.6060104@redhat.com>	<5345703E.2050401@ucdavis.edu>	<5346A663.502@redhat.com>	<006a01cf5b33$47f5bb20$d7e13160$@edu>
	<53564F0C.3080402@redhat.com> <007b01cf5e5a$d1293500$737b9f00$@edu>
	<535772FA.3060205@gmail.com>
In-Reply-To: <535772FA.3060205@gmail.com>
Date: Wed, 23 Apr 2014 09:56:00 -0700
Message-ID: <014801cf5f14$e7ccff70$b766fe50$@edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
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
Content-Type: text/plain; charset="us-ascii"
To: 'Zdenek Kabelac' <zdenek.kabelac@gmail.com>, 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Zdenek,

The last thing I want to do is waste people's time.  I do appreciate you
wanting to know what caused this in the first place.  Even if we got the
data to mount (/home), I would like to know what caused this so that I could
be aware of it and prevent it from happening again.

I was running some analysis tools on some genomic data stored on the LV.  I
checked the capacity of the LV with #df -h and realized that I was 99% full
on home and proceeded to delete some folders while the analysis was running.
At the end of the day I was at 93% full on /home.
I shutdown the system and then physically moved the server to a new location
and upon booting up the system for the first time in the new location I
received the following error when it tried to mount /dev/vg_data/lv_home:

The superblock could not be read or does not describe
a correct ext2fs.
device-mapper: reload ioctl failed invalid argument

The system dumped me to a rescue prompt and I looked at dmesg:

device-mapper table device 8:33 too small for target
device-mapper 253:0 linear dm-linear device lookup failed
device-mapper ioctl error adding target to table

I then contacted the manufacturer who setup the server.  We booted the
system using a live CD (CentOS 6.3) and commented out the mounting of /home.
They had me issue the following commands:

pvdisplay 
vgdisplay 
lvdisplay

They then had me do the following that I reported in the initial post:

[root hobbes ~]# mount  -t ext4 /dev/vg_data/lv_home /home

mount: wrong fs type, bad option, bad superblock on /dev/vg_data/lv_home,

       missing codepage or other error

       (could this be the IDE device where you in fact use

       ide-scsi so that sr0 or sda or so is needed?)

       In some cases useful info is found in syslog - try

       dmesg | tail  or so

 

[root hobbes ~]# dmesg | tail

 

EXT4-fs (dm-0): unable to read superblock

 

[root hobbes ~]# fsck.ext4 -v /dev/sdc1

e4fsck 1.41.12 (17-May-2010)

fsck.ext4: Superblock invalid, trying backup blocks...

fsck.ext4: Bad magic number in super-block while trying to open /dev/sdc1

 

The superblock could not be read or does not describe a correct ext2

filesystem.  If the device is valid and it really contains an ext2

filesystem (and not swap or ufs or something else), then the superblock

is corrupt, and you might try running e4fsck with an alternate superblock:

    e4fsck -b 8193 <device>

 

[root hobbes ~]# mke2fs -n /dev/sdc1

mke2fs 1.39 (29-May-2006)

Filesystem label=

OS type: Linux

Block size=4096 (log=2)

Fragment size=4096 (log=2)

488292352 inodes, 976555199 blocks

48827759 blocks (5.00%) reserved for the super user

First data block=0

Maximum filesystem blocks=4294967296

29803 block groups

32768 blocks per group, 32768 fragments per group

16384 inodes per group

Superblock backups stored on blocks:

        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
2654208,

        4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,

        102400000, 214990848, 512000000, 550731776, 644972544


At this point they didn't know what to do and told me the filesystem was
probably beyond repair.  This is when I posted to this mailing list.


To answer your questions:

>Obviously your device  /dev/sdc1  had   7812456381 sectors.
>(Very strange to have odd number here....)

This was setup by manufacturer

>So we MUST start from the moment you tell us what you did to your system
that suddenly your device is 14785 blocks shorter (~8MB) ?

Hopefully the information above fills you.  If not I am not sure what
happened.

Have you reconfigured your  /dev/sdc device?
No

Is it HW raid5 device ?
This is a hardware Raid5


/home is controlled by a 3ware card:



Unit UnitType Status %RCmpl %V/I/M Stripe Size(GB) Cache AVrfy

----------------------------------------------------------------------------
--

u0 RAID-5 OK - - 256K 3725.27 RiW ON 

u1 SPARE OK - - - 1863.01 - OFF 



VPort Status Unit Size Type Phy Encl-Slot Model

----------------------------------------------------------------------------
--

p0 OK u0 1.82 TB SATA 0 - WDC WD2000FYYZ-01UL 

p1 OK u1 1.82 TB SATA 1 - WDC WD2002FYPS-01U1 

p2 OK u0 1.82 TB SATA 2 - WDC WD2002FYPS-01U1 

p3 OK u0 1.82 TB SATA 3 - WDC WD2002FYPS-01U1


>Have you repartitioned/resized  it  (fdisk,gparted) ?

No, just did some fdisk -l


>I just hope you have not tried to play directly with your /dev/sdc  device
(Since in some emails it seems you try to execute various command directly
on >this device)

Besides the commands above and mentioned in these posts I have not tried
anything on /dev/sdc1.


I have had issues with the RAID5 in the past with bad drives.  Could
something have happened during the shutdown since the issues arose after
that?

Thanks for the support!

Ryan

-----Original Message-----
From: Zdenek Kabelac [mailto:zdenek.kabelac@gmail.com] 
Sent: Wednesday, April 23, 2014 1:00 AM
To: LVM general discussion and development; rrdavis@ucdavis.edu
Subject: Re: Can't mount LVM RAID5 drives

Dne 22.4.2014 20:43, Ryan Davis napsal(a):
> Hi Peter,
>
>
> Thanks for the support.
>
> Everything ran smooth until I did a fsck on the FS on the LV.  It's 
> complaining about a bad superblock

Saying something runs smooth here is somewhat pointless...


Looking at your lvmdump  --


pv0 {
			id = "8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf"
			device = "/dev/sdc1"	# Hint only

			status = ["ALLOCATABLE"]
			flags = []
			dev_size = 7812456381	# 3.63796 Terabytes
			pe_start = 384
			pe_count = 953668	# 3.63795
}


This is how your PV was looking when you have created your VG.

Obviously your device  /dev/sdc1  had   7812456381 sectors.
(Very strange to have odd number here....)

Later you report # blockdev --getsz /dev/sdc1 as 7812441596

So we MUST start from the moment you tell us what you did to your system
that suddenly your device is 14785 blocks shorter (~8MB) ?

Have you reconfigured your  /dev/sdc device?
Is it HW raid5 device ?
Have you repartitioned/resized  it  (fdisk,gparted) ?

We can't move forward without knowing exact roots of your problem ?

Everything else is pointless waste of time since we will just try to hunt
some random piece of information?

I just hope you have not tried to play directly with your /dev/sdc  device
(Since in some emails it seems you try to execute various command directly
on this device)

Zdenek
