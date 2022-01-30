Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD37C433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 16:46:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-ivfIsA5CNDCQOsOyTYh4UQ-1; Sun, 30 Jan 2022 11:45:59 -0500
X-MC-Unique: ivfIsA5CNDCQOsOyTYh4UQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00884814245;
	Sun, 30 Jan 2022 16:45:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 390EA798DE;
	Sun, 30 Jan 2022 16:45:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C56D1809CB8;
	Sun, 30 Jan 2022 16:45:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UGjV9J016879 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 11:45:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D637E40CFD16; Sun, 30 Jan 2022 16:45:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1A4D40CFD10
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 16:45:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9A1C803C9F
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 16:45:31 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-246-p5tIk8-jNhaDB47_9AIqcg-1; Sun, 30 Jan 2022 11:45:29 -0500
X-MC-Unique: p5tIk8-jNhaDB47_9AIqcg-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6C5C95C0095;
	Sun, 30 Jan 2022 11:45:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Sun, 30 Jan 2022 11:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0NswwQ+ls5aJj/ro4
	tnwsgP+FXHQ/eKBalwgjArGH4s=; b=dHJp7ZoHac7vaG5dIsYmoWQuNQ2xQeMiT
	4CNwgQyNLzQNqHoH4L02mu7wWDaK01BbScRg9NsFn4JuMKlDqRNWXiEHW//LZnwb
	2TlpB0AQPAYNqFG9RScOvJLpC6Yj184/Vx/WSL3rdtYKPwl9+mq7UUTd0t79F/Yy
	JlhbJi1WZ1dI3rRl8+DZEXzR0bIhttX7bdqjJDRO9l5CW6R/wdj+9UPJQWIWBges
	ojNskkVS9mlB094faZ9Uz+2comfx21ob+izmLAQksyI+zsMEbAQ4rbGPQn2ncjT7
	2RKkuq7ZReZquLHsiNKCsihRjKnjiNY8zZ0LmsxiZ18tnDIvBOMLA==
X-ME-Sender: <xms:qcD2Yd0a_OO42MjHJh1wrTuGNH8cMOoUHqawK4ZkZjA8XnOj5xc2XA>
	<xme:qcD2YUEaLETm-i9dYTC4pqFWl995iFqp66ST05Hwcfs99J2s7E17fE2GxBuj7-AMC
	iDs7HCee5DmIKU>
X-ME-Received: <xmr:qcD2Yd7rqS_sgXZcDZOT-wM_DCVzkMiiw6rXXKSkkgoOQ44Ns54xNerMqsQ5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgdelvdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
	rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
	grsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdeuiedvfeeiudfgjedtuedtleef
	vdeukeeltddugeejvdeiudekfefhueetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
	hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
	sgdrtghomh
X-ME-Proxy: <xmx:qcD2Ya1Nzi7drLQqlpRIsKsHoi8v3rmgDkh3AqLZt7l9jIb1EAp2-w>
	<xmx:qcD2YQFFYCWG5y9q96fa1hivZIj84kJiwBAfo0O0kcfKlDYhjM8b7Q>
	<xmx:qcD2Yb_jzmPrpAr1c-Uo0YaR2fSCowkeBmrl1WlTQv842KZaF3mOhw>
	<xmx:qcD2YTz0JsiH5qW4ee2A3QKpS7vgNJreyY6VzB00XjyfuC4oGowhvg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
	30 Jan 2022 11:45:28 -0500 (EST)
Date: Sun, 30 Jan 2022 11:45:01 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <YfbApm+9ac6iBbbg@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Content-Type: multipart/mixed; boundary="===============4831225841972409589=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14


--===============4831225841972409589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m3WkM6yTCwuCYYPP"
Content-Disposition: inline


--m3WkM6yTCwuCYYPP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Jan 2022 11:45:01 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: LVM performance vs direct dm-thin

On Sun, Jan 30, 2022 at 11:52:52AM +0100, Zdenek Kabelac wrote:
> Dne 30. 01. 22 v 1:32 Demi Marie Obenour napsal(a):
> > On Sat, Jan 29, 2022 at 10:32:52PM +0100, Zdenek Kabelac wrote:
> > > Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):
> > > > How much slower are operations on an LVM2 thin pool compared to man=
ually
> > > > managing a dm-thin target via ioctls?  I am mostly concerned about
> > > > volume snapshot, creation, and destruction.  Data integrity is very
> > > > important, so taking shortcuts that risk data loss is out of the
> > > > question.  However, the application may have some additional inform=
ation
> > > > that LVM2 does not have.  For instance, it may know that the volume=
 that
> > > > it is snapshotting is not in use, or that a certain volume it is
> > > > creating will never be used after power-off.
> > > >=20
> >=20
> > > So brave developers may always write their own management tools for t=
heir
> > > constrained environment requirements that will by significantly faste=
r in
> > > terms of how many thins you could create per minute (btw you will nee=
d to
> > > also consider dropping usage of udev on such system)
> >=20
> > What kind of constraints are you referring to?  Is it possible and safe
> > to have udev running, but told to ignore the thins in question?
>=20
> Lvm2 is oriented more towards managing set of different disks,
> where user is adding/removing/replacing them.  So it's more about
> recoverability, good support for manual repair  (ascii metadata),
> tracking history of changes,  backward compatibility, support
> of conversion to different volume types (i.e. caching of thins, pvmove...)
> Support for no/udev & no/systemd, clusters and nearly every linux distro
> available... So there is a lot - and this all adds quite complexity.

