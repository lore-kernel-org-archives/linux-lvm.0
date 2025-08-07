Received: from mail.stoffel.org (mail.stoffel.org [172.104.24.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B071993B7
	for <linux-lvm@lists.linux.dev>; Thu,  7 Aug 2025 15:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.104.24.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580110; cv=none; b=rHr+nS+vTtwJT/Kji8pj054bVp4D6NOP5MJczBQW+KwiaDo+NrZlyxuaiht9QloHw502RUGDA2hTmJAuxsVD2fbAGzlffysRFCLZAA4kG7JxrW45pUo62MQPUJR27QXeYvOhmpfBg/PuYURY5uCYtU4zYgVVkRZdWDCeMCenKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580110; c=relaxed/simple;
	bh=1cPH1AYU8EE91JkmZuXUMeGTsuVPJcTOW8k2sfo0WPI=;
	h=MIME-Version:Content-Type:Message-ID:Date:From:To:Cc:Subject:
	 In-Reply-To:References; b=NVRI5LeQ1+LpwivpjZVlCTPz9hS00IJ48pdj5nz1M8o09vKF1DD5Qs6NDJ8uOOsV2Qe3xO1uowUdXbRjZzC/ks6Glo9c319nOr0xxH0O7aztD3uCidWwqsiZlOrX8cvDfYTDVfGAhB2W3KgUK07xlNwr8WJCnhGBmM6kkLUwqDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stoffel.org; spf=pass smtp.mailfrom=stoffel.org; dkim=pass (2048-bit key) header.d=stoffel.org header.i=@stoffel.org header.b=VxijOrew; arc=none smtp.client-ip=172.104.24.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stoffel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stoffel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stoffel.org header.i=@stoffel.org header.b="VxijOrew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stoffel.org;
 i=@stoffel.org; q=dns/txt; s=20250308; t=1754580107; h=mime-version :
 content-type : content-transfer-encoding : message-id : date : from :
 to : cc : subject : in-reply-to : references : from;
 bh=1cPH1AYU8EE91JkmZuXUMeGTsuVPJcTOW8k2sfo0WPI=;
 b=VxijOrewj0zAMFNHvsmFPdMhGydXDaEqvoBoTBIFFi1JsULW+jy9lMkQKSAEWIW5Oix89
 E2104s6A72NV0ITpKttuIGo/OX5tm2Ny6SJJubctPKc5i8scxRPk4ReyjN6H3+hLEYRI5pZ
 xgrvgwX+9YE0vGod8jTqgmRIPGW2Z4nXU+vuHWwMra7RwhRdOixFzAWOwcE9RxntbQr4u67
 /jAVh2gto76V8MxHzyQLlbQIHow0goUxGcJfOkBkuNcni4sLffjomoMOxMw/KkWohyAJo45
 C/xIbOS+sVK1aBmJn9lfQzkDiPO9ARlkIoitB9cuLQJXwIMnoP7Z5zQ7NKYQ==
Received: from quad.stoffel.org (syn-097-095-183-072.res.spectrum.com [97.95.183.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id AC9131E67A;
	Thu,  7 Aug 2025 11:21:47 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 52E67A11AD; Thu,  7 Aug 2025 11:21:47 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <26772.50315.313737.277898@quad.stoffel.home>
Date: Thu, 7 Aug 2025 11:21:47 -0400
From: "John Stoffel" <john@stoffel.org>
To: matthew patton <pattonme@yahoo.com>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
    "Brian J. Murrell" <brian@interlinx.bc.ca>
X-Clacks-Overhead: GNU Terry Pratchett
Subject: Re: Best use of a small SSD with LVM
In-Reply-To: <2070465037.1525842.1754533330183@mail.yahoo.com>
References: <1b749fa978a120d9d9e3ed1951aa45aa753e8006.camel@interlinx.bc.ca>
	<2070465037.1525842.1754533330183@mail.yahoo.com>
X-Mailer: VM 8.3.x under 28.2 (x86_64-pc-linux-gnu)

>>>>> "matthew" =3D=3D matthew patton <pattonme@yahoo.com> writes:

>> =A0IOW is LVM caching effective?

> no it is not. Unless your workload pounds on the same files over and
> over which for OS files is nil.  You want open-cas
> Linux.=A0https://github.com/Open-CAS/open-cas-linux

This looks interesting, but why isn't it upstreamed into the linux
kernel?  What's stopping it being added if it's so good?
