Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FFEC433FE
	for <linux-lvm@archiver.kernel.org>; Mon, 17 Oct 2022 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666020362;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8mEKGcJYqYoeQ0aKY4Q2C5j3Tt2tamjz3t/oWw3ccMo=;
	b=KBvgSYGrF/iobWtv8I8iCQAgMEnD45WoEDThCSK/VeKvfjgfQhn5h/Q9Ntmn/qR23RPZiD
	eecWS0GG9R+0OhMrYV0D4HwUUK3qxvu47R72CkMv5KS31Xe7SP5RfW2926d+Fo3m8iY409
	H8AB5M3+Sgn25KIHLk3l5Rc/Kr3RuY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-AZ5PeOk0P2KI_-g-pEvCmg-1; Mon, 17 Oct 2022 11:26:00 -0400
X-MC-Unique: AZ5PeOk0P2KI_-g-pEvCmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C6A9185A7A8;
	Mon, 17 Oct 2022 15:25:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B08772166B29;
	Mon, 17 Oct 2022 15:25:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87BE21946595;
	Mon, 17 Oct 2022 15:25:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 86895194658F
 for <linux-lvm@listman.corp.redhat.com>; Mon, 17 Oct 2022 15:25:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71E8549AFD; Mon, 17 Oct 2022 15:25:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A5D21731B
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 15:25:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48291299E763
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 15:25:53 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com
 (wout1-smtp.messagingengine.com [64.147.123.24]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-s5821LmSOd6qnoNu69U1vw-1; Mon, 17 Oct 2022 11:25:51 -0400
X-MC-Unique: s5821LmSOd6qnoNu69U1vw-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1DBF932008FF;
 Mon, 17 Oct 2022 11:16:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 17 Oct 2022 11:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666019785; x=
 1666106185; bh=p0MIAkHqbEVmniV+qZuRO+6BB/tNhCEv9fF002nO7mw=; b=C
 NtXV0OLCRJNuyFkA4JJv2RJcp6C9khEB5b+xxWukJXQrPeTUzp/K3SUwyYS+xUB+
 XE/xUc8pc1tkgCnehpasctHw0Nv2e/llOgH0axtqMpnF0V0IuFXfgDpCE3Guye/2
 w7xgl6bKQ2R12Rf+IA3tqKzQmWSAbQXyY+YoTGrNgR+XoaT6IY1K1o7O7HI/G35h
 5bhwAmP9FLMb1Ffliv8nun5KeTjS0naIt0bP5LGsXdxEoJ7nBIB1DI8i7IGpYD4t
 61nJ3zDrRs4jZfAlT9vxBBN1LspyYNVPVrbR7/my5yKzWM411su51jGNVR5ZsX92
 1RIRnHV3kpvc4KoiIR8Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666019785; x=1666106185; bh=p0MIAkHqbEVmniV+qZuRO+6BB/tN
 hCEv9fF002nO7mw=; b=ZiaQVdljWtWNZnw9MBLtx3GHSd1IUpC+RE7JxPJ7L2Az
 nAs6KU8x+JQHInlW04cp/PsCzOLzdkA7e9rMFgDUW4bO/bkVu1UtPc6Syyyfm8Dq
 LVZZg+pKoTr/gsCBvofK99cNJDbfGpNjzto6T5+QXcIW/R0mAdypi5RlZU0PcPhv
 /FsynTQGQZHBawBiWWcnf3m35LpW96hRQ6E8StC+ndtKztqj+MIXrYfpuxdCsg4X
 v2IeLRSxqM1N35W2xPyg3esM/oeGvOtPAZCzxiI/fzwo1N7VwsRGDVUkNnTFO0gR
 vyUAqZo8sfLXc6nSaOmBvc/AsBa2YWpcM11xtS1iPg==
X-ME-Sender: <xms:yXFNY59vqaqVWRHKZ2iU2psRehAGBnB2UJCgh692UKDyN_lVqne6Ew>
 <xme:yXFNY9t89_SGscouBnVuBiT32tIKg60ZkZjubpErp7rw3Yc070BK3wg_Sx_NwFU-n
 ibiJkJPzfKM0cA>
X-ME-Received: <xmr:yXFNY3BD0aJM2Fuy2QjprU3HNhwYHy8PG4EtQEprCEPeI_RLQUaBY0DcTZbv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekledgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
 jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:yXFNY9fC0-V-yyjdPo2OlQ3LnXTm6s-ICh_fN69IsmIHo-6sT-LXig>
 <xmx:yXFNY-PjrmjuwQHRg4luafQg5C-bDc_QUK-EaotIATdWTcQlp2cXeA>
 <xmx:yXFNY_mVXyONILWAL8mWz3cy1ZlzhI7NWtvwwCpXt-FRmyglUuDwXA>
 <xmx:yXFNYw2yufOaL-fhAEOv0_qhMZXig3AL77ccxIJ3OH9zM3uTKwX2qA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Oct 2022 11:16:25 -0400 (EDT)
Date: Mon, 17 Oct 2022 11:16:22 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Y01xx0qpzYCXjDL/@itl-email>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <CAAMCDefYPozC32AdCqw-c1nOZNiEK0j0pG7n+zcu_bRwTfCagg@mail.gmail.com>
 <2e6bad30-2ebf-4162-b62d-092c3ad14003@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2e6bad30-2ebf-4162-b62d-092c3ad14003@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>,
 Mitta Sai Chaithanya <mittas@microsoft.com>,
 "lvm-devel@redhat.com" <lvm-devel@redhat.com>
Content-Type: multipart/mixed; boundary="===============3548492410874339970=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6


--===============3548492410874339970==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7vGUBgrzxkFC9UKb"
Content-Disposition: inline


--7vGUBgrzxkFC9UKb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Oct 2022 11:16:22 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>,
	"lvm-devel@redhat.com" <lvm-devel@redhat.com>,
	Mitta Sai Chaithanya <mittas@microsoft.com>
Subject: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot

On Fri, Oct 14, 2022 at 10:28:28PM +0200, Roberto Fastec wrote:
> TIP and HINT
> forget SSDs with LVM unless of enterprise level=20
> especially if you are going to use/implement the thin provisioning

As a user and developer of Qubes OS, this makes me nervous.  Qubes OS
uses LVM heavily in the default configuration, and is designed for
end-user systems.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--7vGUBgrzxkFC9UKb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmNNccYACgkQsoi1X/+c
IsGMIQ//UBbfZHf+PS4MrKdiUvzYqvOZ+gpSEvuL4+4uk0Pg3JWso2MhrmMZGPf7
q10lpLgR5pAPJ7hWboWKrg4XNq2MLxmUY7Fhn0xD0loPMaLhbmjwY2coCybouqEe
sJHEu4Jdr3AAz6rPJQ6w+okse8lGaMi+IYASZDnUh7/ey9x4FQKc5lJptdMrbtYw
y6mdfnDEjPoqJOhJlKk6Y9shZqR3JxCMaOt+RmFCyDnK+xHDhtfKVYoxAO4OSEp6
Jb2IBWaBBTgeUfIysoBbE+3SsOl/mdxeDTBvHsz8wzDrwF/Kp7jX8zgfDQV5iPqb
6vwvup1vtea/L+X3ukbjn+qdHWR1NdxvkEtCQ49N9Wg/pRY05CbAkMJdB/nbHAfz
ZX02qw4nnFYlrR3Hcsbm8AGXAACfDK8ARedTjcv4VRvsqF0KFpZTyz2IrytPpvnX
LQrNHrRspaPL1W4ytfe2mXUk+dfcq7VVNqUVgvxVkXHNWqtQUMfhzgOBdJCZdn+C
NoJEMjf33Km1/8bIASGHqueEdY7Pp9BGySoe/qjiFZ0l+8EyXwTUo8UTcfCTegu1
w+LyuZd8GD96Iq1aWu1FUAJumrN6Sw37ipP1BbrYhv2yvvBHTy5aLYw5HkVqY/Ru
bVKT7ijuhNmHBtlRguahq9ai5WcoXf9NADAyrq+HiPzZ/Q2G4u4=
=V32V
-----END PGP SIGNATURE-----

--7vGUBgrzxkFC9UKb--


--===============3548492410874339970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============3548492410874339970==--

