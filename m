Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBCDKO1T001835
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2010 08:20:24 -0500
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBCDKA7X008295
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2010 08:20:14 -0500
Received: from [192.168.1.4] (unknown [82.66.78.161])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 521984C802E
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2010 14:20:05 +0100 (CET)
Message-ID: <4D04CC04.6080903@free.fr>
Date: Sun, 12 Dec 2010 14:20:04 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <4CFD6563.70508@free.fr> <4CFD8A3F.8070403@bmsi.com>
In-Reply-To: <4CFD8A3F.8070403@bmsi.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] A hint on a process
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hello !
Here I am again.
The migration went well. Here is a synopsis of what I've done (including
finding a second drive with lot of SMART errors...)
Bought 2 SATA 320G disks (different make/model...)
Make a set of backups of every partitions on the machine. Check the dump
are readable and stored in a safe place ;-)
Remove one failed 160 GB disk from raid 1 array (software raid, with 3
disks.)
Physically replace the disk with one 320 GB disk. Partition the new disk
to have the small partition for /boot identical as it is on the previous
disk, allocate the remaining space to the second partition. toggle them
both to raid autodetect.

Add each partition to the two arrays. Wait for synchronisation.=20
Repeat for the two other disks.
When done, you've a raid array saying that it's size is 150 GB and this
on a roughly 320 GB partition.
Do a mdadm /dev/md1 --grow --size=3Dmax on the offending array, wait for
the synchronisation to take place, and when done do a pvresize /dev/md1.
Et voila, you're done. You've got a 320GB PV based on a RAID 1 device...
Many thanks for your help !

P.S. : I'm a bit paranoid and know my wife will forgot to tell me that
the computer said "something funny this morning" so I build my arrays
with 3 disk for a mirror...
Having been bitten by a bad disk lot, which make me loose all my data
because all disks died in a couple of hours, I build my arrays with
mixed brands/models to avoid this. I loose a couple of sectors here and
here but, IMHO it is worth it....
Le 07/12/2010 02:13, Stuart D Gathman a =EF=BF=BDcrit :
> On 12/06/2010 05:36 PM, Georges Giralt wrote:
>> Hello !
>> I've a system (now on Ubuntu 9.04, but initially on a Fedora ) set up as
>> follow :
>> There are two RAID1 software raid arrays (md0 , which is around 100 Mb
>> and holding an Ext2 FS for use in booting, md1 occupying the rest of the
>> space used as a PV for LVM) made on a couple of old 160 GB disks.
>>
>> On the LVM VG0 are a lot of LV onto which Ubuntu is installed.
>>
>> One of the two disks failed. I can't find a 160 GB replacement. Only 320
>> Gb for the smallest availlable disk near where I live.
>>
>> So I plan to move the system to 320 GB disks and, if possible, not
>> wasting the 320-160 difference....
>> The process I thought about is as follow :
>>
>> 1) insert one 320 disk in both arrays (after partitioning it correctly,
>> 100 Mb for the first partition and the remaining for the second.)
>>
>> 2) wait for the raid1 to synchronize.
>>
>> 3) mark the remaining 160 GB disk as failed and remove/replace with
>> another 320 GB disk set up as the first.
>>
>> 4) wait for the arrays to reconstruct/synchronize.
>>
>> 5) Extend the PV my Volume Group is build on (md1 in this case)
>>
>> 6) enjoy a beer...
>>
>> What do you think of my method ? Is it a good one or am I missing
>> something ? You will have understood that losing data is not an option .=
..
>> Many thanks in advance for your answers, critics and pointers...
>> Regards.
> Your method will fail because the raid superblock is at the end of the
> partition.
>
> I use and recommend this variation:
>
> 1. Replace 160 with 320, allocate 2 partitions to match (or slightly
> exceed if geometry requires) the partitions on
> the 160.  Synchronize.=20
>
> 2. Replace the 2nd 160, resynchronize.=20
>
> 3. Add a 3rd raid1 with the remaining space, and extend the VG with the
> additional PV.
>
> If your system can support 3 drives, you can always partition to mirror
> everything despite size mismatches.  For example,
> step 3 would become:
>
> 3a. reinstall the 160 and allocate 2 80g partitions on the 160 (which is
> no longer the default boot drive).  Allocate an 80g partition on each
> 320 to mirror the 2 80g partitions giving md2 and md3.  Mirror the
> remaining 80g in each 320 for md4.  Extend the VG with the addition 3 PVs.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


--=20
If the only tool you have is a hammer, you tend to see every problem as a n=
ail.
                Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.=20
