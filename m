Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E9EC433F5
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Feb 2022 19:02:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-Wp6L6uZlO8--Lh-yfGRXXw-1; Tue, 08 Feb 2022 14:02:07 -0500
X-MC-Unique: Wp6L6uZlO8--Lh-yfGRXXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B681898290;
	Tue,  8 Feb 2022 19:01:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BEC160843;
	Tue,  8 Feb 2022 19:01:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93EBC1809CB8;
	Tue,  8 Feb 2022 19:01:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 218J1XPL021465 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Feb 2022 14:01:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5528F2026D11; Tue,  8 Feb 2022 19:01:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50A5F2026D13
	for <linux-lvm@redhat.com>; Tue,  8 Feb 2022 19:01:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5083F106655D
	for <linux-lvm@redhat.com>; Tue,  8 Feb 2022 19:01:29 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com
	(wout3-smtp.messagingengine.com [64.147.123.19]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-663-hXOE_0RCNrCqcLEqj46J8Q-1; Tue, 08 Feb 2022 14:01:27 -0500
X-MC-Unique: hXOE_0RCNrCqcLEqj46J8Q-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id DDB043202053;
	Tue,  8 Feb 2022 14:01:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute2.internal (MEProxy); Tue, 08 Feb 2022 14:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=tCWKbmRC14Qsl+Ruvy+6ovfGXzeKfqEYnJcpVVaya
	so=; b=FRY9+kVZw9KJkBXoeT2uzUO9SAi1svGMPMXDkMFR1SqQmLdfxNzHS6ysn
	2Z6zayuaxmsi2U+O5EStjDZ8UEbMrb7ZkNznIOKNYMPPB1kvSiMVU85lmlYGhcca
	Uhf5WPy5sfFXruoPC1gntCk5F4wD0FLNmIehEV4gokE3ggsOWYBjusvExqx5JwsB
	z8Kgl8NrOwl8wa8TrZ1gX6u5jk8rU9x+XmcHl7qhDLS78xUR0GWRlqB/9XL5+cKV
	dVemmAo37CiJDstAsOP/pdtt2jnDgRlhh4VvzdkveilFiwI2ZRIDW4o4E3mNq7zx
	pWWycRpQoeCrZZY/Tky49BPzenesg==
X-ME-Sender: <xms:Bb4CYk2FAloARYGb-rkucbpTRwKdMBcFkZmOg4VWmqJUQ_pPv8bw3A>
	<xme:Bb4CYvELyIfmxgptz9DyGhqQIgXF6CYt7Lb0UKYgPob6LFKXzzw4V83SoEGRsTG7o
	kni86k9bDDxP3o>
X-ME-Received: <xmr:Bb4CYs7zc4LoJxMNxf5h2YTm20JIemOTMtj4cD7dDtHWkimGaxtsre_F7974>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheejgdduudeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcuofgr
	rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
	gsrdgtohhmqeenucggtffrrghtthgvrhhnpedujefgjeeggeelhfevkeeltdekvdeuhfet
	iefffefhkeehhfevhefhkefgudegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
	grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
	rdgtohhm
X-ME-Proxy: <xmx:Bb4CYt1ONWPg7B7XWaxj5hvUhIH5qZhN_2j2mvFf0aC2OpPny7lgQg>
	<xmx:Bb4CYnHmjLi0Grv6sj_kxzlbjy88Hg04kwDCAztHmFYfQ7zGlrcENg>
	<xmx:Bb4CYm9AGhq2-XMB3lRPline7_rf3hTlDH9DT5fKgPElNgsmAdaPiw>
	<xmx:Bb4CYtN4IqoL7Mqwzi41vShSb-ujHa6hnMlRElOw4IJRfxW34w_c1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
	8 Feb 2022 14:01:24 -0500 (EST)
Date: Tue, 8 Feb 2022 14:00:43 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
Message-ID: <YgK+Avj+VURDqo7j@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Cc: =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [linux-lvm] Thin pool performance when allocating lots of blocks
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
Content-Type: multipart/mixed; boundary="===============6641072884329433827=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13


--===============6641072884329433827==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N3VN9/yyr1jY1NhI"
Content-Disposition: inline


--N3VN9/yyr1jY1NhI
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Feb 2022 14:00:43 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, 
	=?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: Thin pool performance when allocating lots of blocks

Are thin volumes (which start as snapshots of a blank volume) efficient
for building virtual machine images?  Given the nature of this workload
(writing to lots of new, possibly-small files, then copying data from
them to a huge disk image), I expect that this will cause sharing to be
broken many, many times, and the kernel code that breaks sharing appears
to be rather heavyweight.  Furthermore, since zeroing is enabled, this
might cause substantial write amplification.  Turning zeroing off is not
an option for security reasons.

Is there a way to determine if breaking sharing is the cause of
performance problems?  If it is, are there any better solutions?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--N3VN9/yyr1jY1NhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmICvgIACgkQsoi1X/+c
IsG9ZRAAjng6XabF9PFKdAooS26UPMMpKl5j9tWDhP9nz/kTolpr2UT/Gb06VR9s
nykRjIg0tSID2I6jTpPkjqHJ3zHg7ledk74wrLL9cwDKNgqmfC4qR6OxGxfaND+k
d7a4sqepsdejL2QLi4I9tmGEGn8PV2EwW8evxL0R1JaxKnnJopQaZYnFW/7H3geY
Fg7cRyPoWUEnS0a0CJIZQGK38QPGpxdTEpMvc3IItG+lUGrzpnA+fZZ8crjQxQzD
nr+GoADFJ7cyBt2VVgXXPtRrhv3UK/PoPh5iNpC6fBZsCnjgJXetOrTPiLClwacK
9wABrdXOOgjsxRhZU3h0hcMNQAuJVkJPSWic5/VwaMPCq9BhlNtzj4kKjNw7M/m0
XExNtXKdwmvPJTnHp5zBIrJwHx/Uv/OkhHCYj6NtUxic3QycSA7LjWYPnvHjf6la
UetwRhSpyj3eXEwKp1MYOSYC52giWplTjKFvF40ua605Kt0olQY6rbZuQaEiu2Y1
UcWhHRBU9yCFh2+vDv0S/qvJzLennheyorORxO6TM+JhWV/8CHJS4i6XwNfU/oxa
DGyqn2qx9fG8WvR5LW8cbdxUm0Z6fcXuu3j3Z8c+uL7dA3+O3QXkkGyelhZrPgDA
Fpw/GRMNhX0EwJrpWUhEXrS5eWGEJZSVg4gn2wO15kjezFbXAow=
=Yiqb
-----END PGP SIGNATURE-----

--N3VN9/yyr1jY1NhI--


--===============6641072884329433827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6641072884329433827==--

