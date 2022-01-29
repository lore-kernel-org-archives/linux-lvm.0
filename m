Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EA3C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 08:31:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-xCRdFrjyN_OjmJG0asAE9g-1; Mon, 31 Jan 2022 03:31:30 -0500
X-MC-Unique: xCRdFrjyN_OjmJG0asAE9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B2C51F6AC;
	Mon, 31 Jan 2022 08:31:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C766E4C6;
	Mon, 31 Jan 2022 08:31:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CE734A7CD;
	Mon, 31 Jan 2022 08:31:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20THp6q9028738 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 12:51:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 501992026D7F; Sat, 29 Jan 2022 17:51:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ACA72026D46
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 17:51:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38DC7101A54C
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 17:51:03 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com
	(wout5-smtp.messagingengine.com [64.147.123.21]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-650-UjvqjmMqM1e4LAv1ofmJ7Q-1; Sat, 29 Jan 2022 12:51:00 -0500
X-MC-Unique: UjvqjmMqM1e4LAv1ofmJ7Q-1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 812363200B8B
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 12:45:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute3.internal (MEProxy); Sat, 29 Jan 2022 12:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=9FYdZE5aQz7l9K/05AN0DMtbRqH9SILmYo++kOoFY
	W8=; b=Hq87yj4EEMEVGOaPBmkkX6HyMSD/yuF6FijbeTE6JtiBpsMYyhrzqIGP7
	nTyPSnOTgpEzCF9tLPGaqUd2Suuzu02q66+oBAO36XJkJ6YXr8NJ0OuV4CNsfsrM
	hRQcmSAgDeMSg35yGOorCk5j6/hW+TU5iZPII/3lY9WiTO/C4SQOwQlRSmLeB79B
	x0mLpfDs0ve7mOWbSVxi9BLWQ53iqr+/+iQ80oh+fnVuMVknn+oLBa6qyhZnLsa4
	D44oD6coHEEKsnyPSPDeecBgu37ZxLnb1qN8qQT+y1jd4kkQ2o0nTclQnSE1n8rj
	TFU/pfUGkZlrCmtOD5kBtiQGwD//Q==
X-ME-Sender: <xms:Sn31YX4hHjk74qeuRU7I7fcTY0UwaBCa_KBZXSCBQZzRZRG4pDXeHw>
	<xme:Sn31Yc6SCdCXAdXsc8S95bjlzQyyJJFOVU_eajyZnBtrIcKKewOiJNW0HOihn76hQ
	8CP7p5se1paoLU>
X-ME-Received: <xmr:Sn31YeftQB-LJa64W6XaGk7n7heOcXxda0LTm31pEbGAitVMxvi4FI7XTEYT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgddutdejucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
	dtvdenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehi
	nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepud
	ejgfejgeeglefhveekledtkedvuefhteeiffefhfekhefhveehhfekgfdugeeknecuvehl
	uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinh
	hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Sn31YYJBOoxQqA-ZkQ-2aDO7qhXzCVdaOU2mp-nKfYyprZGTfM5mrQ>
	<xmx:Sn31YbJ0xGeeqNUfUSY5luIH5mCIh1WouFsqrSDRnHt-EJWaMB81rA>
	<xmx:Sn31YRw4fCAuHK_7u5PWJUsYvZvVnAf5ZNOQFwOrVp15WnbNT_Bi4w>
	<xmx:S331YQX-NbnVn096Lha0BTe6tRqNc5PyDynh38o-sZQ0TQgk0SsZtw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
	<linux-lvm@redhat.com>; Sat, 29 Jan 2022 12:45:46 -0500 (EST)
Date: Sat, 29 Jan 2022 12:45:41 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: linux-lvm@redhat.com
Message-ID: <YfV9SAsGJBGMMv1b@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 31 Jan 2022 03:31:05 -0500
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
Content-Type: multipart/mixed; boundary="===============6328485539237913737=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12


--===============6328485539237913737==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YOOIxrOwb1T+o9p/"
Content-Disposition: inline


--YOOIxrOwb1T+o9p/
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Jan 2022 12:45:41 -0500
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

--YOOIxrOwb1T+o9p/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH1fUgACgkQsoi1X/+c
IsEsSRAAtamIuqJKpCEYkBMdYNz56Ybom1xuYcJkCcsWEo9OToTkfWf8xlOOPZ18
tc/jca9/Gq92go/Y4Uss0c/WMlmsPU4/fpyeYDVdBKPrJ90GC3qBPLbAWskZDVgr
tdkEiesnIijlEaH7CFY6dE6zO0YUmPs2a0B8JAcQDDcAeu7lNzmzZettmlJPOvwT
43ordYMClsu2K7WW4rHwqR2YPvclw1ZP8z6PfA1s9R1OnZlKFYX0vxT3MerQApGp
8lJtZfaox568wnjzaENY4BnmHiL66dZbhu/Z5Vqr+mdJT2OBpRaMG4NXs8n5zo2h
5w2T1NDxdSNcrQCOyCPXzQHq/F2hgap0frCcN4N2M7k07kb6kRnK5gSdi4vDcFW6
5xYMZCEZ7pjqoK0eUUKdDxrkxz3jXRgNnQXK13BkkCZZ+psrhc51BFuDuaUfOJHa
BW3IurKq+hZoCezqtxe9UcKU/euuU8zZsStCZMJfJlMpfXfXXbIhf0QFNIQQvXRs
fUTSRFJlxtiNxSUPXpn4R3hiMC7p1PPeNEwUrLh+2dz5AVCi0OlOtLhkCnPFqR79
QzzbJRlASKIdkrwrdr4VtCbGXVUptAPnEFJ+e7EzT34qXQhzHq2thLaOBlYFBYw4
JDJiMz7b27o/JCkVMEJrdEU3oHLdN4xe7KCqB7O5kBO1xtGRgw0=
=GrL6
-----END PGP SIGNATURE-----

--YOOIxrOwb1T+o9p/--


--===============6328485539237913737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6328485539237913737==--

