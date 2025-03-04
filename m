Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48444BA2D
	for <linux-lvm@lists.linux.dev>; Tue,  4 Mar 2025 23:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741132137; cv=none; b=UjNCrCVeK9ijOYtLw8jdnMfUJADxU67Ye2Ic1YO3BR9Pq53WYwvVynS+GmVlHR+Tu7a3JLzCeT7Vs4tvDB81ED0RULeTGkqKp0hO5iOo6gwC2YkQ5zKD9wTkOrmR3Cx4/nJO1khvHVSe6DhtKoZDums9/h/hLYpR7/bEoToayqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741132137; c=relaxed/simple;
	bh=GxUWE1DBnti9t/6Sqo5XrgEP1ysvvn8Cs4bRWCxf1LQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSva6vefcTIRikHWPx7551UtiA5kNrBQETOEZ2XQ9n2Pybw15dLbEjhv1jqpfDht4wvJrxAKsbCj3TzIMlurkB5zO0e3Y/XZzqlK2HjSRCmjlfaLIghtUAmne6lPXY5qfHH7A47vO8TNMpM0sfXRQk5STw0/rGXI/61N0ZsIGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=DUky5fNH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U/O9aGIP; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="DUky5fNH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U/O9aGIP"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F19F11401C7;
	Tue,  4 Mar 2025 18:48:54 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 04 Mar 2025 18:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1741132134;
	 x=1741218534; bh=uBnQwxx0t/CWfoA/JO9w7IYcaUrwZPUhI7Ha9z8LogI=; b=
	DUky5fNH4cLx/RfCj/BJeZKtTHmiohyhguld7dvnkyp7ebtiFy5N0XFGutpMqTTg
	K2W+NiZi/25reSTeJKuFojwcsdTK9UnigQzo+rhtUQTo9aKFkHpzGFNLrAlzUru8
	KBnKOzuYteP7ul4/haanqaJOEvl5RGHUvNflRpa0GW6HqlpHaJPldxLurOd84Z9x
	oB6RyzkJPFIXs/7jyOU9eUmQnaCkQVgk8WBRoDkHduPuJneG8ldEbsok9lMRemic
	Eh4LxRvknkCf7/HCBdiPR3OecMTs+pDgcoUvH09rO2lnE0yNOfACYb4tTBtntAMG
	qEydBMSTFYwFXzce8ODpQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741132134; x=1741218534; bh=uBnQwxx0t/CWfoA/JO9w7IYcaUrwZPUhI7H
	a9z8LogI=; b=U/O9aGIPemNk1DWs0dLuohKe27Kp/KHllNPv0HYbcLqO6dgZ21s
	dz+ZCmjLPVywvXwKdKZL4nOwCY1Gy4q0i4gXHEc7e+mteGsucn24511+N7XaUGcU
	zaJr/YBSYQWSWi2ADrNdQxbInOEZUTOnfT6xqhAL3GO5Yp9xrPUEsXxjGzB9sqJV
	dfC1M5uI6YAnS+//crCwubI2YAdxQbR3VWobnXbdRG0hIh50UejPB2+vnAegBCJa
	+ahVWxExgqr9pFRhSu2Ge85yQAkz8hydwQ+b922WpL652igUrd07/NOEY9pVZhel
	wnaXW5+iNKOesGS8wYF+AW+zasBnUh2XMQQ==
X-ME-Sender: <xms:ZpHHZ10y951EP9W4rjdCm0UHEHowJQyKG2Zk4RNkacs1_IgcK_E8aQ>
    <xme:ZpHHZ8EbMrVc6HbteFpwZ690FJXeE5eCpOl5rtRfatwr1ltg937K1YTiz7tcFiqBr
    21FliYBqWRFqnQ>
