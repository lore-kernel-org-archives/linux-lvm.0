Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342F17E4
	for <linux-lvm@lists.linux.dev>; Fri, 17 Nov 2023 01:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="NP4SfTow";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gCrfbf91"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 88CC05C017C;
	Thu, 16 Nov 2023 20:47:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 16 Nov 2023 20:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1700185659; x=1700272059; bh=kWsE8fUNRVXhv2TmnRmViu6MTAC0zFUO+K5
	EbPrdid0=; b=NP4SfTowhAC8mYaHfhs01V6KIihV5eOeXMX0UnvtQYF75a5sFRg
	IDS12LS6byG3QLjZjCThjPaqYSZS7OISsvXKjYHSoKakwYEBk4JmpM+74WXrOV5o
	T/5ilub3YYD3JzKLyfzEIfjUo8rGbVb53q4m32llFTXJJR7844YmcNEJpy6UjgaZ
	7la+UlCIbVieVleB2sEno0lAg3rQnpuhs+Y9RRug1/k/xhal5dRkmg3RHYAmhagI
	7VoR/RCNbljeTiXWzdFWQyCPxqxm4lnaKWc5MlKLSn/OQ+idowUgjcP2DIFwW9jE
	nBrIBXZ2MKPnpWg/J1jqMtjW76ok8e44t7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700185659; x=1700272059; bh=kWsE8fUNRVXhv
	2TmnRmViu6MTAC0zFUO+K5EbPrdid0=; b=gCrfbf911L3BWTimHHQC5XIKFGGtH
	7QNPISwZKnJX7rZQpCAVrRyyEm1wMdkNbWLgWSnsVoA6tPFnixL+E/s7jd8LQ0uR
	Vw2yXhitv6+tR+cXVUpoXr4QCwohhEdjg7Q3Kbk3nZ/sP1gjqnpuVSZBnYP6PfF1
	Dhfbv73FLSnY3yTgW4fnucoDF3Mada1phNhtWCa6VhtQJyb6EtDLEea2EhDj3V/i
	X8QlhAeQ309Xov14zFGXxq6PpUIJjVkJFuH9i0uK73Dew929lggdExBy7AEUZ5KU
	72S6WG55p0+QBJ/P6rnTuviuCpQOK6nFMbi3lMJpPSjpbrpptuwnGm7aw==
X-ME-Sender: <xms:O8ZWZb4FAgkGwdJrc5TD9c83i4OZ2b9AMhrj5oNViY9mzjjOBcfm2g>
    <xme:O8ZWZQ5CI_6upANBhsplVjw5mv5COISkNJVb2Ak57brA1bWsSwrEtyxFWuupQOQKr
    QKKD4EHmA_wK3c>
X-ME-Received: <xmr:O8ZWZScMpOLR3PEBs0MDuJyAMYpIEmkMZGg6SUjIVgS6cPGmKkj6pHxlGBsL5pFIQAYDFaYMgqcRz4AI3KNwOKhmbslY04QlS9nZlV3op5atTuuk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudefledgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueeuveelheevvdeuvdfhiefhleff
    tdehuedvfefgveegfefgiefhudehveehtdefnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:O8ZWZcKimy0E3J6XtaawEVs4_X6FsW43G0VC1gi7R298bldRqmyWQg>
    <xmx:O8ZWZfJcmsIXRuWBZ3EIliHT0-qo-bPkG-4tt77B5huUkwKXW_8ebw>
    <xmx:O8ZWZVybOZdyYEsBlcJJpY8yrtYAJJ5sbr8a4-XPtZBGxRbMtsUqgQ>
    <xmx:O8ZWZX9WFNPO1xfosbTST_hz4KHjv7NAxwtkZFi3fAgkoqOgPEOzRw>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Nov 2023 20:47:38 -0500 (EST)
Date: Thu, 16 Nov 2023 20:47:22 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zkabelac@redhat.com>,
	David Teigland <teigland@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVbGObxAvSsYqvvo@itl-email>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/HNjuFQnq/MCDbdB"
Content-Disposition: inline
In-Reply-To: <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>


--/HNjuFQnq/MCDbdB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Nov 2023 20:47:22 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zkabelac@redhat.com>,
	David Teigland <teigland@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83

