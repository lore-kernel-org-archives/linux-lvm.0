Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C78C433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Feb 2022 00:23:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-JyBuYS6iN6uSayu-gkI0Hw-1; Wed, 02 Feb 2022 19:23:52 -0500
X-MC-Unique: JyBuYS6iN6uSayu-gkI0Hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C2AC802C80;
	Thu,  3 Feb 2022 00:23:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CAE46982;
	Thu,  3 Feb 2022 00:23:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76B5E1806D1C;
	Thu,  3 Feb 2022 00:23:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2130NLth002597 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 19:23:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2127E40885BC; Thu,  3 Feb 2022 00:23:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC4D40885BB
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 00:23:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 050B11044561
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 00:23:21 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com
	(wout1-smtp.messagingengine.com [64.147.123.24]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-606-tU1qSuzfM7Cv77I_xeLygg-1; Wed, 02 Feb 2022 19:23:19 -0500
X-MC-Unique: tU1qSuzfM7Cv77I_xeLygg-1
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 4B657320214F;
	Wed,  2 Feb 2022 19:23:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Wed, 02 Feb 2022 19:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yjFp7UfkNS+7tBtLV
	Wy6K2hd4LNUgef9c9J/hq30/VY=; b=ARFhbiLJO4wdg++8QJ8DzdqExFMfhKHVi
	65U+UhtJEMJWd5QmlRlJSW5HnagFJsXKXN89oAbZKKdJXW/xn0nTrWPdtgbrtoTR
	dS97aMK2f9j0DUJr+kJ+AaGT9t6mReODYRbBcjESwDw9hwd1xFElqpFS2zqhvb9F
	19HbuMrxiCBBpK00GkaGH6WyFGGC1RLg4/zCcwC+D6Qn2lP5hh9IB8AFMUYjPD2G
	A7tX8BLkEfa3lBSnHVsO+qydQd0QuH26DuhwlKej6/Qf5QrnzJXB11CLVkmrJUeb
	mgJorQwoVHiDaS3DfzecbkjPHIYVBJdDjZT4+LXKqpTWvhQbzSArA==
X-ME-Sender: <xms:dSD7YaPqoyDrhasEa6VysRThyuFaMLdhy3pkACrslHyPsLQCzrwjQw>
	<xme:dSD7YY910xoKxs67ZvL4OwRzcis0lCaml_WCAK0HdL7BnEZRkbTfunK-31fSLo1wC
	pVDjIqbOqnAjm0>
X-ME-Received: <xmr:dSD7YRTg28Cyh0vluSZQwm994JOW5F8GKyHrRAJm80eHQzHdUFFkKkTfsicC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigddulecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepffgvmhhiucfo
	rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
	grsgdrtghomheqnecuggftrfgrthhtvghrnhepffevledvjeevieelieduudehveehteet
	ffeljeeigefhkeegieeutedutdettdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
	hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
	sgdrtghomh
X-ME-Proxy: <xmx:dSD7YavMQ9gHbG7WapO_tVUIJVri5iooZgeCFItNRWc1rYV280YiUw>
	<xmx:dSD7YSeLpzKTlInMJLRHvnrzGQnc4ohE2XWmopZHv2226Sdqk_EySg>
	<xmx:dSD7Ye3lNbPli11mxhprx1Trg29tmMMzho58ZWRp4x1TJwuYwdNU3A>
	<xmx:dSD7YUortQmTH5SMSw5BbwspWkU3vjFtC0bwFCCA2MH-RqKODNw0bw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
	2 Feb 2022 19:23:17 -0500 (EST)
Date: Wed, 2 Feb 2022 19:23:13 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <YfsgcwXnOouviZgc@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<849ab633-ec3d-a0a5-38bf-72b87bbba2c5@gmail.com>
	<Yfnn+BcjuukqjfVO@itl-email>
	<3adf6eb1-94ac-dd91-e3e6-f0d44cd36b89@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3adf6eb1-94ac-dd91-e3e6-f0d44cd36b89@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Content-Type: multipart/mixed; boundary="===============7711471767446137370=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12


--===============7711471767446137370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gDJjnsTNTRdYYLLf"
Content-Disposition: inline


--gDJjnsTNTRdYYLLf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Feb 2022 19:23:13 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: LVM performance vs direct dm-thin

On Wed, Feb 02, 2022 at 11:04:37AM +0100, Zdenek Kabelac wrote:
> Dne 02. 02. 22 v 3:09 Demi Marie Obenour napsal(a):
> > On Sun, Jan 30, 2022 at 06:43:13PM +0100, Zdenek Kabelac wrote:
> > > Dne 30. 01. 22 v 17:45 Demi Marie Obenour napsal(a):
> > > > On Sun, Jan 30, 2022 at 11:52:52AM +0100, Zdenek Kabelac wrote:
> > > > > Dne 30. 01. 22 v 1:32 Demi Marie Obenour napsal(a):
> > > > > > On Sat, Jan 29, 2022 at 10:32:52PM +0100, Zdenek Kabelac wrote:
> > > > > > > Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):
> > > My biased advice would be to stay with lvm2. There is lot of work, ma=
ny
> > > things are not well documented and getting everything running correct=
ly will
> > > take a lot of effort  (Docker in fact did not managed to do it well a=
nd was
> > > incapable to provide any recoverability)
> >=20
> > What did Docker do wrong?  Would it be possible for a future version of
> > lvm2 to be able to automatically recover from off-by-one thin pool
> > transaction IDs?
>=20
> Ensuring all steps in state-machine are always correct is not exactly sim=
ple.
> But since I've not heard about off-by-one problem for a long while -  I
> believe we've managed to close all the holes and bugs in double-commit
> system
> and metadata handling by thin-pool and lvm2.... (for recent lvm2 & kernel)

