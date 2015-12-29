Received: from [10.40.200.17] (ovpn-200-17.brq.redhat.com [10.40.200.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBTL6w0k029775
	for <linux-lvm@redhat.com>; Tue, 29 Dec 2015 16:06:59 -0500
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
	<CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5682F5F2.1000804@redhat.com>
Date: Tue, 29 Dec 2015 22:06:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
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

Dne 27.12.2015 v 14:09 M.H. Tsai napsal(a):
> Sorry, I sent a wrong mail before. Please ignore it.
>
> 2015-12-26 2:37 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> Dne 25.12.2015 v 03:27 M.H. Tsai napsal(a):
>>
>> It's not so simple - since the user may activate  thin-pool without
>> activation of any thin-volume, and keep thin-pool active while thin-volumes
>> are activated and deactivated - so it's different case if user activates
>> thin-pool explicitly or thin-pool is activated as thin volume dependency.
>>
>> Also thin-pool LV has its own cluster lock which is quite complicated to
>> explain, but for now -  thin-pool size is unimportant, but it's existence is
>> mandatory :)
>
> I have three questions:
>
> 1. If we need to preserve the -tpool layer, why the commit 00a45ca4
> activates a new thinpool (transaction_id == 0) without overlay?

This comes from request to support  'external' thin-pool users - so
lvm2 only manages thin-pool resize - but does not create thin LVs -
it's docker's business...

But the rule is - users' usable LV do have public names and UUID.
Hidden/private  LVs have suffices in UUID.
(In the future all hidden LVs should have UUID suffix for easy identification
by blkid)


> 2. Is it necessary to suspend any thin volume while extending a
> thinpool? If not, the commit fa648234 might need some fix.

Well technically it would likely be better to do a suspend from
all top-level LVs - but ATM thin-pool does use 'internal'
suspend - there are couple associated issue - like usage of
flush during such suspend (see comment bellow)


> 3. Similary to question(2), is it necessary to suspend thin-pool while
> expanding a thin-volume ? If no, we should adopt the approach of
> a900d150e for thin-volume expansion. The following is my solution:

Nope, even the current solution is rather 'short-time' hack
until better fitting way is found (the hack needs some libdm API
interface rather then some autonomous decision)
But since current thin-pool target is missing couple features,
we need to first improve kernel target.

In general we need 'suspend with flush' which will not block, when pool
runs out of space as suspend without flush is in general not so much
useful.

Unsure how much you interested in development of lvm2 code?

Are you targeting some specific feature?

Zdenek
