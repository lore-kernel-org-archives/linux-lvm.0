Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l85DbPdC027927
	for <linux-lvm@redhat.com>; Wed, 5 Sep 2007 09:37:25 -0400
Received: from el-out-1112.google.com (el-out-1112.google.com [209.85.162.178])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l85DbOcf011394
	for <linux-lvm@redhat.com>; Wed, 5 Sep 2007 09:37:24 -0400
Received: by el-out-1112.google.com with SMTP id b25so259829elf
	for <linux-lvm@redhat.com>; Wed, 05 Sep 2007 06:37:23 -0700 (PDT)
Message-ID: <d00698fb0709050637p6d239d78l71b3ad932d290744@mail.gmail.com>
Date: Wed, 5 Sep 2007 15:37:22 +0200
From: noah <noah123@gmail.com>
Subject: Re: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
In-Reply-To: <46DEA19C.9000207@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>
	<46D9B8B2.3070104@theendofthetunnel.de>
	<d00698fb0709011605h25edefbep1c989c23effe5c55@mail.gmail.com>
	<d00698fb0709050257y220be827ybc88fd680b14f1d4@mail.gmail.com>
	<46DE7FB6.3090203@redhat.com>
	<d00698fb0709050442w3f98f7baueeb3550022ce4186@mail.gmail.com>
	<46DEA19C.9000207@redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

2007/9/5, Bryn M. Reeves <breeves@redhat.com>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> noah wrote:
> > This patch is already applied on the kernel i was running.
> > Also, I'm not sure I'm using dm-raid at all since I don't have one of
> > these lame software (BIOS) RAID cards.
>
> dm-raid1 is nothing to do with dmraid per-se (it's just one of the
> targets dmraid might use to construct a raid set).
>
> It is also used by pvmove - when you pvmove a volume, a temporary mirror
> is constructed using dm-raid1, synchronised and then broken. After the
> pvmove the newly sync'ed copy is substituted for the original PV.

I see, thanks for the explaination.

>
> > I'm using md and dm-crypt straight on top of the harddrives.
>
> I'm not sure I understand - if you're only using md and dm-crypt, why is
> pvmove involved?

Sorry, I forgot to mention LVM. Just wanted to make it clear I wasn't
using dmraid in case it was related -- which it obviously wasn't.

>
> You can directly view the status of the mirror/pvmoved volume using
> "dmsetup status" - the patch I linked to earlier corrected a problem
> with the status report that prevented userspace correctly parsing the
> status updates.

Interesting.
Unfortunately my whole system went away in the crash and I cannot
reproduce the error again to see what dmstatus table would have
reported.
But it does look good on the new system with the same kernel AFAICT.

aes-root: 0 6291456 linear 9:2 384
aes-root: 6291456 2097152 linear 9:2 887095680
aes-root: 8388608 2097152 linear 9:2 897941888
raidB: 0 586113528 crypt aes-cbc-essiv:sha256
00000000000000000000000000000000 0 9:1 1032
raidA: 0 976771960 crypt aes-cbc-essiv:sha256
00000000000000000000000000000000 0 9:0 1032


>
> It does sound from your description like you may have hit a separate
> problem since you mention that the pvmove does initially proceed correctly.

Check.
Is this list the correct place for bug reports or should I resend my
mail to dm-devel@ or even lkml?

  -- noah
