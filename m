Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF031C433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  4 Apr 2022 22:03:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674--aj6dGmwPDOzAx8-G-OyPA-1; Mon, 04 Apr 2022 18:02:40 -0400
X-MC-Unique: -aj6dGmwPDOzAx8-G-OyPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 160233804071;
	Mon,  4 Apr 2022 22:02:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF245145D36A;
	Mon,  4 Apr 2022 22:02:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8495E1940368;
	Mon,  4 Apr 2022 22:02:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3103519451EF
 for <linux-lvm@listman.corp.redhat.com>; Mon,  4 Apr 2022 22:02:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 204D1C52D73; Mon,  4 Apr 2022 22:02:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19BD8C52D72
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 22:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0ECE3C01BAA
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 22:02:29 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-kk7YNUDjN2Sf0cfhQgaiyw-1; Mon, 04 Apr 2022 18:02:28 -0400
X-MC-Unique: kk7YNUDjN2Sf0cfhQgaiyw-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D715A5C04E7;
 Mon,  4 Apr 2022 18:02:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Apr 2022 18:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hSxJWB5XCCUB5qbNd
 6GflGTXSko2wfgcW7k/n/OsNlA=; b=RMTQj4MjyWbjVL/1LFTB6MQuzoiEobYIW
 ZoS8eTpOwYDt7Ql2A6x6zlL6VrB3Cf4Eql873N8lOjnH12d5hgKJNmUZJNGKG+33
 HWA94qMnPTpb6WhIN2h0rtKK6ZI2qtAZWQ4Wm2GmXgP7r+B4ujP1A78BL/9UvW0W
 Ca3AU6l7uSMI+3GRsK/0dyIFb43NKXHy/YZgVQfXrjukAWBb/8dSq42cyJaV9ihP
 uN79fXG0/54hHWCmEB7Tz5SglPtHi7FmwvjSzx14NaFZLNsxJAv1ESFJt3UyPbdG
 ouwQ3M99dGlDqYScnJN2mjYZXp2OEzVDsg0ZkryIi3fGqScZbXx6Q==
X-ME-Sender: <xms:82pLYjpVss5LVJYFD10aqjBpNgOwQC19jBmwMRkS0VFBrHOXCGoFQg>
 <xme:82pLYtqB7l-jpIwR6S2Xs0NuFuAnCtz5C0o-bxM0ZN3Rysdb1DCST04wNYiAanIUC
 AjBSl0q9q7-r0w>
X-ME-Received: <xmr:82pLYgN-j9mEYvL23cVCZYtxBfeBmIMvfjX12gGscf8piyog1ZCB-c5YieAa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
 ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevheelffdvgffghffftdeiheeugffh
 hfekffeitdeivdehfeekheegheefleelkeenucffohhmrghinheprhhulhgvshdrihhnne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhi
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:82pLYm7F9pYatrjzkJQmtVHCFY1Rx5S8jWQn12H2u8vz7rsDXwk4Wg>
 <xmx:82pLYi6oHp7j6SDlGg9VXBe-Oo2XxIGEnJQkuLEnfckK6cP3r9R81Q>
 <xmx:82pLYuiLdU1yyCL6BeN-z_TjTG8z4sGaNFsWNHU1AquSwWNRTvUeoA>
 <xmx:82pLYvVVqxqDQWw7d20Ds-fOXr6EXjx1OcMYEL4G8ggh02xJ4us8HA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 18:02:27 -0400 (EDT)
Date: Mon, 4 Apr 2022 18:02:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Yktq8dapJmOv8suO@itl-email>
References: <YktogFA9Lidvo6qa@itl-email>
MIME-Version: 1.0
In-Reply-To: <YktogFA9Lidvo6qa@itl-email>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [linux-lvm] [PATCH 2/3] Disable lvm2 udev rules if `dmsetup
 splitname` fails
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
Content-Type: multipart/mixed; boundary="===============5806974421164760980=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7


--===============5806974421164760980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rT6/VjaS8dphm+nB"
Content-Disposition: inline


--rT6/VjaS8dphm+nB
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Apr 2022 18:02:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/3] Disable lvm2 udev rules if `dmsetup splitname` fails

If the output of `dmsetup splitname` cannot be trusted, the safest
option is to disable all lvm2 rules.
---
 udev/11-dm-lvm.rules.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/udev/11-dm-lvm.rules.in b/udev/11-dm-lvm.rules.in
index 7c58994..f7066b7 100644
--- a/udev/11-dm-lvm.rules.in
+++ b/udev/11-dm-lvm.rules.in
@@ -18,7 +18,7 @@ ENV{DM_UDEV_RULES_VSN}!=3D"?*", GOTO=3D"lvm_end"
 ENV{DM_UUID}!=3D"LVM-?*", GOTO=3D"lvm_end"
=20
 # Use DM name and split it up into its VG/LV/layer constituents.
-IMPORT{program}=3D"(DM_EXEC)/dmsetup splitname --nameprefixes --noheadings=
 --rows $env{DM_NAME}"
+IMPORT{program}!=3D"(DM_EXEC)/dmsetup splitname --nameprefixes --noheading=
s --rows $env{DM_NAME}", GOTO=3D"lvm_disable"
=20
 # DM_SUBSYSTEM_UDEV_FLAG0 is the 'NOSCAN' flag for LVM subsystem.
 # This flag is used to temporarily disable selected rules to prevent any
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab




--rT6/VjaS8dphm+nB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJLavEACgkQsoi1X/+c
IsG9Ig/+N6F10lrWqSo8xLt1ziQhgYTSCfaECCfO3/6MW09s+LhWB6JewFuyvb0q
50OO7yQUOh8XvfAWLrUwfkaprW6xjlWEuVp24fk74baw9njFqWlgJhMmOWeVekCY
GiFxQdNBJF7gqweIVSij25jSzLEBaLbyEeHyiMCkIIExDrXw9wEKf/sRC5+PnRN3
VCz4TFWi8gYHLgL6erldnsR/s2/qsmxrP/67A7q68TM11ZE4ifiMbGKEcsOqGl/v
kKbwwnzGPKQVGveENVul8h2qOCdv2bZRoX5xq93tycOZB4aK+Wwoz8FPMhownym7
/X+TFG1a63rzDTOg6BSI2nry8qN43/PS9bzV4OYanty5tk01u2ufLM7eNCuCgoR9
/2W5R24fj9r8YJKufn3pyZ4arGTEbOa73A5yGzY0MEbBOA5TYiM4w5tDitD5WeL6
q4Lr+pE3rjRarTXMTGCvAfOzdKFVDbJN51NcKU7FfChNFrYm/Ks0G5prP4eKCL53
MEZT75AP1PbxE3U5TArs/FM1QdZdoQ9bFo8rCKv4+gca5bOQGTTnJ1Bb/JLSEMQc
7BwbIhuXs0arSKdLVqFOn57x0b16DcQiBnmRCxIk6a0EI5l5BP2CbwzBVLhAb+kV
GDMneo4oL4jXhCf8bewyIYUmmF+EVBlSZh0rYhqsbGABewUCNa0=
=Z1ny
-----END PGP SIGNATURE-----

--rT6/VjaS8dphm+nB--


--===============5806974421164760980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5806974421164760980==--

