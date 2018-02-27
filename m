Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC9660476
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2018 18:40:10 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E20881DF4
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2018 18:40:07 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 64E8340C2802
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2018 19:39:44 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 27 Feb 2018 19:39:44 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
Message-ID: <bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 24-04-2017 23:59:

>>> I'm just currious -  what the you think will happen when you have
>>> root_LV as thin LV and thin pool runs out of space - so 'root_LV'
>>> is replaced with 'error' target.
>> 
>> Why do you suppose Root LV is on thin?
>> 
>> Why not just stick to the common scenario when thin is used for extra 
>> volumes or data?
>> 
>> I mean to say that you are raising an exceptional situation as an 
>> argument against something that I would consider quite common, which 
>> doesn't quite work that way: you can't prove that most people would 
>> not want something by raising something most people wouldn't use.
>> 
>> I mean to say let's just look at the most common denominator here.
>> 
>> Root LV on thin is not that.
> 
> Well then you might be surprised - there are user using exactly this.

I am sorry, this is a long time ago.

I was concerned with thin full behaviour and I guess I was concerned 
with being able to limit thin snapshot sizes.

I said that application failure was acceptable, but system failure not.

Then you brought up root on thin as a way of "upping the ante".

I contended that this is a bigger problem to tackle, but it shouldn't 
mean you shouldn't tackle the smaller problems.

(The smaller problem being data volumes).

Even if root is on thin and you are using it for snapshotting, it would 
be extremely unwise to overprovision such a thing or to depend on 
"additional space" being added by the admin; root filesystems are not 
meant to be expandable.

If on the other hand you do count on overprovisioning (due to snapshots) 
then being able to limit snapshot size becomes even more important.

> When you have rootLV on thinLV - you could easily snapshot it before
> doing any upgrade and revert back in case something fails on upgrade.
> See also projects like snapper...

True enough, but if you risk filling your pool because you don't have 
full room for a full snapshot, that would be extremely unwise. I'm also 
not sure write performance for a single snapshot is very much different 
between thin and non-thin?

They are both CoW. E.g. you write to an existing block it has to be 
duplicated, only for non-allocated writes thin is faster, right?

I simply cannot reconcile an attitude that thin-full-risk is acceptable 
and the admin's job while at the same time advocating it for root 
filesystems.

Now most of this thread I was under the impression that "SYSTEM HANGS" 
where the norm because that's the only thing I ever experienced (kernel 
3.x and kernel 4.4 back then), however you said that this was fixed in 
later kernels.

So given that, some of the disagreement here was void as apparently no 
one advocated that these hangs were acceptable ;-).

:).


>> I have tried it, yes. Gives troubles with Grub and requires thin 
>> package to be installed on all systems and makes it harder to install 
>> a system too.
> 
> lvm2 is cooking some better boot support atm....

Grub-probe couldn't find the root volume so I had to maintain my own 
grub.cfg.

Regardless if I ever used this again I would take care to never 
overprovision or to only overprovision at low risk with respect to 
snapshots.

Ie. you could thin provision root + var or something similar but I would 
always put data volumes (home etc) elsewhere.

Ie. not share the same pool.

Currently I was using a regular snapshot but I allocated it too small 
and it always got dropped much faster than I anticipated.

(A 1GB snapshot constantly filling up with even minor upgrade 
operations).



>> Thin root LV is not the idea for most people.
>> 
>> So again, don't you think having data volumes produce errors is not 
>> preferable to having the entire system hang?
> 
> Not sure why you insist system hangs.
> 
> If system hangs - and you have recent kernel & lvm2 - you should fill 
> bug.
> 
> If you set  '--errorwhenfull y'  - it should instantly fail.
> 
> There should not be any hanging..

Right well Debian Jessie and Ubuntu Xenial just experienced that.



>> That's irrelevant; if the thin pool is full you need to mitigate it, 
>> rebooting won't help with that.
> 
> well it's really admins task to solve the problem after panic call.
> (adding new space).

That's a lot easier if your root filesystem doesn't lock up.

;-).

Good luck booting to some rescue environment on a VPS or with some boot 
stick on a PC; the Ubuntu rescue environment for instance has been 
abysmal since SystemD.

You can't actually use the rescue environment because there is some 
weird interaction with systemd spewing messages and causing weird 
behaviour on the TTY you are supposed to work on.

Initrd yes, but not the "full rescue" systemd target, doesn't work.

My point with this thread was.....




When my root snapshot fills up and gets dropped, I lose my undo history, 
but at least my root filesystem won't lock up.

I just calculated the size too small and I am sure I can also put a 
snapshot IN a thin pool for a non-thin root volume?

Haven't tried.

However, I don't have the space for a full copy of every filesystem, so 
if I snapshot, I will automatically overprovision.

My snapshots are indeed meant for backups (of data volumes) ---- not for 
rollback ----- and for rollback ----- but only for the root filesystem.

So: my thin snapshots are meant for backup,
     my root snapshot (non-thin) is meant for rollback.

But, if any application really misbehaved... previously the entire 
system would crash (kernel 3.x).

So, the only defense is constant monitoring and emails or even tty/pty 
broadcasts because
well sometimes it is just human error where you copy the wrong thing to 
the wrong place.

Because I cannot limit my (backup) snapshots in size.

With sufficient monitoring I guess that is not much of an issue.

> Thin users can't expect to overload system in crazy way and expect the
> system will easily do something magical to restore all data.

That was never asked.

My problem was system hangs, but my question was about limiting snapshot 
size on thin.

However userspace response scripts were obviously possible.....

Including those that would prioritize dropping thin snapshots over other 
measures.
