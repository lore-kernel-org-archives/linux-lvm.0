Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A113D270
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513413; cv=none; b=Ckj9gdrK4L5fXy1T2HVMV5Z4CmkG8s9+oTiyHcTefH6hRXydzvHJt+bDAXB+gtoJToOfm4p2lbSFLXnsH04fIp81a+5axYn9Op80C2i9+F61yveAK5awOeqjET77aXwyRIOrPfbxVGhPVLpXJJYHBai7l26ICu2QbcOK44hMxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513413; c=relaxed/simple;
	bh=CeGxYWP22uUxbeeZo92OxGAfdw8jtYExzG2+4FzdCoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSbQPIMURGYjgYIulAhLje4rbuIYIOGJ/K84MUDItsfeFPg62vpLFJqfoOcJSHwyOozKa+oVxxQMpf7A9lEujM6O/RkmqG4dkpeXPg0+mlnQq5h3qZWhqFGipphmZX6HVNnL96WQD5n3svQYU2oCDcpwpJdvMf5ZQSc5gd88778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkQPlNXA; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkQPlNXA"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7e1fcd2662cso46211239f.2
        for <linux-lvm@lists.linux.dev>; Tue, 04 Jun 2024 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717513411; x=1718118211; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI+A/+xCebcj3yaMOR+KspjlmayutAQmfYkGO5VARbg=;
        b=lkQPlNXAu+sA/hl2OUS9kYTW+NZFcsrbZt1pvbo6fYPECYQW/kFbF/z5amaJMnTg2+
         71/z0dwdqOByx9qwENUeYyamtuxJBOcDOKJe2XFgIdhOtBVE3bbFQsahtDSRZ5/zBplk
         HwQEkv9Zg63WTBUaCyomok/lFuOHs+H6CFtgZp1B2CtLV8P72zOU14hRcFQDhXTftmP4
         5qF/8fcCRe3TIJd3W/MPkaacfNqMPx5tLXNuhnP+A+vgaxNB9+aAg7ycDa2rvSpN8of5
         v+J16z/48Pn+A51C8ncQmVXOvmHYw8tgEsAwpMwqfDFTxzt0dC/GwWNGk+Q3Ds6eIkIG
         3f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717513411; x=1718118211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI+A/+xCebcj3yaMOR+KspjlmayutAQmfYkGO5VARbg=;
        b=PEFpxsB2ljqtLVy2mY6AHoJ++R7iAbpNwmHUi5NmLiRJLDbiZcpo6XdHAiSPDD5tKq
         hbcyAp02L5ojj4G4/N6499I7AoH0Uk40+LPK1YGSs4FEg4PTqG3slkq+SSTU5AoAGGsy
         4nNnnTfC3m0jTBDpN5XCpBroy0AS2w676ggQSZqkXhpPgseSSK3PxGQSDvSnRr1q378U
         O5g9rkIzpw+BdwV/cgJVjkj4ZzWbMiaJGKSVr99HWYXsWOFW07s0N0Tho6WJ//SZVRVU
         +xNCOn9fTy6ZsYnaVr8H0TS/ckfxxr2XZpzOFoXxgW+0HObSSWg8IPfLRJgSuKBdwOnG
         RtLg==
X-Forwarded-Encrypted: i=1; AJvYcCXFrW9B1ko2/GiK18RnNj3kbjQ2QqjPrUVaYdKfU47bW6umRkLx/9t5B0YYSR0wiztNyGgj0LaDPOOsgSbSGAnH1TLn9CRtgkLs
X-Gm-Message-State: AOJu0YxJ2bcaMs4lmU2V8dsZB7oj/UI74ReTKb08iUrQmvF+TuFFtPSG
	8sZM0jFpmYLWR6PcC20lzHMa6yfweBWX2QTSM4Xs0v248YpaPgjbZGoDdCb09gwxBFc752sxilS
	qXlnCYPafogeRMgvpzzabFeUDOro=
