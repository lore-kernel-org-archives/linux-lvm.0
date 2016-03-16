Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2G86ENF032548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 04:06:14 -0400
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mx1.redhat.com (Postfix) with ESMTPS id EC3AC711C8
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 08:06:12 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l124so38146620wmf.1
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 01:06:12 -0700 (PDT)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102]) by smtp.gmail.com with ESMTPSA id
	pd1sm1809048wjb.19.2016.03.16.01.06.10 for <linux-lvm@redhat.com>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 01:06:10 -0700 (PDT)
References: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
	<56E89311.1030408@gmail.com> <D30DED20.19EAC%stdake@cisco.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <56E913F2.60702@gmail.com>
Date: Wed, 16 Mar 2016 09:06:10 +0100
MIME-Version: 1.0
In-Reply-To: <D30DED20.19EAC%stdake@cisco.com>
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

Dne 16.3.2016 v 00:52 Steven Dake (stdake) napsal(a):
>
>
> On 3/15/16, 3:56 PM, "linux-lvm-bounces@redhat.com on behalf of Zdenek
> Kabelac" <linux-lvm-bounces@redhat.com on behalf of
> zdenek.kabelac@gmail.com> wrote:
>
>> Dne 15.3.2016 v 23:31 Serguei Bezverkhi (sbezverk) napsal(a):
>>> Hello folks,
>>>
>>> While trying to make lvm work within a docker container I came across
>>> an issue when all lvcreate/lvremove got stuck indefinetly or until
>>> control-c. When I checked process I noticed lvm was waiting on one
>>> semaphore, I found that other folks hit similar issue and they fixed it
>>> by setting  udev_sync and udev_rules to 0. It also helped my case too.
>>>
>>> I would greatly appreciate if you could share your thought if this
>>> change in future can potentially have any negative impact.
>>>
>>> Thank you
>>
>> Hi
>>
>>
>> To 'unblock' stuck processes waiting on udev cookie - you could run:
>>
>> 'dmsetup udevcomplete_all'
>>
>>
>> However the key question is - how you could get stuck.
>> That may need further debugging.
>>
>> You would need to expose your OS  version and also version of lvm2 in use.
>>
>> Non working cookies are bad - and disabling udev sync is even more bad
>> idea...
>
> Zdeknek,
>
> To expand on what Serguei is doing, he is working on a patch to add
> LVM2+Iscsi in a container for the Cinder (block storage AAS) project in


Hi

Well - this should be the 1st. sentence in the initial email reporting the 
problem.

lvm2 DOES NOT (and CANNOT) work properly inside container.

Devices are not 'containerized' resource.
This is common bug in 'Docker-land' understanding of Linux kernel.
That's where the hacks like not using 'udev' sync comes from.

> OpenStack.  He is doing this in the upstream repository here:
>
> http://github.com/openstack/klla
>
> The LVM processes are running within a container.  I suspect if the
> process is stuck on a semaphore it has something to do with semaphores not
> being shared with the host OS, because containers naturally create a
> contained environment.  There are solutions for things like sockets, but
> not necessarily for things like semaphores for the container to
> communicate with the host OS.
>
> Is there another mechanism besides semaphores to get lvm2 to communicate
> with udev?  Turning off udev sync side-steps the problem because then udev
> is not in the picture.  Some people in our community think this is a
> security risk, although we assume the servers are completely secure.
>
> Your advice welcome on how to solve the problem would be mighty nice :)
>
> To see the change in full, check out:


The proper way to resolve this is - to have some 'system' service doing
device for you and then transporting such device to your container.
Some sort of super-controller daemon.

Device creation is controlled by udev - which runs in your core system.
It's this udev which is processing kernel event and completes cookie and 
unblocks lvm2 command.

But user really should not confuse what is cgrouped process supposed to be 
doing - it really cannot create device (unlike in full virtual VM) - it has 
wide impact over the whole system - so there must be 'upper-level' process 
controlling this in some way and resolving i.e. name conflicts - sync in the 
system you have just one name space - not per-container namespace - and there 
are more and more troubles ahead...

Anyway - my first advice is to active device as service and pass properly 
created device back to your container via some protocol.

Regards


Zdenek
