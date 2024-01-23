Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6926A01D
	for <linux-lvm@lists.linux.dev>; Tue, 23 Jan 2024 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028232; cv=none; b=GzpXoMtuEsWLYNQPCU9LtKUUbXJIKvmqjo/y5KHGox+03xkItWy0kXbZwAbdLyzoFWaPznZ3CoYB7NfNmFq7oGzXpEd/pzQhTMVzRb4K2oTOZ+HczSmxt6Y9abANjKHZNQ2ZFMnhEIgEtSzKtMYtlInqfvEUiY54QRATh1pKXp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028232; c=relaxed/simple;
	bh=4RVNzBp6usSTvD5ab0RcuEqwSO18i1EdiztdfTe7PDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJsiqpv8mhk6k4aLd1MImv4znPsrCGH7/jiMPN5UwHurb5VG4mDhOBPTYYV0COah1+JYJn1hwsB/97iL9mYrmMzRbFIO+Vwj2mq69Qb1HMjd6oQTrI2Ys9X6AOkP6O0ph5v4BZufPKhVaYl0JN7IQGDbmHZLf/AXf0sz8ejBTMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com; spf=none smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=5HRRv9LG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MoiLKgxU; arc=none smtp.client-ip=64.147.123.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="5HRRv9LG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MoiLKgxU"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 444A6180006C;
	Tue, 23 Jan 2024 11:43:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 23 Jan 2024 11:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1706028228;
	 x=1706114628; bh=zHglhvipEJ2L4GdlYjl8CfjPC/LhJaJHxsHeYiOvJno=; b=
	5HRRv9LGBEQqsPEhnr6hyYuvyc9vaRi0N/quxPyGa2f8qidWM3oWlXh/Opomo0nV
	P4ucKSZZUJGNUdL5t04iDkqFc4gR5ORe+Sk1L0uqCdXnh+rtwVQj8e9MZj0OyL7T
	CyITSNOXtGR1sdDImFPHpQcu7W8nFsIAf+dzeFyco+okn55s5/2IH6ijo00FnmLj
	maGKwOs5PxJdYEFI5cMvKJBTBUEuz1UJNogaMC72QlNUpGhbQgWpoAA8pyTgtkpA
	TnyNpyduJb8u+FZvvLqrCjNaDBYqythOVWvA/6hxFMMVrnYChnyoToGljbxjnizV
	p9FqARNCdLo5gD+OYVadnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706028228; x=1706114628; bh=zHglhvipEJ2L4GdlYjl8CfjPC/Lh
	JaJHxsHeYiOvJno=; b=MoiLKgxUB/vtUvDvXx9ODQiSqrHHQbhSzMc0YidG2Ggz
	yRPu1QrB//9s2Fwn36xFKpn1ewyc2Cqldl6d/fgGtd5MoHul7MewhAbhBQ/Fh4I7
	b2MGvNqMcV4iVcMIL+CZiUBHKkp2VIam6Yv88lP+kTFMNNTqReMmmKJS6Xo4SqiT
	sHjdF8/i0IZ3dBFaqdwzJ8y12pELlcTd7PbVnPlX11j6w6eEygOinZFc8x/2xCJT
	JDXzpGLSo4vtJG0hcTi+rLPo6/5Y9H+POmofjLrOyJxhOnugjFUezSrzDEgVFiS4
	py0eKAQc4++cEzGk39iqVCbXygFopL2umEvdPxnCtQ==
X-ME-Sender: <xms:xOyvZfg8_qZqoU8dvVKI8iEWDzw9gmaCfm0NI2KgqWrHaSBYyk-6fg>
    <xme:xOyvZcDhnBF2rOLTG5X59_Ecu7e5DkobqTdP6lz3m0VsxZvGKB57prWfOPp7EQ-mI
    cfvO7nMQ1LfM0g>
X-ME-Received: <xmr:xOyvZfH2_gaGSeltt5YYV5nAIfYjZL-xjGC52vE3tOwsnaFLM_8nAK5tiTBE7bwHzdhzuEJngJrYM6n_ww0NFQ8Vd4EvRU-Qsz6BgyDCJSfrvbwJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:xOyvZcQWe_V5iPBPEqNRtbChMryRyqevDfOmfpBlvhCWR0dR7oMNzQ>
    <xmx:xOyvZcyN0EyoetVSFOh52JEUq0JRhWM2GUCW2h-fouRK9Zf2v7iXyA>
    <xmx:xOyvZS5EKDVO4i7ebbl3XMP5Rc-iWL0rLgP1SulRkK__L9l9QrwIBA>
    <xmx:xOyvZTnQ1K4014gxI_HxsVSqQfpxGLL34BShmNRs4nM-RpR50fat6cOXDds>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jan 2024 11:43:47 -0500 (EST)
