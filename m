Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94B3F62502
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 17:34:22 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B45AC0D8D5C
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 17:34:21 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 189so10355879wmh.1
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 10:34:21 -0700 (PDT)
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<d834399d42da2d585673e8e24a8a9383@xenhideout.nl>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <14ec0303-5e4e-3100-7d0b-251532717ecc@gmail.com>
Date: Mon, 11 Sep 2017 19:34:18 +0200
MIME-Version: 1.0
In-Reply-To: <d834399d42da2d585673e8e24a8a9383@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 11.9.2017 v 16:00 Xen napsal(a):
> Just responding to second part of your email.
> 
>>> Only manual intervention this one... and last resort only to prevent crash 
>>> so not really useful in general situation?
>>
>> Let's simplify it for the case:
>>
>> You have  1G thin-pool
>> You use 10G of thinLV on top of 1G thin-pool
>>
>> And you ask for 'sane' behavior ??
> 
> Why not? Really.

Because all filesystems put on top of thinLV  do believe all blocks on the 
device actually exist....

>> Any idea of having 'reserved' space for 'prioritized' applications and
>> other crazy ideas leads to nowhere.
> 
> It already exists in Linux filesystems since long time (root user).

Did I say you can't compare filesystem problem with block level problem ?
If not ;) let's repeat - being out of space in a single filesystem
is completely different fairy-tail with out of space thin-pool.

> 
>> Actually there is very good link to read about:
>>
>> https://lwn.net/Articles/104185/
> 
> That was cute.
> 
> But we're not asking aeroplane to keep flying.
IMHO you just don't yet see the parallelism....


>> And we believe it's fine to solve exceptional case  by reboot.
> 
> Well it's hard to disagree with that but for me it might take weeks before I 
> discover the system is offline.

IMHO it's problem of proper monitoring.

Still the same song here - you should actively trying to avoid car-collision, 
since trying to resurrect often seriously injured or even dead passenger from 
a demolished car is usually very complex job with unpredictable result...

We do put number of 'car-protection' safety mechanism - so the newer tools,
newer kernel the better -  but still when you hit the wall in top-speed
you can't expect you just 'walk-out' easily... and it's way cheaper to solve 
the problem in way you will NOT crash at all..

> 
> Otherwise most services would probably continue.
> 
> So now I need to install remote monitoring that checks the system is still up 
> and running etc.

Of course you do.

thin-pool needs attention/care :)

> If all solutions require more and more and more and more monitoring, that's 
> not good.

It's the best we can provide....


>> So don't expect lvm2 team will be solving this - there are more prio work....
> 
> Sure, whatever.
> 
> Safety is never prio right ;-).

We are safe enough (IMHO) to NOT loose committed data,
We cannot guarantee stable system though - it's too complex.
lvm2/dm can't be fixing extX/btrfs/XFS and other kernel related issues...
Bold men can step in - and fix it....


>> If the system volume IS that important - don't use it with over-provisiong!
> 
> System-volume is not overprovisioned.

If you have  enough blocks in thin-pool to cover all needed block for all 
thinLV attached to it - you are not overprovisioning.


> Just something else running in the system....


Use different pools ;)
(i.e. 10G system + 3 snaps needs  40G of data size & appropriate metadata size 
to be safe from overprovisioning)

> That will crash the ENTIRE SYSTEM when it fills up.
> 
> Even if it was not used by ANY APPLICATION WHATSOEVER!!!

Full thin-pool on recent kernel is certainly NOT randomly crashing entire 
system :)

If you think it's that case - provide full trace of crashed kernel and open BZ 
- just be sure you use upstream Linux...

> My system LV is not even ON a thin pool.

Again - if you reproduce on kernel 4.13 - open BZ and provide reproducer.
If you use older kernel - take a recent one and reproduce.

If you can't reproduce - problem has been already fixed.
It's then for your kernel provider to either back-port fix
or give you fixed newer kernel - nothing really for lvm2...


> It's way more practical solution the trying to fix  OOM problem :)
> 
> Aye but in that case no one can tell you to ensure you have auto-expandable 
> memory ;-) ;-) ;-) :p :p :p.

I'd probably recommend reading some books about how is memory mapped on a 
block device and what are all the constrains and related problems..

>>> Yes email monitoring would be most important I think for most people.
>> Put mail messaging into  plugin script then.
>> Or use any monitoring software for messages in syslog - this worked
>> pretty well 20 years back - and hopefully still works well :)
> 
> Yeah I guess but I do not have all this knowledge myself about all these 
> different kinds of softwares and how they work, I hoped that thin LVM would 
> work for me without excessive need for knowledge of many different kinds.

We do provide some 'generic' script - unfortunately - every use-case is 
basically pretty different set of rules and constrains.

So the best we have is 'auto-extension'
We used to trying to umount - but this has possibly added more problems then 
it has actually solved...

>>> I am just asking whether or not there is a clear design limitation that 
>>> would ever prevent safety in operation when 100% full (by accident).
>>
>> Don't user over-provisioning in case you don't want to see failure.
> 
> That's no answer to that question.

There is a lot of technical complexity behind it.....

I'd say the main part is -  'fs'  would need to be able to know understand
it's living on provisioned device (something we actually do not want to,
as you can change 'state' in runtime - so 'fs' should be aware & unaware
at the same time ;) -   checking with every request that thin-provisioning
is in the place would impact performance, doing in mount-time make it
also bad.

Then you need to deal with fact, that writes to filesystem are 'process' 
aware, while writes to block-device are some anonymous page writes for your 
page cache.
Have I said the level of problems for a single filesystem is totally different 
story yet ?

So in a simple statement  - thin-p has it's limits - if you are unhappy with 
them, then you probably need to look for some other solution - or starting
sending patches and improve things around...

> 
>> It's the same as you should not overcommit your RAM in case you do not
>> want to see OOM....
> 
> But with RAM I'm sure you can typically see how much you have and can thus 
> take account of that, filesystem will report wrong figure ;-).

Unfortunately you cannot....

Number of your free RAM is very fictional number ;) and you run in much bigger 
problems if you start overcommiting memory in kernel....

You can't compare your user-space failing malloc and OOM crashing Firefox....

Block device runs in-kernel - and as root...
There are no reserves, all you know is you need to write block XY,
you have no idea what is the block about..
(That's where ZFS/Btrfs was supposed to excel - they KNOW.... :)

Regard

Zdenek
