Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4N8e9uU026463
	for <linux-lvm@redhat.com>; Mon, 23 May 2016 04:40:10 -0400
References: <d38a602864c07cd1ee5cd4d12a7d0383@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <aeba9dc1-e51f-a68d-c0d9-28c606368eb6@redhat.com>
Date: Mon, 23 May 2016 10:40:09 +0200
MIME-Version: 1.0
In-Reply-To: <d38a602864c07cd1ee5cd4d12a7d0383@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] auto umount at thin meta 80%
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

On 22.5.2016 19:07, Xen wrote:
> I am not sure if, due to my recent posts ;-) I would still be allowed to write
> here. But, perhaps it is important regardless.
>
> I have an embedded LVM. The outer volume is a cached LVM, that is to say, two
> volumes are cached from a different PV. One of the cached volumes contains LUKS.
>
> The LUKS, when opened, contains another PV, VG, and a thin pool.
>
> The thin pool contains about 4-5 partitions and is overprovisioned. Only one
> volume is in use now.
>
> This thin volume called "Store" is almost the full size of the thin pool, but
> not quite:
>
> store    vault Vwi-aotz-- 400.00g thin                        40.37
>
> It currently stores a backup, I was writing some backup scripts.
>
> The volume apparently got umounted when the meta of the thinpool reached 80%.
>
> 10:47:21 lvm[4657]: WARNING: Thin pool vault-thin-tpool metadata is now 80.14%
> full.
> 10:47:21 lvm[4657]: Request to lookup VG vault in lvmetad gave response
> Connection reset by peer.
> 10:47:21 lvm[4657]: Volume group "vault" not found
> 10:47:21 lvm[4657]: Failed to extend thin pool vault-thin-tpool.

At this moment -   any failure in  'lvresize' execution leads to immediate 
umount - tool went ballistic and so takes 'drastic' action to prevent further
damage.

See here again:

https://www.redhat.com/archives/linux-lvm/2016-May/msg00064.html

ATM there is some new code which unconditionally always connects to lvmetad
even it's not necessary at all - and it's potential source of many other
troubles - so fixes here are in progress  -   set 'use_lvmetad=0'  if it's 
still a problem in your case.

Regards

Zdenek
