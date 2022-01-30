Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9FBC433F5
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 17:30:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ojhRY7PyNnKIvlE1g6Wwlg-1; Sun, 30 Jan 2022 12:30:54 -0500
X-MC-Unique: ojhRY7PyNnKIvlE1g6Wwlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F6721853020;
	Sun, 30 Jan 2022 17:30:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A21C7E11C;
	Sun, 30 Jan 2022 17:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFC664BB7C;
	Sun, 30 Jan 2022 17:30:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UHUX4i019828 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 12:30:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BFE432166B46; Sun, 30 Jan 2022 17:30:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B841A2166B26
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 17:30:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BFD63800087
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 17:30:30 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-442-yANjcJ-4P4ix-Y9JUbS6NQ-1; Sun, 30 Jan 2022 12:30:28 -0500
X-MC-Unique: yANjcJ-4P4ix-Y9JUbS6NQ-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CD9695C00E0;
	Sun, 30 Jan 2022 12:30:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sun, 30 Jan 2022 12:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2BhDXsIEF23QP3B6l
	RcHi+DcquEbJwMmLeWC0bqJEG0=; b=HxTrnrZ+b9YJjiZDUWSoheNnOs9uBLtbs
	yoorcWidQ279oHIGovhFxZrcnQlO7YgnTRAlfJaGlj6Q0Z4ZRHg3QYfztnQNFYe1
	FtzlltVqFM83k0uSPgEY13IgRX+/mjRR1l4uq9ieeMtv0M4jIxYhjceBUSyJd5ex
	y9B9Kc8NdCyD63LZcbI9gyUuCJPFnAuM1zkt3ifiqKUVNY/ENa1GsOk+fE6eGJkc
	FmrBg83qaQ9XYxQ+82ZYjNphTwhMxO3mZ3uqO5uRTMxi2Zj3TtedFL6LbD33+3n/
	+mvvOF/BOIrbdvvIhrALCmzQeHPDR31bTKPM65S3uB4EnHScQtAUw==
X-ME-Sender: <xms:M8v2YbY1YWBNZZocBHW6_q1Kp8iy8cka_iBTnixnIkisd8U7BEQR0A>
	<xme:M8v2YaZ-Y_8WmSivnqQCf0e-TfZxcMzocCgbTxLcOfPez7aTgdpDovyColb-_7xW-
	z1NT5csw6KpQHM>
X-ME-Received: <xmr:M8v2Yd9ojs0l-QICVVWGElK3lJ0VlrgSflTOOq7DqooXAJ5Xxe_IOFeKDT_H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgddutdduucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
	ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
	hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehhedtkefhgfegledtjeefjedutedu
	ieeileeiudekvdekvdeuueehffevtedutdenucffohhmrghinheprhgvughhrghtrdgtoh
	hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
	mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:M8v2YRptUsyYezphQq6c3cevB0-mG2XuNX6fwEpTKMGgAbNAfcNX7Q>
	<xmx:M8v2YWqUWWkmOZgrJrMJ4QaFceJKc0Kflusp0bEuBGlqs0p9_hb9Xg>
	<xmx:M8v2YXQJGpVlQDg-auGJebjS5U2MEmdKctq4F22ln8M72UCyf10JdQ>
	<xmx:M8v2YUGgPo9_d5b_9vVoqYAfnxknA4sr24MuW_hoFFQNHZ2M79hmpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
	30 Jan 2022 12:30:27 -0500 (EST)
Date: Sun, 30 Jan 2022 12:30:04 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <YfbLMQ7a6D479vz6@itl-email>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
	<83468eda-6697-5f15-d949-e23611cded84@gmail.com>
	<YfXoBour6CGZt9NH@itl-email>
	<b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool
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
Content-Type: multipart/mixed; boundary="===============6737636588145131389=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12


--===============6737636588145131389==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t/Ej5BC4r5auuRLa"
Content-Disposition: inline


--t/Ej5BC4r5auuRLa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Jan 2022 12:30:04 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: Running thin_trim before activating a thin pool

On Sun, Jan 30, 2022 at 12:18:32PM +0100, Zdenek Kabelac wrote:
> Dne 30. 01. 22 v 2:20 Demi Marie Obenour napsal(a):
> > On Sat, Jan 29, 2022 at 10:40:34PM +0100, Zdenek Kabelac wrote:
> > > Dne 29. 01. 22 v 21:09 Demi Marie Obenour napsal(a):
> > > > On Sat, Jan 29, 2022 at 08:42:21PM +0100, Zdenek Kabelac wrote:
> > > > > Dne 29. 01. 22 v 19:52 Demi Marie Obenour napsal(a):
> > > > > > Is it possible to configure LVM2 so that it runs thin_trim befo=
re it
> > > > > > activates a thin pool?  Qubes OS currently runs blkdiscard on e=
very thin
> > > > > > volume before deleting it, which is slow and unreliable.  Would=
 running
