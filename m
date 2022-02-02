Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C95C433F5
	for <linux-lvm@archiver.kernel.org>; Wed,  2 Feb 2022 02:10:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-GBNhXjC6OxOPC8XCbMqF_g-1; Tue, 01 Feb 2022 21:10:40 -0500
X-MC-Unique: GBNhXjC6OxOPC8XCbMqF_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D62511853028;
	Wed,  2 Feb 2022 02:10:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7654D5DB81;
	Wed,  2 Feb 2022 02:10:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA3AB4CA93;
	Wed,  2 Feb 2022 02:10:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2122A9wS005404 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 1 Feb 2022 21:10:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 68486202698A; Wed,  2 Feb 2022 02:10:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61DF82026980
	for <linux-lvm@redhat.com>; Wed,  2 Feb 2022 02:10:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 335AA185A79C
	for <linux-lvm@redhat.com>; Wed,  2 Feb 2022 02:10:06 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com
	(wout2-smtp.messagingengine.com [64.147.123.25]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-526-6GwKlKXyPmCOPn3tiN8U3g-1; Tue, 01 Feb 2022 21:10:04 -0500
X-MC-Unique: 6GwKlKXyPmCOPn3tiN8U3g-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 62A9232021FD;
	Tue,  1 Feb 2022 21:10:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Tue, 01 Feb 2022 21:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jv91CDDL4O7nkJ629
	hx27rfVOOTchvy3JWbov2pC2ck=; b=U/AtS34j66dXgIJErWM+DG/qgq2pAoLt8
	VFXL+FYuAQaeX7NIOHusu2SfBYOnpywLw9BuiF0GpUnC2XEBmvJAN5UhBMdLvBx8
	Db9ll1lLFmgXt71bDCYddZxyoj30HOEbSz2ezNEZTmfhgC92Tw9KpSV+o+PiJpD2
	KaRhV/xbqq+67bpoO7oHMMGaRvt5juVLnjQnHJ3uw62P+Tnl6ZCLQqZ1eVansbnn
	UMHsAudGRCmsJdqwwkUHxk6PPXYZtLV19+47pSOlGfMWZ5WJRWLISaWQe6+t6zsb
	eYJy3fcHCjnjsa/llwGzUJCliiR34MM5LmI3AEPPJnnoXA4OQAzrQ==
X-ME-Sender: <xms:-uf5YScwFOBKaWYmHy2HskxTbiMoxjtgVo51aHvnt4uXo4BrajVJNg>
	<xme:-uf5YcOmxQnG86nqljzC6-24n8Y426mxCcuJ7QV9T2XP_ICw-T8fmwn_zMkvbA2DI
	8t9KamVaDvON9A>
X-ME-Received: <xmr:-uf5YTiLH4p4vhthUeXK02E1xs7vAhUljt1NDS8OTMsVcQFl63DG_mvYaypG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeggdefkecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
	rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
	grsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdeuiedvfeeiudfgjedtuedtleef
	vdeukeeltddugeejvdeiudekfefhueetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
	hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
	sgdrtghomh
X-ME-Proxy: <xmx:-uf5Yf8CBlPAHByIjcA1qDt_byuNv2FsQcqlg8aI09bAvDR3oOz-hg>
	<xmx:-uf5YeskmOEu6WJurSTpPs9JD1uwF670Uy7isvUXzUrMS_rYvNgokg>
	<xmx:-uf5YWF2fRLOn1dvtswmmuD09x-B0eTHNldAyt2Hm5hzRCjYECnBdg>
	<xmx:-uf5Yf7OAKztzHgxYkdiFmHGid-3PR4Q5H1vV1pvr47WcwnOVeiI1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
	1 Feb 2022 21:10:02 -0500 (EST)
Date: Tue, 1 Feb 2022 21:09:52 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <Yfnn+BcjuukqjfVO@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<849ab633-ec3d-a0a5-38bf-72b87bbba2c5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <849ab633-ec3d-a0a5-38bf-72b87bbba2c5@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Content-Type: multipart/mixed; boundary="===============6753274321865379477=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11


--===============6753274321865379477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tWU3ZGmMy0vpA3FY"
Content-Disposition: inline


--tWU3ZGmMy0vpA3FY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 1 Feb 2022 21:09:52 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: LVM performance vs direct dm-thin

On Sun, Jan 30, 2022 at 06:43:13PM +0100, Zdenek Kabelac wrote:
> Dne 30. 01. 22 v 17:45 Demi Marie Obenour napsal(a):
> > On Sun, Jan 30, 2022 at 11:52:52AM +0100, Zdenek Kabelac wrote:
> > > Dne 30. 01. 22 v 1:32 Demi Marie Obenour napsal(a):
> > > > On Sat, Jan 29, 2022 at 10:32:52PM +0100, Zdenek Kabelac wrote:
> > > > > Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):
> > > > > > How much slower are operations on an LVM2 thin pool compared to=
 manually
