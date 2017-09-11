MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Sep 2017 15:46:55 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
Message-ID: <9115414464834226be029dacb9b82236@xenhideout.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek Kabelac schreef op 11-09-2017 15:11:

> Thin-provisioning is - about 'postponing'  available space to be
> delivered in time

That is just one use case.

Many more people probably use it for other use case.

Which is fixed storage space and thin provisioning of available storage.

> You order some work which cost $100.
> You have just $30, but you know, you will have $90 next week -
> so the work can start....

I know the typical use case that you advocate yes.

> But it seems some users know it will cost $100, but they still think
> the work could be done with $10 and it's will 'just' work the same....

No that's not what people want.

People want efficient usage of data without BTRFS, that's all.

>> File system level failure can also not be critical because of using 
>> non-critical volume because LVM might fail even though filesystem does 
>> not fail or applications.
> 
> So my Laptop machine has 32G RAM - so you can have 60% of dirty-pages
> those may raise pretty major 'provisioning' storm....

Yes but still system does not need to crash, right.

>> Block level layer failure is much more serious, and can prevent system 
>> from recovering when it otherwise could.
> 
> Yep - the idea is - when thin-pool gets full - it will stop working,
> but you can't rely on 'usable' system when this happens....
> 
> Of course - it differs on case by case - if you run your /rootvolume
> out of such overfilled thin-pool - you have much bigger set of problems
> compared with user which has just some mount  data volume - so
> the rest of system is sitting on some 'fully provisioned' volume....

Yes.

> But we are talking about generic case here no on some individual 
> sub-cases
> where some limitation might give you the chance to rescue better...

But no one in his right mind currently runs /rootvolume out of thin pool 
and in pretty much all cases probably it is only used for data or for 
example of hosting virtual hosts/containers/virtualized 
environments/guests.

So Data use for thin volume is pretty much intended/common/standard use 
case.

Now maybe amount of people that will be able to have running system 
after data volumes overprovision/fill up/crash is limited.

However, from both a theoretical and practical standpoint being able to 
just shut down whatever services use those data volumes -- which is only 
possible if base system is still running -- makes for far easier 
recovery than anything else, because how are you going to boot system 
reliably without using any of those data volumes? You need rescue mode 
etc.

So I would say it is the general use case where LVM thin is used for 
data, or otherwise it is the "special" use case used by 90% of people...


In any case it wouldn't hurt anyone who didn't fall into that "special 
use case" scenario, it would benefit everyone.

Unless you are speaking perhaps about unmitigatable performance 
considerations.

Then it becomes indeed a tradeoff but you are the better judge of that.

> Again - it's admin's  gambling here - if he let the system 
> overprovisiong
> and doesn't have 'backup' plan -  you can't blame here  lvm2.....

He might have system backups.

He might be able to recover his system if his system is still allowed to 
be logged into.

That should be enough backup plan for most people who do not have 
expandable storage.

So maybe this is not main use case for LVM2, but it is still common use 
case that people keep asking about. So there is a demand for this.

Normal data volumes filling up is pretty much same situation.

Same user will not have backup plan in case volumes fill up.

Thin provisioning does not make that worse, normally.

That's where we start out from.

Thin provisioning with overprosisioning and expandable storage does 
improve that thing for those people, that want to have larger 
filesystems to cater to growth.

But people using slightly larger filesystems only for data space sharing 
between volumes...

Are trying to get a bit more flexibility (for example for moving data 
from partition to partition).

So for example I have 50GB VPS with Thin for data volumes.

If I want to reorganize my data across volumes I only have to ensure 
enough space in thin pool, or move in smaller parts so there is enough 
space for that.

Then I run fstrim and then everything is alright again.

This is benefit of me for thin pool.

It just makes moving data around a bit (a lot) easier.

So I first check thin space and then do operation.

So the only time when I near the "full" mark is when I do these 
operations.

My system is not data intensive (with just 50GB) and does not run quick 
risk of filling up -- but it could happen.

So that's all.

Regards.
