Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451225760
	for <linux-lvm@lists.linux.dev>; Mon, 13 Jan 2025 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785248; cv=none; b=kl6bW4GdcEs2ql1x5hrdRj9ky+VWMyEPauKhF2c5LpXTOA44VBX4qfxGDhKOI5zOhZ8fO41W40H3LWISykM0PTVzn1F5ES6Gp4XIMzKEx15bJ2q9/uVvEFGCvUFH5U65s0kYCQV9ap4JlqR7y8cL+48wUlK7ousbbGH24nl4qIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785248; c=relaxed/simple;
	bh=c0IekNYHqd8+LrZv8BuwagpwQ5BnZOptlJmhYt+jzGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ryLyhc27CTdjdMdYPbY8buC0PZYBcVVdTVlCeF+0wDJw9bBUOH1FUnZSQCM7hetewcKj9Ewv+X5TGNCSSNAVfIw+4vP7VBaTPWLr/YNIcBq/PgHuXT9P3o5xpsuIYrPFPHaS9/Igq1/iAW5lIr1I5ojaD5mrlYsUkG/GDgFLigs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BatWjhi+; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BatWjhi+"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5f31b3db5ecso1934225eaf.0
        for <linux-lvm@lists.linux.dev>; Mon, 13 Jan 2025 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736785245; x=1737390045; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDKk/iaW7Cm43Uv/r5qm4vytP5YskscdrqKZ2o9PWlk=;
        b=BatWjhi+uKpGreONyMr3gjbZC9lpLaK9b5bl5Tev6vAxZ9lgzooM16Qu+96iICTg0K
         GgkDRyPub75HicAO/85lnUBhv46ZhkL+sm/v34mELlU1axqz40x4SKNiLXc6b+j7P2dV
         CI9+EHPV3Gww22mrmC/owuonFeOY1uFKAWMz6hAwoZtRs9SfLec/EUS8eXu3YEa95LdO
         hF9EFGNLgELhIEYq9ar5q+Pdvz7jCOklfVvU2+uk1mSsZyLI1PqfeyJY01S6hgpFIUy4
         rnVyOBHHZ3/z75iGRvydHjffMBADO3S6U+arfG2cJdyT16A5uryvchhk9QKjgsSHBJB/
         iDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785245; x=1737390045;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDKk/iaW7Cm43Uv/r5qm4vytP5YskscdrqKZ2o9PWlk=;
        b=NqZkYQdB1MDtKh597xXbCB9US0M2Mo8p83S/dhdDS0GLkI2/BjM9LJXz1rFv2m29iQ
         LEOD6KqKjNIDX2uDEiVvw0vLkTCCKvy0KszMgNESXOwm0mlx8eCmSkoc3eSX79csJXit
         HL3RcsnwSnZWnydTrUumeerusfdUgK93ykgrQo3J0/d1usFUJxtLzgEXW1xc3lkgQ9KH
         BgwsB9+rnqgSxI/t3j0Px/oI5AVMaTaxHJletr2yFZlauh5+PHfaV6XAb6w3lWUxtVfB
         yk63eNyQGgeDqw8ad7ZbVQeV56/9SGx3/1ECp4tB0U7oQGoWpw/Hk3knZwje3JjxyY7+
         Mz9Q==
X-Gm-Message-State: AOJu0YwCSnrEQk9gguTohTccboq0mR5XkbY4DXassCNb0fOEQaZVYy9t
	c0HoRTWuOOa2vPwctWLumTIN3v7goMDK6TmyIM3xAVIN+YHW2LKhSzXuDbPR+QVT5pMBlmJbLTS
	g3/E2W6VLRl8bL0Z11dHNm38IPPm2mwdm
X-Gm-Gg: ASbGncv8PJGP8rZocTzuEFiE1VdaHlaIk2txev02oGVyUqEpczLc7vkwWNqTQBBokN/
	fT9cd+PJx3J8SeFSNafcmQYIaMSkpL0pLEUC3vycea7yIkb28uGBURDue95UAQeeIyjVi
