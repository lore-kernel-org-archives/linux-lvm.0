Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54780C433FE
	for <linux-lvm@archiver.kernel.org>; Wed,  1 Jun 2022 07:36:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-UJ8mahVOPqme1PlrBRRZ6A-1; Wed, 01 Jun 2022 03:35:58 -0400
X-MC-Unique: UJ8mahVOPqme1PlrBRRZ6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D60A5833976;
	Wed,  1 Jun 2022 07:35:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8543B2026D64;
	Wed,  1 Jun 2022 07:35:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD0F11947071;
	Wed,  1 Jun 2022 07:35:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 447F5194706A
 for <linux-lvm@listman.corp.redhat.com>; Wed,  1 Jun 2022 07:35:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A4CB1731B; Wed,  1 Jun 2022 07:35:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 261CF8288A
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 07:35:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B3B1101AA46
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 07:35:53 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com
 (wout4-smtp.messagingengine.com [64.147.123.20]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-_BpulTIbOkqLdPZOs9f6jQ-1; Wed, 01 Jun 2022 03:35:51 -0400
X-MC-Unique: _BpulTIbOkqLdPZOs9f6jQ-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D4B613200B59
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 03:26:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 01 Jun 2022 03:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1654068390; x=
 1654154790; bh=gsPOFhUUONbQ+TS4BbrUNKI8vsce26bQKnRzds3l9nI=; b=l
 f7Zt2a5LmpKIY75DJVeXbAiAG6PqnplOcxkwizBdvJF1LIOVJMC7z59QFYmfoJFP
 95puldlQaPBpghwWTgh3r0XZ8UXNS9kIF/7hg52pez7tWHsvo9nQG8PtQCxsumy7
 vnZ9j0LoeCrj2EP27lmGLAsmn2axAVjn2sbOtF1tHZJd0BVjt8tqNVbvgafOKUaw
 YWVQ2VnkNrkKyofykD5UcAeu31m8JSPOidaHEWtuc5rzU/bLQkeKlvi3WJ5PF3rI
 jZUW7W3Tgj8Cj+tN5R2GY4mKLfbabSyVJKZfn6szilRSqGzHVHcDRy6fShWpIeI8
 tHjgUPl/HyRpbbfdDQBvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654068390; x=1654154790; bh=gsPOFhUUONbQ+TS4BbrUNKI8vsce
 26bQKnRzds3l9nI=; b=j7htslC6ynOYvCFUMc20hYXRVvSO4K36YTBIrs/MNkNE
 PNe6tJmMXEBuYMCr92i52q9KO/iovEpmg/VKxlryXF5dIFHg0T4O7HAd4AYyHrcH
 e36bNplLtgxO/km6rwD6Q42X613dTgeVgOdSW7Gjb8A6q+S9VMrPZVG2CJfqq3zx
 0pTvCTcdY+deslTjO1IgMk5oWsDjb5mUW2NrJZW17xTfyLmF6MLcwgFUjCcwXm5S
 a6UMHT9RUXGM5pO68FrmkZUR2WCedpyu7aLV4tTbrARgxrP1pOQ2eAxqkt/D6kzw
 45N7Hq8duuEdBUQr1RzFvBQlTqoXjFuP1+BZNXq+pg==
X-ME-Sender: <xms:phSXYkq7UlMmFfG0r6nZAXiqiAyCZmRToAqZY0z4gq0Sfom__wlsYQ>
 <xme:phSXYqpWrOoClS24oy7_0Bo34XtaCJn8CWznIkSfd4qvK3MqDe8zVy2baPDgzSY1B
 GuGo0dJ647V5Ac>
X-ME-Received: <xmr:phSXYpP6VQmvthayNGI4_Hgn45zbCkr8JmNzMSI8P75qmssWsX2Lz04irLcL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhi
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnh
 epvedvteehueeukedtfedvkefhjeekieekteehgeegueeuieevtdduteehvdfgfeevnecu
 ffhomhgrihhnpehprghsthgvsghinhdrtghomhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
 shhlrggsrdgtohhm
X-ME-Proxy: <xmx:phSXYr4uI_e8Ib3Q6mblXIb3iPMb2cl0LQrikrhtUCCAzOUs_oPZpg>
 <xmx:phSXYj5fZe3gHtDX5CX4Gxbce-SL2aM2sZZAX2hYxmtxRe8l-Qqy0g>
 <xmx:phSXYrjdyTkZjbN5DtjLbtUcNIUweI7hMdp3H0j7DH4Qfc4ppHSEMw>
 <xmx:phSXYlGF_7PpXxYd6gENqmfwa3n4NpCkAS_7y1MTtp4WovKwZCnNuA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Wed, 1 Jun 2022 03:26:30 -0400 (EDT)
Date: Wed, 1 Jun 2022 03:26:27 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YpcUpGsiSjwK8cG2@itl-email>
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod
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
Content-Type: multipart/mixed; boundary="===============5650656627184208528=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4


--===============5650656627184208528==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EyxwMehO+4T4+Q5j"
Content-Disposition: inline


--EyxwMehO+4T4+Q5j
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 1 Jun 2022 03:26:27 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod

On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:
> Hi Roger. Thanks for your reply. I have rerun the command with `strace -f`
> as you suggested. Here is the pastebin link containing the detailed output
> of the command: https://pastebin.com/raw/VRuBbHBc

Even if you can get LVM =E2=80=9Cworking=E2=80=9D, it is still likely to ca=
use data
corruption at some point, as there is no guarantee that different LVM
processes in different namespaces will see each others=E2=80=99 locks.

Why do you need to run LVM in a container?  What are you trying to
accomplish?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--EyxwMehO+4T4+Q5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKXFKQACgkQsoi1X/+c
IsHgrA/9GHro+IAfeKojAEFwUeftqtjaPCyIuIDy+kHLYQzMJaBDTrxJJEU/lDnK
9Swf/F5M4wK3eEumDfWjSYLIZIR2TBIdtrgp63icLvsuu9urz0TJwhl/v+0F6Z2U
EiKGSOJz5wjWonJmwH/5GKE/ipvhEvEpaWD1Ai8XzDx3HbgHM0VjvLFDEXnebyiq
OZ5SkrWn1ch61kvyMAyqKZA7hnvuscGY9XFHnGR1moa+8W3karETMbA5SNEasLuM
Sje5UDqIdOCNe2AzPZkKsrXlafBCSZE8+hEPuIaJfVyBArxqB7fLx/3EoGfQI7GN
Jr3jro9/N7SoA7ZxWpcp/NLnPs36e7RA5Pl2VIEkRSlpbEowk2PNWN1JTqPqIBE/
TrA8VB95D7DYkKeGx1GgzXnszjePUX0CsJ0sJNxdWJ+BkE/5UkrxL4FM1mVOyzRJ
l8xGD2cjjizHrcmacILY7PkBASnRgzSlQGeVvmS2F2JO7mVrkkBQwx335hGCuxnG
SwnWqFRqc+x8z+rZV7zm5L3lm5BBiP8WQqAmi91QGoZ8DTv9ppO/HUOIYJp1pjH5
jSPoVHIqG5lMb07hphIOm6YUkD12jzZWy7QR/TM25t9uN+3G9mC8g7aOm0G7Whu7
elei9i6ZiEKYEFIBC3Nm2exKcHq8rc4QfClUbjNCrhEflUclzYY=
=0lv/
-----END PGP SIGNATURE-----

--EyxwMehO+4T4+Q5j--


--===============5650656627184208528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5650656627184208528==--

