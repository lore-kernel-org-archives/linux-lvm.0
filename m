Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C100CC433FE
	for <linux-lvm@archiver.kernel.org>; Mon,  4 Apr 2022 21:52:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-4QooF1FDNY2lS8SOb6SggA-1; Mon, 04 Apr 2022 17:52:49 -0400
X-MC-Unique: 4QooF1FDNY2lS8SOb6SggA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4431838035B0;
	Mon,  4 Apr 2022 21:52:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAB721468F2A;
	Mon,  4 Apr 2022 21:52:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9BD61940368;
	Mon,  4 Apr 2022 21:52:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC9AE19451EF
 for <linux-lvm@listman.corp.redhat.com>; Mon,  4 Apr 2022 21:52:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2A8C432708; Mon,  4 Apr 2022 21:52:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE9E5432701
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:52:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3B1E1C0785B
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:52:05 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-v_Ofd8H9Pu-MKEWNvwTCiQ-1; Mon, 04 Apr 2022 17:52:04 -0400
X-MC-Unique: v_Ofd8H9Pu-MKEWNvwTCiQ-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1207B5C05BB;
 Mon,  4 Apr 2022 17:52:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Apr 2022 17:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=FpzJZAlqEIkX8mBiUe7Lns5oa+Cn8bF21HeSZ2tAH
 Jk=; b=PLKo1YdUBtlCzIy6ymLPupCvs1AI7CYklZUaTPYdx8v742gX7w6EN/D0y
 MeF+MJbo9iwo5TkPCPHsxzNHuTzHmLrTcIIDltNN7bMbqkOT/glszMAcBDjPLZwZ
 RkqGj9hrL+JfGiM5sYe9ZV/zqrLm03kL5mT/tYPdPWv5xLcMDI190qg3hUrHD3wO
 O4YLjm2d0FRkkFNE4OTuxeOl3PHZE6F9n+rbMLMOeeTsbMCU1pOTLoZKo5Rc8sy0
 jdsNDu3UQ/vCHqH7htYjHGMqJ7rR6AOf3ITY0DiYTlwa3xeJkIth7y/BFKVSTCDP
 FNQs4iTH4JBO+UH2iNN8SZ/CVe3nA==
X-ME-Sender: <xms:g2hLYi4ATMVIm1gsAzsjHTwXnDCSl7XaC8BRl_pk0bzSY76c3BObbw>
 <xme:g2hLYr6D45_CZ-Md3a4r-NqOL-i-JDZfvlihX4IY8aZox7dI4WWjmkwnGXGwxNVr5
 VdwzblYCJBAasg>
X-ME-Received: <xmr:g2hLYhckxKpjVgQOwfeOM5N_K5xbWnXL5TpmcKwVBQO3RgI1yw2iiM5HOchX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcuofgr
 rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhmqeenucggtffrrghtthgvrhhnpeehveehveetgeffleelgeegueeftdejtdeu
 leetgeelveevueektdeuleelleduudenucffohhmrghinheprhhulhgvshdrihhnnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:g2hLYvJzB2qsSJ-Mr8UMy_Vcam9Lo6brmjGNfoYF1MLGWkU0i099IA>
 <xmx:g2hLYmKOs9JqUbWtqcwBg97FinE67tpFB2biZLw2VuIIYoTIkWKsAg>
 <xmx:g2hLYgxInseQsLkvNnY1bysh6S_fPQKWx_stfSOhGIm0brMtuHz7jg>
 <xmx:hGhLYlkwYWcRweFCAFW399TL47fFS5fS81-iguQuIcj_7UnT4wssnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 17:52:03 -0400 (EDT)
Date: Mon, 4 Apr 2022 17:51:55 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YktogFA9Lidvo6qa@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [linux-lvm] [PATCH 0/3] Make udev rules more robust
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
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: multipart/mixed; boundary="===============8671485808397326859=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7


--===============8671485808397326859==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u9sCTZF9QJ5luC8A"
Content-Disposition: inline


--u9sCTZF9QJ5luC8A
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Apr 2022 17:51:55 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/3] Make udev rules more robust

This makes the udev rules more robust against various unsafe error
conditions.

Demi Marie Obenour (3):
  dmsetup: return non-zero on stdio I/O error
  Disable lvm2 udev rules if `dmsetup splitname` fails
  Disable udev rules if udev flags can't be obtained

 libdm/dm-tools/dmsetup.c | 2 ++
 udev/10-dm.rules.in      | 2 +-
 udev/11-dm-lvm.rules.in  | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--u9sCTZF9QJ5luC8A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJLaIAACgkQsoi1X/+c
IsGWQw/+K5tPRY8NpZAsqvLCxc0tehSQ8/LMTwHMNDyMq52vcSVApNoFFxOgJubo
TREMGJb10LrO8Nz+E3voIkm2cbbIidclAVJsx1kWkBAN+RFt3LQCvkL3s0dney/X
kizEhmF1kpsO/A2ke1arN4t+bU/7q+njOwLx414+NRyWh+1nZyWPfyOAadWdlBjI
VJ8xhRaPllnsynSEirp12ZQ48YIxvYmh9h8/gN/OfO9SAXAEmx4G2eW8b0Gks4lV
eZQxpb09eftnKoSPvBOFvO6steDjDE1s6+Fc/pHPffq8y5VMh4s6rVe4PoSVUXER
boWWG3NijuD7VYqQI5UTzpp6C3JBStIc2jvAUc+6EUQSRVnW+wVtn9jSnLKWNhQR
XhLbr6BC0FNqHjbWlLNf9tpcAL/mACaC8+WpJxf79aNO7F+CfPn4QM/hkGLPJylm
FgsP1tDIqC2mdER8+VnCATDNIhNDwMjF+VdgEO0qsB5OGTHOvb4hdw4CySk/graA
WPKQmsux5U74T1KnfW0BF8ZfFIqdiZAtP8fjZGKd2YNcPCATlcV5fDKyKdUMeEXQ
NTbPeeWml3x3hujK5PIdfn0BIg+9e+W79eWdmQRJkk6q67ZXFIUQG5BxqDsBXagS
pDMClVOnbtNyfeUQNSvfwckzeY9dMD6vFMd2ZL+SwI8yJOL2Hwo=
=RI0t
-----END PGP SIGNATURE-----

--u9sCTZF9QJ5luC8A--


--===============8671485808397326859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8671485808397326859==--

