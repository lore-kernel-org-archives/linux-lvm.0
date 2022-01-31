Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A406AC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 19:05:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-sSssyw6gNq2LTUlVlU6-aw-1; Mon, 31 Jan 2022 14:05:33 -0500
X-MC-Unique: sSssyw6gNq2LTUlVlU6-aw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9E6A18B613D;
	Mon, 31 Jan 2022 19:05:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5AA360936;
	Mon, 31 Jan 2022 19:05:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A4321809CB8;
	Mon, 31 Jan 2022 19:05:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VJ4e4I023479 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 14:04:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0569A492CAE; Mon, 31 Jan 2022 19:04:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01E4A492CAD
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 19:04:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8741185A7B4
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 19:04:39 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-627-vWiWeTCTOEGWEaMfhmL_Xw-1; Mon, 31 Jan 2022 14:04:37 -0500
X-MC-Unique: vWiWeTCTOEGWEaMfhmL_Xw-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3C7FE5C0058;
	Mon, 31 Jan 2022 14:04:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Mon, 31 Jan 2022 14:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y7z+Nis7eesCAz/VE
	5EZJiPnk1CEbsLeLH/dcoRXMzY=; b=IuZdfmHm/WSW2i3ER4fBCt2q8rHS7dwME
	e8z7Mchy8WPWzAdJNfhMlAZmXKZhvkJPhelS8gJUNq3EBVpsiRUw1M+7jzYjdaOQ
	DTHsN0M6mtAFyVSNsUh81TjmoobjfKjvIxZuzTVgAhJwZiS9Dx/g2BP68L/RNCHM
	LFRRd/JpSbABwxLgQCMvZky/LKczqsd5ezvtR1EisgCtfDO1dL/dgYJrwz3J7aIW
	IoqzwrFsnmr3BzRWevMPZg+ihIZ7Unpp3kDBfna8gODWQPp0KDy/21/A9kYwrkaB
	wELXwvj846eiOTYZio7V5veIpGnVbIlij75Hc437ihR/n7XzvAGBw==
X-ME-Sender: <xms:wzL4YRxIxco-NFYGtSj6EgU2h0tJ_VAY_fzTz79V-fGlgLSv26dGEA>
	<xme:wzL4YRT4jp4uc-7B_Q9AjxhIterc3vV54Il4tqimesAXR6c5eneUVJ4-PYLaJnVnX
	TQcqC-t8kav2UQ>
X-ME-Received: <xmr:wzL4YbXwkfdbuqS0WTogLRiqVD3-kj3apWOVDiXkMSInaQglCBPTZmNDUa_L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugdduvdduucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
	ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
	hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedtueeivdefiedugfejtdeutdel
	fedvueekledtudegjedviedukeefhfeuteenucevlhhushhtvghrufhiiigvpedtnecurf
	grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
	rggsrdgtohhm
X-ME-Proxy: <xmx:wzL4YTiHJamqN9TeJb54gMg5AxVifnbNAWRH7TPOYnpig6FPM5hMgg>
	<xmx:wzL4YTCnWjDUJ4Z_J4ZrSxy4kBEcu9mmM4SmKlZHGbxUm9oiWyL1Yg>
	<xmx:wzL4YcLr9ElOO-GBMo9eHAvVRPeeUb_NWekC80JiOaZVQgNE7NhTRw>
	<xmx:xTL4YW-ZKvPUkZXW87laFup6KeogmDKepiuWnwOIy5RBKOtGMwRzww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
	31 Jan 2022 14:04:35 -0500 (EST)
Date: Mon, 31 Jan 2022 14:04:15 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <YfgywUaJVsygv487@itl-email>
References: <YfV9SAsGJBGMMv1b@itl-email>
	<9c35198501aae82e7a911f5418cfd7f6@assyoma.it>
	<YfgAOeqHtutU91rI@itl-email>
	<b3127b95f8c2e687b4358ec0558cdd6a@assyoma.it>
MIME-Version: 1.0
In-Reply-To: <b3127b95f8c2e687b4358ec0558cdd6a@assyoma.it>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool
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
Content-Type: multipart/mixed; boundary="===============4540217593125390065=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13


--===============4540217593125390065==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1RFwmv9EkjZG0wNq"
Content-Disposition: inline


--1RFwmv9EkjZG0wNq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Jan 2022 14:04:15 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool

On Mon, Jan 31, 2022 at 06:54:48PM +0100, Gionatan Danti wrote:
> Il 2022-01-31 16:28 Demi Marie Obenour ha scritto:
> > thin_trim is a userspace tool that works on an entire thin pool, and I
> > suspect it may be significantly faster than blkdiscard of an individual
> > thin volume.  That said, what I would *really* like is something
> > equivalent to fstrim for thin volumes: a tool that works asynchronously,
> > in the background, without disrupting concurrent I/O.
>=20
> Are you sure that fstrim works asynchronously?
> I remember "fstrim -v /mybigdevice" tacking some time (~30s).

It=E2=80=99s happens online and without preventing other I/O from happening,
whereas thin_trim can only be run offline.

> > FYI, you might want to specify a full fingerprint here; short key IDs
> > are highly vulnerable to collision and preimage attacks.
>=20
> Yeah, it is a 15 years old signature I must decide to update ;)
> Thanks.

Might want to generate a new key while you are at it :) (especially if
the old one is weak)

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--1RFwmv9EkjZG0wNq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH4MsIACgkQsoi1X/+c
IsE16w//aPqAGzkmkps2ANbDjlZV40J1wF9lzqdC4h0vIVP/KLRXMCwUsgPkjRX8
zWPqqsA3zTILLcOT27zT347ZgSnB5xwpiRvI6IkwPcSvHbsJX6i0FAHB4TPQVmbw
JbGJUJP5uvg1dm9qV87HQ9kq+qMDZNWJM3pJqZBWEQH4nGbDnURIp4VVMruYyWtN
6twK7t5VVAJh6TocAqM/mQh5ycvNtVDQSzl9JLMv6ZeVS2VwlGwECylIizh4L8N8
OqRWsaNQBqGmYRUoUaoLuHFTNdLciihctRGFha2yV2kop7l4n5gui+E+DLXuucKw
w+GXB2khay1TayxrbSnQI7IpqmcWWFR2LreRg4u9UapoB/bkgXBNFCJu5MOIOl7F
ZOuEFmq7pHVy6WVAjQSYf6rotVomlM9qja1MR5DWL2dxzcmDoOSt7FKK2eoWOw2I
zhyCOb1Dnr1lQxDUb1fOc177yHlBiU+4ODVYfj+jcgPypPBKbqkfvp7t7ls4E9PL
sNNtjJXLjrTBVjzI0nXkzJE0A6yvRPArp1u9e6GNXejhatfejnzEHBMq670hf8F8
06w32epVo9M7uaSDwpIP/8Rw4YT6GAemuvxwzfsy5R76GwQJcSlwP2dCyFnJCaAn
0KSX6Eh/OxR9ABjR0xdmzr13jCJyFQ16oR8RywQ2dL7el9js/PU=
=Vah0
-----END PGP SIGNATURE-----

--1RFwmv9EkjZG0wNq--


--===============4540217593125390065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4540217593125390065==--

