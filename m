Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50591C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 20 Dec 2021 06:58:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-oQp_2sWMM5WjMSm19KYvXQ-1; Mon, 20 Dec 2021 01:58:09 -0500
X-MC-Unique: oQp_2sWMM5WjMSm19KYvXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0B3E1006AA9;
	Mon, 20 Dec 2021 06:58:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CFC51059A40;
	Mon, 20 Dec 2021 06:58:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 885101802E27;
	Mon, 20 Dec 2021 06:58:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BJKDsqU021374 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 19 Dec 2021 15:13:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D7452166B1E; Sun, 19 Dec 2021 20:13:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25A3A2166B2F
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2021 20:13:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B4E329DD986
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2021 20:13:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-641-reXSvRbZOe-xNctDqqhkYQ-1; Sun, 19 Dec 2021 15:13:48 -0500
X-MC-Unique: reXSvRbZOe-xNctDqqhkYQ-1
Received: by mail-lj1-f180.google.com with SMTP id a37so12598134ljq.13;
	Sun, 19 Dec 2021 12:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=NGwfRAAnIMX+ILnmzgKY21t78jA7Io6mXFzWhEUNCmo=;
	b=XkdGuWT3cS6tkURtrhBpH5w5pYzLolhstlT3BKyYHrmkE1EpIteaalxacUkduQW4FD
	159t4nkGMaDoqrwTOR9ZtJXbyKY3ABP+OlUBUhRO3NtR1k44IazoT05/J8gK1V8twB1R
	wZVDIZ1CAE/o8KQv1Zp61L14TkR2NCBqOep1457Z2x3HFaVegb2pBicp8TU995ZIno04
	Od1SB66IyveoMSygI/3K5Ri+mbAEEc3Yytsex4zN9ZDe3U6PleHgeBGuR69dgwUUlITE
	Ts7Qgb6C540zp4LatnL6bujFScbQGCpcCQw9LNo0kByBj86lRgLMgJR7A3m4ZVfeaEAe
	w4Wg==
X-Gm-Message-State: AOAM531T98Lpwu+hxRWzOKrYoaZOnRqLv/ghPTKmqaGGrtvjQhrAAtnj
	lPsKfbZbonQ8t/ZndRKOsHfm3m+RvBY=
X-Google-Smtp-Source: ABdhPJy2wSA9xuq8zvRu3flZcODTGGdPqnRVd53T6C4oeLhT4xUahovERk6lmSZ1R6TOOZuqC2SIhw==
X-Received: by 2002:a05:651c:a11:: with SMTP id
	k17mr12021497ljq.243.1639944826887; 
	Sun, 19 Dec 2021 12:13:46 -0800 (PST)
Received: from smtpclient.apple ([2a02:aa1:1628:62d6:b0bd:2c34:f6bf:319])
	by smtp.gmail.com with ESMTPSA id
	b12sm2131924lfb.146.2021.12.19.12.13.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 19 Dec 2021 12:13:46 -0800 (PST)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 19 Dec 2021 21:13:45 +0100
Message-Id: <1CFB8D67-A13E-46F3-8693-545ED89CB981@gmail.com>
References: <f4b822a0-33d2-bd9b-6696-09d09aa19052@redhat.com>
In-Reply-To: <f4b822a0-33d2-bd9b-6696-09d09aa19052@redhat.com>
To: Heinz Mauelshagen <heinzm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 20 Dec 2021 01:56:54 -0500
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] size of lvm metadata
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7137874786374466282=="

--===============7137874786374466282==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-251E2605-7375-4C59-A57C-8AA349101535

--Apple-Mail-251E2605-7375-4C59-A57C-8AA349101535
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

if I have a disk that are merged into a server coming from another server c=
ontaining a lvm snapshot
How can I convert this foreign disk to an existing  lv volume?

The documentation says I can use
lvconvert-Zn -s targetvg/targetlv sourcevg/sourcelv

But I guess I have to perform some lvm metadata recreation first?

please let me know what steps are neede

Regards Tomas

Sent from my iPhone

> On 17 Sep 2020, at 17:22, Heinz Mauelshagen <heinzm@redhat.com> wrote:
>=20
> =EF=BB=BF Tomas,
>=20
> the first PE starts at offset 2048 sectors of size 512 bytes by default, =
i.e. the LVM MDA (metadata area)
> is ~1MiB big (because the MDA starts at offset 1 page into the device).  =
If you plan for large numbers of LVs or expect very scattered allocations w=
hich both grow the metadata, you may want to create a
> bigger MDA using vgcreate's option --metadatasize (also see /etc/lvm/lvm.=
conf description on
> metadata/pvmetadatasize).
>=20
> On 9/16/20 5:50 PM, Tomas Dalebj=C3=B6rk wrote:
> > hi
> >=20
> > I am trying to understand how big the lvm metadata is
> >=20
> > in the vgcfgbackup file, I can see extent_size =3D 8192 dev_size =3D
> > 204800 pe_start =3D 2048 pe_count 24
> >=20
> > pe_count(24) * extent_size(8192) =3D 196608 bytes usable space of the
> > total dev_size(204800) metadata size? =3D dev_size(204800) - 196608 =3D
> > 8192
> >=20
> > but... pe_start is 2048? so what is pe_start here? cant be
> > sectors(512)? bytes? well than ther be not aligned
> >=20
> > so where starts the actual data? and where ends the lvm metadata?
> At offset 2048 sectors (1MiB into the device) / MDA ends at sector 2047.
>=20
> Mind that lvm2 metadata is text formatted (see /etc/lvm/backup/$VGName fo=
r one)
> and thus varies in size (the MDA is used as a ring buffer for 2 copies of=
 the MDA to
> support atomic updates).  As pointed out above when refering to 'vgcreate=
 --metadatasize',
