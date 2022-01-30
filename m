Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FDDC433F5
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 18:02:23 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-T-ET9C5hNbalm_DUU75jkQ-1; Sun, 30 Jan 2022 13:02:18 -0500
X-MC-Unique: T-ET9C5hNbalm_DUU75jkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 531551853026;
	Sun, 30 Jan 2022 18:02:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10D5D84D31;
	Sun, 30 Jan 2022 18:02:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59C9C1809CB8;
	Sun, 30 Jan 2022 18:02:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UI23Pg021411 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 13:02:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6F29B2026D4D; Sun, 30 Jan 2022 18:02:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A3E82026D46
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 18:02:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6089A1C04B51
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 18:02:00 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com
	(wout3-smtp.messagingengine.com [64.147.123.19]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-456-m2PM84ozPg61BBStfqfgqQ-1; Sun, 30 Jan 2022 13:01:58 -0500
X-MC-Unique: m2PM84ozPg61BBStfqfgqQ-1
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id E0BB83200E79;
	Sun, 30 Jan 2022 13:01:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Sun, 30 Jan 2022 13:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=A3J4yi4yjYiKPqd6t
	lU/SqICEkczTFyH70JkWcWOc3o=; b=kUgRqSmZ+RyicG0ULNDt2zLIILbqD9T9y
	VOpVuP1J3mblfkb7+mhe6hJFPN4ussZESmGyEO6vDhT5ciTqlcXfyhVRGqj8qUec
	PVHlIJ1jSaEAx690rulNjFEy737cGtoyVKHwMfJLdISUn3IDMX0zb3OZXSVX151Q
	cKxQJLlBYRIIlcl+X0kfjAmTmuFPboYviXE7KSqW7C+ozf7kKZR80sFOU4KDZsOh
	8BoRktrkggmByVj8dQk+fFjQbp1y+t4bftXt3vZfcSzY1WOh9n64KnbA9V0QhTR9
	MphIzfuJBmhINwommOM5+M/7ENr9yN6OrA3w/udDcdwHIsPMvqAGA==
X-ME-Sender: <xms:lNL2YfE-dKx3myF-oEiu7hz0pHEtNUjF7r3p4MBGwyyXQ9ufs-_eZQ>
	<xme:lNL2YcVuLSrvUdk73HhRBNGD9_1FZWsnU3K2KlmqJPjq1msxHKB2rlmordOMKDPho
	agsyERtT5FAC8Y>
X-ME-Received: <xmr:lNL2YRKA2bHLAnGsccEScw8fwSgFwrjNPooqyQh1wRJVqtj1XKZgrCvSxIrX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgddutdekucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
	ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
	hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedtueeivdefiedugfejtdeutdel
	fedvueekledtudegjedviedukeefhfeuteenucevlhhushhtvghrufhiiigvpedtnecurf
	grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
	rggsrdgtohhm
X-ME-Proxy: <xmx:lNL2YdEfJxS2xCnTMjRq8q4Dwc8EWcE7evRVECUKCk3J14APqU-4jA>
	<xmx:lNL2YVUWLoq4d0QcTh7-ZvARUQGlZs2UQjIbS0FHff6mx5WrOZhvKg>
	<xmx:lNL2YYN88gpKp0QRF3W8z_vJ5npVzYluRPLFEOsPjo6WYjtyTczT0A>
	<xmx:lNL2YUDV5HRKqCffr2377dvgWBmpfbpXfSgJEe7iNFqFXXeGQrwbMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
	30 Jan 2022 13:01:56 -0500 (EST)
Date: Sun, 30 Jan 2022 13:01:31 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <YfbSkfdz2cAV4Iaz@itl-email>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
	<83468eda-6697-5f15-d949-e23611cded84@gmail.com>
	<YfXoBour6CGZt9NH@itl-email>
	<b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
	<YfbLMQ7a6D479vz6@itl-email>
	<57a77ded-703d-d8a6-a919-2a68ba4cf97f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <57a77ded-703d-d8a6-a919-2a68ba4cf97f@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Content-Type: multipart/mixed; boundary="===============4923675384943813261=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13


--===============4923675384943813261==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iHtopr6FCyg96qcS"
Content-Disposition: inline


--iHtopr6FCyg96qcS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Jan 2022 13:01:31 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: Running thin_trim before activating a thin pool

On Sun, Jan 30, 2022 at 06:56:43PM +0100, Zdenek Kabelac wrote:
> Dne 30. 01. 22 v 18:30 Demi Marie Obenour napsal(a):
> > On Sun, Jan 30, 2022 at 12:18:32PM +0100, Zdenek Kabelac wrote:
> > > Discard of thins itself is AFAIC pretty fast - unless you have massiv=
ely
> > > sized thin devices with many GiB of metadata - obviously you cannot p=
rocess
> > > this amount of metadata in nanoseconds (and there are prepared kernel
> > > patches to make it even faster)
> >=20
> > Would you be willing and able to share those patches?
>=20
> Then are always landing in upstream kernel once they are all validated &
> tested (recent kernel already has many speed enhancements).

Thanks!  Which mailing list should I be watching?

> > > What is the problem is the speed of discard of physical devices.
> > > You could actually try to feel difference with:
> > > lvchange --discards passdown|nopassdown thinpool
> >=20
> > In Qubes OS I believe we do need the discards to be passed down
> > eventually, but I doubt it needs to be synchronous.  Being able to run
> > the equivalent of `fstrim -av` periodically would be amazing.  I=E2=80=
=99m
> > CC=E2=80=99ing Marek Marczykowski-G=C3=B3recki (Qubes OS project lead) =
in case he
> > has something to say.
>=20
> You could easily run in parallel individual blkdiscards for your thin LVs=
=2E...
> For most modern drives thought it's somewhat waste of time...
>=20
> Those trimming tools should be used when they are solving some real
> problems, running them just for fun is just energy & performance waste....

My understanding (which could be wrong) is that periodic trim is
necessary for SSDs.

> > > Also it's very important to keep metadata on fast storage device (SSD=
/NVMe)!
> > > Keeping metadata on same hdd spindle as data is always going to feel =
slow
> > > (in fact it's quite pointless to talk about performance and use hdd..=
=2E)
> >=20
> > That explains why I had such a horrible experience with my initial
> > (split between NVMe and HDD) install.  I would not be surprised if some
> > or all of the metadata volume wound up on the spinning disk.
>=20
> With lvm2 user can always 'pvmove'  any LV to any desired PV.
> There is not yet any 'smart' logic to do it automatically.

