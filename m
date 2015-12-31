Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBVD7GH2026026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 08:07:16 -0500
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mx1.redhat.com (Postfix) with ESMTPS id 2BF337AEAA
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 13:07:15 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n135so102313295qka.2
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 05:07:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5682F5F2.1000804@redhat.com>
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
	<CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
	<5682F5F2.1000804@redhat.com>
Date: Thu, 31 Dec 2015 17:06:30 +0800
Message-ID: <CAAYit8TZV55HM5LwBzWH6wqppYjFfJaVY4hxXS0eFFfJNi9ESQ@mail.gmail.com>
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

2015-12-30 5:06 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> I have three questions:
>>
>> 1. If we need to preserve the -tpool layer, why the commit 00a45ca4
>> activates a new thinpool (transaction_id == 0) without overlay?
>
> This comes from request to support  'external' thin-pool users - so
> lvm2 only manages thin-pool resize - but does not create thin LVs -
> it's docker's business...
>
> But the rule is - users' usable LV do have public names and UUID.
> Hidden/private  LVs have suffices in UUID.
> (In the future all hidden LVs should have UUID suffix for easy
> identification
> by blkid)

I found the discussion thread and related commits (in 2014-11-04).
I'll read it later.
https://github.com/docker/docker/issues/15629

>> 2. Is it necessary to suspend any thin volume while extending a
>> thinpool? If not, the commit fa648234 might need some fix.
>
> Well technically it would likely be better to do a suspend from
> all top-level LVs - but ATM thin-pool does use 'internal'
> suspend - there are couple associated issue - like usage of
> flush during such suspend (see comment bellow)
>
>
>> 3. Similary to question(2), is it necessary to suspend thin-pool while
>> expanding a thin-volume ? If no, we should adopt the approach of
>> a900d150e for thin-volume expansion. The following is my solution:
>
> Nope, even the current solution is rather 'short-time' hack
> until better fitting way is found (the hack needs some libdm API
> interface rather then some autonomous decision)
> But since current thin-pool target is missing couple features,
> we need to first improve kernel target.
>
> In general we need 'suspend with flush' which will not block, when pool
> runs out of space as suspend without flush is in general not so much
> useful.
>
> Unsure how much you interested in development of lvm2 code?
> Are you targeting some specific feature?

I'm the maintainer of LVM for my company's NAS. We just take daily
snapshot for backup.

For question(2), the kernel's pool_presuspend() function suspends all
the active thin volumes. Does that mean we don't need to suspend all
the thin volumes explicitly? Also, the current LVM only suspends the
"first" thin volume, which looks confusing.

The main concern for question (3) is IO performance -- taking
snapshots or expanding a thin volume should not affect IO of other
volumes or the entire pool.
