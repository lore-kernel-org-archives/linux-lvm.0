Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F03C433F5
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Apr 2022 23:26:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-LiAsCJ-sMoCfvwuk8lKmXw-1; Fri, 01 Apr 2022 19:26:16 -0400
X-MC-Unique: LiAsCJ-sMoCfvwuk8lKmXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3046310115F6;
	Fri,  1 Apr 2022 23:26:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7B142166B2F;
	Fri,  1 Apr 2022 23:26:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A6BF41940340;
	Fri,  1 Apr 2022 23:26:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADEFB1947BBE
 for <linux-lvm@listman.corp.redhat.com>; Fri,  1 Apr 2022 23:26:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9BDD4C54183; Fri,  1 Apr 2022 23:26:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96CE1C54180
 for <linux-lvm@redhat.com>; Fri,  1 Apr 2022 23:26:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79704380450B
 for <linux-lvm@redhat.com>; Fri,  1 Apr 2022 23:26:05 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com
 (wout4-smtp.messagingengine.com [64.147.123.20]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-PlrUrWU4OzqEtvG3Sh2Jcg-1; Fri, 01 Apr 2022 19:26:03 -0400
X-MC-Unique: PlrUrWU4OzqEtvG3Sh2Jcg-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B924C3201F9F
 for <linux-lvm@redhat.com>; Fri,  1 Apr 2022 19:19:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 01 Apr 2022 19:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=0HJQxveO3dnSfM7D7FumfjyCKAQXmYdfw29r82pkC
 5k=; b=Uf69eKmBezoyNNTFGt0pscYGvtgJprIaQSiejYSINcgtL5LsKXf1EzNO6
 jUbX4+JSsSPkjiyx4X4dNrQRU8zhqbmI1wy+NoXb17G7GBzioVcjCIiqdM6THdn7
 twr0CgnY6auovSx5dsPl1uXCy/0DR53bfTYzRzy9lLH4+LVESS7WUk61XFJRopbf
 aGlGQARLIqxii+wfBe1mHe5jgobLRUA2jNDT/PqOlN1cWiMtlbgZg1rQD+iJMviO
 b6SGuQP77nZ/WNPMc8SvtA/ExsSm6TdfTTs/IGDX1htk2O9+b7yqwheuNCmyzPvv
 LZWvsTU7SsehTdiNHXW2JyzJUCCWw==
X-ME-Sender: <xms:cYhHYrWlPzkbU73KAqeuUrRaa50WA2alMV0Z6vj-nYFI6RcXKgn-XA>
 <xme:cYhHYjlIzI8Rd7ROK8iVuA9m4hhXJON8Tj0o_zqSAW5_eHM1x89nCEiDBGtOxolL0
 fX9QGGf-e1CkA4>
X-ME-Received: <xmr:cYhHYnZOyrwNd9nhJjxYypB2DSW3m9yMoXZVhXyjyXj2_L_77hfNvyLdujRh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeijedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtvdenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepud
 ejgfejgeeglefhveekledtkedvuefhteeiffefhfekhefhveehhfekgfdugeeknecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:cYhHYmXYTBJVsnsfKxX0OmXoDiHFogXu_xJBHZZ5NmvrVSsA_sUIWw>
 <xmx:cYhHYlmlgiT4CkAoV3nCRRpt8OYtsdgg3dkNHHboHx5PzpDNowU6fQ>
 <xmx:cYhHYjf5IAn-hZueTg_Y9PV88gqh3q2Oskmcdq6zjPIjqMGyaW9SrA>
 <xmx:cYhHYhwymdPcYS8zi8ixXx417oV_K34UXrTb7PvVa42UJoXBLYGCrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Fri, 1 Apr 2022 19:19:13 -0400 (EDT)
Date: Fri, 1 Apr 2022 19:19:10 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YkeIb0Lq37D+OtQL@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [linux-lvm] Safety of DM_DISABLE_UDEV=1 and --noudevsync
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
Content-Type: multipart/mixed; boundary="===============8944294043832429762=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6


--===============8944294043832429762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UkvdZEHzeBiu8itd"
Content-Disposition: inline


--UkvdZEHzeBiu8itd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 1 Apr 2022 19:19:10 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Safety of DM_DISABLE_UDEV=1 and --noudevsync

Under what circumstances are DM_DISABLE_UDEV=3D1 and --noudevsync safe?
In Qubes OS, for example, I am considering using one or both of these,
but only for operations performed by qubesd.  systemd-udevd will still
be running, but it will be told to create no symlinks for the devices
these commands create or destroy.  systemd-udevd will still be in charge
of other devices, however, and other lvm2 commands may run that use
neither of these.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--UkvdZEHzeBiu8itd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJHiG8ACgkQsoi1X/+c
IsFY5RAAsCbqUqBeTEYlDKeZI2UeBiCqlYI4F47gZhDmlmKs8gjYQdWWPd5BTxcV
3/ql4pCFK0zDxqaTzNJBX8bGM3C6l6kEh4w40ZWYBU6gdLcdUvozIolILJSC6l85
NXn5e6LcagYTPdJNWfwoAZo9fHBPmhVHhouRveVHhpCm9msQbgQspE9A1zSX7uor
1f04HvgNdOlG4mWeyoUnGNyD67H3PrZKUf3RBtt50eIwMSTn4sTIgJ1dzbet2oWb
U0DWz8569ejaCSd7IeU8kRs5egZquOsnFYdMX3qfNvkSfaE0J5obwPF0/qwBmLck
W8MwHgNUJi3V864BPP/7d339k+mHfGOLQO0cr+Fw6tA8HnmAh2VsJGuSbv4KBBbO
OetSfPa/D8Z9hwiGhtcJFu27AuL1hGz4msSf4+ZdT3ndLMau00RogBo5p9B/yACs
miTVkeXExgz1aOf9Q9IWKdNzDPdY1gghNYYKhgMzvlyh5EmeNYAm4YgLl5I3VsSg
Ai443kC43HyJzC++RLJKrW2s8lDSaCrdQhRHT8TMmJusIFF5MHLxCyNICmZYtcME
CxHQKMKtY2pIP+kF7tBEyoNj93a8sqd4MB7XkeZ7edEq8nH5WWjdSL4sRxSksi0t
DpaSdEaVr09YQaQU687R7gA1YXx2ydW9GvgboK+JS1Bjxazbfec=
=lWaX
-----END PGP SIGNATURE-----

--UkvdZEHzeBiu8itd--


--===============8944294043832429762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8944294043832429762==--