X-Google-Smtp-Source: AGHT+IHCAcq++/l+2noEVkVwCr1+wSnxhKLvVjw+mNwxgLC/YRakjbChdOfI++Mj4M9B3ryNzE/irpyQzl1hFFv684E=
X-Received: by 2002:a05:6870:ce45:b0:29d:c764:70e1 with SMTP id
 586e51a60fabf-2aa066942famr11278230fac.17.1736785245356; Mon, 13 Jan 2025
 08:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAbQbbCN-=DDSerkOoKHCHxwA9gu32HvsCezOHU4NhR0cByKpA@mail.gmail.com>
 <47cbadf5-fa07-4e9d-8bd2-9cf969777f4e@gmail.com> <CAAbQbbDGW=Q-NBVdgKqt272VYdYdd_i7Cr8qPLJiS2moSjQMAg@mail.gmail.com>
In-Reply-To: <CAAbQbbDGW=Q-NBVdgKqt272VYdYdd_i7Cr8qPLJiS2moSjQMAg@mail.gmail.com>
From: Tilman Vogel <tilman.vogel@gmail.com>
Date: Mon, 13 Jan 2025 17:20:29 +0100
X-Gm-Features: AbW1kva_QMZsGnfHc4BbjRk4RK6L95COt5VJ9vkFGDU3xLu37GmCrCPHcWJdcBc
Message-ID: <CAAbQbbA_gvXzgpmgAM8jun3-8=-EiFdNoKGJTRn0P09+RKA5hg@mail.gmail.com>
Subject: Fwd: pvresize after pvcreate changes PV size: expected?
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

(original message was rejected because of HTML)

---------- Forwarded message ---------
Von: Tilman Vogel <tilman.vogel@gmail.com>
Date: Mo., 13. Jan. 2025 um 17:09 Uhr
Subject: Re: pvresize after pvcreate changes PV size: expected?
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: <linux-lvm@lists.linux.dev>


Hi Zdenek!

Thank you for the explanation! Let me give missing context why I do
care even if it is not a bug:
On an SSD, I had partitioned such that all space at the end was in an
LVM PV living inside a LUKS-encrypted partition. But now, I needed a
new non-encrypted partition such that I had to shrink the
LUKS-encrypted partition. The PV was not fully utilized and had plenty
of space towards the end. So, this involved:

1. pvresize --setphysicalvolumesize <PV_size> ...
2. cryptsetup resize --size <LUKS_size> ...
3. cfdisk (or similar) to adjust the partition end

My fear was that I would choose a wrong <LUKS_size> and cut off data
that the PV still expects to have. When I looked at `pvdisplay --units
b` (or s), I was puzzled by the discrepancy between what I had given
as <PV_size> and what was listed after "PV Size". So, I started
playing with what I sent as `test.sh` and found yet more fluctuating
size information.

So, long story short: If I want to know how much space LVM is using
for the PV such that I can resize the containing block device without
loss, is it safe to use the value from `pvdisplay`?

Best regards,

Tilman


Am Mo., 13. Jan. 2025 um 14:46 Uhr schrieb Zdenek Kabelac
<zdenek.kabelac@gmail.com>:
>
> Dne 11. 01. 25 v 23:21 Tilman Vogel napsal(a):
> > Hi!
> >
> > I just encountered the following and do not understand it. The confusing part
> > is that when I run pvresize without size parameter directly after pvcreate,
> > the size still seems to change even though pvcreate of course also uses the
> > underlying device size just as pvresize should.
> >
> > I am attaching the test.sh for your reference.
> >
> > What am I missing?
> >
>
> Hi
>
> You are missing that the actual size of usable count of PV extents  is not
> changed by a single bit.
>
> The surrounding accounting changes with the lvm2 metadata content size accounting.
>
> For a user of a PV it's important there is 24 free extents of 4MiB each in
> this case and this gives a usable size for LVs.
>
> Rest is either unused alignment space or space dedicated to PV header & lvm2
> metadata.  This space is accounted a  bit differently when you create a new PV
> or you work with already existing PV with already existing lvm2 metadata area.
> Yeah - it might be possibly 'addressed' better and PV could be readjusted
> after initial create - but it's not a bug - so it avoids 'extra' clutering
> of PV header space when it's not really necessary  (as unlike lvm2 metadata,
> PV header space is not using any backups - so the less it's touched, the
> better....)
>
> Regards
>
> Zdenek
>
>
> PS: for small PV sizes like in this case - using smaller  extent size  (i.e.
> 256K, and reducing metadata size to i.e. 192K) may  'boost' usable  space for LVs.
>