> > > > > > thin_trim during system startup provide a better alternative?
> > > > >=20
> > > > > Hi
> > > > >=20
> > > > >=20
> > > > > Nope there is currently no support from lvm2 side for this.
> > > > > Feel free to open RFE.
> > > >=20
> > > > Done: https://bugzilla.redhat.com/show_bug.cgi?id=3D2048160
> > > >=20
> > > >=20
> > >=20
> > > Thanks
> > >=20
> > > Although your use-case Thinpool on top of VDO is not really a good pl=
an and
> > > there is a good reason behind why lvm2 does not support this device s=
tack
> > > directly (aka thin-pool data LV as VDO LV).
> > > I'd say you are stepping on very very thin ice...
> >=20
> > Thin pool on VDO is not my actual use-case.  The actual reason for the
> > ticket is slow discards of thin devices that are about to be deleted;
>=20
> Hi
>=20
> Discard of thins itself is AFAIC pretty fast - unless you have massively
> sized thin devices with many GiB of metadata - obviously you cannot proce=
ss
> this amount of metadata in nanoseconds (and there are prepared kernel
> patches to make it even faster)

Would you be willing and able to share those patches?

> What is the problem is the speed of discard of physical devices.
> You could actually try to feel difference with:
> lvchange --discards passdown|nopassdown thinpool

In Qubes OS I believe we do need the discards to be passed down
eventually, but I doubt it needs to be synchronous.  Being able to run
the equivalent of `fstrim -av` periodically would be amazing.  I=E2=80=99m
CC=E2=80=99ing Marek Marczykowski-G=C3=B3recki (Qubes OS project lead) in c=
ase he
has something to say.

> Also it's very important to keep metadata on fast storage device (SSD/NVM=
e)!
> Keeping metadata on same hdd spindle as data is always going to feel slow
> (in fact it's quite pointless to talk about performance and use hdd...)

That explains why I had such a horrible experience with my initial
(split between NVMe and HDD) install.  I would not be surprised if some
or all of the metadata volume wound up on the spinning disk.

> > you can find more details in the linked GitHub issue.  That said, now I
> > am curious why you state that dm-thin on top of dm-vdo (that is,
> > userspace/filesystem/VM/etc =E2=87=92 dm-thin data (*not* metadata) =E2=
=87=92 dm-vdo =E2=87=92
> > hardware/dm-crypt/etc) is a bad idea.  It seems to be a decent way to
>=20
> Out-of-space recoveries are ATM much harder then what we want.

Okay, thanks!  Will this be fixed in a future version?

> So as long as user can maintain free space of your VDO and thin-pool it's
> ok. Once user runs out of space - recovery is pretty hard task (and there=
 is
> reason we have support...)

Out of space is already a tricky issue in Qubes OS.  I certainly would
not want to make it worse.

> > add support for efficient snapshots of data stored on a VDO volume, and
> > to have multiple volumes on top of a single VDO volume.  Furthermore,
>=20
> We hope we will add some direct 'snapshot' support to VDO so users will n=
ot
> need to combine both technologies together.

Does that include support for splitting a VDO volume into multiple,
individually-snapshottable volumes, the way thin works?

> Thin is more oriented towards extreme speed.
> VDO is more about 'compression & deduplication' - so space efficiency.
>=20
> Combining both together is kind of harming their advantages.

That makes sense.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--t/Ej5BC4r5auuRLa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH2yzEACgkQsoi1X/+c
IsGT5g/9G+QNIr5Um1UcjV/ggTFTytY+igNCXVcemgOH0EnljHt0DtjX17Rz52B9
4YPWX02vu7hjAKlMM5d9Ephs+Sv29Y2ael8yrwtYgB/MxwAsQ6gYJQExWjFJf+m6
7FG3oU39HvZc7EiVIml8Br8N2HrBPFp0f/cjaGkoTNldH6R/nr1BlOpDV/SIUFRl
O13b31abOGGfapg/BQdkbwq4Detp2ipKUj8r92B/2OxA4xl0Qzzh+dKOKAJzgYOR
0W9g6Q0kMUbvuFSy6vaMglQg/D0/YCJ7PFencp0NChSCH3WReD83V6gHgILpFENr
yPg0/GSslFbB3EUDZ5BkTZLPpoobmvlkLa17atUu45783uOn356cRXOiCM8zrFdQ
tKMZEauJz7o3JtWV4/ofx4vtVtFhknPvv4mQ/Hb4YnsJHunlQDa0kilUVo5n25LD
mr/YeU5U6pX5UWGzwrvDTPpu3CbJpJfSdj/Jad24/kGhY/p/oyQmnYQQvsK+4XLO
5dxI4UJd0NJilwHv+eikwccspQQySpnCOJyp93U/BcToNGbZTeiCpXfF58PBz5gE
MTl1AwG1tv8mGwBTSTTAv5ZgRJ11rhz1EedAxnZDyH9qf39AzUe22NdJ1TBIN9Wp
uNGv4uxG9CREYWU4pH3CjD+qish6G76hHSUOXSm2pBnrXsOrqOg=
=yJi7
-----END PGP SIGNATURE-----

--t/Ej5BC4r5auuRLa--


--===============6737636588145131389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6737636588145131389==--

