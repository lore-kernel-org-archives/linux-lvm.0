Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n14JNu3a004123
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 14:23:56 -0500
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n14JNaLG029253
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 14:23:37 -0500
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id A4E77D48175
	for <linux-lvm@redhat.com>; Wed,  4 Feb 2009 20:23:34 +0100 (CET)
Received: from [192.168.1.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 9E171D48191
	for <linux-lvm@redhat.com>; Wed,  4 Feb 2009 20:23:31 +0100 (CET)
Message-ID: <4989EB33.3070606@free.fr>
Date: Wed, 04 Feb 2009 20:23:31 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Query regarding conversion of root partition to LV
References: <a80c86b70902040505l257e8ab8k4bad5ac121520e3f@mail.gmail.com>	<4989A4E3.6040201@free.fr>
	<a80c86b70902041036g5e7c125fn1b9b41aaa2abd18f@mail.gmail.com>
In-Reply-To: <a80c86b70902041036g5e7c125fn1b9b41aaa2abd18f@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello Prateek !
You need 3 PV to use LVM mirroring.
You can't boot using Grub on an LVM so I advised of a plain partition 
with an EXT2/3 FS to hold the kernel and grub setup files.
I doubt you can plug and have the disk recognized/discovered without 
turning the machine down. But your mileage may vary.
Last but not least, having the same partition scheme on the two disks 
will help maintain the system in the future. Bear in mind that in order 
to use the remaining space on the original disk, you've to play with the 
partition table and that the kernel will/may fool you because it *has* 
to know the exact partition used because the root filesystem relies upon it.
Hope this helps.
Prateek Donni a écrit :
> Hey George,
>      I am trying to make use of LVM's existing mirroring feature to
> protect data from disk failures.
> So i want to convert the original root into an LV.
> I thought of making a block device with the free space(as in which is
> allocated inside as root )  and create a PV of the same. can this help
> ? then on the second disk which may have unallocated space, i create
> another PV and mirror a volume across it using LVM features.
> I dont want to make use of RAID and i have to have my application run
> w/o a reboot.
> 
> Any suggestions which you can give me considering the above constraints ....
> 
> 
> Thanks Prateek
> 
> 
> 
> On Wed, Feb 4, 2009 at 7:53 PM, Georges Giralt <georges.giralt@free.fr> wrote:
>> Prateek Donni a écrit :
>>> I have a fedora 9 installation with two partitions swap and /
>>> partition. Now i want to mirror the files on the root partition to
>>> another disk using LVM mirroring. Since i dint make root on a LV and
>>> have no allocated space left so i am thinking of using the free space
>>> on the root partition as a block device that can be converted into PV
>>> and then mirrored after making it a LV.
>>> Is this feasible?
>>> Can someone let me know wht can be done?
>>>
>>> Thanks
>>> Prateek
>>>
>> Hi Prateek !
>> IMHO this won't work.
>> As you spoke about mirroring, you can do this :
>> 1) add another disk to the system (ideally same size of the original one)
>> 2) partition it as :
>>        part #1 used as /boot (about a 100 MB, Ext2/3 FS )
>>        part #2 the remaining of the disk tagged as LVM.
>> 3) boot your system under Fedora 9 and using LVM mamger create a PV ont the
>> second partition, then a VG on the PV and then as much LV as you need. Do
>> not forget to create the swap LV.
>> 4) Format and temporary mount each LV ont the filesystem, recreating the
>> correct layout but under, say, /mnt.
>> 5) copy the data using a command like : cd / && tar cf - . |(cd /mnt && tar
>> xf -)
>> 6) under the /mnt layout correct the Grub menu file, then using this as the
>> root with chroot, re-run grub-install.
>> 7) boot under the new disk and test your system.
>> If fine,
>> 8) create the same partition layout on the old disk as the new one and
>> create 2 software raid 1 (mirror) using mdadm, one for the first partition
>> used as /boot , the other one for the PV.
>> 9) synchronize the md.
>> Enjoy.
>> Be carefull and read the man pages before proceding. A complete backup may
>> prove usefull, also.
>> Hope this helps.
>>
>> --
>> If the only tool you have is a hammer, you tend to see every problem as a
>> nail.
>>                Abraham Maslow
>> A British variant :
>> Any tool can serve as a hammer but a screwdriver makes the best chisel.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 


-- 
If the only tool you have is a hammer, you tend to see every problem as 
a nail.
                 Abraham Maslow
