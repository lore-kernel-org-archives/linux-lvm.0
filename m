Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u046AMR3029047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 4 Jan 2016 01:10:22 -0500
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mx1.redhat.com (Postfix) with ESMTPS id 81C468E913
	for <linux-lvm@redhat.com>; Mon,  4 Jan 2016 06:10:21 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id b35so118148313qge.0
	for <linux-lvm@redhat.com>; Sun, 03 Jan 2016 22:10:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <568857A2.7080807@redhat.com>
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
Date: Mon, 4 Jan 2016 13:08:44 +0800
Message-ID: <CAAYit8RFg1hTUvQqNxv6Uip7ZgA2Dg5KtO1RjpxqpqwGO=io0A@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2016-01-03 7:05 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Dne 1.1.2016 v 19:10 M.H. Tsai napsal(a):
>> 2016-01-01 5:25 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>>> There is even sequencing problem with creating snapshot in kernel target
>>> which needs to be probably fixed first.
>>> (the rule here should be - to never create/allocate something when
>>> there is suspended device

Excuse me, does the statement
'to never create/allocate something when there is suspended device'
describes the case that the thin-pool is full, and the volume is
'suspend with no flush' ? Because there's no free blocks for
allocation.

Otherwise, it would be strange if we cannot do these operations when
the pool is not full.

>>> and this rule is broken with current thin
>>> snapshot creation, so thin snap create message should go in front
>>> to ensure there is a space in thin-pool ahead of origin suspend  - will
>>> be addressed in some future version....)
>>>
>>> However when taking snapshot - only origin thin LV is now suspended and
>>> should not influence rest of thin volumes (except for thin-pool commit
>>> points)
>>
>> Does that mean in future version of dm-thin, the command sequence of
>> snapshot creation will be:
>>
>> dmsetup message /dev/mapper/pool 0 "create_snap 1 0"
>> dmsetup suspend /dev/mapper/thin
>> dmsetup resume /dev/mapper/thin
>>
> Possibly different message - since everything must remain
> fully backward compatible (i.e. create_snap_on_suspend,
> or maybe some other mechanism will be there).
> But yes something in this direction...

I'm not well understood. Is the new message designed for the case that
thin-pool is nearly full?
Because the pool's free data blocks might not sufficient for 'suspend
with flush' (i.e., 'suspend with flush' might failed if the pool is
nearly full), so we should move the create_snap message before
suspending. However, the created snapshots are inconsistent.
If the pool is full, then there's no difference between taking
snapshots before or after 'suspend without flush'.
Is that right?


Thanks,
Ming-Hung Tsai
