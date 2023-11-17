Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F446421
	for <linux-lvm@lists.linux.dev>; Fri, 17 Nov 2023 21:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="PSPJdopJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sxXGKanb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 20D285C0120;
	Fri, 17 Nov 2023 16:03:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 17 Nov 2023 16:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1700254998; x=1700341398; bh=By5gN3RytU6Mh0ou9df/34DqLlBDsUUkTav
	Xk6PEekI=; b=PSPJdopJnY+iuhvHBMLSZrSYNBFiinjlR2+gkMVSoOOhqR92Hiz
	SsNm4272mH5rs8gLwhG8B80qDHwGLa7yNGocXYmYYkpLEVM+A0V1pa02JFKyWb7b
	CVF2g+t3BzjRAwkFDk4tUpbPVcI8o9xcNEHWrQZucJ9WLle/tq/HESrFx8oZHQl8
	lEGvijSCx2tuLvktJwPKMHDU773eR1PguSCyr/e8UmXbLZx+2vqSfgCo1P+Qr/Tw
	HcdCDOyxV/W4XxrJM65V/mL2iMt+6KTnDNBQKF58fqYdmwI3ZB+43xC5FNaYijbj
	Mdbp1eA615w9WCpAkcB+guLkTGDhYPrDSFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700254998; x=1700341398; bh=By5gN3RytU6Mh
	0ou9df/34DqLlBDsUUkTavXk6PEekI=; b=sxXGKanbmq3H0ibtOhrqqn40zkeuJ
	M1KvLs+GcTdJ2IjN8BD08Fx3HqWABbU5CdIXVtKvc/3Vxn4g5pik1QV2MEsoDwb1
	VwkJYh3kchvohb19pO5D5CsA0IY/b1ZjYG5kmtRTFI6CTk8iqaUJ7SvnqP1yeyfl
	5nR8K0wpo2pblveOv7AQfPV3z4kq9En3nMqr5zqgRNDNrZEvJnanPR2IhhOn6gjg
	ia0ifkvGOjWbFtJlzA/yGH3hoIhdrb4QTgsfHu2PZ9XYBD+nE1xugJzS0twq6AcQ
	OTIavWbpoYI9Xgq9XT3jpFDMnOzdyNel0hGjuASwK/CdaDp+qvKqH3X4Q==
X-ME-Sender: <xms:FdVXZRzhRwR96gVugJ4ICcdaNE5CWcALLqUKmnh6L9sNIc1pbhy2kQ>
    <xme:FdVXZRQdoHx7HPL0h1a5zw99jJ11TNgf18VSFvCIdwoY0JNtxt8pBhvT-TT57kn_g
    8iPeyzFjcWuQbY>
X-ME-Received: <xmr:FdVXZbWxHAjgDsm0VNzj6RjjmQmRhSUr6NHu-N4BTdF7YM-GP2k6rCOTRa8Qb1h3JYC0CWMvAgAhk0REwsfeFAEt3oYyBuQvwFw8MtOfwYgzAbmh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegtddgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffej
    geejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:FdVXZTi0n0n1mMnOboxM4bD1ZLcHLjDQ4azKleE8WTBy-uhqhgL3sA>
    <xmx:FdVXZTDQzcSU-lDy38NZ-GkGR6SkFVMgyIruKELhuf8_aaYxUq6SAA>
    <xmx:FdVXZcJg08ETPeniVtWZeWgEHf_XDvUS6Q_50_VLRZzWCThoNJ5XNQ>
    <xmx:FtVXZV3FH9IQvdOKLUwvMttvTpJef0X_I5_ZWW0q9i-iDXPSgbv7wA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Nov 2023 16:03:16 -0500 (EST)
Date: Fri, 17 Nov 2023 16:03:12 -0500
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
Message-ID: <ZVfVE4IYDiePcHDo@itl-email>
References: <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <ZVbGObxAvSsYqvvo@itl-email>
 <ZVeF_vUYxaRLLJbv@redhat.com>
 <ZVfGLbjio7PEWG/L@itl-email>
 <ZVfKMHFtaG8UyvwG@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bTzPpBkJ/S5Hk47C"
Content-Disposition: inline
In-Reply-To: <ZVfKMHFtaG8UyvwG@redhat.com>


--bTzPpBkJ/S5Hk47C
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Nov 2023 16:03:12 -0500
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

On Fri, Nov 17, 2023 at 02:16:48PM -0600, David Teigland wrote:
> On Fri, Nov 17, 2023 at 02:57:35PM -0500, Demi Marie Obenour wrote:
> > > Yes, the devices file is intended to be a default feature of lvm sinc=
e the
> > > commit above.
> >=20
> > Could LVM issue a deprecation warning if DEFAULT_USE_DEVICES_FILE is set
> > to 0 or system.devices is not set at runtime?
>=20
> No, deprecated implies we're planning to remove it, which we probably
> never will.

Still, distros need to know that they should make the change.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--bTzPpBkJ/S5Hk47C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmVX1RMACgkQsoi1X/+c
IsGsOA/7BcoP0L2ghz1S9LuOAdCAiJpY2TafazR58cgE8jllhF2Va3Bq6p/XF4X4
LhiTAtS8AKCWWFhr5/fGt8A9TX2yRtLJi04gdrMvyF12n3uxavrptXVPRP/zIF/m
pByEgquAqBfFbKkXCoJOgHARww0At3GqAOeji4tP/fEbl7+yWnAXbzIHiiCThSQd
3M27HC0SuqCIZTBSNmWFdGvxMoTSw31xrYjOv14lNM2Rj/iYIrx9HovNhkoTr8UT
pYhohcOtoPI2jJ11OliWKu4D+Xq/Y83ieKk5L5TfObIr3Dj9DsC2cOHcCXep4BET
2uCfki0QFPo8nVyn6qs3aI+7PDMwrGFyvjy/2z4H19ax/BAVC+Da5nwjVJ+nEiEc
aCI/y4T9T4r9pYSjx421vVIYb01sGw5GfcAGG3JI5Y2Xge9gtI5jTGBk6f55x9fF
dgcz3XNFrfMACqB9VqIKzwZGudYcEPBYiB2yEFdZ6nnlOQKLq5UArE9aepE9QSiX
RC1+7fx93zfNQV5J7vDLZaCHGmAzpa3XMCJdziBkMvGrSBvo4jut3OJKk0/oIDC4
JOnZePZKUa7qzikdUI6WCaNIvdrabPRd1titrF2ISDURTwB9fop7vW7GnFKP6Yoq
3rgl1u6Vn0YUGDOwOeZepN+iM9CE9bT54tVEE1LaFPyq+P5fh0g=
=zkjx
-----END PGP SIGNATURE-----

--bTzPpBkJ/S5Hk47C--