Good point.  I was probably unware of that at the time.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--iHtopr6FCyg96qcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH20pIACgkQsoi1X/+c
IsHG0g//R4o03kAP14FRuugzQfU208e0hMdsbNmTazw4ifqrfodXid8wVfhdqfwj
AA+qJhy2CafEw6Bnz4qaprFwDVgPWWPiOybU9YcST52dtUOYHS+Qtc1qbp58Mo1p
B20wS9nkrbKNMQ/JIu3VtGYtaZtbcf1jKEbHbAs+KzdzsRISHJdj+8a6RukZgkHJ
AMfe0Gn64vJg7cM/TUSx1hhB13MRBVX51i/54jh4iGlJcsH3qQxJY3LEUZYgB/xF
PJiJponSSSUmV/32v+ClqhBpu4PnKK9VRONbbHCgINKtsILAvryngt34u50zfS3v
vuY1aM3oLNSqOw97/isu03aWF+2OfHnxZHhg8hL1HhrU06eToaQLaC4AStO1399r
Xeb6rpDglzZRPomq+9mDeZx7OHRVXFNOWBCwUXd4Qu2tt2W42qevljijM+OTfTP9
tEypGHm75hZtvixGFjEpow/iKOs20aVffu1Vl+ICOI9rBiqBxCgZ/0Cavxq1hWJf
pabiEhhEeZe2pZT7Sdr1pof+7FKlyEnc2eLeGvv3dSZGjz247hd3RjCN0ID9M0Un
b5wifmgY6TZkjFAHpcGiALyZ2KYlO31KoauP+gfeJeSfj2yFwcEAdc4kEI0T6Mg6
41Cn1WgvJ8F59EAo6hOgqTYD20pt+KiPOlgqY/c0J9D8XrCMRWg=
=PxJm
-----END PGP SIGNATURE-----

--iHtopr6FCyg96qcS--


--===============4923675384943813261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4923675384943813261==--

