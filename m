Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3210649DD
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 14:00:42 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D78AC3725DF
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 14:00:40 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id D9BA440C1DF6
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 16:00:38 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 11 Sep 2017 16:00:39 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
Message-ID: <d834399d42da2d585673e8e24a8a9383@xenhideout.nl>
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
To: linux-lvm@redhat.com

Just responding to second part of your email.

>> Only manual intervention this one... and last resort only to prevent 
>> crash so not really useful in general situation?
> 
> Let's simplify it for the case:
> 
> You have  1G thin-pool
> You use 10G of thinLV on top of 1G thin-pool
> 
> And you ask for 'sane' behavior ??

Why not? Really.

> Any idea of having 'reserved' space for 'prioritized' applications and
> other crazy ideas leads to nowhere.

It already exists in Linux filesystems since long time (root user).

> Actually there is very good link to read about:
> 
> https://lwn.net/Articles/104185/

That was cute.

But we're not asking aeroplane to keep flying.

We are asking aeroplane to not take down fuelling plane hovering nearby 
too.

> Well yeah - it's not useless to discuses solution for  old releases of 
> lvm2...

This is insignifant difference. There is no point in here for you to 
argue this.

> Lvm2 should be compilable and usable on older distros as well - so
> upgrade and do not torture yourself with older lvm2....

I'm not doing anything with my system right now so... upgrading LVM2 
would be more torture.


> And we believe it's fine to solve exceptional case  by reboot.

Well it's hard to disagree with that but for me it might take weeks 
before I discover the system is offline.

Otherwise most services would probably continue.

So now I need to install remote monitoring that checks the system is 
still up and running etc.

If all solutions require more and more and more and more monitoring, 
that's not good.


> Since the effort you would need to put into solve all kernel corner
> case is absurdly high compared with the fact 'it's exception' for
> normally used and configured and monitored thin-pool....

Well I take you on your word, it is just not my impression it would be 
*that* hard but this depends on design I guess and you are the arbiter 
on that I guess.

> So don't expect lvm2 team will be solving this - there are more prio 
> work....

Sure, whatever.

Safety is never prio right ;-).

But anyway.

>> Sure but some level of "room reservation" is only to buy time -- or 
>> really perhaps to make sure main system volume doesn't crash when data 
>> volume fills  > up by accident.
> 
> If the system volume IS that important - don't use it with 
> over-provisiong!

System-volume is not overprovisioned.

Just something else running in the system....

That will crash the ENTIRE SYSTEM when it fills up.

Even if it was not used by ANY APPLICATION WHATSOEVER!!!

> The answer is that simple.

But you misunderstand that I was talking about a system volume that was 
not a thin volume.

> You can user different thin-pool for your system LV where you can 
> maintain
> snapshot without over-provisioning.

My system LV is not even ON a thin pool.

> It's way more practical solution the trying to fix  OOM problem :)

Aye but in that case no one can tell you to ensure you have 
auto-expandable memory ;-) ;-) ;-) :p :p :p.

>> Yes email monitoring would be most important I think for most people.
> Put mail messaging into  plugin script then.
> Or use any monitoring software for messages in syslog - this worked
> pretty well 20 years back - and hopefully still works well :)

Yeah I guess but I do not have all this knowledge myself about all these 
different kinds of softwares and how they work, I hoped that thin LVM 
would work for me without excessive need for knowledge of many different 
kinds.

>> Aye but does design have to be complete failure when condition runs 
>> out?
> 
> YES

:(.

>> I am just asking whether or not there is a clear design limitation 
>> that would ever prevent safety in operation when 100% full (by 
>> accident).
> 
> Don't user over-provisioning in case you don't want to see failure.

That's no answer to that question.

> It's the same as you should not overcommit your RAM in case you do not
> want to see OOM....

But with RAM I'm sure you can typically see how much you have and can 
thus take account of that, filesystem will report wrong figure ;-).

>> I still think theoretically solution would be easy if you wanted it.
> 
> My best advice - please you should try to write it - so you would see
> more in depth how yours 'theoretical solution'  meets with reality....

Well more useful to ask people who know.


-- 
Highly Evolved Beings do not consider it “profitable” if they benefit at 
the expense of another.
