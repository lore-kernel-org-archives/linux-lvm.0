Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F4BC4332F
	for <linux-lvm@archiver.kernel.org>; Tue,  1 Nov 2022 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667326564;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=px+ffMulXOpqz/b5zJoCpbQnI/qALvJEVANx/COGndc=;
	b=VKDIC7cVgrOSOIt7OSkY3rk+yFLq8hCUMPbEx1iHdKHNGFO8voi69UMqecVfjyHeEcMZuW
	xXFTZC0uBOsmm2B5tKUf6do5OGoAJKLuoV/tSWbqGuFaW5sIOgKOxYbUoYXC1jDR2TrVBq
	e0HgATSek44vMy5EA/HfSgfPIBZZbAQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-meve_nB0OdikGVaVIen1YA-1; Tue, 01 Nov 2022 14:15:36 -0400
X-MC-Unique: meve_nB0OdikGVaVIen1YA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44CC029ABA1B;
	Tue,  1 Nov 2022 18:15:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAD20C15BA5;
	Tue,  1 Nov 2022 18:15:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 86C4E1946A42;
	Tue,  1 Nov 2022 18:15:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 564AA1946594
 for <linux-lvm@listman.corp.redhat.com>; Tue,  1 Nov 2022 18:15:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 001D842220; Tue,  1 Nov 2022 18:15:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECA717AE5
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 18:15:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD10085A5B6
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 18:15:29 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com
 (wout2-smtp.messagingengine.com [64.147.123.25]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-U9AL9ZsmMwaumNPAZW-yUQ-1; Tue, 01 Nov 2022 14:15:28 -0400
X-MC-Unique: U9AL9ZsmMwaumNPAZW-yUQ-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B75C8320090F;
 Tue,  1 Nov 2022 14:15:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Nov 2022 14:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667326526; x=
 1667412926; bh=qYE0CeYyzw7QWAC7xM9DsopIO87fqzRV5EPBV6sN3Z4=; b=Y
 RJuDJMTHLnXDH5jqoLqUYLPzX88QtM0FcSJ6APMq0pH8iWU/aOoosex+MzjllGg7
 O0D34nrmcBP1WYbjGqu5IjmZ1dEQQfINHTGYsvraZ7Dz0MKdgjqoLKO4kWG2SHgd
 Cx3tLbVUOGw9aKLTV+WX+lJ/4om/XHF1MwnOApS28xJaBwoXvOmsnqE042wlvmkV
 SmBT9EnVrBC6lmsIDS2UhGNrcGgdxd/owXPx4ioYbOzuGGGSEyOXBK7Dcg7TvNcU
 JVpB2/mc6VGBsBgt5KQI146OxQIb6rc3wDYAzx186qsVQ4j8WXyRM+oz0keWXqdF
 kQJgjGyvzpb8xXPuL7e+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667326526; x=1667412926; bh=qYE0CeYyzw7QWAC7xM9DsopIO87f
 qzRV5EPBV6sN3Z4=; b=FGrb875TiBB0JIwg8/CpL5tbVgTEf2LnAoVoAx2KUcN1
 BW4jg3AuiDWbB5OH6n1+BvwZOtl6axw3o269yo0ybsMDrwBTQ5qptKKMS3SutMxg
 y15iNuDgeYDb3TWV8yI4xthK5J5jSmgVrH9WEQSRBG8MpiMV3kiYTxi96pyAABhr
 yrbCB/0y7EUHAPaAhKn9cZTU/i841qOZXuYvgwhLYsVsfVpAB5j64KomWYvE947J
 Nb5zU84xuDijhzKLv4mLo9CgJa8pQ22SdURtWw8AGtwf7xN9KpT9/EFrrGZAL3VV
 rpCnvXY/rxpvuikX6haV5PQPTHj3SEIIqfxzgtoo/w==
X-ME-Sender: <xms:PmJhY0zIStHrrsh_xB-0_wlaWclOIIMTqW3uc9GDne9HCm-8uD75Cg>
 <xme:PmJhY4Ss0SJJuzG7FoLzKKtI-nFjK4wyFbhktdtB63oYDao20KCpMLtx6Gw26oiYj
 ilPXBm6btF0At4>
X-ME-Received: <xmr:PmJhY2VkVa3KwUwkvgeqokpS12v9f7WEztGkmOqc_u-sLI4-FphM56tYhKls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudehgdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
 jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:PmJhYyjpje0uh4I6CfBELwgKa5KPieAhQV1Dohvoef2V6SGOZ9EE7g>
 <xmx:PmJhY2D6CYKul4ADCx2NThpxWiGAxlFeVXkfldDj8a95Svmqd5KGXQ>
 <xmx:PmJhYzJ3mOamSXeetT23fTwSMrLLmeslKC-f-905GcxSXlkfsXSZQw>
 <xmx:PmJhYxrJQsfrwJTDOJd2T_kihUCU5GWK9OjLgW71N3iu9Gbynz4vJw>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Nov 2022 14:15:25 -0400 (EDT)
Date: Tue, 1 Nov 2022 14:15:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <Y2FiO90/LQ/Pi3SN@itl-email>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
 <20221101144230.GA11193@redhat.com>
 <bd522c48-03df-1130-54af-bee8a58440f0@bytedance.com>
 <20221101175756.GB11193@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221101175756.GB11193@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] How to implement live migration of VMs in thinlv
 after using lvmlockd
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: damon.devops@gmail.com
Content-Type: multipart/mixed; boundary="===============6537150874810725356=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--===============6537150874810725356==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VkMzv+jo/1WYd2Sh"
Content-Disposition: inline


