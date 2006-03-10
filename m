Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2ALjS105533
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 16:45:28 -0500
Received: from rarr.org.uk (213-228-241-254.dsl.prodigynet.co.uk
	[213.228.241.254])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2ALjIem001634
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 16:45:18 -0500
Received: from rarr.org.uk ([127.0.0.1] helo=192.168.0.6)
	by rarr.org.uk with esmtp (Exim 4.54) id 1FHpQa-0000z7-Kz
	for linux-lvm@redhat.com; Fri, 10 Mar 2006 21:45:40 +0000
Message-ID: <32988.192.168.0.2.1142027140.squirrel@192.168.0.6>
In-Reply-To: <6c3e3c670603101323s6ccb11f2kfeea93718cfd162a@mail.gmail.com>
References: <43CE271C.4090308@rarr.org.uk> <43CF4607.70703@rarr.org.uk> 
	<54841.192.168.0.2.1142022376.squirrel@192.168.0.6>
	<6c3e3c670603101323s6ccb11f2kfeea93718cfd162a@mail.gmail.com>
Date: Fri, 10 Mar 2006 21:45:40 -0000 (GMT)
Subject: Re: [linux-lvm] Disk space reporting inconsistencies
From: cbolton@rarr.org.uk
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


hmm yeah, but this machine doesnt have space for a cdrom to be attached
nor a floppy drive so how could I resize offline? would there be away?

On Fri, March 10, 2006 9:23 pm, Chad Rebuck wrote:
> I am just trying to fix my own problems here so don't expect what I
> say will fix your troubles...but try running ext2online with -d and -v to
> get more information.
>
> have you looked at resize2fs?
>
> http://www.2robots.com/static/man/index.php/resize2fs
>
>
> On 3/10/06, cbolton@rarr.org.uk <cbolton@rarr.org.uk> wrote:
>
>> Repling to my own mail here but its on subject.
>>
>>
>> Just added a new drive to the machine, added it to the volume group,
>> moved everything from /dev/hde1 to /dev/hda, removed hde1 from the VG
>> and removed in physicaly from the machine.
>>
>> Great everything went fine, only the new drive is 60gigs so in moving
>> its only used 40gigs.  Not a problem I thought, I'll just extend the
>> logical volume, so I did lvextend and extended it by 20gigs.
>>
>> This seemed to work as well..
>>
>>
>> PV /dev/sda2   VG VolGroup00   lvm2 [68.38 GB / 0    free]
>> PV /dev/sdb    VG VolGroup00   lvm2 [68.50 GB / 0    free]
>> PV /dev/hdc2   VG VolGroup00   lvm2 [37.12 GB / 0    free]
>> PV /dev/hdb1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
>> PV /dev/hdd1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
>> PV /dev/hda    VG VolGroup00   lvm2 [57.25 GB / 0    free]
>> Total: 6 [305.69 GB] / in use: 6 [305.69 GB] / in no VG: 0 [0   ]
>>
>>
>> but df -h says...
>>
>> Filesystem            Size  Used Avail Use% Mounted on
>> /dev/mapper/VolGroup00-LogVol00
>> 265G  248G  6.8G  98% /
>> /dev/sda1              99M   73M   22M  78% /boot
>> /dev/shm              252M     0  252M   0% /dev/shm
>>
>>
>> I thought I'd need to extend the file system so i did ext2online
>> /dev/VolGroup00/LogVol00 but its says...
>>
>>
>> ext2online v1.1.18 - 2001/03/18 for EXT2FS 0.5b ext2online: ext2_ioctl:
>> No space left on device
>>
>>
>> ext2online: unable to resize /dev/mapper/VolGroup00-LogVol00
>>
>>
>>
>> Any ideas? I'm plain out.
>>
>>
>> Cheers,
>> Chris
>>
>>
>> On Thu, January 19, 2006 7:55 am, Chris bolton wrote:
>>
>>> nevermind got it sussed, lvm is using 10^9 for a gigabyte while df is
>>>  using 1024^3
>>>
>>> well it would appear that way anyway.
>>>> Hi,
>>>>
>>>>
>>>>
>>>> just added a new PV to my VG but to me there seems to be an
>>>> inconsistency between what lvm says is the disk space and what df
>>>> says.
>>>>
>>>>
>>>> pvscan PV /dev/sda2   VG VolGroup00   lvm2 [68.38 GB / 0    free] PV
>>>> /dev/sdb    VG VolGroup00   lvm2 [68.50 GB / 0    free]
>>>> PV /dev/hdc2   VG VolGroup00   lvm2 [37.12 GB / 0    free]
>>>> PV /dev/hdb1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
>>>> PV /dev/hdd1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
>>>> PV /dev/hde1   VG VolGroup00   lvm2 [37.25 GB / 0    free]
>>>> Total: 6 [285.69 GB] / in use: 6 [285.69 GB] / in no VG: 0 [0   ]
>>>>
>>>>
>>>>
>>>> df -h /dev/mapper/VolGroup00-LogVol00   265G  227G   28G  90% /
>>>>
>>>>
>>>> I tried resizing the filesystem but it just says this..
>>>>
>>>>
>>>>
>>>> ext2online  /dev/VolGroup00/LogVol00 ext2online v1.1.18 -
>>>> 2001/03/18 for
>>>> EXT2FS 0.5b
>>>> ext2online: ext2_ioctl: No space left on device
>>>>
>>>>
>>>>
>>>> ext2online: unable to resize /dev/mapper/VolGroup00-LogVol00
>>>>
>>>>
>>>>
>>>> Am I missing something obvious here? or have I ballsed it up along
>>>> the way?
>>>>
>>>> Cheers,
>>>> Chris.
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>> _______________________________________________
>>> linux-lvm mailing list linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
