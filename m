Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D63224
	for <linux-lvm@lists.linux.dev>; Sat, 22 Feb 2025 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740243365; cv=none; b=F6lmClDpr+jppQg2MQRE46zIlMcYPMJZzXXrl0T80sD7uA06P+z/qDY3sIjIMTR7bnVx6D971C3bNgOt/JLeP1v7s2jE4HRcXS0/qi0DMczrjC5s1pMZ/ZVu/IFsTp38pjwuC7mo4GGTv6IU7Rvc2aHF4FCwXRvBXO7oysW63Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740243365; c=relaxed/simple;
	bh=k24SnqYluCLg6rCxLsLt74IVCrx31cKN0E1kHaS61Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WirkZzqk9dts0KHm2DUzJvj2s6cXin9gMKiRg9PpO7eAvlcVGL8iVDumaPbguUqTIsREvYXMffRMdetCeUgheV59IbQ+IRew+CdK6mvagm+eGNgDArGYx4a/2UCPQtLFqaUnYt/5ukhb43xbJVQptJmGAwzHatgaeAEeh6G606s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6c0Hhtw; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6c0Hhtw"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-855a4024edeso96682539f.0
        for <linux-lvm@lists.linux.dev>; Sat, 22 Feb 2025 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740243363; x=1740848163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLeOU0JB76lgRM3R6gnXph90ZisJMa7ncFdjSceuCQQ=;
        b=l6c0HhtwCedvvfPypIZhHvtpUkihxFSYdKfUKzgjOJudOvXE+FEAhMfEpRixsVG+kZ
         7VBTWqDMOq4sVB42Mi+Ozdu34P+d7F9A2SGesMXUIdIErXqeTavPxZIMqSJ03qVHa8Qj
         y8y9LXEDbxnFIefTS83lLRLIYO0E04Ieqtgu/j06jrs/IbmmGspz7G3FpJ50Z5K0SZIs
         HCYyhaBCL3GIIdQnV8IZimvia0oHOXKA/tuqVTW4dhjVgpqq0fgDvxH/gRrltuyNKmwP
         WUp5lSAp3ZvFH5jPg0btnpjVFMsyS8tg7h1SMvUZeW7Lo/2/cy9uhpUg+geZ5jCbxg6Y
         nMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740243363; x=1740848163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLeOU0JB76lgRM3R6gnXph90ZisJMa7ncFdjSceuCQQ=;
        b=OKSV0cMtquwyPs1t8R/0vk75bWkOCoBdnvpGnd7iqVDphehvqwyLz0uBeVMe5Ko7zk
         bHnkWGDHJ3LnxEidzpJZIbQMqoxvVOuHhaOL0Aw8NB90MVdDsCnHHTrfF2cAf0mRHv+X
         fZ0+VNEKrEVefdFMKw/V+RvKB5tgWP9Tsi1FOmjB00LUMOgc+W8EvqxbX1Kt9tpYygxl
         H76+BdqJ3CKs0/Mgi98vilwd5XQX2c5b7YgSOMCOb1tEmCec0Qsc+ZwtZK6/LqpbB0+n
         4G+5Li0j3inUydZVYxaNu0n72tBBUggPwZUjmG1WbOFD5goWtmCSvtD0PDRMTDkdOGk3
         Ya2w==
X-Gm-Message-State: AOJu0YwpviJW4c4c7CJhoKeyFptAzaoN6m8UcWf8zhzUXHex3KpbxDR2
	NzZp//MLkB50+JYKlWHC1+Swo88SEqX/iLw3lUJ6KBjl3VAlnqUtuXMHmjlpbUpHBfG1BsFuETS
	Gu12yAhJUWVTxyA3o7531m7lz0cg=
X-Gm-Gg: ASbGncurNMsBFYATbE3g8aQYX2DxpRKKZpVCxQf6m4n6j3w5NmQkc0om54gGirLgtQo
	FjGC+FfJX+yhmMu/ML67crnf0j7/PMxqMYIl9K7lDJYxLEC00CbpAVok/l18yoSF34DZ7taYIzq
	5Wkw2sO1+S
