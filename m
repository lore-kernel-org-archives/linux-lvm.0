References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
	<CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
	<5682F5F2.1000804@redhat.com>
	<CAAYit8TZV55HM5LwBzWH6wqppYjFfJaVY4hxXS0eFFfJNi9ESQ@mail.gmail.com>
	<56859D38.6090000@redhat.com>
	<CAAYit8SGsNay4FLfxFnXFBt+aJSF7w+4pDOJpBY4zwNTW=1smA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <568857A2.7080807@redhat.com>
Date: Sun, 3 Jan 2016 00:05:06 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8SGsNay4FLfxFnXFBt+aJSF7w+4pDOJpBY4zwNTW=1smA@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Joe Thornber <thornber@redhat.com>

Dne 1.1.2016 v 19:10 M.H. Tsai napsal(a):
> 2016-01-01 5:25 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> You should be aware of  thin-pool limits.
>>
>> i.e. ATM it's bad plan to use more then say 16 LVs in parallel for
>> a single thin-pool LV - it cannot be used in some massive parallel system
>> for its current locking mechanism.
>
> Is it LVM or dm-thin kernel target's limit? And, is there any
> reference about the "16 LVs" and the locking issue? (why 16 LVs?)

Hi

That's rather Joe (driver author) what are the 'reasonable' limits for current 
target? (I think I remember it correctly it's been somewhere 16-32 LV).

Of course it all depends on uses case - and any reproducible benchmarks
are welcome in this area (e.g. there is no hard limit on some device number
count - but the more parallel writes it need to handle and do provisioning,
trimming the more lock contention will happen)

>> There is even sequencing problem with creating snapshot in kernel target
>> which needs to be probably fixed first.
>> (the rule here should be - to never create/allocate something when
>> there is suspended device - and this rule is broken with current thin
>> snapshot creation - so thin snap create message should go in front
>> to ensure there is a space in thin-pool ahead of origin suspend  - will
>> be addressed in some future version....)
>>
>> However when taking snapshot - only origin thin LV is now suspended and
>> should not influence rest of thin volumes (except for thin-pool commit
>> points)
>
> Does that mean in future version of dm-thin, the command sequence of
> snapshot creation will be:
>
> dmsetup message /dev/mapper/pool 0 "create_snap 1 0"
> dmsetup suspend /dev/mapper/thin
> dmsetup resume /dev/mapper/thin
>

Possibly different message - since everything must remain
fully backward compatible (i.e. create_snap_on_suspend,
or maybe some other mechanism will be there).
But yes something in this direction...

Regards

Zdenek