X-ME-Received: <xmr:ZpHHZ16PkRZUCtOcMHdKIfhF3gOzrTJaB1BGSJbKTNqkNiz2ZrMgiAMz9cxB_geTJu-opBCbQk88kO2hOIjKvPmmOWSLxncvfiHiOPi1ComHjJ56>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeffeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
    necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfei
    fedvgfejleefieefgfejvddvfeelgeelieefgeffhffgffeffffhueduheenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeguvggtrgihhhhonhhorhesghhmrghilhdrtgho
    mhdprhgtphhtthhopeiiuggvnhgvkhdrkhgrsggvlhgrtgesghhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:ZpHHZy3rU1ap_QmW9BayLjiLt29y77IyTqLRWjl8Hb5bGr6CUcrqiA>
    <xmx:ZpHHZ4FUxTZoR3tol-R0XQw119TROBAPZ-Tqesz72t4LdKJXA0y95Q>
    <xmx:ZpHHZz99w-F_kfqngkzIr1w8BPbjS5WtyotCTNPhwh52WyQ2NW1ANw>
    <xmx:ZpHHZ1l_dE15WPV9vRtpCzeMakNDbyfUSDhdpVzDtvfZOjZrSY8m7w>
    <xmx:ZpHHZ8CrwKXKb16xHB8wzyjDXkCDHECZLkNXDufkMAfXB0aHn9T5xobm>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Mar 2025 18:48:53 -0500 (EST)
Date: Tue, 4 Mar 2025 18:48:42 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: DeCay <decayhonor@gmail.com>, Zdenek Kabelac <zdenek.kabelac@gmail.com>,
	linux-lvm@lists.linux.dev
Subject: Re: LVM2 headers
Message-ID: <Z8eRZnRMMsz1-slY@itl-email>
References: <825942ec-5b4f-48aa-bac2-02198d2a2733@gmail.com>
 <0755fea5-22f3-4a90-aec7-07ddb88c2253@gmail.com>
 <31296432-4239-4daf-a0a4-58fdc7c2d955@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wSvRbXx5l/tao9ep"
Content-Disposition: inline
In-Reply-To: <31296432-4239-4daf-a0a4-58fdc7c2d955@gmail.com>


--wSvRbXx5l/tao9ep
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 4 Mar 2025 18:48:42 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: DeCay <decayhonor@gmail.com>, Zdenek Kabelac <zdenek.kabelac@gmail.com>,
	linux-lvm@lists.linux.dev
Subject: Re: LVM2 headers

On Tue, Mar 04, 2025 at 09:13:54PM +0400, DeCay wrote:
> Interesting, thank you for your answer! Yes, DBus should work for my
> use-case.
>=20
> At the same time, I'm looking into lvm2cmd.h right now, but it seems to be
> designed for the CLI `lvm` you mentioned.

LVM2 can't be embedded in an application because there are points where
if LVM crashes, the whole system must be rebooted.  Furthermore, there
are points where accessing memory that is not mlock'd might hang
forever.

If you plan to frequently perform LVM operations, then LVM is probably
the wrong tool for the job.  LVM operations often take 0.3 seconds or
more and are highly disruptive to other I/O on the system.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--wSvRbXx5l/tao9ep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmfHkWMACgkQszaHOrMp
8lPThg/+OdQEuYOkMY4I0UF9RXkZYQuUFRGIXPMRTUl2UCEA+4WvH3SQTZ5iZdin
JoB2PInbXWYQwB2GmVV8EUPNagoDqvW2yc0P60D8ybxcz9skhh3DE268HV/S2Dsj
cwQSEeMe31ddjivb96am6XiKMemNH4VFLRJ+1YlaMyb0A+lGCTgdOaPj17orcYRq
JirnKbtiNW/uBj78Zre5V+N9YuWvZWk0PnTlIUSgCWf5jJiVACuagqf7UJjCP7w2
Xegf19yodLl3xPwq/Q/NFA7IjQP+FtFrgUefsfcJvVIF8NZgoMf6mVv7tY1dGIKU
M3U1LHe4uS/GaUw33mUydNKB+0C9fUqVjH8TQzJ2wfJn7D/8na3ACLSvt8Iy3S0u
xeZUI/nulGTWPdwAh+mp9VN8IohXpewsGYExCYCB6SS3Ke7I4w0aE6UvXGNzC1c1
pigALghjvdROuVtEvXCNXmNI3IbSlMz6QrvNTax6zlZvqxvrWDxBQv5qL1HmdtzX
sztLTi6K3KaMwOb2gyOWNMI5q5aG3kT6cEDyyRhlsLDbuxbpcvH/QCRSKJAFYln2
4XvrN0AFGsfoBXoQlL3RnFpptlbZxxtww+Z59kUuoQoYI5IW0Z2+HiVyFuiwnZiM
SekSbETs4AM3Vq3crwACPsTuuw8d1HzwElrlU9Pt4avOQzt5dIQ=
=8ctR
-----END PGP SIGNATURE-----

--wSvRbXx5l/tao9ep--
