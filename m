Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B89C433EF
	for <linux-lvm@archiver.kernel.org>; Sat, 29 Jan 2022 20:34:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-wFr6t5XzMtidrZxhu4T0hg-1; Sat, 29 Jan 2022 15:34:37 -0500
X-MC-Unique: wFr6t5XzMtidrZxhu4T0hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C677814243;
	Sat, 29 Jan 2022 20:34:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D466C18C;
	Sat, 29 Jan 2022 20:34:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D4ED4BB7C;
	Sat, 29 Jan 2022 20:34:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20TKYFXQ006594 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 15:34:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF66E1402401; Sat, 29 Jan 2022 20:34:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA6C81402400
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 20:34:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF0E63C01C01
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 20:34:14 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-256-m1dIlmJ-Phm1v5DAZxSH4Q-1; Sat, 29 Jan 2022 15:34:12 -0500
X-MC-Unique: m1dIlmJ-Phm1v5DAZxSH4Q-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 313325C0129
	for <linux-lvm@redhat.com>; Sat, 29 Jan 2022 15:34:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute2.internal (MEProxy); Sat, 29 Jan 2022 15:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=974ou9k2MZMsIBEnl/jvKiuY+8f3qQEtdGQ5m5FjF
	II=; b=H/wfIwgzDqjmtZ72wWwAqrCr9Evbl237KPjI1ocXDF9UuKva4ZbEhAfb0
	ip/x20lqC6wDqCdWlo9W70TCIA1QFRuSQJvBksapjhRVQiQlZts2nw8Zh1FtihM7
	qNuBxWgXh6i4qRGwTGxZS+EePrFpY92d1Tkbh41B8lnhKX3EHPDLwlBVIbgOWQHm
	UZZJlNcuz7BXHJYfUsN3Oo2Ffnp3favFFuzvZrokpALM2TqQiPGli6N2fzB6uYyq
	4SAQT3EwYhOLFOjljxcdF+/D2JjaoZ1QYHSNUKHrBe5YM/Co7X3FhCGAPCRUyDum
	j8vHbFUONb9Ahaf7GOUh0hKgPtVbA==
X-ME-Sender: <xms:w6T1Ybe8En8uzrSrw4lyHtPoX-JG-dln9migQt21yS_7ygEzcUnrbQ>
	<xme:w6T1YRPgMOMsmSqtvypfZmXzVMf1QVuX-e49seijIYeklVosdFem6RbYYPX8rBrss
	adsi9efiQOmT9E>
X-ME-Received: <xmr:w6T1YUjSBKiYI3r2fhgN8IujsKX1zFBnhxistVlL0JJ_IE1h9rcNqsZXZ6qi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgddugedtucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtroertd
	dtvdenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehi
	nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgf
	eujeduueehvefgtdekfffgudefgeefjedvkedtleffiefhkeffgeevueehtddtnecuvehl
	uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinh
	hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:w6T1Yc-kPW6RC7EGNYrmh-S0pOokn6GolAKirziiuYlnmwgjxJLL1w>
	<xmx:w6T1YXvqaP84Ioz9_L5v2LAhsoBWCbP1rufWhNNEyJBPztxCj4nhtg>
	<xmx:w6T1YbH0oFbeIj5StBW9Z7NayRiewUNTHW9m5HJoAqxlwpJYUfWXGg>
	<xmx:xKT1YV5nY4C_yWu3gnLJjDc1XmGYvgXOOLhDRnHG2vpwV0XJ0gZtXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
	<linux-lvm@redhat.com>; Sat, 29 Jan 2022 15:34:11 -0500 (EST)
Date: Sat, 29 Jan 2022 15:34:06 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YfWkwtOTFYxDyYrW@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] LVM performance vs direct dm-thin
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
Content-Type: multipart/mixed; boundary="===============7910790799003182048=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12


--===============7910790799003182048==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rzBsynlfHlVumIYw"
Content-Disposition: inline


--rzBsynlfHlVumIYw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Jan 2022 15:34:06 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: LVM performance vs direct dm-thin

How much slower are operations on an LVM2 thin pool compared to manually
managing a dm-thin target via ioctls?  I am mostly concerned about
volume snapshot, creation, and destruction.  Data integrity is very
important, so taking shortcuts that risk data loss is out of the
question.  However, the application may have some additional information
that LVM2 does not have.  For instance, it may know that the volume that
it is snapshotting is not in use, or that a certain volume it is
creating will never be used after power-off.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--rzBsynlfHlVumIYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH1pMIACgkQsoi1X/+c
IsHIrxAAu+SGyB5JbAw95wMzm7QHgbiJvEb3BNKRiue7mQftAj2oVZE2f5vkxQa8
tAU+liJ4zE/Vp37qxKTssTy4OCa26ASaLjuapS/WDQ2OZa1HFowkW6KtmjRcaBLQ
KoPOCUVWFiEMJKNZSvqlPIPub340xfPY1fDar+N/nOMjdu9nfHQyBm4MaLgsN9zt
b4mH40ax2MBYjO0lzQIL9ecgYE8neBXy9nT/BZFQhBWcizC+roRf/gJllZXIhnAO
lAcj+fhPpBtQ+Eh6oLSQaZ7vhZO1/bhOTWaYZ8h1KXAOBtUJ3DYPRSZbXPuxuowm
VtYMk2KHUChmfs5gbIJjqL60ie5iDXhAmUhimBeRq91YAYEFQ1Y7Zmx9WCNCnAGM
yoS389VHc9bqgJy+rJ/briv859I3Iyr9SoABg0nSq+NkH4oomTqwGiEeq9b1WpxI
NxV4EJcRTTtQ4mWbhKSr2AfM6L2rjCI8yfUI7m1ZTR+5NK6RfoA1J9f99L1gCADi
v01pyzwY6TCEu/b6WCizY9or5dk3jRLBBbQbHZA8uSkgKI/c2LiSRC86Ano01Kh/
gqrdxmmrnDmduI3p3LMenCZPG1k9tXNeK0uO81OuFyFMjiipXq2/LoGkHdz/CuNI
LzsGO1Sc0j7hPJnmhhuq6AvlaZvB6h+nFRGpf/c2WMMj6Sg0o9g=
=u+UB
-----END PGP SIGNATURE-----

--rzBsynlfHlVumIYw--


--===============7910790799003182048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7910790799003182048==--