I am certain it does, and that makes a lot of sense.  Thanks for the
hard work!  Those features are all useful for Qubes OS, too =E2=80=94 just =
not
in the VM startup/shutdown path.

> So once you scratch all this - and you say you only care about single disc
> then you are able to use more efficient metadata formats which you could
> even keep permanently in memory during the lifetime - this all adds great
> performance.
>=20
> But it all depends how you could constrain your environment.
>=20
> It's worth to mention there is lvm2 support for 'external' 'thin volume'
> creators - so lvm2 only maintains 'thin-pool' data & metadata LV - but th=
in
> volume creation, activation, deactivation of thins is left to external to=
ol.
> This has been used by docker for a while - later on they switched to
> overlayFs I believe..

That indeeds sounds like a good choice for Qubes OS.  It would allow the
data and metadata LVs to be any volume type that lvm2 supports, and
managed using all of lvm2=E2=80=99s features.  So one could still put the
metadata on a RAID-10 volume while everything else is RAID-6, or set up
a dm-cache volume to store the data (please correct me if I am wrong).
Qubes OS has already moved to using a separate thin pool for virtual
machines, as it prevents dom0 (privileged management VM) from being run
out of disk space (by accident or malice).  That means that the thin
pool use for guests is managed only by Qubes OS, and so the standard
lvm2 tools do not need to touch it.

Is this a setup that you would recommend, and would be comfortable using
in production?  As far as metadata is concerned, Qubes OS has its own
XML file containing metadata about all qubes, which should suffice for
this purpose.  To prevent races during updates and ensure automatic
crash recovery, is it sufficient to store metadata for both new and old
transaction IDs, and pick the correct one based on the device-mapper
status line?  I have seen lvm2 get in an inconsistent state (transaction
ID off by one) that required manual repair before, which is quite
unnerving for a desktop OS.

One feature that would be nice is to be able to import an
externally-provided mapping of thin pool device numbers to LV names, so
that lvm2 could provide a (read-only, and not guaranteed fresh) view of
system state for reporting purposes.

> > > It's worth to mention - the more bullet-proof you will want to make y=
our
> > > project - the more closer to the extra processing made by lvm2 you wi=
ll get.
> >=20
> > Why is this?  How does lvm2 compare to stratis, for example?
>=20
> Stratis is yet another volume manager written in Rust combined with XFS f=
or
> easier user experience. That's all I'd probably say about it...

That=E2=80=99s fine.  I guess my question is why making lvm2 bullet-proof n=
eeds
so much overhead.

> > > However before you will step into these waters - you should probably
> > > evaluate whether thin-pool actually meet your needs if you have that =
high
> > > expectation for number of supported volumes - so you will not end up =
with
> > > hyper fast snapshot creation while the actual usage then is not meeti=
ng your
> > > needs...
> >=20
> > What needs are you thinking of specifically?  Qubes OS needs block
> > devices, so filesystem-backed storage would require the use of loop
> > devices unless I use ZFS zvols.  Do you have any specific
> > recommendations?
>=20
> As long as you live in the world without crashes, buggy kernels, apps  and
> failing hard drives everything looks very simple.

Would you mind explaining further?  LVM2 RAID and cache volumes should
provide most of the benefits that Qubes OS desires, unless I am missing
something.

> And every development costs quite some time & money.

That it does.

> Since you mentioned ZFS - you might want focus on using 'ZFS-only' soluti=
on.
> Combining  ZFS or Btrfs with lvm2 is always going to be a painful way as
> those filesystems have their own volume management.

Absolutely!  That said, I do wonder what your thoughts on using loop
devices for VM storage are.  I know they are slower than thin volumes,
but they are also much easier to manage, since they are just ordinary
disk files.  Any filesystem with reflink can provide the needed
copy-on-write support.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--m3WkM6yTCwuCYYPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH2wKcACgkQsoi1X/+c
IsEntA/+OnrfbaHWWJC621vMJFX8xOSttFHMgxe049LXe0QUrqyuHnLo4R4Wvazi
qn0USRQ5eEcxXXYC1NkgoRPmPIXJhFNgXuH0DHrgIEVTJW+LHZAQ8f16GGzuiexX
nQRNHpNuGeMdcNu02JD70NLWjjMI7vTEYlga0qe3OD0oO3qV4/qqb1xp6PX8sSaL
fQ9ABMLphPxTKcmhovT5Hokg2fKx57AJkl/ahMsXZknnpLIX66w7CGYY7bkRwQMB
W5SxiW9ryQ3bGsoFj+NsrNzKi96BHY2zNGyoHEKoPCQ1FpBrOw/kgyD2GRE7oGim
mAztBaM0E8jsKsmP3LDfoEwGk3Gbjo0OBCwzIhJv1R7kdW83/Qp8XD0t82NimVVt
f/bWOosxe8YnHgojv03WTE99K3GmVxkefyuNSAV5lwW4k19aurbZ6grPkI6mYsVw
x4YFbrFljpiM2VKBkbb74ApczJD+in/Bbl7kg7VAg5egivNaQMrG2IQlWvG6N4Oc
02Q5k13MogGz8zLzS0aQZXiZf2s927Q163lA4AYCWrkzjjHe4QMw5NSSyiziqqPP
XZfoC2LnnPdFiVmQxeGIkvbTol4LnmNV7UzgwEum0tv4Q78cRAuPTP0vsGJ3J+2c
Ga+L6xbaGeiNdxyrem6/nfcTCDAthRWrij4xRj9lL+cehus5ltE=
=l3yq
-----END PGP SIGNATURE-----

--m3WkM6yTCwuCYYPP--


--===============4831225841972409589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4831225841972409589==--

