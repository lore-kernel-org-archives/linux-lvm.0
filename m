Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815C32C88
	for <linux-lvm@lists.linux.dev>; Fri, 17 Nov 2023 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="mmn8UiGk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hgaW79ec"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9C65F5C019F;
	Fri, 17 Nov 2023 14:59:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 17 Nov 2023 14:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1700251184; x=1700337584; bh=kuvm+cAV+nBSs/OizneaLTD7MfPnIFUTHSS
	b8nxpC/4=; b=mmn8UiGkBlC62nWQOd7ixlc04rlzzhHEfT5G+kehPi5+LR7/53g
	tucMrVtzahh98Oomr6ZzQlDO6Q1GpgCFTcLabXNa6cHUP2j9wC4RzxYGmLEf7hQx
	YwtBQ8IIYyqeWR16dFxxQEVHnzavFofj6Wj5yaAC5kjbEVqa8Yjpgr4uvwNx2/eJ
	EjJmxglJ6Thjts7rtctzAzRi7erWGaqGaAP/cWyNEMqv5/mAnkTVYaKoIq5trU6C
	SSmOZEOC6lqf12NH6yGXCA3DPey97Znsl9YI0nHVcNFd1o7EHU3UMstfsjSUEiER
	6VxIgRJEndH/rFFNZmkl4++rdPRU6n8aqbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700251184; x=1700337584; bh=kuvm+cAV+nBSs
	/OizneaLTD7MfPnIFUTHSSb8nxpC/4=; b=hgaW79ecCy4FXD5G+Qyp0zqaSHF+R
	Zso2MwZcCRIn6lMICYMJ1/Kt7lphUC22IwkJGU/BIPfHV38J/yte5Fy3Gfy3/P6A
	9RIH4YeG6M7W0+20oTzclrLKnV5DFcvDgeELMCuJruz/m/5mfGRxaVFX53dsBzwV
	ddxm9Go6CNn2NkUOA/OpAUSJn2Zo93Ha3FfDWOGEsrQWgWmvXcY4VIgGpYNNhAfS
	qb/P5ol3guf6IW62xQsPgtooO6l8JtSt4W2Zy4XNSqLg/rs5LqfZq2tW8vLnIZLi
	0qMf/15uplPTxqzVbyPhIrVoY+vfNboz0Za1c2y4G0xex15cMbBhaI+Lw==
X-ME-Sender: <xms:MMZXZf17raNMY-pSXI0p_5cVueUYSKUk2HDHjJpIqlIBhgSC2kHDlA>
    <xme:MMZXZeE0dYn2rZoHZXndZvHumsk7bhKyYPTSSOrGFNzNMkec_mC8jgV0sUTMaHMbM
    fDl1ekPLyOsz_A>
X-ME-Received: <xmr:MMZXZf4BNqmxW7YTJIczqtXvxGlgWvomT-G91VgQJ2mC1vS-0qIEZ9a_EZAxgC8liNkLXA9ozVV6y5ajkWYf7UYxWznNcocubX7ET4BVqoxrELh5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegtddgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:MMZXZU151PAqeAZbsCpK3XpX61oFlfB8M0R4fadQZ63dQlioaDdKbw>
    <xmx:MMZXZSGYskR0efwwyU018yEeLHIzsfCZ0j-q1ru4ABf7ZkAtSd0zZw>
    <xmx:MMZXZV8ICxIdHvpYiWYvE9EOn5OWQcVc15YhRiO3C7JNZ3jZT31-JA>
    <xmx:MMZXZX7aFaQFsoQBrsyQNAEUpGWpzPjpS-jz8lnzP_Takh7xVyMhGw>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Nov 2023 14:59:43 -0500 (EST)
Date: Fri, 17 Nov 2023 14:57:35 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: David Teigland <teigland@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVfGLbjio7PEWG/L@itl-email>
References: <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <ZVbGObxAvSsYqvvo@itl-email>
 <ZVeF_vUYxaRLLJbv@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IYWWsh2Rb/TnLZCi"
Content-Disposition: inline
In-Reply-To: <ZVeF_vUYxaRLLJbv@redhat.com>


--IYWWsh2Rb/TnLZCi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Nov 2023 14:57:35 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: David Teigland <teigland@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83

