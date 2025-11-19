Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03630DECC
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.165.217.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573921; cv=none; b=HWSVOKqD6STQ6HxPtqtMRJV3XMKFcIrf2PcD8LJnnof4Mo/us45mzbZ63nxs/Aa82oA7jqVmu1yC9QV/oiRde5FQozl7UMwU7KkRuEIwPTJPucnTd1WltgrkoUrvUOjYhijFmjxHNGqffBbXMSk48WOt++rK6zVa13F3uYvXM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573921; c=relaxed/simple;
	bh=oUXjlj/QO/VDcvbmR1wyaMbM4wYBtuKnEWLCFbbUzYo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vC0n8FTnumyi65FzQPWwWI/E+bZmwmvfY8XYgyeGWfnqNlCWbiGKFj2ZSXma1DWnj2o7IkCC5+GZMQAYczSS1c/EtGxFfWh1FmiICTtRKHB2p4xdtj1krJXwqDfNNATHN7B/mk7NJy62s0zBI0qoZuzPR+4ThIgX7ik2ffs9uMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca; spf=fail smtp.mailfrom=interlinx.bc.ca; arc=none smtp.client-ip=69.165.217.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=interlinx.bc.ca
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca [IPv6:fd31:aeb1:48df:0:3b14:e643:83d8:7017])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPS id 224683045A
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 12:38:34 -0500 (EST)
Message-ID: <cd5a3a1b5560f8634b434220a828b535c7a5ebe6.camel@interlinx.bc.ca>
Subject: Re: pvmove thin volume doesn't move
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Date: Wed, 19 Nov 2025 12:38:33 -0500
In-Reply-To: <42516759-f09a-407a-9c2d-1f82d0db19af@gmail.com>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
	 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
	 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
	 <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
	 <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
	 <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
	 <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
	 <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
	 <94679191.5310372.1763572932545@mail.yahoo.com>
	 <42516759-f09a-407a-9c2d-1f82d0db19af@gmail.com>
Autocrypt: addr=brian@interlinx.bc.ca; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1ieMVCKsdWeUxU0ganvi"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-1ieMVCKsdWeUxU0ganvi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-11-19 at 18:31 +0100, Zdenek Kabelac wrote:
>=20
> I've been also thinking - that adding support of 'dumb' mirroring of
> thinLV=20
> into pvmove - isn't a very difficult request - so we will see -
> although=20
> obviously copying=C2=A0 10TiB empty thin volume isn't going to be 'a fast=
=20
> operation' this way - but it's not any worse then a 'dd'.

Not any worse than 'dd' would be more than acceptable.  How can
anything be faster at physically moving data than dd as it is usually
only slowed by the speed of the storage in any case?

Slower, (to a reasonable degree) than dd would even be acceptable if
it's atomic and online like existing pvmove of real LVs since it being
online means nobody is sitting around waiting for it.  So it can be
slower even (again, to a reasonable degree).

Cheers,
b.

--=-1ieMVCKsdWeUxU0ganvi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE8B/A+mOVz5cTNBuZ2sHQNBbLyKAFAmkeAJkACgkQ2sHQNBbL
yKBDfgf/adallHauKzNplZ6PJMvaL6iPLzg3/K4kxTAIIkYBLtrzk/CKOpnXv9c7
kEkIyPeUPZkhyk2hKTYhrEMC5eK02siweuXlQwN6X16bZcuL+0cTEbGm74MWWIqn
NBbBAnkAad1QhSZEdbabhMDSA2LpacoJFUd+xVsfL97SIVRXBsfhRpbqx1cg3nF0
czG7AA/Gsx/mvW9uVSbfFJoTXq/o5Cs+SgrxG6daohkj/qr+RnRk0l0b6n8muutX
xQR7iQqgwOVxdk+GhRvcKQBa2EP/b647k4+HCq9V2lXU31RnHkB+JwWBcZ7GpsOY
F6Sc7n13OMkoJ1UZXvH/GKNsgP6ZQA==
=+x/I
-----END PGP SIGNATURE-----

--=-1ieMVCKsdWeUxU0ganvi--
