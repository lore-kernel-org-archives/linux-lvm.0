Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386DEC3
	for <linux-lvm@lists.linux.dev>; Fri, 26 Jan 2024 01:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706232911; cv=none; b=ayAHTkqz9/JjG0wPQJ1Qs2vU3vsBp1HT9aIUnQ3DH4bDkHCh1VfjdRinA96Y1Beb2aJimIjPvo9B6OxrH54Kgw1JZJPti6zgZj7GjkVaXaDjht7S4pfk2aZcxjLGSddkrB8/AYbYeJ5BumkT1AJAFkMi6ozeqamZwo4UhwFIhnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706232911; c=relaxed/simple;
	bh=o6owtkYmTF1UBgOcyNezElTpO7bhw0ACirjDP7PeWj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0oQ/X/n2+u6EiwzYcCGzF3cO8a88Ouc2xsam2YqP2duZ97ruTstbtve3C+2FUbNkUA0PBXRBK6XNcUVnLg28qZMiQU2evzRHcdxjotL0dAUq7mxJ//pelXBErKJZMN17Eng9guhEomQkf7J8j1ebDL4mw8mt/IoIofw9SyAQxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com; spf=none smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=0NQq+5lR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p/LfAZJJ; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="0NQq+5lR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p/LfAZJJ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8D6291380088;
	Thu, 25 Jan 2024 20:35:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 25 Jan 2024 20:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1706232907;
	 x=1706319307; bh=rz7nIwZoL77Y6O3LgqcL15lYPgc7d3n+4oWRp/FaATo=; b=
	0NQq+5lRGsj4DjTXhN9TkpC+ACVk5RBvEb7qK0oVdPIK3GxC905fZAox67du+9YX
	zaVyElBYPs4HGlQi/QCTbtK0TWWEoE4XoIUKC8jQWv+ppGPYUuDHZYWhfP24Vz74
	foBzTEQFEe0DTVYQrnXx55EHwrWu/pH7haETTy0FelyPEAknrIB6aibAde6YWt2y
	LNxUzdmf0xzI9huupqMbQfHfLpMj64kE2AC0P2MSjK911vu0ZDq8gJz01wmCe8SI
	3TSJQry8ujj8WyR7zSzLpTwoP1PYJ7a+0hbvaN0J9P9nzOxmYf0yNuKh+riKCF9b
	h+zS3I4nFLaJ4FYMXq4HXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706232907; x=1706319307; bh=rz7nIwZoL77Y6O3LgqcL15lYPgc7
	d3n+4oWRp/FaATo=; b=p/LfAZJJ3dGGdMzRw4z+y/BhAFnY5EgErsIAxWW4KsFs
	Q+3aDKyyj34LCo16z47jrf25ag/9AIa1wieKs9Ga6VYRHivT/DcudGcv7z+QgKKz
	g8vraf4i6p92cmZPz63FdN0bblO3t+bC5/fFvSDYJe1tbBLB4TeidWkd6073Cn4e
	97XNt/aCRWAE3/jNnLo/tupxm8q8zG7VtvfjDtPh1YZvZ3ZzralYXMmOtIlmfCKi
	CB6qmT4CtCdUo0a6VVGIv0vKIRVu8z0JpmCNN6eqnEZ9CozePcv9xsVwDXLEUjzy
	MO/QN8CpYz3h1+OWnOboAUsPYb7UJM+cgX+TaLJLNQ==
X-ME-Sender: <xms:SwyzZfkh6wdoa3XJAsik_L1CPRPsjrfe6QhY8eb67DLMsqI4-qnoGw>
    <xme:SwyzZS1JJSfvVL_IGNmtFXZhIL604LkkEHS_D92jvlr5TY1-VNjCN33KrX4x3uEeg
    YVzbZ-Fd-_yORs>
X-ME-Received: <xmr:SwyzZVruep0k93__amimNaf6_aFOyW2NQVnH69yJAfEhhurRtbg7uqyn_4ueaP4rtMIX4Mv2izgQRCQDEke83cqH04kOaUqczmwuEBGqKGRxm-bz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeliedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:SwyzZXnEV4tMoAnLrbCcnVET-_jYfhg9NMDqL2JuE5OrLtqhOkBJrA>
    <xmx:SwyzZd0hs3grLNezGJ8Zb_FTIO2HJi0MFCcM478x8wa8-zfU_pw3AQ>
    <xmx:SwyzZWuVVLOv7R8MeIhHSOT1Xx-gy54VxICqNRZIdDI7sx7aTDXWqw>
    <xmx:SwyzZbCt27W6cqSAs_KRl6ASpQgNwE-Xya5AZD4vSuwztJivDHNFyA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jan 2024 20:35:07 -0500 (EST)
Date: Thu, 25 Jan 2024 20:35:03 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Glenn Washburn <development@efficientek.com>,
	Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <ZbMMSTIs3opXKjlq@itl-email>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <20240125192155.2dbab92c@crass-HP-ZBook-15-G2>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9l3BLWxC0FpS/3Zl"
