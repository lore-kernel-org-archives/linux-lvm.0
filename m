Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u01MIc37015327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 1 Jan 2016 17:18:38 -0500
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mx1.redhat.com (Postfix) with ESMTPS id 5F2968C1AF
	for <linux-lvm@redhat.com>; Fri,  1 Jan 2016 22:18:37 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id p187so231443513qkd.1
	for <linux-lvm@redhat.com>; Fri, 01 Jan 2016 14:18:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56859D38.6090000@redhat.com>
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
	<CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
	<5682F5F2.1000804@redhat.com>
	<CAAYit8TZV55HM5LwBzWH6wqppYjFfJaVY4hxXS0eFFfJNi9ESQ@mail.gmail.com>
	<56859D38.6090000@redhat.com>
Date: Sat, 2 Jan 2016 02:10:45 +0800
Message-ID: <CAAYit8SGsNay4FLfxFnXFBt+aJSF7w+4pDOJpBY4zwNTW=1smA@mail.gmail.com>
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

2016-01-01 5:25 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> You should be aware of  thin-pool limits.
>
> i.e. ATM it's bad plan to use more then say 16 LVs in parallel for
> a single thin-pool LV - it cannot be used in some massive parallel system
> for its current locking mechanism.

Is it LVM or dm-thin kernel target's limit? And, is there any
reference about the "16 LVs" and the locking issue? (why 16 LVs?)

> There is even sequencing problem with creating snapshot in kernel target
> which needs to be probably fixed first.
> (the rule here should be - to never create/allocate something when
> there is suspended device - and this rule is broken with current thin
> snapshot creation - so thin snap create message should go in front
> to ensure there is a space in thin-pool ahead of origin suspend  - will
> be addressed in some future version....)
>
> However when taking snapshot - only origin thin LV is now suspended and
> should not influence rest of thin volumes (except for thin-pool commit
> points)

Does that mean in future version of dm-thin, the command sequence of
snapshot creation will be:

dmsetup message /dev/mapper/pool 0 "create_snap 1 0"
dmsetup suspend /dev/mapper/thin
dmsetup resume /dev/mapper/thin

> minor warning - snapshot is not a backup - although it might look like it is
> :).

Yes, we know it, thanks :)


Ming-Hung Tsai
