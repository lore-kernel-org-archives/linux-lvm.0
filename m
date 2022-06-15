Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2D3C433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 15 Jun 2022 16:42:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-3g9K_358Ny6_4medGz4qzg-1; Wed, 15 Jun 2022 12:42:29 -0400
X-MC-Unique: 3g9K_358Ny6_4medGz4qzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A86F080378C;
	Wed, 15 Jun 2022 16:42:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D89801121315;
	Wed, 15 Jun 2022 16:42:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC5391947041;
	Wed, 15 Jun 2022 16:42:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B55AC19466DF
 for <linux-lvm@listman.corp.redhat.com>; Wed, 15 Jun 2022 16:39:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6ED491121315; Wed, 15 Jun 2022 16:39:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A7001121314
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 16:39:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C08B2999B3E
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 16:39:49 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com
 (wout5-smtp.messagingengine.com [64.147.123.21]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-iQZCoFSNMpWiE7jhYpje5w-1; Wed, 15 Jun 2022 12:39:46 -0400
X-MC-Unique: iQZCoFSNMpWiE7jhYpje5w-1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7D4403200AF9;
 Wed, 15 Jun 2022 12:39:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 15 Jun 2022 12:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1655311185; x=
 1655397585; bh=alyG8tsOSaNDD6yzs9n6+PF98o7Vez6gMNxvQysU2fQ=; b=Q
 SHPrnLLh/bXQwJI2aRqVea8ioX6R8TDPtiNM3RkIFGb/GtErOPSTYQB7uqKYtP8V
 v73i+MnGzN38yY2HUZApVWWg1Ud4+fT+YoeCXolD6k3jZmXzTppOZQNO2EBA+T3M
 9k+H8I6SWYECZ6CLTi8ZWSny9AWHIAq5WlqRcgP6xnWnGgxWh2Tfh68ZYcf9Mbgo
 JsT7sXDAYlC5vRylTltTFcMJwfGCVx5WXe4GhDp16VQefsILqiwlLcNLdBql1jRf
 MS2hT5wlporXYARfNtuIF/YN91TA0F0jnuXnGR9Zca3tqt+cS/s1J3VZMDIa4CP4
 YDEu0wUFXZOSuyWN4ZAgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655311185; x=1655397585; bh=alyG8tsOSaNDD6yzs9n6+PF98o7V
 ez6gMNxvQysU2fQ=; b=gRU8pAVy7yKzT6IYRw5EI9yZmBFF7XoiWhGRtWzTglem
 cs7ZZlVqOQHAwq2mSZNBI/UCwti6Y1LfNqlmmnhoq+/pmfwIz3iIQ2NWZosVqMlh
 nvZMFIVONszYyi6lJWm9UUf6+8xLRMvR6zS25EEvOOZEhRBGbQ9kVjBY28kPUkZn
 htwm4C4Us5QbZjBoNRRa7xZqaSJjuLDS42l32yGHX7uk4epa6aYsHRc6Qht63DFx
 hta4CNnobQ0XYUguyl39LGiEeiQ2cSnb+xNXDCZS0pQBMg+q2HkbsXv2oP/cpcXI
 lerybidLu3oiVXMm7Et3Gp42j6WzastBa/y0Pmg2qQ==
X-ME-Sender: <xms:UAuqYmPoy0ja7f69_1A01ZPf3AwA7nyI9hVmTYw-4owCKR_3EO61WA>
 <xme:UAuqYk8A1Y6ZdYr1nEWAg8zfh0K9bi83w-WPrnI5muxs6Ly9uvOvmuS-pXFSYL45K
 cBCFheHhzHWl3A>
X-ME-Received: <xmr:UAuqYtRzLPEGkAm4FUK8f063IwO-OtsM02Md_KeCFry92Yqb_EiC0Iplgqc2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdeuiedvfeeiudfgjedtuedt
 leefvdeukeeltddugeejvdeiudekfefhueetnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:UAuqYms1UYRIFKiSSB395q9yreJNCs2rIV8YopyEERYx7exopioGrw>
 <xmx:UAuqYuekeZGyx9M3DKH1b7RZ6_dUmf2AkhZD26VaReGZlSNlaUv28g>
 <xmx:UAuqYq1czRLxjlt5Ze_qL8t_VlT4HQurBOyhn_SUVI8v_QnCcXLe9A>
 <xmx:UQuqYgpO1UDRYGCgPpmUlOdj6y_j5TCayMb0SnVAJttKFVGe0e5wmQ>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 12:39:44 -0400 (EDT)
Date: Wed, 15 Jun 2022 12:39:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <YqoLTvinIjf9BetH@itl-email>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
 <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
 <31a7b7e9ea9e60fe42d93f6f113fcaf0@assyoma.it>
 <ad5c7a16-1a66-488a-46c8-10bb3fdd6e60@bytedance.com>
 <fd171a18d82d6f496d9d75c966278b88@assyoma.it>
MIME-Version: 1.0
In-Reply-To: <fd171a18d82d6f496d9d75c966278b88@assyoma.it>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so
 poor
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
Content-Type: multipart/mixed; boundary="===============1572472443042565102=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3


--===============1572472443042565102==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gZQcP3tjjlQMsGhv"
Content-Disposition: inline


--gZQcP3tjjlQMsGhv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jun 2022 12:39:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Zhiyong Ye <yezhiyong@bytedance.com>
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so poor

On Wed, Jun 15, 2022 at 02:40:29PM +0200, Gionatan Danti wrote:
> Il 2022-06-15 11:46 Zhiyong Ye ha scritto:
> > I also think it meets expectations. But is there any other way to
> > optimize snapshot performance at the code level? Does it help to
> > reduce the chunksize size in the code, I see in the help documentation
> > that the chunksize can only be 64k minimum.
>=20
> I don't think forcing the code to use smaller recordsize is a good idea.
> Considering the hard limit on metadata size (16 GB max), 64K chunks are g=
ood
> for ~16 TB thin pool - already relatively small.
>=20
> A, say, 16K recordsize would be good for a 4 TB pool only, an so on.
> Moreover, sequential performance will significantly suffer.
>=20
> I think you have to accept the performance hit on first chunck allocation=
 &
> rewrite.

I seriously hope this will be fixed in dm-thin v2.  It=E2=80=99s a signific=
ant
problem for Qubes OS.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--gZQcP3tjjlQMsGhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKqC04ACgkQsoi1X/+c
IsHsww/8DKiqXEV+av94w6dH+2AmoVACfQt5Wv9B/o2cvpXH82IcCN6M+cDFgGwK
h+ACxqTORYdjJS+sivYMJoPkmkhJwulF6n/KevBJ4MtFTUrAkYC1J5vRraYTz82Q
zHuAzernVlzZs39RIiHjHVOLsDIpXuzXqtxi//6oXLX4nIaHGhNwWj7kvXhU/zLt
KQLk/yiv1SewaaAHTaktBKEzk+sk4eXxoJpe9aL50vlKyqKJQIs7m3eAq7n0HCc0
lzQD5VF9J3vaUr6wQoFNp4GQpe3b3DMhkvjBrTC1ilE0Dq2EBXRlLbvx6GXybQ1L
CxP8A7vkO3M9vJgfXf6mEGbeF8MJfaELoLtiCADamXL05ZMZXQI//GhasDaK1d4Z
cMkjsJaLi/fB/eL587kL4n99e3AoNG+JUrmQoCxd/E8Hdh3d1O8524tC6QGDfVku
wyPnxuhAOBEg96bexEy+RDzOguWzm6AKD5zRqemXWw0otEwj86R/IpsIPXRNAFO8
+jKXqp3ZDKWptBCHmwaiVQTS3Fj/mjnIGu3KYHPHteLTcgZoGIJq5a7RargJptZF
S1lgewfHY/XhZOutaSGYMO9bQ5NA4BVo+pSJl4yo+rVHc8IRT1oQQzrx1Sr57Qrt
TcMhkV5sVkDnwzicCF0rMm+Y3beNTUOjUSY05oQuDXUYLr2Vqog=
=yeGt
-----END PGP SIGNATURE-----

--gZQcP3tjjlQMsGhv--


--===============1572472443042565102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============1572472443042565102==--

