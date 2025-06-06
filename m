Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B7139D1B
	for <linux-lvm@lists.linux.dev>; Fri,  6 Jun 2025 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749184003; cv=none; b=Mkb1zWj4T/gC6x1ipU5bHd4Kk2B+m26/KYZsvgpUxSI+/Xr1fH2Qi5pg4dWHQrV2H1MqF3HLjoJDpHqvitOVsQlfYMKAoARuFxCtkqq5KRjQwJ0YpdUUebBjkw0diqwRE9jXKf8jPesWHO8aN+/z0AQT2f4KeMgRyzC11Zl396w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749184003; c=relaxed/simple;
	bh=cWuUzMQrRikTedC+8BemvQNT+3iv593RC0/jf0iZ6iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWWWVZVfasc/ZqDHnSTm87Ds63hhHuNO3yHtRqnX+5sL0K7aQ3y+7mAoJGtcvRcTrG+Y98r5CgECG5PTdyAtUgFn2LOYZUpnvJXyK52EOlVvpvzr8dCoZvPVFZv2DCeyQXsEOnNrIHdVT39IK9B8JoXP/2wzsExWD988/humij4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=EY1NKP7b; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="EY1NKP7b"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7F063F68E
	for <linux-lvm@lists.linux.dev>; Fri,  6 Jun 2025 04:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749183545;
	bh=+wMYBBFkSbWZrpXCoi5Cxs7EDx9xZmombyc0Bgui1iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EY1NKP7blmXW3Rt/DqpAFIuZIL7yed/UdqQSpZme9sTkbn+2yp3as9c8e/i62K4dc
	 PCd8Xdddc0MFdg5VjEzIDM+iv+Ais9cTY9zt83U/2s4GYszSy/kRXxILh1H2pUdhS7
	 STEvRB3tG6GRbmfYzupcc5dPQDxFMTVXphMlT04e1CGLSk69/z1NmP6CnzEnI0HH7r
	 ktruqDZ38LORZ4c9RHCRfkO99LU86WVImqU8UyS8hzUI1ADNEdRFGvDuBUxj3nZK88
	 Xv3rYuPWEzFDC7NaqkneDxLt82AQGFFIorbE6FD2WwzKulMiUQQJ18PGDEPZnXeGKJ
	 EPRaEsBqS5xQA==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ade2b19287eso171066b.3
        for <linux-lvm@lists.linux.dev>; Thu, 05 Jun 2025 21:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749183545; x=1749788345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wMYBBFkSbWZrpXCoi5Cxs7EDx9xZmombyc0Bgui1iI=;
        b=N/V3WrvSnFvFeKcZtCMP5WotRL5AxM8v4rPC/zZbjfq2yu756xxg4tsu6XOAsI7MHb
         xlILzID1WBb3e4aOzq+qv6Q2BTAUYkXumBCWAPMCVmSARrhY0cPbwWAlulpyCfQMmLtf
         VZAATlT65vQq6plU3tOyuYLhmNSRZZj+aes0Po696UHgVzUWj44ZWz0FfHGoX3e9nCkd
         Xm7N7fEULnrLAC5pOrW2QaQYufWIzHYcXO8o4oCDGnPiocOnePpi1ltN/IHKKNeCKZs+
         4Mn5RV76nIrRIrVtcfwo5J4ZmB4IHGe1g21ELWtgdA2fD+Jpkp//VSoCl8bDNITl4R60
         ytAw==
X-Forwarded-Encrypted: i=1; AJvYcCWrX4sQc9nSuxvdW2jlJUTlRjsuBIG6HjnsnQpKfsGPX9NkfLLfNulBm8QSOtIj/E/vrbMVj92Fda0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEcoHWiiS3aAm7I7QspsGQxLPAjD7mKY86+c21EI5iEiZjw+L+
	wmTgAtCOdDTh6MmDjSs61i7stlQ4zRro+PfycfswmpnjnuYL5y8UNm/RFKgH78/Lxt06QD95a3j
	wHWEy6j9KnEUZPUpmWopN8BUbz7KiWl3js1ivyX169RQqlYNZunmdIvKBb4y3q2dLmSDxfkDoRc
	74D3FZScKPK0mthEzyJdh3oUtqKddVKtXCjAvSzWy4n5rDhTmAl7o5