On Thu, Nov 16, 2023 at 02:37:13PM +0100, Zdenek Kabelac wrote:
> Dne 15. 11. 23 v 20:12 David Teigland napsal(a):
> > On Wed, Nov 15, 2023 at 07:36:57PM +0800, Heming Zhao wrote:
> > >  From the lvm2 code, above description is wrong. By default, system/d=
evices is
> > > disabled status. Because lvm.conf option "use_devicesfile =3D 0" by d=
efault.
> > > under "use_devicesfile =3D 0", any pvcreate/vgcreate/lvmdevices/vgimp=
ortdevices
> > > won't generate/create system/devices file.
> > > If my watching is correct, part discussion of this thread may invalid.
> > The lvm default is use_devicesfile=3D1, as shown in this commit:
> >=20
> > commit 6c22392a3f903d6c086f7cc94978bdf8b072da6e
> > Author: David Teigland <teigland@redhat.com>
> > Date:   Tue Mar 16 09:52:13 2021 -0500
> >=20
> >      config: change default use_devicesfile to 1
> >=20
> > diff --git a/lib/config/defaults.h b/lib/config/defaults.h
> > index 66eece53aa33..a7a2a06df654 100644
> > --- a/lib/config/defaults.h
> > +++ b/lib/config/defaults.h
> > @@ -322,7 +322,7 @@
> >   #define DEFAULT_MD_COMPONENT_CHECKS "auto"
> > -#define DEFAULT_USE_DEVICES_FILE 0
> > +#define DEFAULT_USE_DEVICES_FILE 1
> >   #define DEFAULT_DEVICES_FILE "system.devices"
> >=20
> >=20
> > Later commits that removed DEFAULT_USE_DEVICES_FILE, and tried to repla=
ce
> > it with a configure option, was a failed attempt at building that lvm
> > source for RHEL8.  It's caused no end of problems and I plan to revert =
it
> > and restore define DEFAULT_USE_DEVICES_FILE 1.
>=20
>=20
> There is no problem with configuring DEFAULT_USE_DEVICES_FILE with
> 'configure --with-default-use-devices-file=3D 0/1' and thus no need to ch=
ange
> anything here.
>=20
> Current upstream has set this default value as 0=C2=A0 (in configure.ac)
>=20
> RHEL builds use this setting as 1.=C2=A0 (Possibly even Fedora nowadays).
>=20
> The major problem with turning this=C2=A0 to 1 is the distribution must be
> 'ready' with such relatively invasive change as it changes also requireme=
nts
> on how the boot image is created=C2=A0 (devicesfile must be copied to ram=
disk).
>=20
> So Suse=C2=A0 may try to set this setting=C2=A0 to 1=C2=A0 and see what a=
ll breaks.
>=20
>=20
> Zdenek

Does this mean that distributions *should* set this to 1 and update
their installers?

This would have saved Qubes OS a security bulletin (LVM was scanning
VM-controlled block devices) and might make LVM faster (since it would
no longer need to scan every device on the system).
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--/HNjuFQnq/MCDbdB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmVWxjgACgkQsoi1X/+c
IsHe+A/+LRmK0upU3uD146N7S5zraH+9JdoeWDA4NgGsC5CBJQFZxrDFoQsLMEGL
dlfa5QOmF9VuNWqpgBoTKrj7NXsgHcYdk+HToVQg27pdcd8L9H5pe9lEKdg0MtUQ
rXEfyzijH5mFClL78IAkW8SQAYGbncjahX6FllOCVpWvtnUtsVvi92OIKggzbQLo
Dxg713iu1IRKgRotObmWgC4Qymh9yP1gBmRQPtZxcfuaXfHy/c/HpG+N2Leq52t1
HH4T3Y1veZ4wQ/bsYE0EoWq/PMqIXSZOf61qUe2tfpefLB9Ih/ZGmzagioSaIMNl
oqa3xpHab2qZGMAetLtadcOmmqG/E5ZCsR+tCmY46UOUM9L8l5T5XBp1ojgEKN3m
xNezZfKVQ1DWipZSiQCjc5yAg3VkvfK2FGx0lx3kPc04qleItdLnM3cz04W8ivtA
k8kxAohkRmTbCiRJPZ0Ec1l8jrrV1l8/9AXky0YPSRqY78XWrVOqurXnolOGFJVT
aUJ/rgiIEIY7nZcp5Gparb13D1QNKwmIqOKsl5mfgMZFFkCTWP9Ja7A58YU9pQ+Q
OD1MCxunQ0QyV87x5V7lx/mx8XmCnbtaQVhxaf5rQcp5q7qjspVlGJYDGvoevDsH
DTiNA50vyOqpyGmblVesW0K/XYK/pWEod1wW8dYRggs66o6hja4=
=gwPE
-----END PGP SIGNATURE-----

--/HNjuFQnq/MCDbdB--