How recent are you talking about?  Are there fixes that can be
cherry-picked?  I somewhat recently triggered this issue on a test
machine, so I would like to know.

> > > It's difficult - if you would be distributing lvm2 with exact kernel =
version
> > > & udev & systemd with a single linux distro - it reduces huge set of
> > > troubles...
> >=20
> > Qubes OS comes close to this in practice.  systemd and udev versions are
> > known and fixed, and Qubes OS ships its own kernels.
>=20
> Systemd/udev evolves - so fixed today doesn't really mean same version wi=
ll
> be there tomorrow.  And unfortunately systemd is known to introduce
> backward incompatible changes from time to time...

Thankfully, in Qubes OS=E2=80=99s dom0, the version of systemd is frozen and
will never change throughout an entire release.

> > > Chain filesystem->block_layer->filesystem->block_layer is something y=
ou most
> > > likely do not want to use for any well performing solution...
> > > But it's ok for testing...
> >=20
> > How much of this is due to the slow loop driver?  How much of it could
> > be mitigated if btrfs supported an equivalent of zvols?
>=20
> Here you are missing the core of problem from kernel POV aka
> how the memory allocation is working and what are the approximation in
> kernel with buffer handling and so on.
> So whoever is using  'loop' devices in production systems in the way
> described above has never really tested any corner case logic....

In Qubes OS the loop device is always passed through to a VM or used as
the base device for an old-style device-mapper snapshot.  It is never
mounted on the host.  Are there known problems with either of these
configurations?

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--gDJjnsTNTRdYYLLf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH7IHIACgkQsoi1X/+c
IsGTwA//X02hG2sHF08tTsHRSyYNdE2nwW0bnJXwxXTEGHlYEfEq6AfVm8AJ2DhC
rXrTaKjxccYSj8YWbcE2yXItTTm69g4j0Bh6Kxg92U4xfz1i+YBoT8Ppf5BL9ae5
tgj0aj6495UmDIy5UsYjGe2pJ6lvZFj78nJH8bfSXpge+q7nqn2yNPOgRVRYPQOq
rRBOEsR/D4yP3RTbdfphxCnE5jenKUf93vo5bCrmVS91PXlurd0ZrCUHTuXiot9i
Tcc3s9i0JtFlOs7bUtLH1/XxI+JWWws0gi5rqiE6uTfTi6mrsF5hDWxqr8Fwug05
gmbJfbPhbCbupmadcoPiS9UCECOPjRHKknzvF8dZn+tIVpHBEiUrdky+RljlaKtZ
IfbdGtK4B7ezZn0kggsFzFNanoKM5XLtl8Y3wDFmM+2sIqop0nXK8r4XZzth4PRu
JQO24DwjlWKLnKEyYh8HvlcxJvk+ugnZag78wUG+2zeB67KoEkgwO4+g2vp00Z+7
cDcdFQs+6nvjAz5okHPI1X4HsES7158VQ36J2C5GMFmxXcpWSyk6cUF4KMU1/WLM
VBwz6XDODW8Yy+fTkFBTsINCHOYIB4g1ADDv5qXdvhsM8sYeNWvDVMBrik8CdFF3
5vK8atRoSP+sPUyCIAmOQCzZ3MHu0wAf9jsU9tWYrIH+lg6IZSM=
=93YM
-----END PGP SIGNATURE-----

--gDJjnsTNTRdYYLLf--


--===============7711471767446137370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7711471767446137370==--

