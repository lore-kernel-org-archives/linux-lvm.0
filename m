Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77223144D0F
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507827; cv=none; b=m53+9ZWEOU6QRvRrdkZ0+XMfC609ch/gqS8j/KyxjuuAJcc8gzpI2k4a/dH/DPlM6ZKcaSCehFHnEIMECOPCLRih6ZPHyqUzIpvx06CjAwYS6JRaJuva2HH7B+/h/xkV9bnftlJegGHJ39n/ZtznGLvy8oFb2bzlJzdDt67LZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507827; c=relaxed/simple;
	bh=PUEbBL/nXklSE7iw/FYTOhtry0YgveuGp2442Uv7Ep4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNOz3aVw36caur+hS3dhUK/1ureWa37+Q3CvYGsh+hpP0F6DDbN8wqfibJvCAOijaCFfKW2CAWrkrqncmJcL+V4NqkQsZqeB3Mp9QBIZ66/YnirikylmT043IcWfxctXou3aRnpdVBcF/Jg1ODUEXgqHEgmDhHiU1JiB9gsgjgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/Ov9UVJ; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/Ov9UVJ"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7eb324a9dceso20720739f.1
        for <linux-lvm@lists.linux.dev>; Tue, 04 Jun 2024 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717507825; x=1718112625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wO7pAHbFyD6plaSBjjUWXoIvjxwGJyNTe20TaI2GzY=;
        b=H/Ov9UVJopYBqu71C32M+gyp3eHq1iqOgba3EgKduuoif4ZJw/irTb7w3Ohh2Dp7+J
         ugXRlRCVH87u0ljZ4H7Ha55jVb2sZ6Hb1MSXf1JJm1KQY/64ZlZjeSy/rQ7zD6BmFoSX
         vQbrLyI+ArxgLDta5MY4sdfQhdiD2tT6ujPiHySxCle7rnfI/4Grmkbw8D/SSsAtzmw4
         NxWsOeih2ydW9tGqtD7PU4N3+y4PovF+PupSRTo4wPQd0HVSPQ2uzhY38KEsfgaaMAce
         E+t1QuN2aJFl7rZwpgcksnsG2/1Q1myV8lQU2udm9RT3ce0a/y22ZE294bcloc4OXbp8
         HNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717507825; x=1718112625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wO7pAHbFyD6plaSBjjUWXoIvjxwGJyNTe20TaI2GzY=;
        b=PWh7xd+JW8eZyW8OGx1IHx52GDtD3y0XNhJZ6vAxZ9+azokTJnUDMJZnvZ7SUgs95l
         DrD5I2N0zIooSymLEcdSKP1QXA0L4keAStnEpkIjPxtSz1lvoDPhyvHc+frjRR8GqRs4
         nijQ6+hat5ULxQj7akCHFffcmvEKs2T8N+Fe8D9VFK6+66Hfki21QZdHtZilEJ4G7tf7
         Q/9tyrH64p8AQXoizdpZOjQml50RPtDOB7651EF4857NBUhJ0KU4CKhvTbzcaOsYmego
         W9FFQw6hEatBmrPiJfmjki4hnzoNwdV+ZZdUfB3mbIfX2tnp0kVas1TcK+NqKgmiVVRg
         ZEew==
X-Forwarded-Encrypted: i=1; AJvYcCW8agtusOAEEjVkdwOJECBZqHhA5MxdrsYs6QnigQvLtoJZGG0u+E/7A3yblPMTwGuOMIcX9rKyWr9zcgLSehVXDSJnhx5e4BtW
X-Gm-Message-State: AOJu0YwvbrQp2PclC61sGNAsrHuLbnKj9uLX9hHLIHXMomydL858Acuc
	YGirJ2JHi4jhNpP2NQsiQs+U6NA4ClHm+O9shCn+vKFAC/hyMprkxn7bMOCgPRSYKjOPdbqFw2f
	tnCwpumNSEe8FdP+vFJFLRZWfPzk=