X-Gm-Gg: ASbGnctIanSwTX3h+8wWvU9AqO6LhpU2i4r4QnRK0xdAVARdlDmJ/5ilGSLcHrGh0EK
	kbbgj7giuPS6964ZahRoyb9oeObuw2aWwvAeBcScHIpHOVBmAMzFDVgNjMP2PkBVtbMF3AQ==
X-Received: by 2002:a17:907:7f25:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ade1a922851mr154908666b.28.1749183545356;
        Thu, 05 Jun 2025 21:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPv1/R687GFCs9CX+wBXDkeM92N1XeSKXDWUvABJvOpoDGt7dbfZqxUJxg69+yANkYx4KUOYsl5GhNSPk/yqY=
X-Received: by 2002:a17:907:7f25:b0:aca:95e7:9977 with SMTP id
 a640c23a62f3a-ade1a922851mr154906066b.28.1749183544839; Thu, 05 Jun 2025
 21:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPza5qfw-ExyCFnWa5JoUE7eUsk_es8yx=H0YDFcY-=J8OtHpQ@mail.gmail.com>
 <aCNYxyaGNBuKTqX3@gardel-login> <CAPza5qdAogcH8T9aFPCXs+=gSVAY48Z4TUGxz1Pm0ZENRZjVcA@mail.gmail.com>
 <aae34fa0-9b39-43a9-a784-352aa29ed02f@redhat.com>
In-Reply-To: <aae34fa0-9b39-43a9-a784-352aa29ed02f@redhat.com>
From: Chengen Du <chengen.du@canonical.com>
Date: Fri, 6 Jun 2025 12:18:53 +0800
X-Gm-Features: AX0GCFtRt-JAXJTJ9NAatcma5YawwHnTgmjPAbwoPZuEMLJfzgmvWFj1zHa9OEk
Message-ID: <CAPza5qfpXRe4mOwfz3Kdy-35rhjPa-cakmna3eA4RJM5YHcfqA@mail.gmail.com>
Subject: Re: [systemd-devel] [Discussion][device-mapper] Enabling Block Device
 Access Locking in systemd
To: Zdenek Kabelac <zkabelac@redhat.com>, Lennart Poettering <lennart@poettering.net>
Cc: dm-devel@lists.linux.dev, linux-lvm@lists.linux.dev, 
	christophe.varoqui@opensvc.com, systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zdenek,

Thank you for your feedback on this issue.
Your input has been valuable in moving the discussion forward.

On Wed, Jun 4, 2025 at 5:06=E2=80=AFPM Zdenek Kabelac <zkabelac@redhat.com>=
 wrote:
