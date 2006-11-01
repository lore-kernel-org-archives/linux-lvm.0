Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id kA1HMLSZ032297
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 12:22:21 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <Pine.LNX.4.64.0610302250450.19176@localhost>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
	<2e9d2be4483db00be84afd0aca33e698@redhat.com>
	<Pine.LNX.4.64.0610302250450.19176@localhost>
Message-Id: <9a4fd1bc1dee8da54e868d07f107b3b3@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Date: Wed, 1 Nov 2006 11:26:12 -0600
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

It looks like your 'pvmove --abort' succeeded in canceling the pvmove 
(even though you had to reboot).  So that's good.

You can certainly try an 'lvremove maingroup/dvd'.  It seems to me that 
the logical volume is in the metadata (you can look for it in 
/etc/lvm/backup/maingroup), but for some reason it is not able to 
complete the load of that device into device-mapper.  Because it only 
partially succeeds, it is giving you a device with no table...  After 
doing the 'lvremove' you may need to also do a 'dmsetup remove 
maingroup-dvd'.  Once completely removed, you could try your 'lvcreate' 
again.

I talked to someone about this and they said that it could be a kernel 
device-mapper/user-space device-mapper mismatch issue.  I'm not sure I 
understand that logic, given that you are able to load other devices of 
the same target type (i.e. linear).  Perhaps that person would like to 
speak up here?

  brassow

P.S.  Are you always getting the 'cdrom' error?  You may wish to change 
the filter option to exclude the cdrom device.  To do that, change the 
"filter" line in /etc/lvm/lvm.conf to:
filter = [ "r|/dev/cdrom|" ]

On Oct 30, 2006, at 10:20 PM, Matt McHenry wrote:

> On Mon, 30 Oct 2006, Jonathan E Brassow wrote:
>
>> It appears to me that somehow the device-mapper device was created, 
>> but the table has not yet been loaded.
>>
>> While this is the case, you will not be able to create an LV of the 
>> same name.  (It will always give you the "device-mapper: reload ioctl 
>> failed:..." error.)
>
> 	I know very little about LVM, but if the table hadn't been loaded, 
> shouldn't it be the case that none of my LVs would be usable?  All but 
> the 'dvd' and 'gen-website' LVs are working fine.
>
>> If you reboot the machine does the "maingroup-dvd:" still show up 
>> from 'dmsetup table'?
>>
>> Also, after a reboot, be sure to run 'pvmove --abort'.
>
> 	I tried to run 'pvmove --abort' and got the same error about 'reload 
> ioctl ...'.  But after reboot, the gen-website LV was back and appears 
> intact.  (And the pvmove temporary LV is gone.)  So we're making 
> progress ... :)
>
>> Once you've canceled the pvmove successfully, I would do a 'dmsetup 
>> remove
>> maingroup-dvd; and try the 'lvcreate -L 15G -n dvd maingroup' again.
>
> 	I rebooted, ran 'dmsetup remove maingroup-dvd', rebooted again ... 
> and now the maingroup-dvd is back in the table.  Do I need to do the 
> 'lvcreate' right after the 'dmsetup remove', without rebooting in 
> between? Or maybe do an 'lvremove' in addition to the 'dmsetup 
> remove'?
>
> 	I am at least getting a different error from 'lvcreate' now.  I seem 
> to be in a slightly better state than when this started, so I'm 
> holding off on trying any of my suggestions above in case one of them 
> might make things worse.  :)
>
> # dmsetup table
> maingroup-tmp: 0 4194304 linear 8:8 154018176
> maingroup-c--p: 0 8388608 linear 8:7 47980928
> maingroup-capture: 0 23642112 linear 8:7 56369536
> maingroup-capture: 23642112 40009728 linear 8:6 384
> maingroup-capture: 63651840 78954496 linear 8:10 384
> maingroup-usr: 0 19996672 linear 8:9 73400704
> maingroup-usr: 19996672 974848 linear 8:8 150946176
> maingroup-usr: 20971520 3891200 linear 8:8 48619904
> maingroup-usr: 24862720 7708672 linear 8:8 384
> maingroup-usr: 32571392 9371648 linear 8:8 52511104
> maingroup-var: 0 10485760 linear 8:9 62914944
> maingroup-var: 10485760 5218304 linear 8:8 145727872
> maingroup-gen--website: 0 31457280 linear 8:11 384
> maingroup-music: 0 1810432 linear 8:8 158212480
> maingroup-music: 1810432 17317888 linear 8:9 142705024
> maingroup-music: 19128320 43786240 linear 8:7 384
> maingroup-swap2: 0 2097152 linear 8:7 45883776
> maingroup-opt: 0 2097152 linear 8:8 151921024
> maingroup-opt: 2097152 6291456 linear 8:8 42328448
> maingroup-dvd:
> maingroup-swap1: 0 2097152 linear 8:7 43786624
> maingroup-home: 0 62914560 linear 8:9 384
> maingroup-home: 62914560 29310976 linear 8:9 113394048
> maingroup-home: 92225536 19996672 linear 8:9 93397376
> maingroup-home: 112222208 34619392 linear 8:8 7709056
> maingroup-home: 146841600 83845120 linear 8:8 61882752
>
> # lvcreate -L 15G -n dvd maingroup
>   /dev/cdrom: open failed: Read-only file system
>   Attempt to close device '/dev/cdrom' which is not open.
>   Logical volume "dvd" already exists in volume group "maingroup"
>
> # ls /dev/maingroup/
> c-p  capture  gen-website  home  music  opt  swap1  swap2  tmp  usr  
> var
>
> # ls /dev/mapper/
> control            maingroup-gen--website  maingroup-swap1  
> maingroup-var
> maingroup-c--p     maingroup-home          maingroup-swap2
> maingroup-capture  maingroup-music         maingroup-tmp
> maingroup-dvd      maingroup-opt           maingroup-usr
>
>
> ----------------------
> Matt McHenry
> http://www.speakeasy.org/~jerith/
> jerith@speakeasy.org
> be052@scn.org
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
