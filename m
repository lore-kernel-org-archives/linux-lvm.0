Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0168BC433FE
	for <linux-lvm@archiver.kernel.org>; Fri,  4 Feb 2022 00:04:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-EML-C1BXMi2viXylKn9wrA-1; Thu, 03 Feb 2022 19:04:36 -0500
X-MC-Unique: EML-C1BXMi2viXylKn9wrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901C18145E0;
	Fri,  4 Feb 2022 00:04:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C91EF55F71;
	Fri,  4 Feb 2022 00:04:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EABA84BB7C;
	Fri,  4 Feb 2022 00:04:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21401ZIj031636 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 3 Feb 2022 19:01:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EA8B44292C8; Fri,  4 Feb 2022 00:01:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67C4401474
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2022 00:01:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE20385A5BB
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2022 00:01:34 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-670-DXi_8CfXPom6R3CVEYFnrQ-1; Thu, 03 Feb 2022 19:01:33 -0500
X-MC-Unique: DXi_8CfXPom6R3CVEYFnrQ-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0FC595C00FF;
	Thu,  3 Feb 2022 19:01:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Thu, 03 Feb 2022 19:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7BCyM7NOvCN/iQwJn
	KApKi4kAZqjVDdYchEqvGRbLqM=; b=AD2W0uAV22VmqYUfkOowvJRKgQWPdk4Cb
	ANB4LDGM3iJKVBIO6jPda0ZcO3wPWYESyyaAa8NGmiE6Da0JMuPAFsqQCfaV5Oun
	HGeKK4d+wPOqwNanrONaG5/lqpn+8qwYER+tAc+YiYCziezMM2jfmbFXH+lZi48i
	gCw8b2YvX9IAR9XvVKaTNSLRq3iJQidSm8ynuv45dQ2e3yJM8W9HvD04d/Xng3A0
	OKMFnN3LlsPJRcFC9WVRnOBhGiuDEpY+MhwHnjkYV1UGCk9jNB1zOl2SC8cmrKxr
	h6amp8GBfCZ44SLtaTm5OCNAoOzihnA+SjEPCz3JeiSrMuQ6X7iSw==
X-ME-Sender: <xms:3Gz8YVE6OarG1gEXgl493KSIhjEBMFoCupejOoFDIgsj0H4VJ-V2dA>
	<xme:3Gz8YaW2ZC3Hlq1hd_RGx-C10E4EgIt5koDJWFJl-H_KToeve6E_XW7B434FF7uvE
	x_SOcByrIIFTF8>
X-ME-Received: <xmr:3Gz8YXJadj3Ga-6mD1LBs_TKAqwUOwQ66P5ITUCoYIx4xLYzEM-wIN6RfghI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeekgddujecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
	rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
	grsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdeuiedvfeeiudfgjedtuedtleef
	vdeukeeltddugeejvdeiudekfefhueetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
	hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
	sgdrtghomh
X-ME-Proxy: <xmx:3Gz8YbFaogKuEhmWjKsaWWHabrIj_oT0LmiIHlFyDRkxSxOv5M85xQ>
	<xmx:3Gz8YbVnC1IUKNas-0PGoZhGuxyENvQFWlZhiGfnsf4G2hBkMIRAPg>
	<xmx:3Gz8YWNiyj-dA8DYJNkxXyscrOERonaHZy9M1FbNISezKb8ueVTBTw>
	<xmx:3Wz8YSA5CbiKYl-VE-QfElnSzJXS88uSmW-FzmIKomYQ4EenYwhNrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
	3 Feb 2022 19:01:32 -0500 (EST)
Date: Thu, 3 Feb 2022 19:01:28 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Yfxs2c88Nim9feN/@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
	<YfcN6KHxLe3/krTX@itl-email>
	<CAJNi=XrO3+N63W1zxVhP0_y7CrHB=mmKpA2_MrVRSRX_e2u53A@mail.gmail.com>
	<YftesLAiW8xoFxqq@itl-email>
	<a2786ae3-5339-782f-ae31-5411a7b84bcd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a2786ae3-5339-782f-ae31-5411a7b84bcd@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
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
Content-Type: multipart/mixed; boundary="===============0042340537487065280=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13


--===============0042340537487065280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PwztLmyfDqLsC5lP"
Content-Disposition: inline


--PwztLmyfDqLsC5lP
Content-Type: text/plain; charset=utf-8; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Feb 2022 19:01:28 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin

