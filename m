Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AA0C433EF
	for <linux-lvm@archiver.kernel.org>; Sat, 29 Jan 2022 20:10:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-ULOnbP7DMi6yWxxdJzGY6w-1; Sat, 29 Jan 2022 15:10:05 -0500
X-MC-Unique: ULOnbP7DMi6yWxxdJzGY6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F7C81083F62;
	Sat, 29 Jan 2022 20:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BC30101E591;
	Sat, 29 Jan 2022 20:09:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 784921809CB8;
	Sat, 29 Jan 2022 20:09:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20TK9jeU004331 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 15:09:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A564653D0; Sat, 29 Jan 2022 20:09:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0B2D740A
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 20:09:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 129E785A5A8
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 20:09:41 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-504-bgigIhTaN56qmSiEjbTELQ-1; Sat, 29 Jan 2022 15:09:38 -0500
X-MC-Unique: bgigIhTaN56qmSiEjbTELQ-1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6B82C5C0110;
	Sat, 29 Jan 2022 15:09:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute3.internal (MEProxy); Sat, 29 Jan 2022 15:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UOACqNmtS/oL9RJqc
	1pR1hMSnqHZeSretsO5m6EBcWI=; b=Gmj/a+Glncfo1NSDl2B0az1TCGs4JqB+j
	NO0tgAyK65arSaKI1R4jTVnCaruPXIVjf1m78wmmJh4mHZL/8+Li8GXXbmaCqtKT
	+Uuqf7nGcZ1bRe6+jv2e1YE5HRKGf0bKiW8GLokk17IOhAs6QUutTMyzvWfz1kYV
	XtVVmK3AIsU8ETF5evI3n5GxeQOxoq6zyu87NEodtxilY1R0/RSVCUQ5YNJsnBG9
	p1NVTZTdDe8K4UE5b76uhVrYniB8d5QgIve/JNmpGLAln48pa+3UtXHMZMrAe4WH
	/jUmcnS8gbPOVqY2MTCMDGjXQEFPl+nV3br5n0G9vH0hQqpgP8SxA==
X-ME-Sender: <xms:Ap_1YfvsJgL3VxEUXfZQE6YTpanEE5CBxs_N18BFUPgEoPxPkAd3eQ>
	<xme:Ap_1YQeF1kzm-QxRs4Uo7YtJJwz4Tl3VNzuZ0s-tgMwhSrMlZHdkRed3MgmRwCR69
	U7MwCIFXvZw_fo>
X-ME-Received: <xmr:Ap_1YSxGrx4sOml1Ao0xDRTY5HiGG89iLiiT2g82n0TtbTV_kIEsvrmrSDfr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgddufeeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
	ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
	hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeeifedtteetheettdfhkeehtdei
	gefgieeuhfehieetleeuheeutddvhfeukeenucffohhmrghinheprhgvughhrghtrdgtoh
	hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
	mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Ap_1YePUH6d9n5sSOcqow21oy8Xt9PYLbvnJfAJEPgnCfLp5mOivEg>
	<xmx:Ap_1Yf9aWRktq8tAQ2kNPZcJlKcAzCS6sXNf8t6KyGyG_5VIueNXKg>
	<xmx:Ap_1YeV0x5glxCRF986-95ghPQmoYfeNok4eVQaE0WffNsHanu5aHg>
	<xmx:Ap_1YcKxDSeNBK8jTKdx6yd3UzM5zHIv9LwZ2Epa52yG5WqBWsl9ug>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
	29 Jan 2022 15:09:38 -0500 (EST)
Date: Sat, 29 Jan 2022 15:09:33 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <YfWfAAGK8L1iy7LU@itl-email>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Content-Type: multipart/mixed; boundary="===============7810448594461195307=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22


--===============7810448594461195307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pfLwHFSycnCLSXlv"
Content-Disposition: inline


--pfLwHFSycnCLSXlv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Jan 2022 15:09:33 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: Running thin_trim before activating a thin pool

On Sat, Jan 29, 2022 at 08:42:21PM +0100, Zdenek Kabelac wrote:
> Dne 29. 01. 22 v 19:52 Demi Marie Obenour napsal(a):
> > Is it possible to configure LVM2 so that it runs thin_trim before it
> > activates a thin pool?  Qubes OS currently runs blkdiscard on every thin
> > volume before deleting it, which is slow and unreliable.  Would running
> > thin_trim during system startup provide a better alternative?
>=20
> Hi
>=20
>=20
> Nope there is currently no support from lvm2 side for this.
> Feel free to open RFE.

Done: https://bugzilla.redhat.com/show_bug.cgi?id=3D2048160

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--pfLwHFSycnCLSXlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH1nwAACgkQsoi1X/+c
IsFr2hAAm2ZMBQojbG2dK3jdh5jWITpBvxwXEHJZCjQ3i+5oRfaUGOgtaqpqBYnS
4ZivQ0ls96TQ7FgIF60D+0SQHoXOLmN/MHeejDmJDQ7tgiveKYDFKPAaQBQ3Rwlu
ftPv4osrDd7D+IRRaGaIVz9CWmswhWPeQdr7I7zE9robPVGUGhJ5Zh3SJh0DuSAP
vGcBGEEfnxu1uVfl0vHHxCi6r3i8Ma8Q4h2GYohe3Nh7l1vNgFEkZAvGOeSj+wNy
FJ0Osx+3m7ck7RYoUfgf0a119OCL58CZYupSZ1ZrEHQ95+IiNUzoZQ3k96FI4ac5
AEhno2syEq5gtlDuRhDkL58QXHqq6+gnDiY8Jiw2cSJOUh37ymUC20OeJcl79qCr
KyuzOjtTCoiuTaft+wK8SkpgtpFjReiC5GeoFyn/lwNinveXvfOd6Eez8Aof9fB5
zwSiiKgrtAnNVpBCv4JrISBSS+uQufxtJpPqZAOTX+l6BKHrz8iBXoEJncV6XmTD
tlUCDNfXvzAhBlm/YgkxE5J+M4+8ml08EvU3gIJ6QPJJDVvwEKP02MLxJtO/9whU
8aj5+PY3WnlxFmtqpqIC/akcWVXXZ7cQS0PWsdei3w2psFP/Y1d8WVlXpSEA3NUJ
v2YnAA7gtLzAY58e8FeOGKqh7lxFg4GVMXm4n1LJ2je5dewLx1o=
=gewV
-----END PGP SIGNATURE-----

--pfLwHFSycnCLSXlv--


--===============7810448594461195307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7810448594461195307==--