X-Google-Smtp-Source: AGHT+IETCubKRiPNtJGoy8XINfjd/uL9LB5eyzcJyQ3CWDzXFFsx7/de5B3dyDmO3YdYMtClN796dvVq3Sok6zii1G0=
X-Received: by 2002:a05:6e02:20ee:b0:36c:4887:4434 with SMTP id
 e9e14a558f8ab-3748b9c8ca2mr165010985ab.15.1717513411392; Tue, 04 Jun 2024
 08:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com> <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com> <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
 <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za> <CAAMCDee7ea+x43vx8Q4jJwMyVXpV+NVcTMLHyTYar-ZXkV6mwg@mail.gmail.com>
 <58c4fae3-7944-916a-80fd-303b71e4120@gathman.org> <f5a7e819-f53b-4dd8-9ef4-afa9423baf60@uls.co.za>
In-Reply-To: <f5a7e819-f53b-4dd8-9ef4-afa9423baf60@uls.co.za>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 4 Jun 2024 10:03:19 -0500
Message-ID: <CAAMCDefvnjQ2eZajNpV21DAUfRBgg_2YFZhw7UeC2CJiPewVsg@mail.gmail.com>
Subject: Re: lvm2 deadlock
To: Jaco Kroon <jaco@uls.co.za>
Cc: Stuart D Gathman <stuart@gathman.org>, Zdenek Kabelac <zdenek.kabelac@gmail.com>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The SATA disks work ok if you use smartctl to set the SCTERC timeout
as low as possible (smartctl -l scterc,20,20 /dev/${drive} ).  I have
a set of commands that starts high and sets it lower with the idea
that each different manufactuers disk will have a different min value
and I simply want it is as low as I can go.

Desktop/Green disks do not have a settable timeout and timeout at 60+
seconds or more.

Red/NAS/Video/Enterprise/Purple SATA and such typically timeout at
10sec but can be set lower.  SAS timeouts are typically 1sec or lower
on a bad sector.

And I have personally dealt with "enterprise" vendors that when using
SATA leave the timeout at default (10 seconds) rather than lowering it
so that the disks work reasonably when bad sectors are happening.

On Tue, Jun 4, 2024 at 9:50=E2=80=AFAM Jaco Kroon <jaco@uls.co.za> wrote:
>
> Hi,
>
> On 2024/06/04 15:46, Stuart D Gathman wrote:
> > On Tue, 4 Jun 2024, Roger Heflin wrote:
> >
> >> My experience is that heavy disk io/batch disk io systems work better
> >> with these values being smallish.
> >
> >> I don't see a use case for having large values.   It seems to have no
> >> real upside and several downsides.  Get the buffer size small enough
> >> and you will still get pauses to clear the writes the be pauses will
> >> be short enough to not be a problem.
> >
> > Not a normal situation, but I should mention my recent experience.
> > One of the disks in an underlying RAID was going bad.  It still worked,
> > but the disk struggled manfully with multiple retries and recalibrates
> > to complete many reads/writes - i.e. it was extremely slow.  I was
> > running into all kinds of strange boundary conditions because of this.
> > E.g. VMs were getting timeouts on their virtio disk devices, leading
> > to file system corruption and other issues.
> >
> > I was not modifying any LVM volumes, so did not run into any problems
> > with LVM - but that is a boundary condition to keep in mind.  You
> > don't necessarily need to fully work under such conditions, but need
> > to do something sane.
>
> On SAS or NL-SAS drives?
>
> I've seen this before on SATA drives, and is probably the single biggest
> reason why I have a major dislike for deploying SATA drives to any kind
> of high-reliability environment.
>
> Regardless, we do monitor all cases using smartd and it *usually* picks
> up a bad drive before it gets to the above point of pain but with SATA
> drives this isn't always the case, and the drive will simply
> indefinitely keep retrying, blocking request slot numbers over time
> (SATA protocol handles 32 requests IIRC, but after how long can the
> Linux kernel re-use a number it has never received a response on kind of
> problem) and getting slower and slower until you power cycle the drive,
> after which it's fine again for a while.  Never had that crap with
> NL-SAS drives.
>
> Specific host is all NL-SAS.  No VM involvement here.
>
> Kind regards,
> Jaco
>