>
> Dne 04. 06. 25 v 5:33 Chengen Du napsal(a):
> > Hi DM developers,
> >
> > On Tue, May 13, 2025 at 10:35=E2=80=AFPM Lennart Poettering
> > <lennart@poettering.net> wrote:
> >>
> >> On Di, 13.05.25 16:08, Chengen Du (chengen.du@canonical.com) wrote:
> >>
> >>> Hi,
> >>>
> >>> Apologies for including everyone in this message, but I=E2=80=99d lik=
e to bring
> >>> your attention to a fix [1], which may require your input.
> >>
> >> As mentioned in my comments there: we can certainly enable the locking
> >> stuff again for DM block devices too, but only if DM maintainers sign
> >> off that this is OK. Hence ping the DM people about this, otherwise we
> >> won't move on this.
> >>
> >>> To mitigate such issues, systemd-udevd normally acquires a LOCK_SH|LO=
CK_NB
> >>> using flock on the main block device before processing.
> >>> However, commit #e918a1b5a94f (udev: exclude device-mapper from block
> >>> device ownership event locking) disabled this behavior for device-map=
per
> >>> devices, which appears to be the root cause of the boot hang with enc=
rypted
> >>> swap.
> >>
> >> iirc dm for some reason is allergic to us taking a bsd lock, because
> >> they don't want us to hold an fd open while the udev rules run
> >> (because bsd locking implies holding an fd open as long as the lock is
> >> kept).
> >>
> >> But only the DM people can shed some light on this. if they are fine
> >> these days if we relax this then we can certainly cover their stuff
> >> via the locking, too.
> >
> > Apologies for reaching out again, but may I kindly ask for your input
> > on this issue?
> > Your assistance would be greatly appreciated to help move things forwar=
d.
>
>
> Hi
>
> We have overlooked the issue which seems to have origins most likely in t=
he
> lost uevents due to switch from initramfs to rootfs and should be possibl=
y
> addressed by a new socket flag.
>
> But anyway let's looks at the current locking mechanism.
>
> So for lvm2 to be able to 'deactivate' DM device - such device must NOT b=
e
> opened - so taking a lock on an open descriptor to deactivate DM device i=
s
> likely not going to work.
>
> lvm2 however could be possibly enhanced to at least grab these bsd locks =
maybe
> when processing PV - that does not looks like a problematic part.
>
> But adding bsd locks when processing DM  (active LVs) looks like not so
> trivial task - there are DM devices which are  'private' to DM stack itse=
lf
> (i.e.   cached raid LV  - for a single  public  DM device - there might b=
e
> tens of 'private' DM devices associated in a device tree - and for none o=
f
> these devices lvm2 expects anyone using them - so any 'device stack tree'
> manipulation basically aborts when an unexpected user is there  (public
> availability of these 'private' devices is however useful thing for vario=
us
> 'recovery/debugging' reasons - so there is very good reason all devices a=
re
> present in users's /dev/ directory - but administrator should not blindly=
 open
> them)
>
> For protection against udev access to these private devices - were have
> originally used some uevent flags - those however were not 'permanent' as=
 if
> udev was restarted with the clear database - all this info was lost  (lik=
e one
> of the reason we asked in the past for this DM exception).  Later on we a=
dded
> UUID -suffix solution - but this is not yet 'decorating' all device types=
 -
> and although we now try to add them - it's not a simple task - so likely =
some
> nearby future version of lvm2 could be better - and in such a case - if t=
his
> newer  version of lvm2 would be in the system - and there would be no acc=
ess
> to any device with UUID '-suffix' from udev tools chain - we can possibly
> reconsider this DM exception and see whether we can make it work somehow.
>
> Yet - for locking itself - I'd probably see some usage of separate lockin=
g dir
> in /run  as more usable approach - as the case where device needs to be
> 'removed/instantiated/....' cannot be 'lock protected' if the device itse=
lf
> must be held open.

I actually considered this approach earlier.
We could achieve the same goal by introducing a file under the /run
directory and using it as a target for flock.
One potential challenge might be reaching consensus on the file name format=
.
While this method may not be as straightforward as using the main
block device, it could help address the issue of deactivating a block
device that's being held open.
I'm not an expert in this area, so perhaps Lennart could provide more
informed insights.

>
> But as a short term solution - we would rather need to see the actual exa=
ct
> problem which seems to be missing this locking - as is could be possibly
> something unrelated to this locking...

The issue we're aiming to resolve currently lies within systemd.
During the boot process, the system may hang while waiting for the
encrypted swap device node.
This appears to be caused by the absence of block device access
locking for device-mapper devices during udev event processing.
This problem could potentially be addressed by reintroducing locking
during udev processing, as systemd already wraps operations using
systemd-makefs, which implements the necessary locking logic.
I understand that additional work may be required on the lvm2 side
before block device access locking can be fully considered.
One of the main concerns with this proposed fix is that the main
device may be opened if a BSD lock is held during udev processing.

>
>
> Regards
>
> Zdenek
>
