Return-Path: <hne@inetnow.net>
Message-ID: <3AB7FA02.6060007@inetnow.net>
Date: Wed, 21 Mar 2001 09:46:58 +0900
From: HopNet <hne@inetnow.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering PV's VG metadata
References: <3AB49365.2020606@inetnow.net> <20010319131456.C26986@sistina.com> <3AB71D83.2000000@inetnow.net> <20010320122507.H29326@sistina.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

The Majic message is:

zeus:~ # mount /dev/vg00/lvol1 /mnt/raid
mount: /dev/vg00/lvol1 has wrong major or minor number
zeus:~ #

Once upon a time, this msg originated in:
/*
  * A mount(8) for Linux 0.99.
  * mount.c,v 1.1.1.1 1993/11/18 08:40:51 jrs Exp *
....which I found by searching the web.  Needless to say, this probably isn't the same place as on my system...but, I can't find the same msg in the source on my system!

  It should be a ext2 fs, which is supported in the kernel.

so...
I eventually got around to doing
zeus:/lib/modules/2.2.14/fs # mount -v /dev/vg00/lvol1 /mnt/raid/
mount: you didn't specify a filesystem type for /dev/vg00/lvol1
        I will try all types mentioned in /etc/filesystems or /proc/filesystems
Trying vfat
Trying hfs
mount: /dev/vg00/lvol1 has wrong major or minor number
zeus:/lib/modules/2.2.14/fs # mount -v -t ext2 /dev/vg00/lvol1 /mnt/raid/
mount: wrong fs type, bad option, bad superblock on /dev/vg00/lvol1,
        or too many mounted file systems
zeus:/lib/modules/2.2.14/fs #

no dice...
   grabbed hexedit and examined lvol1 the hard way...ooh, lot's of zeros, not good.
   grabbed lde (linux disk editor) and had it look at lvol1.  It could not identify the filesystem.

So, I'm thinking my next plan of action will be to search /dev/hda for any recognizable data structures (i.e. the beginning of the lvol), and making sure the VG data is pointing to the right place.

Any other ideas?





other stuff follows:

zeus:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "vg01" [21.26 GB / 0 free]
pvscan -- inactive PV "/dev/hda"  of VG "vg00" [12.13 GB / 0 free]
pvscan -- inactive PV "/dev/hdc"  of VG "vg00" [12.13 GB / 0 free]
pvscan -- total: 3 [45.54 GB] / in use: 3 [45.54 GB] / in no VG: 0 [0]

zeus:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg01"
vgscan -- found inactive volume group "vg00"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual backup of your volume groups

zeus:~ # vgchange -a y vg00
vgchange -- volume group "vg00" successfully activated

zeus:~ # ll /dev/vg00
total 36
dr-xr-xr-x   2 root     root         4096 Mar 21 12:18 .
drwxr-xr-x   8 root     root        32768 Mar 21 12:18 ..
crw-r-----   1 root     root     109,   0 Mar 21 12:18 group
brw-r-----   1 root     root      58,   0 Mar 21 12:18 lvol1
zeus:~ # mount /dev/vg00/lvol1 /mnt/raid
mount: /dev/vg00/lvol1 has wrong major or minor number
zeus:~ #

and just as a sanity check...boot.msg

<6>Uniform Multi-Platform E-IDE driver Revision: 6.30
<4>ide: Assuming 40MHz system bus speed for PIO modes; override with idebus=xx
<4>ALI15X3: IDE controller on PCI bus 00 dev 78
<4>ALI15X3: not 100% native mode: will probe irqs later
<4>    ide0: BM-DMA at 0xb400-0xb407, BIOS settings: hda:pio, hdb:pio
<4>    ide1: BM-DMA at 0xb408-0xb40f, BIOS settings: hdc:pio, hdd:pio
<4>hda: Maxtor 91303D6, ATA DISK drive
<4>hdc: Maxtor 91303D6, ATA DISK drive
<4>ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
<4>ide1 at 0x170-0x177,0x376 on irq 15
<6>hda: Maxtor 91303D6, 12427MB w/512kB Cache, CHS=25249/16/63, UDMA(33)
<6>hdc: Maxtor 91303D6, 12427MB w/512kB Cache, CHS=25249/16/63, UDMA(33)

....

<4>Partition check:
<4> sda: sda1 sda2 sda3
<4> sdb: sdb1
<4> hda: hda1
<4> hdc: hdc1

Anyone know why this sees hda1 & hdc1?  There are no partition tables.

and fdisk appears to be confused (just like me most of the time)

zeus:~ # cat fdisk.out
Disk /dev/vg00/lvol1 doesn't contain a valid partition table
Disk /dev/vg01/lvol1 doesn't contain a valid partition table

Disk /dev/sda: 255 heads, 63 sectors, 1043 cylinders
Units = cylinders of 16065 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1        17    136521   83  Linux
/dev/sda2            18        83    530145   82  Linux swap
/dev/sda3            84      1043   7711200   83  Linux

Disk /dev/sdb: 255 heads, 63 sectors, 2776 cylinders
Units = cylinders of 16065 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1      2776  22298188+  8e  Unknown

Disk /dev/hda: 16 heads, 63 sectors, 25249 cylinders
Units = cylinders of 1008 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System

Disk /dev/vg00/lvol1: 64 heads, 32 sectors, 24848 cylinders
Units = cylinders of 2048 * 512 bytes


Disk /dev/vg01/lvol1: 64 heads, 32 sectors, 21772 cylinders
Units = cylinders of 2048 * 512 bytes


Disk /dev/hdc: 16 heads, 63 sectors, 25249 cylinders
Units = cylinders of 1008 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System


Heinz J. Mauelshagen wrote:

> On Tue, Mar 20, 2001 at 06:06:11PM +0900, HopNet wrote:
> 
>> Thanks to Heinz & Andreas for your suggestions.  They are "almost" working. :-)  I can activate the VG, but I'm getting "wrong major or minor number" from the mount of the lvol, so I'm thinking I have an offset that is not correct.
>> 
> 
> 
> As Andreas questioned in his answer: where does that message come from and
> what is it exactly?
> 
> 
> 
>> Heinz, you're assumptions (listed below) are correct.  The PVs are identical models.
>> 
>> One thing I have a question about, and this may lead to resolving my offset problem, is where does the following pvdata info come from?
>> hda showed: (after LILO, which, I can see from the hex dump, was indeed the problem)
>> PV Size               12.14 GB / NOT usable 3.21 MB [LVM: 16.09 MB]
>> hdc showed:
>> PV Size               12.14 GB / NOT usable 3.24 MB [LVM: 242 KB]
>> 
>> After I copied the header over, they are the same (as hdc).  Should they be the same?  Or do I need to fudge some more numbers in the hda header.
>> 
> 
> 
> If the models are *exactly* equal there are none.
> 
> If there's firmware differences that could actually lead to slightly different
> sizes beeing exposed to the OS.
> This difference could eventually lead to an additional PE on one disk causing
> an *additional* entry in the mapping table in the VGDA on disk which starts at
> offset pv->pe_on_disk.base set in library functions
> vg_setup_for_{create,extend}() calculated by macro LVM_PE_ON_DISK_BASE(pv)
> defined in lvm.h.
> Nevertheless the beginning offsets to the mapping tables should be
> the same, because this macro was introduced in LVM 0.6 and hasn't changed
> since then.
> 
> Explained that we still need the exact "wrong major or minor number" messages
> in order to proceed ;-)
> 
> 
> 
>> Heinz, from your paragraph below: What should I be looking for to identify the first sector of "?"  Is there a block diagram available with the metadata layout?
> 
> 
> See the pv_on_disk, vg_on_disk, pv_name_list_on_disk, lv_on_disk and pe_on_disk
> structures beeing set in vg_setup_for_{create,extend}() and the macros defined
> in lvm.h they use.
> 
> Structure layout from the beginning of the PV is:
> 
>  - PV
>  - VG
>  - NAMELIST (of all devices names used; changed to UUIDLIST in 0.9)
>  - LVs
>  - PEs
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
>> Andreas, this appears to be a v1 header, so no uuid.  This confused the heck out of me for a while, until I finally deciphered part of lvm.h.  Also, pvdata doesn't support -PU on this release.
>> 
>> If I can't get the offset fixed, I'll probably try creating the "lvrecover" that Andreas suggested.
>> 
>> One the bright side, I do have a backup I recovered!  On the dark side, my backups have been flaky, and the only good one was two months old :-(  Time to invest in a new tape drive.  Well 12G of data is better than no data at all.
>> 
>> Heinz J. Mauelshagen wrote:
>> 
>> 
>>> I understand:
>>> 
>>>  - you are not booting from hda or hdc
>>> 
>>>  - hdc still holds a valid LVM VGDA
>>> 
>>>  - likely the first sector of hda got blown away (by lilo)
>>> 
>>>  - you don't have any /etc/lvmconf/ VGDA backup files on disk/tape
>>>    (if not so use vgcfgrestore(8) in order to restore metadata to /dev/hda!)
>>> 
>>> 
>>> I'm assuming based on the data below:
>>> 
>>>  - your 2 physical volumes are equal in size
>>> 
>>>  - you had just 1 logical volume spread over both physical volumes using
>>>    all of the VG's capacity
>>> 
>>>  - all of your VGDA with the exception of the physical volume structure,
>>>    which was sitting at the very beginning of hda is still there and
>>>    likely valid
>>> 
>>> 
>>> *If* the above assumptions are correct, your option is to copy the first
>>> sector of /dev/hdc over to /dev/hda with
>>> "dd if=/dev/hdc bs=512 count=1 of=/dev/hda" *and* change it with a hex editor.
>>> 
>>> In order to find the correct offsets into the first sector on /dev/hda to
>>> change, look at lvm.h (of LVM 0.8final!) and the definition of pv_disk_t in
>>> that header file.
>>> 
>>> At least you need to change the physical number (pv_number); set it to 1.
>>> 
>>> In case the above assumptions are not correct for eg. the sizes of the PVs
>>> differ, you need to change pv_size, pe_total and pe_allocated as well.
>>> 
>>> Please get back to me if this is the case.
>>> 
>>> 
>>> BTW: we are working on the enhancement of our LVM checker in order
>>>      to support such repairs. Not very helpfull for you nor, I know :(
>>> 
>>> Don't forget to check your /etc/lilo.conf to make sure, that lilo doesn't
>>> tamper with the first sector on /dev/hda again!
>> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