Date: Tue, 23 Jan 2024 11:42:26 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
	Anthony Iliopoulos <ailiop@suse.com>
Cc: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
	Heming Zhao <heming.zhao@suse.com>,
	Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Message-ID: <Za_swUm-PGHoaf1X@itl-email>
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com>
 <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uCuar08UABmQ5+96"
Content-Disposition: inline
In-Reply-To: <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>


--uCuar08UABmQ5+96
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jan 2024 11:42:26 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
	Anthony Iliopoulos <ailiop@suse.com>
Cc: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
	Heming Zhao <heming.zhao@suse.com>,
	Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
Subject: Re: [Question] why not flush device cache at _vg_commit_raw

On Mon, Jan 22, 2024 at 03:52:57PM +0100, Zdenek Kabelac wrote:
> Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
> > On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
> > > Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
> > > > Hi lvm folks,
> > > >     Recently We received a report about the device cache issue afte=
r vgchange =E2=80=94deltag.
> > > > What confuses me is that lvm never calls fsync on block devices eve=
n at the end of commit phase.
> > > >=20
> > > > IIRC, it=E2=80=99s common operations for userspace tools to call fs=
ync/O_SYNC/O_DSYNC while writing
> > > > critical data. Yes, lvm2 opens devices with O_DIRECT if they suppor=
t , but O_DIRECT doesn't
> > > > provide data was persistent to storage when write returns. The data=
 can still be in the device cache,
> > > > If power failure happens in the timing, such critical metadata/data=
 like vg metadata could be lost.
> > > >=20
> > > > Is there any particular reason not to flush data cache at VG commit=
 time?
> > > >=20
> > >=20
> > > Hi
> > >=20
> > > It seems the call to 'dev_flush()' function got somehow lost over the=
 time
> > > of conversion to async aio usage - I'll investigate.
> > >=20
> > > On the other hand the chance here of losing any data this way would be
> > > really really very specific to some oddly behaving device.
> >=20
> > There's no guarantee that data will be persisted to storage without
> > explicitly flushing the device data cache. Those are usually volatile
> > write-back caches, so the data aren't really protected against power
> > loss without fsyncing the blockdev.
>=20
> At technical level modern storage devices 'should' have enough energy held
> internally to be able to flush out all the caches in emergency cases to t=
he
> persistent storage. So unless we deal with some 'virtual' storage that may
> fake various responses to IO handling - this should not be causing major
> troubles.

This is only true for enterprise storage with power loss protection.
The vast majority of Qubes OS users use LVM with consumer storage, which
does not have power loss protection.  If this is unsafe, then Qubes OS
should switch to a different storage pool that flushes drive caches as
needed.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--uCuar08UABmQ5+96
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmWv7MEACgkQsoi1X/+c
IsH7WhAAmAw4qqQFzq0EiFL0YJmn6GClHOXJfZR0EdcpkeY1s/4wi63q17IApusV
DvDRypSeE7egorGzKekSvemt0D4apWLCI2gIlnoKM/o9J6iIj9tn6hk4nZuDCemq
PFLJ2Sk6mwDrpQ4QlYfxnlc7IUcoySDbJLSceXA4+4cTK723JlKdzwFsjCwqbhYW
ywm3whBaMxm7/gaJrclBLiTnCd69RmdIR/XEy1AaOYaFmFLWX84PeuFHoXY83AyJ
YhP9rDbACtqczmQfodfSi3XSVFTR8rAgRUDicHsgRnM/SbyHVkNT5E1S7trLKpT4
V58o3gjut6lsLIYXwIchQ7mqXxTbDiQc6XR0cn5+mLJFiJIcD1DeKoXItkU9ekAu
5mxxl/pLJAboAbUrRiJldzv9xcefs0+Q05eoYT2x/ICHaz4raRFudTCLkCV5KF81
JtF3yBApxwOyBKAjgGtPyVua8PDyczo2b6IGX98wz9K6VEIcOr2pPPzpai/KVRsc
kW/wkpphRjzsx3/Pp3j2ne/sFXl3KGQyNYIXAy7lqTCIWHONwsu7zhkczD4XaHAJ
eObSEjDmFvQ5fDz+74vPv91SJL4QHEebJZUytG/sQ8B6z2avlAQ683peAYBoQOO3
F0bIWcAX9+AKGb6NaLQm1T3VNvKiAC00WeW7nB/Cbgp1jFtWCVU=
=Yb74
-----END PGP SIGNATURE-----

--uCuar08UABmQ5+96--
