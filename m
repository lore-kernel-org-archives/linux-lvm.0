Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id kA6GAn1N010497
	for <linux-lvm@redhat.com>; Mon, 6 Nov 2006 11:10:49 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <fd8cf572cedb06da504fb08eaf705d9b@redhat.com>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
	<2e9d2be4483db00be84afd0aca33e698@redhat.com>
	<Pine.LNX.4.64.0610302250450.19176@localhost>
	<9a4fd1bc1dee8da54e868d07f107b3b3@redhat.com>
	<Pine.LNX.4.58.0611011953150.32134@shell2.speakeasy.net>
	<172c1cd542e581bc25f1bfb25e7b819a@redhat.com>
	<Pine.LNX.4.64.0611032113550.5594@localhost>
	<fd8cf572cedb06da504fb08eaf705d9b@redhat.com>
Message-Id: <6da928984b8ac9c997def9d0f7fabddc@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Date: Mon, 6 Nov 2006 10:15:02 -0600
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

I've also been told that this could very well be a known bug related to 
the kernel you are using... have you tried updating your kernel?

  brassow

On Nov 6, 2006, at 9:52 AM, Jonathan E Brassow wrote:

> Ok, at least maingroup-dvd isn't showing up anymore... so we know we 
> can get rid of it when things go wrong.
>
> I don't have an idea why the lvcreate is failing...  You could try to 
> interface with device-mapper directly and see what happens.  To do 
> that type:
>
> echo "0 31457280 linear 8:11 31457664" | dmsetup create maingroup-dvd
>
> That should create the device /dev/mapper/maingroup-dvd; and it should 
> be useable.  (Make sure that 8:11 is the same device that 
> maingroup-gen--website is on.)  If that works, then the problem is in 
> LVM, if it doesn't, we know it is in device-mapper.
>
> Another simple thing to try is bumping up the verbosity; e.g. 
> 'lvcreate -vvvv -L 15G -n dvd maingroup'.  This will give alot of 
> output, so you may wish to redirect it to a file.  Having everything 
> printed can often give great clues as to the problem.
>
>  brassow
>
>
> On Nov 3, 2006, at 8:27 PM, Matt McHenry wrote:
>
>> 	Thanks for your continued help.  It's still not working, though. I 
>> ran 'dmsetup remove maingroup-dvd' and 'lvremove maingroup/dvd' and 
>> rebooted.  It looks like it worked:
>>
>> # dmsetup table
>> maingroup-tmp: 0 4194304 linear 8:8 154018176
>> maingroup-c--p: 0 8388608 linear 8:7 47980928
>> maingroup-capture: 0 23642112 linear 8:7 56369536
>> maingroup-capture: 23642112 40009728 linear 8:6 384
>> maingroup-capture: 63651840 78954496 linear 8:10 384
>> maingroup-usr: 0 19996672 linear 8:9 73400704
>> maingroup-usr: 19996672 974848 linear 8:8 150946176
>> maingroup-usr: 20971520 3891200 linear 8:8 48619904
>> maingroup-usr: 24862720 7708672 linear 8:8 384
>> maingroup-usr: 32571392 9371648 linear 8:8 52511104
>> maingroup-var: 0 10485760 linear 8:9 62914944
>> maingroup-var: 10485760 5218304 linear 8:8 145727872
>> maingroup-gen--website: 0 31457280 linear 8:11 384
>> maingroup-music: 0 1810432 linear 8:8 158212480
>> maingroup-music: 1810432 17317888 linear 8:9 142705024
>> maingroup-music: 19128320 43786240 linear 8:7 384
>> maingroup-swap2: 0 2097152 linear 8:7 45883776
>> maingroup-opt: 0 2097152 linear 8:8 151921024
>> maingroup-opt: 2097152 6291456 linear 8:8 42328448
>> maingroup-swap1: 0 2097152 linear 8:7 43786624
>> maingroup-home: 0 62914560 linear 8:9 384
>> maingroup-home: 62914560 29310976 linear 8:9 113394048
>> maingroup-home: 92225536 19996672 linear 8:9 93397376
>> maingroup-home: 112222208 34619392 linear 8:8 7709056
>> maingroup-home: 146841600 83845120 linear 8:8 61882752
>>
>> 	But lvcreate still fails:
>>
>> # lvcreate -L 15G -n dvd maingroup
>>   /dev/cdrom: open failed: Read-only file system
>>   Attempt to close device '/dev/cdrom' which is not open.
>>   device-mapper: reload ioctl failed: Invalid argument
>>   Failed to activate new LV.
>>
>> 	(note that I have made the suggested change to /etc/lvm/lvm.conf and 
>> am still getting those /dev/cdrom errors)
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