On Fri, Nov 17, 2023 at 09:25:50AM -0600, David Teigland wrote:
> On Thu, Nov 16, 2023 at 08:47:22PM -0500, Demi Marie Obenour wrote:
> > > > commit 6c22392a3f903d6c086f7cc94978bdf8b072da6e
> > > > Author: David Teigland <teigland@redhat.com>
> > > > Date:   Tue Mar 16 09:52:13 2021 -0500
> > > >=20
> > > >      config: change default use_devicesfile to 1
> > > >=20
> > > > diff --git a/lib/config/defaults.h b/lib/config/defaults.h
> > > > index 66eece53aa33..a7a2a06df654 100644
> > > > --- a/lib/config/defaults.h
> > > > +++ b/lib/config/defaults.h
> > > > @@ -322,7 +322,7 @@
> > > >   #define DEFAULT_MD_COMPONENT_CHECKS "auto"
> > > > -#define DEFAULT_USE_DEVICES_FILE 0
> > > > +#define DEFAULT_USE_DEVICES_FILE 1
> > > >   #define DEFAULT_DEVICES_FILE "system.devices"
> > > >=20
> > > >=20
> > > > Later commits that removed DEFAULT_USE_DEVICES_FILE, and tried to r=
eplace
> > > > it with a configure option, was a failed attempt at building that l=
vm
> > > > source for RHEL8.  It's caused no end of problems and I plan to rev=
ert it
> > > > and restore define DEFAULT_USE_DEVICES_FILE 1.
> > >=20
> > >=20
> > > There is no problem with configuring DEFAULT_USE_DEVICES_FILE with
> > > 'configure --with-default-use-devices-file=3D 0/1' and thus no need t=
o change
> > > anything here.
> > >=20
> > > Current upstream has set this default value as 0=C2=A0 (in configure.=
ac)
> > >=20
> > > RHEL builds use this setting as 1.=C2=A0 (Possibly even Fedora nowada=
ys).
> > >=20
> > > The major problem with turning this=C2=A0 to 1 is the distribution mu=
st be
> > > 'ready' with such relatively invasive change as it changes also requi=
rements
> > > on how the boot image is created=C2=A0 (devicesfile must be copied to=
 ramdisk).
> > >=20
> > > So Suse=C2=A0 may try to set this setting=C2=A0 to 1=C2=A0 and see wh=
at all breaks.
> > >=20
> > >=20
> > > Zdenek
> >=20
> > Does this mean that distributions *should* set this to 1 and update
> > their installers?
>=20
> Yes, the devices file is intended to be a default feature of lvm since the
> commit above.

Could LVM issue a deprecation warning if DEFAULT_USE_DEVICES_FILE is set
to 0 or system.devices is not set at runtime?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--IYWWsh2Rb/TnLZCi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmVXxi4ACgkQsoi1X/+c
IsHBVRAA3zWTMKNyMQJAIZNAEwA+tKHjk3jlblnoPpltuBtDPXDykh6uGUIDpFmM
xpS5jCJzocibbLrEyUVoS4256yjl+nVRxL31XRZi3ahp35J3/7t98s4oFWrDKXRe
FQHj3LJV7gYg1zQWPKMjjwCtxrBp61Ah+nhkBSgMgDA8cHAjbscJsYKCqeKLIoNY
QFooLH32+vqa2N3yRyJdkR2nEFUWbU69FrTdmGMJQR4NOqS22wdaIbh7LvnCE2cO
QfsY0SBRzpwsHR143SdsnvzrKZ0J3Nc0Sf723QLYiiL0H+CTORSyV3lPLrqav9In
44GYV64C0qd57xaBFJQJhf6MF82wchdh27lTJSYRP0u/L8XpLkagklT7TsmSd7/Z
DeAr8a1a8ExH2CXuN7TIWsYLQS/EsbGugi82IOqP08l2g7jgdD4Fudh6duipDQZo
yxCOurR2DAcReZd4BCemsUSyAH/3M03jXym9zxqAnIlnbI583ygkqvFYdXFQtIyG
/hrrzgp8cFgJxj8W+vi0wrChdL7yu3XUCV1NoCTUEVn1KbsLPvP46mrBYK8NZGIi
18zEQI+bQgyOIV3RdNOP8omQhWQscKrPTYStrB7IEyx5QKlLF+fmHayESUm9xy1J
AoNo4Mwc3Eekm4GzVY3SONS3RWewkT/UO1ppxl3GVM/GYixtRxE=
=kTmn
-----END PGP SIGNATURE-----

--IYWWsh2Rb/TnLZCi--
