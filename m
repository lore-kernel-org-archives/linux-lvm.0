Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GF5RLi028067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 11:05:27 -0400
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mx1.redhat.com (Postfix) with ESMTPS id BA29EB8BB3
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 15:05:26 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so194530690wml.0
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 08:05:26 -0700 (PDT)
Received: from [10.34.130.128] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	ys9sm3423390wjc.35.2016.03.16.08.05.23 for <linux-lvm@redhat.com>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 08:05:24 -0700 (PDT)
References: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
	<56E89311.1030408@gmail.com> <D30DED20.19EAC%stdake@cisco.com>
	<56E913F2.60702@gmail.com> <D30EAF21.19F62%stdake@cisco.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <56E97633.10009@gmail.com>
Date: Wed, 16 Mar 2016 16:05:23 +0100
MIME-Version: 1.0
In-Reply-To: <D30EAF21.19F62%stdake@cisco.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] disabling udev_sync and udev_rules
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

Dne 16.3.2016 v 14:37 Steven Dake (stdake) napsal(a):
>
>
> On 3/16/16, 1:06 AM, "linux-lvm-bounces@redhat.com on behalf of Zdenek
> Kabelac" <linux-lvm-bounces@redhat.com on behalf of
> zdenek.kabelac@gmail.com> wrote:
>
>> Dne 16.3.2016 v 00:52 Steven Dake (stdake) napsal(a):
>>>
>>>
>>> On 3/15/16, 3:56 PM, "linux-lvm-bounces@redhat.com on behalf of Zdenek
>>> Kabelac" <linux-lvm-bounces@redhat.com on behalf of
>>> zdenek.kabelac@gmail.com> wrote:
>>>
>>>> Dne 15.3.2016 v 23:31 Serguei Bezverkhi (sbezverk) napsal(a):
>>>>> Hello folks,
>>>>>
>>>>> While trying to make lvm work within a docker container I came across
>>>>> an issue when all lvcreate/lvremove got stuck indefinetly or until
>>>>> control-c. When I checked process I noticed lvm was waiting on one
>>>>> semaphore, I found that other folks hit similar issue and they fixed
>>>>> it
>>>>> by setting  udev_sync and udev_rules to 0. It also helped my case too.
>>>>>
>>>>> I would greatly appreciate if you could share your thought if this
>>>>> change in future can potentially have any negative impact.
>>>>>
>>>>> Thank you
>>>>
>>>> Hi
>>>>
>>>>
>>>> To 'unblock' stuck processes waiting on udev cookie - you could run:
>>>>
>>>> 'dmsetup udevcomplete_all'
>>>>
>>>>
>>>> However the key question is - how you could get stuck.
>>>> That may need further debugging.
>>>>
>>>> You would need to expose your OS  version and also version of lvm2 in
>>>> use.
>>>>
>>>> Non working cookies are bad - and disabling udev sync is even more bad
>>>> idea...
>>>
>>> Zdeknek,
>>>
>>> To expand on what Serguei is doing, he is working on a patch to add
>>> LVM2+Iscsi in a container for the Cinder (block storage AAS) project in
>>
>>
>> Hi
>>
>> Well - this should be the 1st. sentence in the initial email reporting
>> the
>> problem.
>>
>> lvm2 DOES NOT (and CANNOT) work properly inside container.
>>
>> Devices are not 'containerized' resource.
>> This is common bug in 'Docker-land' understanding of Linux kernel.
>> That's where the hacks like not using 'udev' sync comes from.
>
> Zdenek,
>
> Just for the sake of the archive, we did manage to get LVM to work inside
> a container without modifying the udev sync rules by using --ipc=host to
> docker start.  Thanks for the pointers. I hope that other people that run
> across this problem can find this thread and use the --ipc=host solution,
> since containerized applications are the future and would be bleak without
> lvm2 ;)

Hi

I think you still miss the problem. So let me illustrate:

Let's assume you have a 'VG' in your host machine.

Then you let run commands operating on this VG inside your guest-like 
Dockerized container application - this one surely has no access to system 
lvm2 lockdir. So it will access metadata of your VG without using proper 
locking - it may even think it is taking lock - since inside your 'chrooted' 
container the locking will work - but it's different lock then your system 
lvm2 lock - so just useless...

The situation ain't any better if you make special LV for your docker guest 
and then you let guest to create there a PV to use - since your host
unless precisely configured will see and will interact with does metadata as well.

The 'lvm2' solution so far is  'clvmd' but it's well beyond docker as it's 
using dlm locking and needs fair bit of cluster infrastructure.

I'm also not sure if even 'sanlock' would make a docker land easier to accept 
the fact that you can't let to  have 2 independent apps changing/playing with 
metadata without using locking between each other.

 From what you repeat to say here I assume there is no interest to make it - 
right - just make it work with any hack you can find.

So you've been just warned that there is fair bit of complexity running inside 
lvm2 that relies on certain system behavior - and it's not designed to be 
running in container at all and used in a way you try to demonstrate/promote 
as usable.

Regards

Zdenek
