Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4HHHO9m028290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 13:17:25 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CA4D8AE72
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 17:17:22 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 4475B7FCC7
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 19:17:19 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 17 May 2016 19:17:19 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <573AE7BD.3000008@redhat.com>
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
	<573AE7BD.3000008@redhat.com>
Message-ID: <5751b613e8123d1c61ef8d08a5c01ea3@dds.nl>
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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

Strange, I didn't get my own message.


Zdenek Kabelac schreef op 17-05-2016 11:43:

> There is no plan ATM to support boot from thinLV in nearby future.
> Just use small boot partition - it's the safest variant - it just hold
> kernels and ramdisks...

That's not what I meant. Grub-probe will fail when the root filesystem 
is on thin, thereby making impossible the regeneration of your grub 
config files in /boot/grub.

It will try to find the device for mounted /, and not succeed.

Booting thin root is perfectly possible, ever since Kubuntu 14.10 at 
least (at least januari 2015).

> We aim for a system with boot from single 'linear' with individual
> kernel + ramdisk.
> 
> It's simple, efficient and can be easily achieved with existing
> tooling with some 'minor' improvements in dracut to easily allow
> selection of system to be used with given kernel as you may prefer to
> boot different thin snapshot of your root volume.

Sure but won't happen if grub-update bugs on thin root.

I'm not sure why we are talking about this now, or what I asked ;-).

> Complexity of booting right from thin is very high with no obvious 
> benefit.

I understand. I had not even been trying to achieve yet, although it has 
or might have principal benefit, the way doing away with partitions 
entirely (either msdos or gpt) has a benefit on its own.

But as you indicate, you can place boot on non-thin LVM just fine, so 
there is not really that issue as you say.

>> But for me, a frozen volume would be vastly superior to the system 
>> locking up.
> 
> You miss the knowledge how the operating system works.
> 
> Your binary is  'mmap'-ed for a device. When the device holding binary
> freezes, your binary may freeze (unless it is mlocked in memory).
> 
> So advice here is simple - if you want to run unfreezable system -
> simply do not run this from a thin-volume.

I did not run from a thin-volume, that's the point.

In my test, the thin volumes were created on another harddisk. I created 
a small partition, put a thin pool in it, put 3 thin volumes in it, and 
then overfilled it to test what would happen.

At first nothing happened, but as I tried to read back from the volume 
that had supposedly been written to, the entire system froze. My system 
had no active partitions on that harddisk other than those 3 thin 
volumes.

> ATM there are some 'black holes' as filesystem were not deeply tested
> in all corner cases which now could be 'easily' hit with thin usage.
> This is getting improved - but advice  "DO NOT" run thin-pool 100%
> still applies.

I understand.

> The best advice we have - 'monitor' fullness - when it's above - stop
> using such system and ensure there will be more space -  there is
> noone else to do this task for you - it's the price you pay for
> overprovisioning.

The point is that not only as an admin (for my local systems) but also 
as a developer, there is no point in continuing a situation that could 
be mitigated by designing tools for this purpose.

There is no point for me if I can make this easier by automating tools 
for performing these tasks, instead of doing them by hand. If I can 
create tools or processes that do, what I would otherwise have needed to 
do by hand, then there is no point in continuing to do it by hand. That 
is the whole point of "automation" everywhere.

I am not going to be a martyr just for the sake of people saying that a 
real admin would do everything by himself, by hand, by never sleeping 
and setting alarm clocks every hour to check on his system, if you know 
what I mean.

"Monitoring" and "stop using" is a process or mechanism that may very 
well be encoded and be made default, at least for my own systems, but by 
extension, if it works for me, maybe others can benefit as well.

I see no reason for remaining a spartan if I can use code to solve it as 
well.

Just the fact that auto-unmount and auto-extend exists, means you do not 
disagree with this.

Regards.




> If you need something 'urgently' now  -  you could i.e. monitor your 
> syslog
> message for 'dmeventd' report and run  i.e.  'reboot' in some case...

Well I guess I will just try to find time to develop that applet/widget 
I mentioned.

Of course an automated mechanism would be nice. The issue is not 
filesystem corruption. The issue is my system freezing entirely. I'd 
like to prevent that. Meaning, if I were to change the thin dmeventd 
module, to remount ro, it would probably already be solved for me, if I 
recompile and can use the compiled version.

I am not clear why a forced lazy umount is better, but I am sure you 
have your reason for it. It just seems that in many cases, an unwritable 
but present (and accessible) filesystem is preferable to none at all.


> or instead of reboot   'mount -o remount,ro' - whatever fits...
> Just be aware that relatively 'small' load on filesystem may easily 
> provision
> major portion of thin-pool quickly.

Depending on size of pool, right. It remains a race against the clock.


>> Maybe it would even be possible to have a kernel module that blocks a 
>> certain
>> kind of writes, but these things are hard, because the kernel doesn't 
>> have a
>> lot of places to hook onto by design. You could simply give the 
>> filesystem (or
>> actually the code calling for a write) write failures back.
> 
> There are no multiple write queues at dm level where you could select
> you want to store data from LibreOffice, but you want to throw out
> your Firefox files...

I do not mean any form of differentiation or distinction. I mean an 
overall forced read only mode on all files, or at least all "growing", 
for the entire volume (or filesystem on it) which would pretty much be 
the equivalent of remount,ro. The only distinction you could ever 
possibly want in there is to block "new growth" writes while allowing 
writes to existing blocks. That is the only meaningful distinction I can 
think of.

Of course, it would be pretty much equivalent to a standard mount -o 
remount,ro, and would still depend on thin pool information.


> dmeventd is quite quick when it 'detects' threshold (recent version of 
> lvm2).

Right.

> Your 'write' queue (amount of dirty-pages) could be simply full of
> write to 'blocked' device, and without 'time-outing' writes (60sec)
> you can't write anything anywhere else...

Roger that, so it is really a resource issue. Currently I am running 
this here system off of a USB 2 stick. I can tell you. IO blocking 
happens more than sunrays bouncing off walls in my house, and they do 
that a lot, too.

Something as simple as "man command" may block the system for 10 seconds 
or more. Often times everything stops responding. I can see the USB 
stick working. And then after a while the system resumes as normal. I 
have a read speed of 25MB/s but something is amiss with IO scheduling.


> Worth to note here - you can set your thin-pool with 'instant'
> erroring in case you know you do not plan to resize it (avoiding
> 'freeze')
> 
> lvcreate/lvchange --errorwhenfull  y|n

Ah thank you, that could solve it. I will try again with the thin test 
the moment I feel like rebooting again. The harddrive is still 
available, haven't installed my system yet.

Maybe that should be the default for any system that does not have 
autoextend configured.

Regards.
