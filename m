Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438CB1DFC7
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705493622; cv=none; b=aht3Y2pggtfcFWLQwTxweG9Badj7zsIFEJjpzy4+MYF/+kaZgDF3wenehoazfbjVGGGIMcsxbckKsQjerpQmtHKgyDA0Zg3YtudO3rJYr4xHGAlfZNBD+KLEuDVG3ItuMEb7yrZ7UAahy7e7JG13NWH1a6eX35W0ImJtKaRaoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705493622; c=relaxed/simple;
	bh=ADIpU1WBe2TQLxst+Appqv/IAlzvUBuyUJS+mddXKTI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=M0lqgNPFuOIPhpdB7sHsXb+UlCoTTM9B6JgI9SeQqOPUl1EGMX/GNa/HTYECdEtp2IelaqZuPoEviyT9N9Wi+rN3SK8jd1PCDfC/2pc6BT0bdn+6wS2yzS71JEyH83QrK7PPeXFKoIrYl4TRO1WZf4a2MGZB/3JoKMbO7u1hkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm3bNT3D; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm3bNT3D"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7baa8097064so489545039f.3
        for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 04:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705493620; x=1706098420; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbAcyEbPZnnopTaBj+CZDEDXGac9DD9staWIEU91s2E=;
        b=Cm3bNT3D+V0dkRVdWn4qoGCDdM0EtiQHOB1a4zKXp0/HLNlmuj9EEAoyyVXojBqtVl
         Kft3+vHAQGO23qFk4FwRcFYf9Cn6NgCRlGyPIPRp5XAfXBxDs0S9P8dICAnRo/g2wtM7
         Ic8y/DYcuciGsVnpg8ZEsFxlJsvhrZFVRrh5LOx4KScYO62GcS/BvVCcMWiIh3vNzf6b
         xLAEFKsGgMFs+Cg4XRfb7FopzfVBf9l8kqpSElv9M9KarjSK3WXYu3UGP0BnMIXuSxUU
         IE6y3+nEI6YCOjWoy7CLujWY27GsqBA76cHnKD7dpiPOel1rWxp3ZSzLpnFV7xfUHQm+
         ciUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705493620; x=1706098420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbAcyEbPZnnopTaBj+CZDEDXGac9DD9staWIEU91s2E=;
        b=g259gp+l9wOqe4QYZYk76NSJoLXZuTe3lDNXY8SCGkY78zpTF9aDaBBSutEuari36M
         rYSr+SpctaBNUubj3bodbQUJdn8le+ol0/GTlnlPc0saX32B3jZEYh7FU1kvLvrxRKWh
         3Kq2Jm/d/CIzDF6613DbnLMH1PXEtsyiutzYS7SwkGzBX7RwuEeFpVVV7Ev+3euFRsqg
         OvDHn+ErO4/S8skrvP7Et39U23VrIX+iiLAfVPYX2yXWWMLxNpqm563RJpvyUONqO/jM
         1l67HWeOmyICwW5bgKVj2JS2zZ1fH5av7xLfmzeSlwKx/AaEMU8xM1NkVwiZLnSlV3xY
         B50Q==
X-Gm-Message-State: AOJu0YwAJgEVl6Aquq3mRmu5lRsBkq4Vljo2zYDsvPGnIiW+eC5SoPNN
	lNWVqnw+VGCZDuhabvUB2Gu/1rgkboNr87UXDDs1EC7m
X-Google-Smtp-Source: AGHT+IGy4Iuwu6VVeXWKJFyV09cUlO44eAnGDhtlQJ9oTDCurkuVIsP1nMwJJmXtDwzjIkVFEqOolv4PrBG68EKU/cc=
X-Received: by 2002:a05:6602:3404:b0:7bf:31fa:e007 with SMTP id
 n4-20020a056602340400b007bf31fae007mr9204038ioz.7.1705493620243; Wed, 17 Jan
 2024 04:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com> <87y1cp9lwi.fsf@vps.thesusis.net>
 <ZabjW4HWOSfy8sRN@mail.bitfolk.com> <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
In-Reply-To: <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 17 Jan 2024 06:13:29 -0600
Message-ID: <CAAMCDecEMT8fK045OvUMuTDVi+iEDH1B3HJJFo19RnroYXKttQ@mail.gmail.com>
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
To: Andy Smith <andy@strugglers.net>
Cc: Phillip Susi <phill@thesusis.net>, linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 1:22=E2=80=AFAM Andy Smith <andy@strugglers.net> wr=
ote:
>
> Hi Phillip,
>
> On Tue, Jan 16, 2024 at 08:13:15PM +0000, Andy Smith wrote:
> > On Tue, Jan 16, 2024 at 01:24:29PM -0500, Phillip Susi wrote:
> > > No, it wouldn't be a problem without the partition table.  ext4 uses =
its
> > > own block size, which is pretty much always 4k.  It doesn't know or c=
are
> > > about the underlying disk logical sector size.
> >
> > I've found quite a few people having similar problems to me so I'm
> > not sure about this, but I haven't had chance to test it yet. I
> > will try it out before I explore hdparm.
>
> I've tested ext4 directly on the LV with no partition table now and
> you're correct - no issues there! Apologies for doubting you - so
> many different vague accounts of issues out there.
>
> So, the actual problem here is something about the MBR partition
> table. Off-topic now for this list but I wonder if there is a safe
> and reliable way to modify such a partition table after sync to
> allow this to work=E2=80=A6
>
> Thanks,
> Andy
>


You might have the 4k alignment off.   IE the first 4k block on the
partition actually is across 2 partial 4k blocks on the disk.
What does fdisk -l look like on the 2 partition tables?

You would want to make sure that the first partition is divisible by 8
and that the partition in the partition is also divisible by 8.

Typically fdisk and other partitioning programs try to do that, but if
someone manually adjusted it and/or an old enough version was used
then it might be wrong.
