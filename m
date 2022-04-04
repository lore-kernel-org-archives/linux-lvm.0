Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02C6C433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  4 Apr 2022 21:57:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-PDDqXSA-PEyrHrP2i_im8Q-1; Mon, 04 Apr 2022 17:56:18 -0400
X-MC-Unique: PDDqXSA-PEyrHrP2i_im8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87DB6811E81;
	Mon,  4 Apr 2022 21:56:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA7610EB0;
	Mon,  4 Apr 2022 21:56:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ED4CD1940368;
	Mon,  4 Apr 2022 21:56:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 92CE019451EF
 for <linux-lvm@listman.corp.redhat.com>; Mon,  4 Apr 2022 21:56:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5DCE3200C0C5; Mon,  4 Apr 2022 21:56:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5945F200BCD0
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:56:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BCFA101A52C
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:56:07 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-UJ1UZBtTOn-aWAF5AzJjaA-1; Mon, 04 Apr 2022 17:56:05 -0400
X-MC-Unique: UJ1UZBtTOn-aWAF5AzJjaA-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 835305C0336;
 Mon,  4 Apr 2022 17:56:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 04 Apr 2022 17:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VXie/V1Cu4bdnD1EF
 WZ+VJzvlZ3pdPIWH7Gp4Afb3nU=; b=VxWM8zfoxPsUjuAPvzsX26kOoIy2tO3dH
 PZKmL69P/kqh8V8iG4zoH/h841VssqlJJ60GpxJH3/mkUOJL/hgZ6bysB1D1Kdg1
 PwwLjJGcJJ2mj3tJC9n3/M++MXZkdA8xo90xYyVyb4MtaJYfKEEp+Q4nKnEm27uU
 CaGNrnGciz5DWX921pNecJGjplwYKjgQBWLWIjfqI7gZJsuZRlPGRDG/bERI2mOX
 WRnF6487Jqqra3yjAch9unvIH/cfErTYz09qgCOh2TFCAihUtx5zR71k0zRV1Q02
 lkbObIEB1w0i9wfnS7KWun/XI2+0JowG3DUAHhnJMOdBhNtp+MUFw==
X-ME-Sender: <xms:dWlLYhMqP3-ZLa18S4YUm0-PLAXBpAI9DNCPIEZ-fVMCY9_F8TJfGQ>
 <xme:dWlLYj8YLHnNtVCEMKHOmYXWvI7axV4L4ghFotcs0feBdI8BMGDZF3rZIPKYV_X-o
 4rHV4oxW1G7Ipo>
X-ME-Received: <xmr:dWlLYgRFAynEnmEoj5OtBnWRLszQsnREYOg6Tws-LuQD7SfgBAiAv-Eih_Xp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
 ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevheelffdvgffghffftdeiheeugffh
 hfekffeitdeivdehfeekheegheefleelkeenucffohhmrghinheprhhulhgvshdrihhnne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhi
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:dWlLYttm-cIJw6M8jl8JmdAnshEgjV4MDwHFouD8SXAwqtUnJ0Lf8A>
 <xmx:dWlLYpdRwQ5ReF93HfBcyIVFhM6IjSMOV8F351W2UoDQAFSi9CKBBA>
 <xmx:dWlLYp0DuKFlfKPF4gR2cbJvBEsUzJIUqw4fjZ7atnv86bD7tbT7Tw>
 <xmx:dWlLYvpznRMZ7EJi2Hq_p6h1TEtwgIgvYQRG9r3cx2I3nOVIzozW8A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 17:56:05 -0400 (EDT)
Date: Mon, 4 Apr 2022 17:56:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Yktpc1D42QLEFqgI@itl-email>
References: <YktogFA9Lidvo6qa@itl-email>
MIME-Version: 1.0
In-Reply-To: <YktogFA9Lidvo6qa@itl-email>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [linux-lvm] [PATCH 3/3] Disable udev rules if udev flags can't be
 obtained
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
Content-Type: multipart/mixed; boundary="===============6669640787050094642=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5


--===============6669640787050094642==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Y6LqAIcX1Dw64BS"
Content-Disposition: inline


--4Y6LqAIcX1Dw64BS
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Apr 2022 17:56:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/3] Disable udev rules if udev flags can't be obtained

In this cased the safest option is to disable most udev rules.
---
 udev/10-dm.rules.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
index b4fa52a..9fae8df 100644
--- a/udev/10-dm.rules.in
+++ b/udev/10-dm.rules.in
@@ -50,7 +50,7 @@ ACTION!=3D"add|change", GOTO=3D"dm_end"
 # These flags are encoded in DM_COOKIE variable that was introduced in
 # kernel version 2.6.31. Therefore, we can use this feature with
 # kernels >=3D 2.6.31 only. Cookie is not decoded for remove event.
-ENV{DM_COOKIE}=3D=3D"?*", IMPORT{program}=3D"(DM_EXEC)/dmsetup udevflags $=
env{DM_COOKIE}"
+ENV{DM_COOKIE}=3D=3D"?*", IMPORT{program}!=3D"(DM_EXEC)/dmsetup udevflags =
$env{DM_COOKIE}", GOTO=3D"dm_disable"
=20
 # Rule out easy-to-detect inappropriate events first.
 ENV{DISK_RO}=3D=3D"1", GOTO=3D"dm_disable"
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


--4Y6LqAIcX1Dw64BS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJLaXMACgkQsoi1X/+c
IsH2DQ/+JBk2eUygjeS2Z/sXEQ+86HNYRrd6aRfWHwvLGITgqiuW/3stx3OzYOLJ
QlIL8xd306y1Y2DpkCACjxSanD+vUYF5g+pFZd3FWCbMIjw+rj+eBO70OyeXNIxn
LghR8kju9fxJ+nVbcqF7C8EdllZUdAUO9blpmX8hUy09T7UKZh2D5q1yz3pKbDPK
9L5CIFKiqSs24ReD38sz1Wz/xUMfCL5GrwjUGIaCyPlVVJf9hcYgow41cDoZIsFw
H2zsJnHtqlQ1x+ofaNYvwjkChJAZko74BENBMFPz0pItavsjqDQT7w0e37LL/XMl
nyEoLm6UVFav7W9/PNdYY5JElNpErXrMPeShRtmZxHBHtymahMq5BbcODME3Wobv
8ROiWXJwTHDTGaH7DMdGETPGhFau2TSJgG4zFxHddFGuxduo2lySPKD9o4duUCmv
YJ3uaDRIGKBIpnWHJP894M+uL0obWXB8z5pXyWbxJEKH1J5iG9K+AbGVZ89hTBDv
LDkt+HL7T5vwQaTWIkugrBsXcwttHz65UMhmUunKfsJFZfXehk7w6hMpBLbMKKqb
0qivHXKG7kATJrn3J0Kz+vZlysjPSX8r4HtfWnSTws0XrVawLRjF5A18P+eN1tna
iqh16PCVWwaIv0l2LsjLpY8/c279xwNpwY5VBnPRaks/VYXrJTI=
=7iC6
-----END PGP SIGNATURE-----

--4Y6LqAIcX1Dw64BS--


--===============6669640787050094642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6669640787050094642==--