Content-Disposition: inline
In-Reply-To: <20240125192155.2dbab92c@crass-HP-ZBook-15-G2>


--9l3BLWxC0FpS/3Zl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jan 2024 20:35:03 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Glenn Washburn <development@efficientek.com>,
	Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?

On Thu, Jan 25, 2024 at 07:21:55PM -0600, Glenn Washburn wrote:
> On Mon, 15 Jan 2024 07:30:51 +0000
> Andy Smith <andy@strugglers.net> wrote:
>=20
> > Hi,
> >=20
> > On machine 'A' I have a pair of:
> >=20
> > Device Model:     Samsung SSD 870 EVO 4TB
> > Sector Size:      512 bytes logical/physical
> >=20
> > on top of this is an mdadm RAID-1 and that is an LVM PV.
> >=20
> > One of the LVs has been partitioned with an MBR and a single
> > partition spanning the whole of the 400GiB LV.
> >=20
> > I took a dd of this LV and transferred it to an identically-sized
> > LV on machine 'B' which has a pair of:
> >=20
> > Device Model:     HGST HUS726T6TALN6L4
> > Sector Size:      4096 bytes logical/physical
> >=20
> > The LV there when examined in a partitioning tool such as "fdisk"
> > now thinks it has a 3.2TiB partition and it is not usable.
> > Correcting the partition sector numbers allows for use of, for
> > example, "kpartx", to expose the partition as a loop device but the
> > ext4 driver and fsck.ext4 remain unable to detect a superblock.
> >=20
> > I have confirmed with sha256sum that the content of the
> > image/partition remains the same on source and destination.
> >=20
> > So, clearly the issue is the 512e sector size on source vs 4Kn on
> > destination. Is there any way to work around this in LVM? My issue
> > is that I would like to be able to move images of disks/filesystems
> > around at the block level without mounting/creating filesystem and
> > transferring with an fs-level application.
> >=20
> > If not, then possibly I can use hdparm to set the 4Kn drives to 512,
> > which will obviously involve destroying their contents, but that is
> > fine at this stage.
> >=20
> > I don't think the presence of a partition (as opposed to an ext4
> > filesystem directly upon the LV) is relevant; I think the same
> > issues would occur with a direct filesystem. I mention it only for
> > completeness. Also, I realise that the problems would also happen
> > without LVM. I just wonder if there is any workaround at the LVM
> > layer, since that is already used here.
>=20
> I've had this issue before and there is a very simple solution. It does
> not work at the LVM layer though, but I suspect what you really care
> about is having it work at the software, as opposed to hardware or
> firmware layer.
>=20
> Since the software that created the image did so assuming a 512b sector
> size, create a block device that has that sector size. The trick is to
> use loopdev to create a layer that does the translation from 512b to 4k
> sector size. See the "--sector-size" argument to losetup.

The atomicity guarantees of devices with different sector sizes are
different, so this is lying to the guest and could cause data corruption
in the event of a power failure.  The only =E2=80=9Cclean=E2=80=9D way to d=
o this is
with something that supports atomic writes with a granularity that is
different than what the hardware does.  ZFS zvols might be able to do
that, since they are copy-on-write internally.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--9l3BLWxC0FpS/3Zl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmWzDEkACgkQsoi1X/+c
IsFoMQ//Y/irbQsQq1OHI3goSqEXUVpkdzNSvXyn2ajLQvlidV9HU6eQLZn4imtT
K1O4gpJb97JEAPXMHe3sstiaot5AQYc3awtE92BtgYCZ6tprqDJY3iBNkzaNFyIt
voxIsrLmkD7sEAtx2gzT87rcRPhTNAsOiqw79gc9hMkjLic7cXM21izEGWkWJgBp
hnqPgIHhFEcPxku/Q4IvRzL+MeLBYCDHcQFI65QKMhnvSxoQVoGPlGnJokOXxjEZ
gCFZNUQqsAG7kIyxwp9lX7Eyp7kC0MTDmZ3UwX9NsIhlIjSRIdRT0TqN1EfMjJnu
ZgYg+ZBx9XW9c9fxT/wCaGMVMaLz55oLGMmv0NlcbFkSRyxSQCJP1RHdVPB28UKi
Tsa1TJYtVbhjuJt8FMDiB1Cax6JJ5taoXrAALAiRIvb8qCO5szSSQR2MYJLLNRzh
XvW/mHPsb4I3MUL6++bSqwiSuEcThL73lu0nExW/ibq87LQgIUqoTcstiEUZhI8S
oBp23TGQT0nbH1TZVKuYy14Uy8YJzcZ6WIk6dIMRKF3cPuMuFbGjQ0fj40VXhCtu
jhV1O9p37weJb1zdZBIQFCjfyE6/I8illhUS8XgdYDrA8RsPcUofEusYau2uf7dn
Q9Va8XNPe0tR/tU7lT76xmIITzI5IeqIBiXl90m1SA6aDo9DCQg=
=03/t
-----END PGP SIGNATURE-----

--9l3BLWxC0FpS/3Zl--
