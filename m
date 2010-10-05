Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95Ffmjr027609
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 11:41:48 -0400
Received: from kyoto.noir.com (m209-5.dsl.rawbw.com [198.144.209.5])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95FfVi3007948
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 11:41:32 -0400
Message-ID: <4CAB472B.70404@noir.com>
Date: Tue, 05 Oct 2010 08:41:31 -0700
From: "K. Richard Pixley" <rich@noir.com>
MIME-Version: 1.0
References: <AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>	<1286249478.12105.27@raydesk1.bettercgi.com>	<AANLkTimSuJmsruAbN5K+s8=DcrcVqB6BAbcyFhdTauF+@mail.gmail.com>
	<AANLkTina=tBEY2aCtSo3AsjOiMAqxWxobDFserPCV-HM@mail.gmail.com>
In-Reply-To: <AANLkTina=tBEY2aCtSo3AsjOiMAqxWxobDFserPCV-HM@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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

  This isn't right.

What you need to understand is that most file systems in unix and linux 
are built on the concept of a block special device.  A block special 
device is a block based device driver.  A block based device driver can, 
(in the general case), only read and write blocks from it's associated 
device, but it can do so in random order.  (As distinct from a character 
special device which, in the general case, can only read and write 
sequential characters like /dev/tty, (although blocking may be supplied 
by the device driver))

You can mkfs any block special device.  You can also use block special 
devices without using mkfs as sequential access devices and write 
whatever you want to them directly, although you'll need to use a 
blocking program like dd or tar in order to get them written solely in 
blocks.  In the past this was used for writing to sequential block 
devices like tape drives.

Many physical devices come from the vendor with block special devices.  
This includes disk drives, floppy disks, optical drives, and things that 
mimic disk drives like some types of solid state storage.

There are also games that can be played at the block device level.  Mkfs 
puts a file system on a block special device which allows it to be 
mounted in the systems file name space.  Partitioning allows you to take 
a single block special device and break it up into several smaller block 
special devices, each of which could potentially be used individually in 
any of the ways I've described.

LVM is a way of aggregating block special devices.  That is, it can take 
several block special devices and combine them to produce a single, 
artificial, (in the sense that there is no single associated physical 
device), block special device.  Actually, it creates a pool of blocks 
from which block special devices can be allocated, so there could be 
multiple block special devices allocated from the same pool.  And any of 
these devices could be partitioned or potentially reused in other block 
device manipulations.  LVM is usually used to provide mirroring, 
striping, aggregation, run time relocation, snapshots, or some 
combination of these.

Other available block device manipulations of which I'm aware include 
compression, remote access, fail over fault tolerance, wear leveling, 
load balancing, and the ability to create a block based device using a 
file located on an existing file system.

You don't have to partition a block device before you mkfs it.  You can, 
but you can also just mkfs it.  This is true regardless of whether the 
device is associated with a particular physical device or whether the 
device was created using LVM.

--rich

On 10/4/10 23:32 , Alexander Skwar wrote:
> hi.
>
> You seem to be confused about the steps that are required for
> "getting a directory to store stuff" on Linux. Let me give you a
> basic workflow:
>
> In old fashioned partition setup:
>
> a) Get a storage device (hard disk, SSD, FC, iSCSI, ...)
>   ->  Result: Device "file" like /dev/sda
> b) Split the storage device into chunks of wanted size ("partitions")
>   using tools like fdisk, cfdisk, parted === REQUIRED TO BE DONE!
>   ->  Result: Device "files" like /dev/sda1, /dev/sda3, /dev/sda15
> f) On those partitions, create a filesystem (eg. mkfs.ext3) or swap (mkswap)
> g) Mount
>
> In LVM, you'd do:
>
> a) Get a storage device (hard disk, SSD, FC, iSCSI, ...)
>   ->  Result: Device "file" like /dev/sda
> b) Split the storage device into chunks of wanted size ("partitions")
>   using tools like fdisk, cfdisk, parted === COMPLETELY OPTIONAL!
>   ->  Result: Device "files" like /dev/sda1, /dev/sda3, /dev/sda15
> c) "Declare" the "storage spot" (/dev/sda, /dev/sda3, ...) as physical
>   volumes (pv) using pvcreate
> d) Create a volume group (vg), using this/these pv(s)
> e) On a vg, create logical volumes (lv) using lvcreate
> f) On these/this lv, create a filesystem (eg. mkfs.ext3) or swap (mkswap)
> g) mount
>
> Steps a), f) and g) are identical in old fashioned way and LVM. Step
> b) is required in partitioning way and optional in LVM setup.
>
> It's also identical, that you only create ONE (1) filesystem on any
> ONE (1) partition or lv. You do *NOT* create two or more filesystems
> on one partition/lv (it's doable, but *EXTREMELY* unusual).
>
> But that's also outlined in the LVM howto... Chapter 11.
> http://tldp.org/HOWTO/LVM-HOWTO/commontask.html
>
> You really should read it...
>
> Alexander
>
> 2010/10/5 Tapas Mishra<mightydreams@gmail.com>:
>> On Tue, Oct 5, 2010 at 9:01 AM, Ray Morris<support@bettercgi.com>  wrote:
>>> partitions, just like any other block device.
>>> Preferably use parted as opposed to fdisk, as
>>> fdisk can support only up to 2 TB.
>> You mean to say within the LVM if I use parted that way I will be able
>> to create two different filesystems existing together.
>> Until now what ever I came across internet is mkfs.ext3 and mkswapfs but
>> they work on two different LVM and will convert those LVM into ext3
>> and swap respectively.
>> I want to break one LVM into 2 one of which I want to populate with a
>> root filesystem
>> and another with swap.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
