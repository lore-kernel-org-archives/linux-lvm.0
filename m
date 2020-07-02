Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5D7410144F6
	for <linux-lvm@redhat.com>; Thu,  2 Jul 2020 02:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA5988EF3A3
	for <linux-lvm@redhat.com>; Thu,  2 Jul 2020 02:16:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id f12so1023199eja.9
	for <linux-lvm@redhat.com>; Wed, 01 Jul 2020 19:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eZfsxij7_huVyEZO5D2BVX3C+E-3WpmNQVe5unw4io8TUXA@mail.gmail.com>
	<CAAYit8Tdw91NM+KaqLMBokBy3v4aSdNz88qmherQX5EqVu-BeA@mail.gmail.com>
In-Reply-To: <CAAYit8Tdw91NM+KaqLMBokBy3v4aSdNz88qmherQX5EqVu-BeA@mail.gmail.com>
From: lampahome <pahome.chen@mirlab.org>
Date: Thu, 2 Jul 2020 10:16:42 +0800
Message-ID: <CAB3eZfs+5vx3T9s5W6tUXPfC9GwYyA5kT2aMWHMO9KoUgvYQ4w@mail.gmail.com>
Subject: Re: [linux-lvm] Difference between thin_ll_xxx & thin_xxx
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

> thin_ll_* tools are targeted for recovering missing data mappings
> ignored by thin_dump and thin_restore. The name is an acronym standing
> for low-level processing. Below is the quickstart guide.
> https://www.redhat.com/archives/linux-lvm/2016-February/msg00038.html
>
The page doesn't describe detail about thin_ll_* tools.
After I run it, get some observations.

thin_ll_dump seems dump the tree root & mapping tree and orphans
blocknr.(seems having orphans is normal)
And that info is which thin_dump doesn't get it.
