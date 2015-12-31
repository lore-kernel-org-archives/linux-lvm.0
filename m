Received: from [10.40.200.19] (ovpn-200-19.brq.redhat.com [10.40.200.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBVLPCHU005437
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 16:25:13 -0500
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
	<CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
	<5682F5F2.1000804@redhat.com>
	<CAAYit8TZV55HM5LwBzWH6wqppYjFfJaVY4hxXS0eFFfJNi9ESQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56859D38.6090000@redhat.com>
Date: Thu, 31 Dec 2015 22:25:12 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8TZV55HM5LwBzWH6wqppYjFfJaVY4hxXS0eFFfJNi9ESQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Possible bug in expanding thinpool: lvextend
 doens't expand the top-level dm-linear device
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

Dne 31.12.2015 v 10:06 M.H. Tsai napsal(a):
> 2015-12-30 5:06 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>>> I have three questions:
>>>
>
>>> 2. Is it necessary to suspend any thin volume while extending a
>>> thinpool? If not, the commit fa648234 might need some fix.
>>
>> Well technically it would likely be better to do a suspend from
>> all top-level LVs - but ATM thin-pool does use 'internal'
>> suspend - there are couple associated issue - like usage of
>> flush during such suspend (see comment bellow)
>>
>>
>>> 3. Similary to question(2), is it necessary to suspend thin-pool while
>>> expanding a thin-volume ? If no, we should adopt the approach of
>>> a900d150e for thin-volume expansion. The following is my solution:
>>
>> Nope, even the current solution is rather 'short-time' hack
>> until better fitting way is found (the hack needs some libdm API
>> interface rather then some autonomous decision)
>> But since current thin-pool target is missing couple features,
>> we need to first improve kernel target.
>>
>> In general we need 'suspend with flush' which will not block, when pool
>> runs out of space as suspend without flush is in general not so much
>> useful.
>>
>> Unsure how much you interested in development of lvm2 code?
>> Are you targeting some specific feature?
>
> I'm the maintainer of LVM for my company's NAS. We just take daily
> snapshot for backup.
>
> For question(2), the kernel's pool_presuspend() function suspends all
> the active thin volumes. Does that mean we don't need to suspend all
> the thin volumes explicitly? Also, the current LVM only suspends the
> "first" thin volume, which looks confusing.
>
> The main concern for question (3) is IO performance -- taking
> snapshots or expanding a thin volume should not affect IO of other
> volumes or the entire pool.


You should be aware of  thin-pool limits.

i.e. ATM it's bad plan to use more then say 16 LVs in parallel for
a single thin-pool LV - it cannot be used in some massive parallel system
for its current locking mechanism.

There is even sequencing problem with creating snapshot in kernel target
which needs to be probably fixed first.
(the rule here should be - to never create/allocate something when
there is suspended device - and this rule is broken with current thin
snapshot creation - so thin snap create message should go in front
to ensure there is a space in thin-pool ahead of origin suspend  - will
be addressed in some future version....)

However when taking snapshot - only origin thin LV is now suspended and
should not influence rest of thin volumes (except for thin-pool commit points)

minor warning - snapshot is not a backup - although it might look like it is :).

Regards

Zdenek
