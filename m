Received: from [10.34.131.78] (dhcp131-78.brq.redhat.com [10.34.131.78])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u04DRZYG006701
	for <linux-lvm@redhat.com>; Mon, 4 Jan 2016 08:27:36 -0500
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
	<CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
	<5682F5F2.1000804@redhat.com>
	<CAAYit8TZV55HM5LwBzWH6wqppYjFfJaVY4hxXS0eFFfJNi9ESQ@mail.gmail.com>
	<56859D38.6090000@redhat.com>
	<CAAYit8SGsNay4FLfxFnXFBt+aJSF7w+4pDOJpBY4zwNTW=1smA@mail.gmail.com>
	<568857A2.7080807@redhat.com>
	<CAAYit8RFg1hTUvQqNxv6Uip7ZgA2Dg5KtO1RjpxqpqwGO=io0A@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <568A7347.4070208@redhat.com>
Date: Mon, 4 Jan 2016 14:27:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8RFg1hTUvQqNxv6Uip7ZgA2Dg5KtO1RjpxqpqwGO=io0A@mail.gmail.com>
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

Dne 4.1.2016 v 06:08 M.H. Tsai napsal(a):
> 2016-01-03 7:05 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> Dne 1.1.2016 v 19:10 M.H. Tsai napsal(a):
>>> 2016-01-01 5:25 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>>>> There is even sequencing problem with creating snapshot in kernel target
>>>> which needs to be probably fixed first.
>>>> (the rule here should be - to never create/allocate something when
>>>> there is suspended device
>
> Excuse me, does the statement
> 'to never create/allocate something when there is suspended device'
> describes the case that the thin-pool is full, and the volume is
> 'suspend with no flush' ? Because there's no free blocks for
> allocation.

The reason for this is -  you could suspend a device with i.e. swap/root
so now - if during any kernel allocation kernel would need a memory
chunk and would require some 'swap/root' space on suspended disk, kernel
would block endlessly.

So table reload (with updated dm table line) should always happen before
suspend (aka PRELOAD phase in lvm2 code).

Following device resume should be just switching tables without any
memory allocations - those should have been all resolved in load phase -
where you have always 2 slots - active & inactive.

(And yes - there are some (known) problems with this rule in current lvm2 and 
some dm targets...)

> Otherwise, it would be strange if we cannot do these operations when
> the pool is not full.

Extension of device is 'special' - in fact we could enable  'suspend WITHOUT 
flush' for any 'lvextend' operation - but that needs full re-validation of all 
targets - so for now it's only enabled for thin-pool lvextend.

As 'suspend with flush' is typically needed when you change device type in 
some way - however with pure lvextend case (onlt new space is added, no 
existing device space changes) there may not be any BIO in-flight routed into 
'new extended' space - thus flush is not needed. (unsure if this explanation 
does make sense)

>
>>>> and this rule is broken with current thin
>>>> snapshot creation, so thin snap create message should go in front
>>>> to ensure there is a space in thin-pool ahead of origin suspend  - will
>>>> be addressed in some future version....)
>>>>
>>>> However when taking snapshot - only origin thin LV is now suspended and
>>>> should not influence rest of thin volumes (except for thin-pool commit
>>>> points)
>>>
>>> Does that mean in future version of dm-thin, the command sequence of
>>> snapshot creation will be:
>>>
>>> dmsetup message /dev/mapper/pool 0 "create_snap 1 0"
>>> dmsetup suspend /dev/mapper/thin
>>> dmsetup resume /dev/mapper/thin
>>>
>> Possibly different message - since everything must remain
>> fully backward compatible (i.e. create_snap_on_suspend,
>> or maybe some other mechanism will be there).
>> But yes something in this direction...
>
> I'm not well understood. Is the new message designed for the case that
> thin-pool is nearly full?
> Because the pool's free data blocks might not sufficient for 'suspend
> with flush' (i.e., 'suspend with flush' might failed if the pool is
> nearly full), so we should move the create_snap message before
> suspending. However, the created snapshots are inconsistent.
> If the pool is full, then there's no difference between taking
> snapshots before or after 'suspend without flush'.
> Is that right?

As said - the solution is nontrivial - and needs enhancements
on suspend API - when you suspend 'thinLV origin' you need
to use suspend with flush - however ATM such suspend may 'block'
whole lvm2 - while lvm2 keeps VG lock.

As a prevention - lvm2 user can configure threshold for autoresize (e.g. 70%)
and when pool is above the threshold user is not allowed to create any new 
thinLV. This normally works quite ok - but it's obviously not a 'bullet-proof' 
solution here (as you could construct a case, where time-of-check
and time-of-use may cause out-of-space pool).

So far the rule is simple - at all cost - do not run thin-pool when it's full, 
overfilled pool is NOT comparable to a 'single' write error.
When admin is solving overfilled pool - something went wrong earlier
(admin failed to extend his VG)....

Thin-pool is about 'promising' a space user can deliver 'later', not about
hitting overfull corner case as 'regular' use-case where user can expect some 
well handled error behavior (but yes we try to make a better user experience here)

Regards

Zdenek