> > > > > > managing a dm-thin target via ioctls?  I am mostly concerned ab=
out
> > > > > > volume snapshot, creation, and destruction.  Data integrity is =
very
> > > > > > important, so taking shortcuts that risk data loss is out of the
> > > > > > question.  However, the application may have some additional in=
formation
> > > > > > that LVM2 does not have.  For instance, it may know that the vo=
lume that
> > > > > > it is snapshotting is not in use, or that a certain volume it is
> > > > > > creating will never be used after power-off.
> > > > > >=20
> > > >=20
> > > > > So brave developers may always write their own management tools f=
or their
> > > > > constrained environment requirements that will by significantly f=
aster in
> > > > > terms of how many thins you could create per minute (btw you will=
 need to
> > > > > also consider dropping usage of udev on such system)
> > > >=20
> > > > What kind of constraints are you referring to?  Is it possible and =
safe
> > > > to have udev running, but told to ignore the thins in question?
> > >=20
> > > Lvm2 is oriented more towards managing set of different disks,
> > > where user is adding/removing/replacing them.  So it's more about
> > > recoverability, good support for manual repair  (ascii metadata),
> > > tracking history of changes,  backward compatibility, support
> > > of conversion to different volume types (i.e. caching of thins, pvmov=
e...)
> > > Support for no/udev & no/systemd, clusters and nearly every linux dis=
tro
> > > available... So there is a lot - and this all adds quite complexity.
> >=20
> > I am certain it does, and that makes a lot of sense.  Thanks for the
> > hard work!  Those features are all useful for Qubes OS, too =E2=80=94 j=
ust not
> > in the VM startup/shutdown path.
> >=20
> > > So once you scratch all this - and you say you only care about single=
 disc
> > > then you are able to use more efficient metadata formats which you co=
uld
> > > even keep permanently in memory during the lifetime - this all adds g=
reat
> > > performance.
> > >=20
> > > But it all depends how you could constrain your environment.
> > >=20
> > > It's worth to mention there is lvm2 support for 'external' 'thin volu=
me'
> > > creators - so lvm2 only maintains 'thin-pool' data & metadata LV - bu=
t thin
> > > volume creation, activation, deactivation of thins is left to externa=
l tool.
> > > This has been used by docker for a while - later on they switched to
> > > overlayFs I believe..
> >=20
> > That indeeds sounds like a good choice for Qubes OS.  It would allow the
> > data and metadata LVs to be any volume type that lvm2 supports, and
> > managed using all of lvm2=E2=80=99s features.  So one could still put t=
he
> > metadata on a RAID-10 volume while everything else is RAID-6, or set up
> > a dm-cache volume to store the data (please correct me if I am wrong).
> > Qubes OS has already moved to using a separate thin pool for virtual
> > machines, as it prevents dom0 (privileged management VM) from being run
> > out of disk space (by accident or malice).  That means that the thin
> > pool use for guests is managed only by Qubes OS, and so the standard
> > lvm2 tools do not need to touch it.
> >=20
> > Is this a setup that you would recommend, and would be comfortable using
> > in production?  As far as metadata is concerned, Qubes OS has its own
> > XML file containing metadata about all qubes, which should suffice for
> > this purpose.  To prevent races during updates and ensure automatic
> > crash recovery, is it sufficient to store metadata for both new and old
> > transaction IDs, and pick the correct one based on the device-mapper
> > status line?  I have seen lvm2 get in an inconsistent state (transaction
> > ID off by one) that required manual repair before, which is quite
> > unnerving for a desktop OS.
>=20
> My biased advice would be to stay with lvm2. There is lot of work, many
> things are not well documented and getting everything running correctly w=
ill
> take a lot of effort  (Docker in fact did not managed to do it well and w=
as
> incapable to provide any recoverability)

What did Docker do wrong?  Would it be possible for a future version of
lvm2 to be able to automatically recover from off-by-one thin pool
transaction IDs?

> > One feature that would be nice is to be able to import an
> > externally-provided mapping of thin pool device numbers to LV names, so
> > that lvm2 could provide a (read-only, and not guaranteed fresh) view of
> > system state for reporting purposes.
>=20
> Once you will have evidence it's the lvm2 causing major issue - you could
> consider whether it's worth to step into a separate project.

Agreed.