On Thu, Feb 03, 2022 at 01:28:37PM +0100, Zdenek Kabelac wrote:
> Dne 03. 02. 22 v 5:48 Demi Marie Obenour napsal(a):
> > On Mon, Jan 31, 2022 at 10:29:04PM +0100, Marian Csontos wrote:
> > > On Sun, Jan 30, 2022 at 11:17 PM Demi Marie Obenour <
> > > demi@invisiblethingslab.com> wrote:
> > >=20
> > > > On Sun, Jan 30, 2022 at 04:39:30PM -0500, Stuart D. Gathman wrote:
> > > > > Your VM usage is different from ours - you seem to need to clone =
and
> > > > > activate a VM quickly (like a vps provider might need to do).  We
> > > > > generally have to buy more RAM to add a new VM :-), so performanc=
e of
> > > > > creating a new LV is the least of our worries.
> > > >=20
> > > > To put it mildly, yes :).  Ideally we could get VM boot time down to
> > > > 100ms or lower.
> > > >=20
> > >=20
> > > Out of curiosity, is snapshot creation the main culprit to boot a VM =
in
> > > under 100ms? Does Qubes OS use tweaked linux distributions, to achiev=
e the
> > > desired boot time?
> >=20
> > The goal is 100ms from user action until PID 1 starts in the guest.
> > After that, it=E2=80=99s the job of whatever distro the guest is runnin=
g.
> > Storage management is one area that needs to be optimized to achieve
> > this, though it is not the only one.
>=20
> I'm wondering from where those 100ms came from?
>=20
> Users often mistakenly target for wrong technologies for their tasks.
>=20
> If they need to use containerized software they should use containers like
> i.e. Docker - if they need full virtual secure machine - it certainly has
> it's price (mainly way higher memory consumption)
> I've some doubts there is some real good reason to have quickly created V=
Ms
> as they surely are supposed to be a long time living entities
> (hours/days...)

Simply put, Qubes OS literally does not have a choice.  Qubes OS is
intended to protect against very high-level attackers who are likely to
have 0day exploits against the Linux kernel.  And it is trying to do the
best possible given that constraint.  A microkernel *could* provide
sufficiently strong isolation, but there are none that have sufficiently
broad hardware support and sufficiently capable userlands.

In the long term, I would like to use unikernels for at least some of
the VMs.  Unikernels can start up so quickly that the largest overhead
is the hypervisor=E2=80=99s toolstack.  But that is very much off-topic.

> So unless you want to create something for marketing purposes aka - my ta=
ble
> is bigger then yours - I don't see the point.
>=20
> For quick instancies of software apps I'd always recommend containers -
> which are vastly more efficient and scalable.
>=20
> VMs and containers have its strength and weaknesses..
> Not sure why some many people try to pretend VMs can be as efficient as
> containers or containers as secure as VMs. Just always pick the right
> tool...

Qubes OS needs secure *and* fast.  To quote the seL4 microkernel=E2=80=99s
mantra, =E2=80=9CSecurity is no excuse for poor performance!=E2=80=9D.

> > > Back to business. Perhaps I missed an answer to this question: Are the
> > > Qubes OS VMs throw away?  Throw away in the sense like many container=
s are
> > > - it's just a runtime which can be "easily" reconstructed. If so, you=
 can
> > > ignore the safety belts and try to squeeze more performance by sacrif=
icing
> > > (meta)data integrity.
> >=20
> > Why does a trade-off need to be made here?  More specifically, why is it
> > not possible to be reasonably fast (a few ms) AND safe?
>=20
> Security, safety and determinism always takes away efficiency.
>=20
> The higher amount of randomness you can live with, the faster processing =
you
> can achieve - you just need to cross you fingers :)
> (i.e. drop transaction synchornisation :))
>=20
> Quite frankly - if you are orchestrating mostly same VMs, it would be more
> efficient, to just snapshot them with already running memory environment -
> so instead of booting VM always from 'scratch', you restore/resume those =
VMs
> at some already running point - from which it could start deviate.
> Why wasting CPU&time on processing over and over same boot....
> There you should hunt your miliseconds...

Qubes OS used to do that, but it was a significant maintenance burden.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--PwztLmyfDqLsC5lP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH8bNoACgkQsoi1X/+c
IsGEhw//RXi2rd0y0tk3IoiXEy4KUpWRKckDRF0dhGyL14sTmX8ttpsVOGmBT6Bv
hvoe835wIGNftl7LXA5KaT0wvECVIXYLMLlgmYzMc7+aBApoIBeaqb2ZJfO9MxHS
dlUZQyemYJb4ieoCp2sypINOFnuY5/owXukarPZ7IuVl96WYW5/PfEv+FeBWO6UD
ZgLZ0sQLX6asHiKAr2+yRx+HBdwDcAktznnfY6UIu8cWg4UK6Sjx8fDPUIErMPk2
Wbb3OFcCECbkz6+hTVGssIRt5dEM2UUGX3DeL0yIED3fQYaHeuVX8hsr1/0kH1qk
9DooFx2xHB4Z4vzq+XH4MFJk29BjaE+mCzhI5exBI8VNEePXysHI81x4oNmS42F4
a9HsVOyIveHyIE9Q7z/ViKmX5DTMa87JY5xRDC8olXFOPyHgU/Dev5XEkB/7vCP7
wYyGJJ+YA6kNO13muYqR/26xgGTg13Ph/TYkeZbQe2S/ze1/GcDFYloVbg/Vqv8Q
H+2C/a6b2JaMo8G3/8nIjl3WTzpaiNEwBKTv8YlhDjuN23ocOhVsYuYdwlqzznW0
+uDTc2Oqcy/U7qd0gaBugF4PIvZoSDauNl35MU1HKNDOXGvu7rhR8bBu8mdkFA3S
Z1iISFeQPiG87E7Y/13dSv0L4p/IxqwtyrcPbceetcKIIYh+ux4=
=egqN
-----END PGP SIGNATURE-----

--PwztLmyfDqLsC5lP--


--===============0042340537487065280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0042340537487065280==--