--VkMzv+jo/1WYd2Sh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 1 Nov 2022 14:15:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Zhiyong Ye <yezhiyong@bytedance.com>
Cc: damon.devops@gmail.com
Subject: Re: [linux-lvm] How to implement live migration of VMs in thinlv
 after using lvmlockd

On Tue, Nov 01, 2022 at 12:57:56PM -0500, David Teigland wrote:
> On Wed, Nov 02, 2022 at 01:02:27AM +0800, Zhiyong Ye wrote:
> > Hi Dave,
> >=20
> > Thank you for your reply!
> >=20
> > Does this mean that there is no way to live migrate VMs when using lvml=
ockd?
>=20
> You could by using linear LVs, ovirt does this using sanlock directly,
> since lvmlockd arrived later.

Another approach would be to use thin provisioning on the SAN instead of
at the LVM level.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--VkMzv+jo/1WYd2Sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmNhYjwACgkQsoi1X/+c
IsGMFQ/+NuZwZHJgCpow6x3gvrBy8cPsdG8+iqYf4cmd38vYHrPt7Iqz88iMEdyW
fLC8FUhBimjsriLhuoGMdnHxf8ZvGR/caqJ+nMcRPbEJU5TycDuUYBewhjx4KYvY
b62+ddaT6GpT58uOK+VkwJRCy11tUE/2Eh00+DNBV9IHULTl7bt2bqdEmFfkMs77
pAjeoM3tsJbyvPSSaYCjItUeTvKLPvrDWBB/mxcLOUkfoYllkTiTGC1nnqc8+3DH
0bSDGq+eDffaQX3iMONZUbzlI12CQuu/mpL58S+MGGoGpUk6Jdmf1e6fO2Hrgg4X
5e4GA9wl3IKYzNQAcgcBSQnwXCLyzysi6ZPgKGl/EC0PyAdcEoqAGu1kHBpzoQyW
v4ONGRPyeOWibdx8tZpPKp9gvoZeeg3c8Sp0hxTwlQoDAHYqhrrAm7yrRM2E209G
DfNnX5Dlx1dSaPTi1hb1DhxM5u4yPTk4LkifqBHnRMghtMPfdwNuAQxe/uzNqoXI
+TmDAWGrYMmdrjPf8RC0ZlA5k9z+2lX6hmLoHjkFKBZuWyDzqOH4ysYs7Vo7XSl8
YGjfjbFZYxw7zRXs2R9NJWA7Bv2ibyBh6UuaSmR8++jyCB/FjD1OgAi8Pr91BDXl
tVYXR1N6Q1mqrXjRlSLIsiAsJiNVu8Glkx3ChSni6uXtTenRlzY=
=vnmH
-----END PGP SIGNATURE-----

--VkMzv+jo/1WYd2Sh--


--===============6537150874810725356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6537150874810725356==--

