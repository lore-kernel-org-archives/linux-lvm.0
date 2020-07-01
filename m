Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E38310E38C7
	for <linux-lvm@redhat.com>; Wed,  1 Jul 2020 15:09:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2742B858EE9
	for <linux-lvm@redhat.com>; Wed,  1 Jul 2020 15:09:39 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id f6so9772947ioj.5
	for <linux-lvm@redhat.com>; Wed, 01 Jul 2020 08:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eZfsxij7_huVyEZO5D2BVX3C+E-3WpmNQVe5unw4io8TUXA@mail.gmail.com>
In-Reply-To: <CAB3eZfsxij7_huVyEZO5D2BVX3C+E-3WpmNQVe5unw4io8TUXA@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Wed, 1 Jul 2020 23:08:59 +0800
Message-ID: <CAAYit8Tdw91NM+KaqLMBokBy3v4aSdNz88qmherQX5EqVu-BeA@mail.gmail.com>
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

thin_ll_* tools are targeted for recovering missing data mappings
ignored by thin_dump and thin_restore. The name is an acronym standing
for low-level processing. Below is the quickstart guide.
https://www.redhat.com/archives/linux-lvm/2016-February/msg00038.html


On Wed, Jul 1, 2020 at 4:33 PM lampahome <pahome.chen@mirlab.org> wrote:
>
> I'm a new to lvm and confused about as titled.
>
> What's the difference between
> thin_ll_restore & thin_restore
> thin_ll_dump & thin_dump?
>
> Thanks
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
