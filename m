Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA2219A95
	for <linux-lvm@lists.linux.dev>; Tue, 22 Jul 2025 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184903; cv=none; b=c8lZj5dDagMNGaFxAj57DPRyzXBHSEpnhlb+fzHDX353Q2OEKWZ0hRg83Ov2qyakI/qgqO2JkCkZMFgeMCdEOGgqqJhmBWf37YiGuNIoMWJMCQqWtfMofWh00bj4QLLAkem4cwawFqDwxaudqnPXTfwnwNx6VUUAJtNIxmpsE3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184903; c=relaxed/simple;
	bh=4QA5GulAfjIBgbEQT1H+YaqTf13hSwb3lZbm5HSqix0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXzuRn3+ydfZ1EV8k4Spm277faH7hg86dzRp1KfPdlsDZBWJp9ErB0TtyVFD8opxhRlsxSkgTdcC1qB6FJMlnirRCHgiVva6J/wwNFJtyYx8yfkEjPWZiNnsmzTqfZZjeNqbPc/fYzSm1tR3z4y5nk5TsaMzsS5uMmr2E/OHiDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKgVxAW/; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKgVxAW/"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86cdb330b48so428830039f.0
        for <linux-lvm@lists.linux.dev>; Tue, 22 Jul 2025 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753184901; x=1753789701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zo3a0GIfc4Oy4/SNlj81pxXOyynaqB202RNwabWOGDg=;
        b=iKgVxAW/GsNetr23Xp54KTif7FpzClcFA+XITrYUE08DffKaSg70KpoPVwLhLXkT4y
         NnYzwMKFJmnhxeefk1bILHbb9k2gegE7aCxo2qPozNyOoZ9vEc7uaBZG/Aiqi7kjZjzq
         5up6vSeOSxYPFwMpCwt/9JN2ttnHSZ46GfyH0nQhQJ4Cg335mqBqYcljCIRReLS89fq5
         jUD6AhT1FMN/JVl6YICsaOFFKdDxxklfXu6mZ0MyuyayuS0JVF0W/XxJbMgZH51r3dQ/
         PA2YQ1dTk4Mgv2G36d89slcexDwyg8rPpSHnSjO9URNVCRF49rFu2Ga8msZYwSMo89B0
         LvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753184901; x=1753789701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zo3a0GIfc4Oy4/SNlj81pxXOyynaqB202RNwabWOGDg=;
        b=SHvMA1S9di3Z3FE4l7KdfF3r9WQ4vMmuxd45lwmWiBOm+qcpmxhwBMR+G5lnN3FKyq
         zGRXh8wIB11ORT83L/w+yx8UbDAbG0MxE5QEx45I/9lyScK57XlOPgU5ETOe2SD0Fzfg
         jQ4qqPuF8hZeKkpjBPSF5G5IB0LLbUb9YitCNyQV0ZV4yx9aVOzQdHwrEHy2WfyC1VUG
         iC1ldYIpnk7sH/p9GRBYsZJ3K/UTkHetKO+WHlw7nOtBp5mnYduDRowLaHfdctFwkboK
         PuOYtgXZJ2k/M70aEtf4SDYxNIrNDhNN1eAjhAO1mOBVxcL2iV4Nce1EsXzJC352u5ac
         KcXg==
X-Forwarded-Encrypted: i=1; AJvYcCXs3h3Fv9DzdXiBQ/tlE2vxfrPN9aAONfAGSMNy3tdEH2JBQ2IX5Ohx+VxLaZfig/3qbjW19Irx3t8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwadIGcwj1pZgHYwogdZudKXst1VJ+HYHF0CgwTl/6P5eN7Q45O
	I9WrR3arG2tcUSO/HtigK37hIvhMhYavTAwUOyunXJ6KWNEgO6P7IJHMngGXl31XJ+7JAzT8S34
	BXKSquo+kESmqS6EX0v6W722f/ksoXnA=
