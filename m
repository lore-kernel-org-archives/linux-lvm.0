Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F7D45D70C
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 18:17:14 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C456428217
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 18:17:12 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 6C67340C0A0E
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 19:17:11 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 03 Mar 2018 19:17:11 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <9142007eeb745a0f4774710b7c007375@assyoma.it>
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
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
Message-ID: <bef0781efb3940275a1b4d2e88848924@xenhideout.nl>
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

Gionatan Danti schreef op 28-02-2018 20:07:

> To recap (Zdeneck, correct me if I am wrong): the main problem is
> that, on a full pool, async writes will more-or-less silenty fail
> (with errors shown on dmesg, but nothing more).

Yes I know you were writing about that in the later emails.

> Another possible cause
> of problem is that, even on a full pool, *some* writes will complete
> correctly (the one on already allocated chunks).

Idem.

> In the past was argued that putting the entire pool in read-only mode
> (where *all* writes fail, but read are permitted to complete) would be
> a better fail-safe mechanism; however, it was stated that no current
> dmtarget permit that.

Right. Don't forget my main problem was system hangs due to older 
kernels, not the stuff you write about now.

> Two (good) solution where given, both relying on scripting (see
> "thin_command" option on lvm.conf):
> - fsfreeze on a nearly full pool (ie: >=98%);
> - replace the dmthinp target with the error target (using dmsetup).
> 
> I really think that with the good scripting infrastructure currently
> built in lvm this is a more-or-less solved problem.

I agree in practical terms. Doesn't make for good target design, but 
it's good enough, I guess.

>> Do NOT take thin snapshot of your root filesystem so you will avoid
>> thin-pool overprovisioning problem.
> 
> But is someone *really* pushing thinp for root filesystem? I always
> used it for data partition only... Sure, rollback capability on root
> is nice, but it is on data which they are *really* important.

No, Zdenek thought my system hangs resulted from something else and then 
in order to defend against that (being the fault of current DM design) 
he tried to raise the ante by claiming that root-on-thin would cause 
system failure anyway with a full pool.

I never suggested root on thin.

> In stress testing, I never saw a system crash on a full thin pool

That's good to know, I was just using Jessie and Xenial.

> We discussed that in the past also, but as snapshot volumes really are
> *regular*, writable volumes (which a 'k' flag to skip activation by
> default), the LVM team take the "safe" stance to not automatically
> drop any volume.

Sure I guess any application logic would have to be programmed outside 
of any (device mapper module) anyway.

> The solution is to use scripting/thin_command with lvm tags. For 
> example:
> - tag all snapshot with a "snap" tag;
> - when usage is dangerously high, drop all volumes with "snap" tag.

Yes, now I remember.

I was envisioning some other tag that would allow a quotum to be set for 
every volume (for example as a %) and the script would then drop the 
volumes with the larger quotas first (thus the larger snapshots) so as 
to protect smaller volumes which are probably more important and you can 
save more of them. I am ashared to admit I had forgotten about that 
completely ;-).

>> Back to rule #1 - thin-p is about 'delaying' deliverance of real 
>> space.
>> If you already have plan to never deliver promised space - you need to
>> live with consequences....
> 
> I am not sure to 100% agree on that.

When Zdenek says "thin-p" he might mean "thin-pool" but not generally 
"thin-provisioning".

I mean to say that the very special use case of an always auto-expanding 
system is a special use case of thin provisioning in general.

And I would agree, of course, that the other uses are also legit.

> Thinp is not only about
> "delaying" space provisioning; it clearly is also (mostly?) about
> fast, modern, usable snapshots. Docker, snapper, stratis, etc. all use
> thinp mainly for its fast, efficent snapshot capability.

Thank you for bringing that in.

> Denying that
> is not so useful and led to "overwarning" (ie: when snapshotting a
> volume on a virtually-fillable thin pool).

Aye.

>> !SNAPSHOTS ARE NOT BACKUPS!
> 
> Snapshot are not backups, as they do not protect from hardware
> problems (and denying that would be lame)

I was really saying that I was using them to run backups off of.

> however, they are an
> invaluable *part* of a successfull backup strategy. Having multiple
> rollaback target, even on the same machine, is a very usefull tool.

Even more you can backup running systems, but I thought that would be 
obvious.

> Again, I don't understand by we are speaking about system crashes. On
> root *not* using thinp, I never saw a system crash due to full data
> pool.

I had it on 3.18 and 4.4, that's all.

> Oh, and I use thinp on RHEL/CentOS only (Debian/Ubuntu backports are
> way too limited).

That could be it too.
