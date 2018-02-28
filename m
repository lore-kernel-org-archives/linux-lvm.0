Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EB8919E7D
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2018 19:14:58 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	by mx1.redhat.com (Postfix) with ESMTP id ABFFC7FDC9
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2018 19:14:56 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 28 Feb 2018 20:07:08 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
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
Message-ID: <9142007eeb745a0f4774710b7c007375@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Xen <list@xenhideout.nl>

Hi all,

Il 28-02-2018 10:26 Zdenek Kabelac ha scritto:
> Overprovisioning on DEVICE level simply IS NOT equivalent to full
> filesystem like you would like to see all the time here and you've
> been already many times explained that filesystems are simply not
> there ready - fixes are on going but it will take its time and it's
> really pointless to exercise this on 2-3 year old kernels...

this was really beaten to death in the past months/threads. I generally 
agree with Zedenk.

To recap (Zdeneck, correct me if I am wrong): the main problem is that, 
on a full pool, async writes will more-or-less silenty fail (with errors 
shown on dmesg, but nothing more). Another possible cause of problem is 
that, even on a full pool, *some* writes will complete correctly (the 
one on already allocated chunks).

In the past was argued that putting the entire pool in read-only mode 
(where *all* writes fail, but read are permitted to complete) would be a 
better fail-safe mechanism; however, it was stated that no current 
dmtarget permit that.

Two (good) solution where given, both relying on scripting (see 
"thin_command" option on lvm.conf):
- fsfreeze on a nearly full pool (ie: >=98%);
- replace the dmthinp target with the error target (using dmsetup).

I really think that with the good scripting infrastructure currently 
built in lvm this is a more-or-less solved problem.

> Do NOT take thin snapshot of your root filesystem so you will avoid
> thin-pool overprovisioning problem.

But is someone *really* pushing thinp for root filesystem? I always used 
it for data partition only... Sure, rollback capability on root is nice, 
but it is on data which they are *really* important.

> Thin-pool was never targeted for 'regular' usage of full thin-pool.
> Full thin-pool is serious ERROR condition with bad/ill effects on 
> systems.
> Thin-pool was designed to 'delay/postpone' real space usage - aka you
> can use more 'virtual' space with the promise you deliver real storage
> later.

In stress testing, I never saw a system crash on a full thin pool, but I 
was not using it on root filesystem. There are any ill effect on system 
stability which I need to know?

>> When my root snapshot fills up and gets dropped, I lose my undo 
>> history, but at least my root filesystem won't lock up.

We discussed that in the past also, but as snapshot volumes really are 
*regular*, writable volumes (which a 'k' flag to skip activation by 
default), the LVM team take the "safe" stance to not automatically drop 
any volume.

The solution is to use scripting/thin_command with lvm tags. For 
example:
- tag all snapshot with a "snap" tag;
- when usage is dangerously high, drop all volumes with "snap" tag.

>> However, I don't have the space for a full copy of every filesystem, 
>> so if I snapshot, I will automatically overprovision.
> 
> Back to rule #1 - thin-p is about 'delaying' deliverance of real space.
> If you already have plan to never deliver promised space - you need to
> live with consequences....

I am not sure to 100% agree on that. Thinp is not only about "delaying" 
space provisioning; it clearly is also (mostly?) about fast, modern, 
usable snapshots. Docker, snapper, stratis, etc. all use thinp mainly 
for its fast, efficent snapshot capability. Denying that is not so 
useful and led to "overwarning" (ie: when snapshotting a volume on a 
virtually-fillable thin pool).

> 
> !SNAPSHOTS ARE NOT BACKUPS!
> 
> This is the key problem with your thinking here (unfortunately you are
> not 'alone' with this thinking)

Snapshot are not backups, as they do not protect from hardware problems 
(and denying that would be lame); however, they are an invaluable *part* 
of a successfull backup strategy. Having multiple rollaback target, even 
on the same machine, is a very usefull tool.

> We do provide quite good 'scripting' support for this case - but again 
> if
> the system can't crash - you can't use thin-pool for your root LV or
> you can't use over-provisioning.

Again, I don't understand by we are speaking about system crashes. On 
root *not* using thinp, I never saw a system crash due to full data 
pool.

Oh, and I use thinp on RHEL/CentOS only (Debian/Ubuntu backports are way 
too limited).

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