> > > > > It's worth to mention - the more bullet-proof you will want to ma=
ke your
> > > > > project - the more closer to the extra processing made by lvm2 yo=
u will get.
> > > >=20
> > > > Why is this?  How does lvm2 compare to stratis, for example?
> > >=20
> > > Stratis is yet another volume manager written in Rust combined with X=
FS for
> > > easier user experience. That's all I'd probably say about it...
> >=20
> > That=E2=80=99s fine.  I guess my question is why making lvm2 bullet-pro=
of needs
> > so much overhead.
>=20
> It's difficult - if you would be distributing lvm2 with exact kernel vers=
ion
> & udev & systemd with a single linux distro - it reduces huge set of
> troubles...

Qubes OS comes close to this in practice.  systemd and udev versions are
known and fixed, and Qubes OS ships its own kernels.

> > > > > However before you will step into these waters - you should proba=
bly
> > > > > evaluate whether thin-pool actually meet your needs if you have t=
hat high
> > > > > expectation for number of supported volumes - so you will not end=
 up with
> > > > > hyper fast snapshot creation while the actual usage then is not m=
eeting your
> > > > > needs...
> > > >=20
> > > > What needs are you thinking of specifically?  Qubes OS needs block
> > > > devices, so filesystem-backed storage would require the use of loop
> > > > devices unless I use ZFS zvols.  Do you have any specific
> > > > recommendations?
> > >=20
> > > As long as you live in the world without crashes, buggy kernels, apps=
  and
> > > failing hard drives everything looks very simple.
> >=20
> > Would you mind explaining further?  LVM2 RAID and cache volumes should
> > provide most of the benefits that Qubes OS desires, unless I am missing
> > something.
>=20
> I'm not familiar with QubesOS - but in many cases in real-life world we
> can't push to our users latest&greatest - so we need to live with bugs and
> add workarounds...

Qubes OS is more than capable of shipping fixes for kernel bugs.  Is
that what you are referring to?

> > > Since you mentioned ZFS - you might want focus on using 'ZFS-only' so=
lution.
> > > Combining  ZFS or Btrfs with lvm2 is always going to be a painful way=
 as
> > > those filesystems have their own volume management.
> >=20
> > Absolutely!  That said, I do wonder what your thoughts on using loop
> > devices for VM storage are.  I know they are slower than thin volumes,
> > but they are also much easier to manage, since they are just ordinary
> > disk files.  Any filesystem with reflink can provide the needed
> > copy-on-write support.
>=20
> Chain filesystem->block_layer->filesystem->block_layer is something you m=
ost
> likely do not want to use for any well performing solution...
> But it's ok for testing...

How much of this is due to the slow loop driver?  How much of it could
be mitigated if btrfs supported an equivalent of zvols?

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--tWU3ZGmMy0vpA3FY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH55/gACgkQsoi1X/+c
IsHeug/9E9kg+f+BvbWujzaXIAUtTCuUM0h0NYPaDEFrucfoIY3LPY6zGhxXFCsH
gO8X0BAgmnw4gc02R87Vxha3AxUfNJiDIWNEr8QZvlyVhduAL2m8rD+QeWS1mjh0
eNdAzB1ZoWbDMVwREOKbTBiKf3D3qZVw6yXbVmQVh2tLBRpHmaa5MvsxfPqBJOIT
YwJNj5ZGq69TfykFq+Ei+KJRJwhBc+2qTY2e5jIv70aa8Vxeuo7a2avR21yUKd0b
t48M9xW7Wd4x0hdO2sBhsbfHD/Kx/yUKlO19Vev5OK8GkMf71iLorU4YD0wIMZu6
VjNTAzvPOpsKHKkJWJcgj7zwqXiIcwfhuUA5v6DGBFv+odxUujeX4ONozKLBNVv9
1BN9LN6XMxm4BNSbH0b1OQ2c4FElnKXJ4aEFt0NFs/OM+mRrPal6uc1apOyoeTLM
4r/EWjjNR5c2ASdjoelg5k2YbS9/PL/xD8RRH4QRE0xlhuiMLjutyQlFtTZCCe9W
EH9igDELU4B+JFgNvsu6X3j/jNEMWsBg5dHIODTUQr6c7v1BBeEVMUGbTRFac1TO
Gyl/16NcnkKmnyBYxBiM2Lj1rQ1p2EFIXqBQ4C4nDA2QjpH7DPzjedLCWlxeT8fn
MRZnVp4UsV1+6hMQeNirVpfH00SgOkTiN7vbVETwMIlqSOG6L6c=
=qY3u
-----END PGP SIGNATURE-----

--tWU3ZGmMy0vpA3FY--


--===============6753274321865379477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6753274321865379477==--