X-Gm-Gg: ASbGncuHT0iLwA0XK+g0yOfyyDDoJ1gslbZCC3GMQ4mzAcB4iBKou1gNHoXwGN3OTvx
	RhU6Z3ZHcc3Xph7sVNHxcJ/lYdSN6e57GU/aufap+OPTcqqPxYloOshtVOM/coUU+8eCfhZYyTH
	AViL1vYjg7V3sK8nK8CleIXWynutfcwbyeaX//4a82+FhMqPoATWhpkEeRH0gv1PDZyCl75Fdck
	q29tA==
X-Google-Smtp-Source: AGHT+IHX7p0EVLPKdvAEbPCRVNENtuuI26sOWPPD7+QIvlUYMn0ChN4t3wj+XsKtVcRusHzT/JiG09toVWr3CYavblA=
X-Received: by 2002:a05:6e02:3113:b0:3dd:b808:be68 with SMTP id
 e9e14a558f8ab-3e282474739mr297944475ab.16.1753184901464; Tue, 22 Jul 2025
 04:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com> <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com> <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com> <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
 <2047613453.835684.1753116128145@mail.yahoo.com> <d935e1ae-9e0c-4b9c-ac3c-9a8e080ae16e@gmail.com>
 <FR6P281MB36729FA59F26E8BEE18F2D91EB5CA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR6P281MB36729FA59F26E8BEE18F2D91EB5CA@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 22 Jul 2025 06:48:09 -0500
X-Gm-Features: Ac12FXzqoGzCkJG8x5S1u2gOnYod8NJylz6951OHcdWloU8k1q-0Gb6YWl53QSY
Message-ID: <CAAMCDedO5OzvuM=WtdOBRQEzEQo5yP=yZvsDZ7ArhAcgZHwnpQ@mail.gmail.com>
Subject: Re: striped LV and expected performance
To: "Henry, Andrew" <andrew.henry@eon.se>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>, matthew patton <pattonme@yahoo.com>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, Erwin van Londen <erwin@erwinvanlonden.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When doing direct, typically it is all about round trip latency.  And
with a VM you add the VM latency on top of the underlying disk
latency.   See what the await is in iostat on the VM vs the physical
(to real disks and physical to SAN) when running the test.  Physical
to local disk has lower latency(seen .05ms) compared to physical to
san(typically once the write gets to the SAN the SAN has to make a
copy in a 2nd SAN nodes cache, around .2ms-depends on array arch), and
vm over either is higher that the pure physical).

On Tue, Jul 22, 2025 at 6:24=E2=80=AFAM Henry, Andrew <andrew.henry@eon.se>=
 wrote:
>
> =C2=B4Thanks for all the tips and info.  I think I've come to the conclus=
ion that the reason I'm not seeing any speed increase from striping across =
the virtual disks is because there's only one communication "path" from the=
 guest OS to the virtual host/SAN.  I've tried all combinations of LVM stri=
ping on a home server and the striping behaves exactly as I expect it to, e=
ven according to the hard drive manufacturer's spec. sheet for read/write s=
peeds that I'm getting on those physical disks when I stripe them, please I=
 see linear speed increases for every disk I add to the striped LVM.
>
> Regarding the very low write speeds with dd in a VM though... On my home =
server, with 4k block sizes in the entire stack, I get about 70MB/s on my m=
echanical disks.  In the virtual environment with solid state, I'm getting =
10MB/s.  This is irrespective of whether I partition those virtual drives o=
r leave them as raw, whether I use 3 striped devices or just one device in =
my VG... it doesn't matter.  By the way, the reason I'm only getting 10 MB/=
s is due to my oflag=3Ddirect.  If I skip that then the speeds are much hig=
her due to caching, but I wanted to test without caching.
>
> So, I've ruled out the Linux guest OS/disk configuration as the problem. =
 It must be something on the VM host side that is causing the issue, or som=
ething to do with "expectations of write patterns in a VM"?  For instance, =
if I create the stripe as 4k block sizes in lvm, but write a test file with=
 dd using a block size of 4MB, then suddenly I'm getting 700MB/s write spee=
ds to disk.  I get it, the higher the write size the better the speed, but =
When I compare like for like with physical mechanical disks and I'm getting=
 higher speeds with the old mechanical disks than in the VM, it just feels =
wrong.  But maybe I'm "comparing it wrong"?
>
> /AH
