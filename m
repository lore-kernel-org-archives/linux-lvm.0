Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694B5C433EF
	for <linux-lvm@archiver.kernel.org>; Sat, 29 Jan 2022 19:01:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-5tGA9crnNGC7lPssbF7l6A-1; Sat, 29 Jan 2022 14:01:33 -0500
X-MC-Unique: 5tGA9crnNGC7lPssbF7l6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2328B363A4;
	Sat, 29 Jan 2022 19:01:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C6E95D6BA;
	Sat, 29 Jan 2022 19:01:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F9051809CB9;
	Sat, 29 Jan 2022 19:01:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20TJ0tXC000634 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 14:00:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD6D7492CAD; Sat, 29 Jan 2022 19:00:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9A69492CAB
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 19:00:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF7D3C01C05
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 19:00:54 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-665-WGh8WMhgNLCW4as7atE3yQ-1; Sat, 29 Jan 2022 14:00:52 -0500
X-MC-Unique: WGh8WMhgNLCW4as7atE3yQ-1
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B0F85C0175
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 13:52:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Sat, 29 Jan 2022 13:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=AIgbkyq7KfEBdGf51DdCDslGa7XMZRNWrmvqbfFz6
	Zk=; b=UHaFpcVQ4N+1TGr83p47g3mPgsTLEYQZHDmehX4Clp3mC5MtY5Ty6pOMO
	gxica2jKkHgccVezz+x8EvDjxhMYc88VfN8JusxUHQSGXTV2e4MHKuhOwcKdmusH
	ForPSUlF4KjkM+IzaFicGg2nE/FA0p5rPYTKB9NPhl3cYgXOxL/00MOjgJMbdrtA
	JYhr34tsDaOUY1eKqHfa45LBIRLys/Ic/P8L5bLZpg0gHY1QLbufF3SAW2Yt0SKH
	HcZDDbENNQoHcps0FfvgRPvXIFEN+S6pStU7eWg2KAxKN4hjJXUgJYtu4YiFKwFP
	Cc0PkAOrQBrGe5v8Ujmq7p+yxuZIQ==
X-ME-Sender: <xms:_Yz1YUbHk1N_LQczaFIGJgLhOIKdtj9khRWhjfQUBmlequS2b6Q5tw>
	<xme:_Yz1YfbYcgv8AsZKWXv1ZQwFeXYsdFxTxDXgC02pNMSQnc4wMWGkUuypmkOzveHTu
	norY1gRstJYADE>
X-ME-Received: <xmr:_Yz1Ye-8-1wWt0nmnNRRLaUooiO7uHbiP-L0jCNljuNO3R-OMZOWDl4rV724>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgdduvddtucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
	dtvdenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehi
	nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepud
	ejgfejgeeglefhveekledtkedvuefhteeiffefhfekhefhveehhfekgfdugeeknecuvehl
	uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinh
	hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:_Yz1YeqXJXY783KhLU3pwaj8CMuEMZwEp3vdiWfdg3WNoIojQGCdKw>
	<xmx:_Yz1YfqueUi-pbiQ3MREMQJq9ukZ_VbLWJ9P5dnh_h2mZT3spaGZRw>
	<xmx:_Yz1YcS4YsrSWErOHaCCaqmgl1im8mapMHAmEjPdfLy_U7vLYSjpQQ>
	<xmx:_Yz1Yc2UP2KUgOhZSWX-N5kvQuzBfhMHw47X1GM3ALivT87oKyvkxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
	<linux-lvm@redhat.com>; Sat, 29 Jan 2022 13:52:44 -0500 (EST)
Date: Sat, 29 Jan 2022 13:52:24 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: linux-lvm@redhat.com
Message-ID: <YfWM+8w1TonBXNsP@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Running thin_trim before activating a thin pool
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
Content-Type: multipart/mixed; boundary="===============3550340401066442653=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15


--===============3550340401066442653==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lCtDjWEIXaJYcTqI"
Content-Disposition: inline


--lCtDjWEIXaJYcTqI
Content-Type: text/plain; charset=us-ascii; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Jan 2022 13:52:24 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: linux-lvm@redhat.com
Subject: Running thin_trim before activating a thin pool

Is it possible to configure LVM2 so that it runs thin_trim before it
activates a thin pool?  Qubes OS currently runs blkdiscard on every thin
volume before deleting it, which is slow and unreliable.  Would running
thin_trim during system startup provide a better alternative?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--lCtDjWEIXaJYcTqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH1jPsACgkQsoi1X/+c
IsEYqw/5ASYD3IM4XXJWcMLl7/o46fFKp31iuh5BT0dvp++156VHZHgmAEKNuoBQ
2g/tb+wIHN3EMfbrwVGjxqXXoWrXgXp2zNhRbroH0Xqc7fjEt6K5hLlbyC6TF7An
zsesbzbY0h5oXQJc+xxNexNS814K06Zx2Un69YI5wGMrGjXgqQCZjicJOfXZb5Dq
5U99F2LfwBex+FFmdkDA/Aff9u7AUL7M2j4qXfo9nLc29/ncR7s6vhHmO+YQiwL2
Q3amXfLuKfACYDCW+wCNxkdXQgNAESCfnWjxYCc2OQsb2nZXIaiV0ChmZmWDs5kJ
x88VjAyF2tci3Om0QEgzf5xsMH4D6rSPg9jnUzbqKVs8+WU0YIpJzGYPe4GyfyPi
H6ypD72cz5t9UoSaXzRNRAt4DKk0hTrXZmaVBSuWX8kV/ZzQVwks7dmpGe/n/GRK
LzPmtxL6R2mx8Th6ikG/s2WmQV8huJi4jYBU9VuACO9qGwVqyoF/TeSnxbfjFpC4
uVjYzk8AensefH68fS20uIJrDmFI0ciJLrtOiJCvKGWO+bT8eMqSL855OhXfZE/E
jO++xUnD/5fa1f5iaM7CLKqui3rcC8OPPfsJYLbu7ml7msuXSVaJxnkUSHJnb0IF
sLiOxrBtwpl1dA0vI6i1Gx0ZGCwhqwEMhHVuN6EyqP4vpW7LGpQ=
=7noP
-----END PGP SIGNATURE-----

--lCtDjWEIXaJYcTqI--


--===============3550340401066442653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============3550340401066442653==--