X-Google-Smtp-Source: AGHT+IGhSeNMWb3IhusMPSGeN+mS335gJwrixVrG7fqm+zlBgI0kn5i8WpBxWXdu7IQMokjpRkZzYmuQXV7byBosr8U=
X-Received: by 2002:a05:6602:3f6b:b0:841:99cb:776f with SMTP id
 ca18e2360f4ac-855c3326a4fmr1045808539f.6.1740243363297; Sat, 22 Feb 2025
 08:56:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fa068a4eabaece5fcddca5ea5adf0557f26387a2.camel@gmail.com>
 <CAAMCDecz1tp3ErfusOc7U3j48-h+qSsGfBX1wRntd-hBh8BkKw@mail.gmail.com> <75fa5ea9867b3b998c62693730e3f5bfa0a271a1.camel@gmail.com>
In-Reply-To: <75fa5ea9867b3b998c62693730e3f5bfa0a271a1.camel@gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sat, 22 Feb 2025 10:55:52 -0600
X-Gm-Features: AWEUYZk98blam5VUITrtsjhDzlxGGgj2cSTVDakHPyAHblHUsJG3_fKC140LMSk
Message-ID: <CAAMCDeef0QwdV3WX8X56K2TrxYuXkdV7Y=xPgj3w+geSUtnhVA@mail.gmail.com>
Subject: Re: lvm2 weirdness in Fedora 40
To: christophe.ochal@gmail.com
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 10:05=E2=80=AFAM <christophe.ochal@gmail.com> wrote=
:
>
> On Sun, 2025-02-16 at 15:45 -0600, Roger Heflin wrote:
> > The first thing I would do is change the mount line to add ",nofail"
> > on the options so that a failure does not drop you to single user
> > mode.
> >
> > Then you can boot the system up and with the system on the network
> > figure out the state of things.
>
> I wasn't aware of this option, but I'm not sure if this is any better,
> right now I can just run vgchange -ay end exit to resume the boot
> process, to end up in the Gnome envronment, if add nofail to /home i
> stil end up in an unussable state because gnome can't load my user's
> files
>
> > In the old days I have seen lvm2-lvmetad break systems on boot up in
> > bizarre ways.
>
> I'm not sure that fedora uses lvm2-lvmetad, and google isn't helping
> me,  any hits i find are for red hat 9
>
> I wonder if this is relevant:
>
> From lvm.conf:
>
>  # Configuration option devices/scan_lvs.
>         # Allow LVM LVs to be used as PVs. When enabled, LVM commands
> will
>         # scan active LVs to look for other PVs. Caution is required to
>         # avoid using PVs that belong to guest images stored on LVs.
>         # When enabled, the LVs scanned should be restricted using the
>         # devices file or the filter. This option does not enable
> autoactivation
>         # of layered VGs, which requires editing LVM udev rules (see
> LVM_PVSCAN_ON_LVS.)
>         # This configuration option has an automatic default value.
>         # scan_lvs =3D 1
>
> I had no luck on googling LVM_PVSCAN_ON_LVS
>
>

That is only if you put a pv on top of a vg.

Fedora may have finally got rid of lvmetad so it may not be the issue.

What does cat /proc/cmdline look like?

If /home is listed as mounting early but is not explicitly in cmdline
(either a list of LV(rd.lvm.lv=3D) or VG(rd.lvm.vg) to turn on at boot)
it will be missing.  And if you configured it after initial install
and/or changed the name of the LV then it won't get activated early
and will fail early.   I always use rd.lvm.vg to active everything in
the boot vg at startup.

you might try a "systemd-analyze blame" and see what it dumps for timers.

The typical disk missing timeout is like 60-90 seconds were the boot
should pause(and fail) before it gives you a emergency mode prompt.