> in more elaborate setups you may run out of MDA space.
>=20
> Heinz
>=20
> >=20
> > regards Tomas Sent from my iPhone
> >=20
> >=20
> > _______________________________________________ linux-lvm mailing
> > list linux-lvm@redhat.com=20
> > https://www.redhat.com/mailman/listinfo/linux-lvm read the LVM HOW-TO
> > at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--Apple-Mail-251E2605-7375-4C59-A57C-8AA349101535
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto">Hi<div><br></div><div>if I have a disk =
that are merged into a server coming from another server containing a lvm s=
napshot</div><div>How can I convert this foreign disk to an existing &nbsp;=
lv volume?</div><div><br></div><div>The documentation says I can use</div><=
div>lvconvert-Zn -s targetvg/targetlv sourcevg/sourcelv</div><div><br></div=
><div>But I guess I have to perform some lvm metadata recreation first?</di=
v><div><br></div><div>please let me know what steps are neede</div><div><br=
></div><div>Regards Tomas</div><div><br><div dir=3D"ltr">Sent from my iPhon=
e</div><div dir=3D"ltr"><br><blockquote type=3D"cite">On 17 Sep 2020, at 17=
:22, Heinz Mauelshagen &lt;heinzm@redhat.com&gt; wrote:<br><br></blockquote=
></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
 =20
 =20
    Tomas,<br>
    <br>
    the first PE starts at offset 2048 sectors of size 512 bytes by
    default, i.e. the LVM MDA (metadata area)<br>
    is ~1MiB big (because the MDA starts at offset 1 page into the
    device).&nbsp; If you plan for large numbers of LVs or expect very
    scattered allocations which both grow the metadata, you may want to
    create a<br>
    bigger MDA using vgcreate's option --metadatasize (also see
    /etc/lvm/lvm.conf description on<br>
    metadata/pvmetadatasize).<br>
    <br>
    On 9/16/20 5:50 PM, Tomas Dalebj=C3=B6rk wrote:<br>
    <span style=3D"white-space: pre-wrap; display: block; width: 98vw;">&gt=
; hi
&gt;=20
&gt; I am trying to understand how big the lvm metadata is
&gt;=20
&gt; in the vgcfgbackup file, I can see extent_size =3D 8192 dev_size =3D
&gt; 204800 pe_start =3D 2048 pe_count 24
&gt;=20
&gt; pe_count(24) * extent_size(8192) =3D 196608 bytes usable space of the
&gt; total dev_size(204800) metadata size? =3D dev_size(204800) - 196608 =
=3D
&gt; 8192
&gt;=20
&gt; but... pe_start is 2048? so what is pe_start here? cant be
&gt; sectors(512)? bytes? well than ther be not aligned
&gt;=20
&gt; so where starts the actual data? and where ends the lvm metadata?
</span>
    <p>At offset 2048 sectors (1MiB into the device) / MDA ends at
      sector 2047.<br>
      <br>
      Mind that lvm2 metadata is text formatted (see
      /etc/lvm/backup/$VGName for one)<br>
      and thus varies in size (the MDA is used as a ring buffer for 2
      copies of the MDA to<br>
      support atomic updates).&nbsp; As pointed out above when refering to
      'vgcreate --metadatasize',<br>
      in more elaborate setups you may run out of MDA space.<br>
    </p>
    <p>Heinz<br>
    </p>
    <span style=3D"white-space: pre-wrap; display: block; width: 98vw;">&gt=
;=20
&gt; regards Tomas Sent from my iPhone
&gt;=20
&gt;=20
&gt; _______________________________________________ linux-lvm mailing
&gt; list <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:linux-lvm@re=
dhat.com">linux-lvm@redhat.com</a>=20
&gt; <a class=3D"moz-txt-link-freetext" href=3D"https://www.redhat.com/mail=
man/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a> read the LVM HOW-TO
&gt; at <a class=3D"moz-txt-link-freetext" href=3D"http://tldp.org/HOWTO/LV=
M-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
</span><br>
 =20

</div></blockquote></div></body></html>
--Apple-Mail-251E2605-7375-4C59-A57C-8AA349101535--

--===============7137874786374466282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7137874786374466282==--

