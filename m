Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FA1C433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 21:19:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-d4G0H4YsMXmelFWoqvrwoQ-1; Sun, 30 Jan 2022 16:19:21 -0500
X-MC-Unique: d4G0H4YsMXmelFWoqvrwoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA1701083F61;
	Sun, 30 Jan 2022 21:19:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E4B36AB8D;
	Sun, 30 Jan 2022 21:19:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 921921809CB8;
	Sun, 30 Jan 2022 21:19:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20ULIxpB002306 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 16:18:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9E8F1112131B; Sun, 30 Jan 2022 21:18:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A2281121314
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 21:18:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7DC7800882
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 21:18:56 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com
	(wout1-smtp.messagingengine.com [64.147.123.24]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-180-QNMWXN1MMdaJgx9vA-hVzA-1; Sun, 30 Jan 2022 16:18:54 -0500
X-MC-Unique: QNMWXN1MMdaJgx9vA-hVzA-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 24DDF3200953;
	Sun, 30 Jan 2022 16:18:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute2.internal (MEProxy); Sun, 30 Jan 2022 16:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Yy9ivutiPNOnIPqBD
	PwIJwN/+HqGom7O+rd5Vb3QKO0=; b=FrkPdp5FSDeQRn1NlMZ68IwnHoGoNDXwg
	PV+bVGkAomX7uZArZWCh26SIJzDU3BN3vkUpHiF4q0nhvoaPJ8StOiN/jwnKH7I5
	oOZkMjrvkkVduDgbFR14wFnfss2soy094IZAgsxxUHZxp3FYWgCuPpCAvkn483Gs
	0UwJK5ZdMU2v246aaaaLqweD/m5tOaRYBnZIx/jU2Yp/meBOda6nlgTK66Zneq51
	Ozwa4zZLiYAiUrBG+OnW3m22K/m1UJei1LKtd6tImfkzLJ5P1Zn3fMQln1nFycxE
	G1nJPTFGU/HoJCOi0iY8PRpl5ApjBgcUKUTsdqDHi/hvqKmlZ43/w==
X-ME-Sender: <xms:vAD3YRWX5C8YZylyq9UyUSpqxDE7JSP5rq0bj19AZndTWS8YSCPcpg>
	<xme:vAD3YRlOY4lcIA5Tsp67P7I4220QPzMx6PeoH4zFRjVrZHTY5MkXgFTIOJGbCanya
	Wam7Eeujn9PG0I>
X-ME-Received: <xmr:vAD3YdYO31sJnvNqFXZQV8ckgrl0odFXDr2J7hcHdX_IRLzkcswvW6NMy8GX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgddugeekucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
	ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
	hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfeifedvgfejleefieefgfejvddv
	feelgeelieefgeffhffgffeffffhueduheenucevlhhushhtvghrufhiiigvpedtnecurf
	grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
	rggsrdgtohhm
X-ME-Proxy: <xmx:vAD3YUUBeQulTnlv_5rh_WTzSmqE6p8ciEwKwc0d9gdEmfoZwO5pUw>
	<xmx:vAD3YblMidc6jpZKE4gb1c6PUQZFeSn5w2rVTol8h8nNXZg6P82FXg>
	<xmx:vAD3YRd91skRlUKrb4Kxhtxa_Udy8CKBnBmD7ct9r3WBl495C4jGxg>
	<xmx:vAD3YRTLr6NzScY5y1wZ5Lyw7ZnezCVfppgmtwTcI2WSNUuKW8vz0A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
	30 Jan 2022 16:18:52 -0500 (EST)
Date: Sun, 30 Jan 2022 16:17:17 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <YfcAucYQ+GIMpW6t@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<849ab633-ec3d-a0a5-38bf-72b87bbba2c5@gmail.com>
	<d6edb2859c355a842a87b897106832a0@assyoma.it>
MIME-Version: 1.0
In-Reply-To: <d6edb2859c355a842a87b897106832a0@assyoma.it>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
Content-Type: multipart/mixed; boundary="===============2048295913895505818=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16


--===============2048295913895505818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8VD6qVE7SRgJDQA+"
Content-Disposition: inline


--8VD6qVE7SRgJDQA+
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Jan 2022 16:17:17 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin

On Sun, Jan 30, 2022 at 09:27:56PM +0100, Gionatan Danti wrote:
> Il 2022-01-30 18:43 Zdenek Kabelac ha scritto:
> > Chain filesystem->block_layer->filesystem->block_layer is something
> > you most likely do not want to use for any well performing solution...
> > But it's ok for testing...
>=20
> I second that.
>=20
> Demi Marie - just a question: are you sure do you really needs a block
> device? I don't know QubeOS, but both KVM and Xen can use files as virtual
> disks. This would enable you to ignore loopback mounts.

On Xen, the paravirtualised block backend driver (blkback) requires a
block device, so file-based virtual disks are implemented with a loop
device managed by the toolstack.  Suggestions for improving this
less-than-satisfactory situation are welcome.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--8VD6qVE7SRgJDQA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH3ALoACgkQsoi1X/+c
IsGNoRAAmQNwX/6xmAR8OVEsQFo877UYbpwIDoeid1hoN0SjKAX6LpvqJuHv3Evm
k+Ff94ZNxe4cYY6DTfAT2PGk3Sn2BJKbozUIx3ZGPzkqhSYIbDqaDg1KdP9q+O0B
3YpmF4ddmv3BIHwLMvMlAsGHdfMZPP1Fp1Tb92/11NjjvPrbdSXOxHzKXCNBTeQh
d7DfAOspZRszg/ijALr/iadvhwjyyuW+GorpvC6tmdzr7X1RtNW00KvCnO/qyuaV
80HXlmg0gkku194rxnnVYeGUot4ODP9R3gW1V8EC0aEpBTAf5LU0H3tQ2P1kz1qj
lqjJuih8AltQm7zQJYUBBTRM6UCexXvi/tgi63QD9z5edHIJGHP4czDtKuWMJdUv
O7xVb2lU7eBy94o/Xg3dgGt8xRLJ3y1B0J/C75RY0eZ1nENyz2Y4FYSlc3rc0qVS
+lVRq+uwWB+0o/EzOXjRI+SNtd3JdyUTHIEHMH34EV0J5loeQGveIkHHPJ/ZIi22
8/ujemETUgi0QYj/mmNLAW2lpkP3v8GZgHZpGOy1IT7SSya3Nx1FOwXD0CX8+lj3
xtfsSK2PFR9dwHtFDsqMJWnijff0DRr0rHoJdtAY6iu7ijVVdkCDc9IHNk2u6x/6
ByEx/6w0tt2BAIrb3SSfT0ujSwsggBV4C2lw1aKecOpcZmHr2m4=
=ngVF
-----END PGP SIGNATURE-----

--8VD6qVE7SRgJDQA+--


--===============2048295913895505818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============2048295913895505818==--