X-Google-Smtp-Source: AGHT+IHxP1IZh6zzOzElAbUd7vqQN4Gmuekvrix/MWUo7XcXRfgPOkDCf1zNAWlofnd39xa9g3UD2YuJgtdPM89JTNg=
X-Received: by 2002:a05:6602:3fc8:b0:7de:c742:8e0d with SMTP id
 ca18e2360f4ac-7eaffe97061mr1478730339f.1.1717507825413; Tue, 04 Jun 2024
 06:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com> <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com> <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com> <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
In-Reply-To: <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 4 Jun 2024 08:30:13 -0500
Message-ID: <CAAMCDee7ea+x43vx8Q4jJwMyVXpV+NVcTMLHyTYar-ZXkV6mwg@mail.gmail.com>
Subject: Re: lvm2 deadlock
To: Jaco Kroon <jaco@uls.co.za>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My experience is that heavy disk io/batch disk io systems work better
with these values being smallish.

Ie both even under 10MB or so.    About all having the number larger
has done is trick io benchmarks that don't force a sync at the end,
and/or appear to make large saves happen faster.

There is also the freeze/pause for outstandingwritesMB/<iorateMB>
seconds, smaller shortens the freeze.

I don't see a use case for having large values.   It seems to have no
real upside and several downsides.  Get the buffer size small enough
and you will still get pauses to clear the writes the be pauses will
be short enough to not be a problem.


On Tue, Jun 4, 2024 at 6:52=E2=80=AFAM Jaco Kroon <jaco@uls.co.za> wrote:
>
> Hi,
>
> On 2024/06/04 12:48, Roger Heflin wrote:
>
> > Use the *_bytes values.  If they are non-zero then they are used and
> > that allows setting even below 1% (quite large on anything with a lot
> > of ram).
> >
> > I have been using this for quite a while:
> > vm.dirty_background_bytes =3D 3000000
> > vm.dirty_bytes =3D 5000000
>
>
> crowsnest [13:32:48] ~ # sysctl vm.dirty_background_bytes=3D3000000
> vm.dirty_background_bytes =3D 3000000
> crowsnest [13:32:59] ~ # sysctl vm.dirty_bytes=3D500000000
> vm.dirty_bytes =3D 500000000
>
> And persisted via /etc/sysctl.conf
>
> Thank you.  Must be noted this host doesn't do much else other than disk
> IO, so I'm hoping the 500MB value will be OK, this is just so IO won't
> block CPU heavy-at-the-time tasks.
>
> The purpose of 256GB RAM was so that we could have ~250GB worth of disk
> cache (obviously we don't want all of that to be dirty, OS and "used"
> used to be below 4GB, now generally around 8-12GB, currently it's in
> "quiet" time, so a bit lower, just busy running some background
> compression).  As per iostat:
>
> avg-cpu:  %user   %nice %system %iowait %steal   %idle
>             7.73   18.43   18.96   37.86    0.00   17.01
>
> Device             tps    MB_read/s    MB_wrtn/s    MB_dscd/s MB_read
> MB_wrtn    MB_dscd
> md2             392.13        10.00         5.11         0.00 4244888
> 2167644          0
> md3            2270.12        43.88        56.82         0.00 18626309
> 24120982          0
> md4            1406.06        30.47        16.83         0.00
> 12934654    7143330          0
>
> That's total 35805851 MB (34.1B) read and 33431956 MB (31.9TB) written
> in just under 5 days.
>
> What I am noticing immediately is that the "free" value as per "free -m"
> is definitely much higher, which to me is indicative that we're not
> caching as aggressively as can be done.  Will monitor this for the time
> being:
>
> crowsnest [13:50:09] ~ # free -m
>                 total        used        free      shared buff/cache
> available
> Mem:          257661        6911      105313           7 145436      2482=
46
> Swap:              0           0           0
>
> The Total DISK WRITE and Current DISK Write values in in iotop seems to
> have a tighter correlation now (no longer seeing constant Total DISK
> WRITE with spikes in current, seems to be more even now).
>
> Kind regards,
> Jaco
