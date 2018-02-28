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
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
Date: Wed, 28 Feb 2018 22:43:26 +0100
MIME-Version: 1.0
In-Reply-To: <9142007eeb745a0f4774710b7c007375@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Xen <list@xenhideout.nl>

Dne 28.2.2018 v 20:07 Gionatan Danti napsal(a):
> Hi all,
> 
> Il 28-02-2018 10:26 Zdenek Kabelac ha scritto:
>> Overprovisioning on DEVICE level simply IS NOT equivalent to full
>> filesystem like you would like to see all the time here and you've
>> been already many times explained that filesystems are simply not
>> there ready - fixes are on going but it will take its time and it's
>> really pointless to exercise this on 2-3 year old kernels...
> 
> this was really beaten to death in the past months/threads. I generally agree 
> with Zedenk.
> 
> To recap (Zdeneck, correct me if I am wrong): the main problem is that, on a 
> full pool, async writes will more-or-less silenty fail (with errors shown on 
> dmesg, but nothing more). Another possible cause of problem is that, even on a 
> full pool, *some* writes will complete correctly (the one on already allocated 
> chunks).

On default - full pool starts to 'error' all 'writes' in 60 seconds.

> 
> In the past was argued that putting the entire pool in read-only mode (where 
> *all* writes fail, but read are permitted to complete) would be a better 
> fail-safe mechanism; however, it was stated that no current dmtarget permit that.

Yep - I'd probably like to see slightly different mechanism - that all
on going writes would be failing  - so far - some 'writes' will pass
(those to already provisioned areas) - some will fail (those to unprovisioned).

The main problem is - after reboot - this 'missing/unprovisioned' space may 
provide some old data...

> 
> Two (good) solution where given, both relying on scripting (see "thin_command" 
> option on lvm.conf):
> - fsfreeze on a nearly full pool (ie: >=98%);
> - replace the dmthinp target with the error target (using dmsetup).

Yep - this all can happen via 'monitoring.
The key is to do it early before disaster happens.

> I really think that with the good scripting infrastructure currently built in 
> lvm this is a more-or-less solved problem.

It still depends - there is always some sort of 'race' - unless you are 
willing to 'give-up' too early to be always sure, considering there are 
technologies that may write many GB/s...

>> Do NOT take thin snapshot of your root filesystem so you will avoid
>> thin-pool overprovisioning problem.
> 
> But is someone *really* pushing thinp for root filesystem? I always used it 

You can use rootfs with thinp - it's very fast for testing i.e. upgrades
and quickly revert back - just there should be enough free space.

> In stress testing, I never saw a system crash on a full thin pool, but I was 
> not using it on root filesystem. There are any ill effect on system stability 
> which I need to know?

Depends on version of kernel and filesystem in use.

Note RHEL/Centos kernel has lots of backport even when it's look quite old.


> The solution is to use scripting/thin_command with lvm tags. For example:
> - tag all snapshot with a "snap" tag;
> - when usage is dangerously high, drop all volumes with "snap" tag.

Yep - every user has different plans in his mind - scripting gives user 
freedom to adapt this logic to local needs...

>>> However, I don't have the space for a full copy of every filesystem, so if 
>>> I snapshot, I will automatically overprovision.

As long as admin responsible controls space in thin-pool and takes action
long time before thin-pool runs out-of-space all is fine.

If admin hopes in some kind of magic to happen - we have a problem....


>>
>> Back to rule #1 - thin-p is about 'delaying' deliverance of real space.
>> If you already have plan to never deliver promised space - you need to
>> live with consequences....
> 
> I am not sure to 100% agree on that. Thinp is not only about "delaying" space 
> provisioning; it clearly is also (mostly?) about fast, modern, usable 
> snapshots. Docker, snapper, stratis, etc. all use thinp mainly for its fast, 
> efficent snapshot capability. Denying that is not so useful and led to 
> "overwarning" (ie: when snapshotting a volume on a virtually-fillable thin pool).

Snapshot are using space - with hope that if you will 'really' need that space
you either add this space to you system - or you drop snapshots.

Still the same logic applied....

>> !SNAPSHOTS ARE NOT BACKUPS!
>>
>> This is the key problem with your thinking here (unfortunately you are
>> not 'alone' with this thinking)
> 
> Snapshot are not backups, as they do not protect from hardware problems (and 
> denying that would be lame); however, they are an invaluable *part* of a 
> successfull backup strategy. Having multiple rollaback target, even on the 
> same machine, is a very usefull tool.

Backups primarily sits on completely different storage.

If you keep backup of data in same pool:

1.)
error on this in single chunk shared by all your backup + origin - means it's 
total data loss - especially in case where filesystem are using 'BTrees' and 
some 'root node' is lost - can easily render you origin + all backups 
completely useless.

2.)
problems in thin-pool metadata can make all your origin+backups just an 
unordered mess of chunks.


> Again, I don't understand by we are speaking about system crashes. On root 
> *not* using thinp, I never saw a system crash due to full data pool. >
> Oh, and I use thinp on RHEL/CentOS only (Debian/Ubuntu backports are way too 
> limited).

Yep - this case is known to be pretty stable.

But as said - with today 'rush' of development and load of updates - user do 
want to try 'new disto upgrade' - if it works - all is fine - if it doesn't 
let's have a quick road back -  so using thin volume for rootfs is pretty 
wanted case.

Trouble is there is quite a lot of issues non-trivial to solve.

There are also some on going ideas/projects - one of them was to have thinLVs 
with priority to be always fully provisioned - so such thinLV could never be 
the one to have unprovisioned chunks....
Other was a better integration of filesystem with 'provisioned' volumes.


Zdenek
