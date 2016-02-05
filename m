Received: from [10.40.200.51] (ovpn-200-51.brq.redhat.com [10.40.200.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u15HSAsc001963
	for <linux-lvm@redhat.com>; Fri, 5 Feb 2016 12:28:11 -0500
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
	<CAAYit8T1Wh+zQT_fsEk88D=1hv2A=kLVGWQAcdccjzx5xPuh5g@mail.gmail.com>
	<56B4BD12.3050103@redhat.com>
	<CAAYit8SG+PrSfGzi6S0eYpX8SQhECCvaeWvN9Gqq9z8VwA8SmQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56B4DBAA.1010902@redhat.com>
Date: Fri, 5 Feb 2016 18:28:10 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8SG+PrSfGzi6S0eYpX8SQhECCvaeWvN9Gqq9z8VwA8SmQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Repair thin pool
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

Dne 5.2.2016 v 17:12 M.H. Tsai napsal(a):
> 2016-02-05 23:17 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> Dne 5.2.2016 v 12:44 M.H. Tsai napsal(a):
>>>
>>> Hi,
>>>
>>> Seems that your steps are wrong.  You should run thin_repair before
>>> swapping the pool metadata.
>>
>> Nope - actually they were correct.
>>
>>> Also, thin_restore is for XML(text) input, not for binary metadata
>>> input, so it's normal to get segmentation fault...
>>>
>>> "lvconvert --repair ... " is a command wrapping "thin_repair +
>>> swapping metadata"  into a single step.
>>> If it doesn't work, then you might need to dump the metadata manually,
>>> to check if there's serious corruption in mapping trees or not....
>>> (I recommend to use the newest thin-provisioning-tools to get better
>>> result)
>>>
>>> 1. active the pool metadata (It's okay if the command failed. We just
>>> want to activate the hidden metadata LV)
>>> lvchange -ay vgg1/pool_nas
>>>
>>> 2. dump the metadata, then checkout the output XML
>>> thin_dump /dev/mapper/vgg1-pool_nas_tmeta -o thin_dump.xml -r
>>
>> Here is actually what goes wrong.
>>
>> You should not try to access 'life' metadata (unless you take thin-pool
>> snapshot of them)
>>
>> So by using thin-dump on life changed volume you often get 'corruptions'
>> listed which actually do not exist.
>>
>> That said - if your thin-pool got 'blocked' for whatever reason
>> (deadlock?) - reading such data which cannot be changed anymore could
>> provide the 'best' guess data you could get - so in some cases it depends on
>> use-case
>> (i.e. you disk is dying and it may not run at all after reboot)...
>>
>> You should always repair data where you are sure they are not changing in
>> background.
>>
>> That's why --repair requires currently offline state of thin-pool.
>> It should do all 'swap' operations in proper order.
>>
>> Zdenek
>
> Yes, we should repair the metadata when the pool is offline, but LVM
> cannot activate a hidden metadata LV. So the easiest way is activating
> the entire pool. Maybe we need some option to force activate a hidden
> volume, like "lvchange -ay vgg1/pool_nas_tmeta -ff". It's useful for
> repairing metadata. Otherwise, we should use dmsetup to manually
> create the device.

But that's actually what described 'swap' is for.

You 'replace/swap'  existing metadata LV with some selected LV in VG.

Then you activate this LV - and you may do whatever you need to do.
(so you have content of  _tmeta LV  accessible through your  tmp_created_LV)

lvm2 currently doesn't support activation of 'subLVs'  as it makes activation 
of the whole tree of LVs much more complicated (clvmd support restrictions)

So ATM we take only top-level LV lock in cluster (and yes - there is still 
unresolved bug for thin-pool/thinLV - when user may 'try' to activate 
different thin LVs from a single thin-pool on multiple nodes - so for now - 
there is just one advice - don't do that - until we provide a fix for this.


>
> In my experience, if the metadata had serious problem, then the pool
> device usually cannot be created, so the metadata is not accessed by
> kernel... Just a coincidence.

So once you  i.e.   'repair'  metadata from swapped LV to some other LV
you can swap back 'fixed' metadata (and of course there should (and someday 
will) be further validation between kernel metadata and lvm2 metadata about
device IDs, transaction IDs,  devices sizes....)

This way you may even make metadata smaller if you need to (and select to 
large metadata area initially so you not waste space on this LV).

Zdenek
