Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A259C433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  4 Apr 2022 21:55:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-IIhV7yCsPIOl9LPWxDAbZg-1; Mon, 04 Apr 2022 17:55:27 -0400
X-MC-Unique: IIhV7yCsPIOl9LPWxDAbZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D5D028EA6E3;
	Mon,  4 Apr 2022 21:55:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3468C409B3E7;
	Mon,  4 Apr 2022 21:55:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8A6BD1940368;
	Mon,  4 Apr 2022 21:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 97F4519451EF
 for <linux-lvm@listman.corp.redhat.com>; Mon,  4 Apr 2022 21:55:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 38BB120296AC; Mon,  4 Apr 2022 21:55:22 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34A9A20296AB
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:55:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5CB238035A5
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:55:17 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-9ifqVgOsMH2kZyD_1SnX2g-1; Mon, 04 Apr 2022 17:55:16 -0400
X-MC-Unique: 9ifqVgOsMH2kZyD_1SnX2g-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 364B65C05D3;
 Mon,  4 Apr 2022 17:55:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 04 Apr 2022 17:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=vvwkqyyu8gI1J7bX9XxtRwN7KPYrQTusY4kh4+4l0
 aQ=; b=oA9rgEegAKqX3ZfVtAV7Fv1C2RmivQFKttyEk3cjAu6MJ0FbS7/ij22PK
 LoPDS8BjWyFYQlkf+fpJmb61GxcDMdvrOpFdd7ql904C7mB5/KYCFb5FaXF7Ji1A
 cD70mBg1L6HHemh9Gz01399otspRvuAOj7VGitFZRc5qgPnid2vFl02Q3PlksNX6
 iQ/RESdcQzA5yAfFN+3XtGd+0sjRUlxe6jSsqLBvgXrQNXhjOQPrkQip8Msy8LAD
 C247CtZm5GXJn4u+9s1MydpP9NGZiXWKPMjVEta/eBuE4rm24NlXWvnzehp6cA9E
 /HyemqEVe1MvULMLpYB0JOP3fTa3w==
X-ME-Sender: <xms:RGlLYhbeRkLr1b_fKehw-gL21Tl7p9V8P8RBCatpC__v6PkHjG-Lhg>
 <xme:RGlLYoZv8vt4HnRKG2mABE2oh143h3ZYz67BfC4ckTHm7JHefyYtbYSdtyHZ-hJ0y
 8QVL5pXfXGvQaw>
X-ME-Received: <xmr:RGlLYj84VBF-M_2-0fPCTiKtffYYcJYvrTW8e7CW6Yk2fY7WiUgOhPsgQ0BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcuofgr
 rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhmqeenucggtffrrghtthgvrhhnpeehveehveetgeffleelgeegueeftdejtdeu
 leetgeelveevueektdeuleelleduudenucffohhmrghinheprhhulhgvshdrihhnnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:RGlLYvr4W8wGG1mqkD2Cbez39P7CFE0OfuzC1Va4Ec12vDSMXSk0IA>
 <xmx:RGlLYspilTNtLLSt1AE5gDEqWyzHZcAk1591wbDOnA3zQK02HzagNQ>
 <xmx:RGlLYlQoe-zvlmeuYsPzX0_r7EzWg-0fpHvX-OxZI53uZ9xADUXjyw>
 <xmx:RGlLYiHNptXOwSyvgAQlODro2MneIP1gCM9uEKtU1n_ZnkwIrsYl1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 17:55:15 -0400 (EDT)
Date: Mon, 4 Apr 2022 17:55:13 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YktpQgrkTyvnI9cQ@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Content-Type: multipart/mixed; boundary="===============0752261155835627597=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1


--===============0752261155835627597==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0KKC/UGJEYWtLoGx"
Content-Disposition: inline


--0KKC/UGJEYWtLoGx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Apr 2022 17:55:13 -0400
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


--0KKC/UGJEYWtLoGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJLaUIACgkQsoi1X/+c
IsGcrw/7BmFHMPOtV2I3GXiZLLEZrbj+OhkQqvfD4PccKM1Vl3TAwIRLLaPPTgHH
rAJqD3tHWvPPEo6VenLUHYk1Ga8RZJ7CMC6CNHpz3K4P3IJ1peo22qbnltz+mSnT
B9LuIDXBI3ovbEOA6fmDgeH6MQnQxvT+5N+OMtotqVbWYnaA3yhI30lNoiOo9OPx
zRl3OLZIjV80iifDSIWvpzIgEyeG7h5zqKE+fPYZ8G48BkdSEoYbPWTJgQRGB7RP
E38JWSDTY+y2KtEoWxbWGRHYAzKsLWg0NElKZYZk+4ftR3xluqClQ/gWkLA71XJX
LpDUXCNFjrZDgSPh1UJuIMn5Kp+c8kb6BEziXshyJVo6aq6dHL3eUpWrK3m/OQZT
rsP0/AgN+Fhsu3GneGvLDDc+lxnJewrL7xryJzueQy5loaq7JtPkutAeAOgt5Ryf
jnvxmgprupfPvpIPTW7PDg8ghTdvrKWQaqxsSxoFHnkYVv6Z3GWbsxmTIj9skpzU
otDnOtZrTfS3FY97xi8Kw2y1cRurTwQu1yR0pLf9x9YfmfJyDp816HXwdjPcbk2X
7/g2+Y7dVq5Gl0198SkTT/AJc2+sv5gHXacii/EPDvO5NIfFYa1/YYgiXttDpBjo
ylRpLuZiedrKC4UZXlf+1lfVVk0hT+W27IbYnyV2ae88pHRfVSs=
=tPMt
-----END PGP SIGNATURE-----

--0KKC/UGJEYWtLoGx--


--===============0752261155835627597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0752261155835627597==--

