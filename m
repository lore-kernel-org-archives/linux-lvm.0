Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BE1DED40
	for <linux-lvm@lists.linux.dev>; Fri, 13 Jun 2025 04:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749787665; cv=none; b=RULm7UiOZHgxnlASbiTDYQmW1J5uUM0pD0NvYFrzIK9dH3wUXUGIn2Ue8CgEqnu84XLUGkrUJHDkE/6s6+pxVboTxCZ1EKNjPLh3xcqw5EEFjymnnGHGqV54PDfI+3s4NXz2spsnMTVSHo64MLJveeUalUWhhjBAjzrDWBy19wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749787665; c=relaxed/simple;
	bh=bSTOr/g8oyPAU+c5/gHdpN+ZrcmUx6R2lrY4cao4El8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=U7wv5ax1rgfyfZp4sisqurPsau8NAWpkL6otX7WBjNsHocHrAe/JQsOZU+mnz4kxESTzUiiLLFjWYLUvpBB9oqVXw+qq5LVpYZLlowOkA6RGqUx9Ysd+xWoWoJd4xvgJ1G0vk/OZ0/RCHhvKxYTEMrFNFZ73rmM2Fh0kEuRO9fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=mq4a4dCY; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="mq4a4dCY"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 91F753F87F
	for <linux-lvm@lists.linux.dev>; Fri, 13 Jun 2025 04:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749787652;
	bh=9m9uhZkcv32Fmw+TsMjFEmeO137goUyHvRUng28jawU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type;
	b=mq4a4dCY6uWrFykzGwlUyie/l6wAF3uGLsuV4MdBe/bPEw1hlxGb4bzAhHmYAZ16s
	 kmFUFpTS6nIakhEKNgwMCHu7+4x8WxVuMjeIM1i4OC0FfD2S1SkmQjHd/UKjT9KzBZ
	 DSAskiXkjZjQJsPTKgnz56cifnxOJrBjHe1L110HKMeui6SgWYviMSLU0dmgget8M5
	 KJm8Uf+m1yTtj9MUZ+knIEKr3iZTbSf2LZEsWw67I2z7Uns6qt5SVDrSSM9dBb6UQX
	 T9aQrYCbZyZ56kYE75LEmu/7jPijU2uINeJEptOt3cfT9x+igMxIEhpSTAu6ZSvjqh
	 qyCHiOEBbYNIA==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ade70c2cfc1so133329966b.3
        for <linux-lvm@lists.linux.dev>; Thu, 12 Jun 2025 21:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749787652; x=1750392452;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9m9uhZkcv32Fmw+TsMjFEmeO137goUyHvRUng28jawU=;
        b=K1tbNt0lOlHeFqkcbxYe20gPhHQsgBJcOe7O5U6GUC3aJb5fhd9uQEaMxQS704c5c2
         t10LoaIjO3WWXz4NtpRyNJjGwOSfML1BvWX95myVHU0PaKmiTcqJexBXLIo4wvpguPsy
         rkhXX6J9aq0SnOfscjbAbT+1CW9C0d0VgA8Hq0kqqXARPWB1c+6t8nAQC0weHIdC3Pat
         ArsXrxxwG1nhUiRuBflpUEo4o6pUqCusZjghnhHI53wQHHTyLtUNugurind/B3zPToOx
         ZrLekNAZfyVcu2EzMaUohQAPzyGK8BqO5/Mh6Ty3Vc38CGIBYpPP58bZeCxDk8AKbBvG
         BYbg==
X-Forwarded-Encrypted: i=1; AJvYcCWmRD1pP8AhcrL7nWTO7fe9toOvwjzgyWcvwyxcbqBYS5pyHkaI6GdoKxuSM2HAsQpZsgbZU4P/Jh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtjUv1RHng9cCZUW7yJNdCngnzT3XOudB9/6ZLh2m7JN7mbKnd
	p6ggmj1lTaKT1ioxRZi+1N/555QeOGkD+si8NLSwH0MWB8Jv4wfrS3Y3jvD4pIfeRJxFcbchGRH
	iGNuyskDFSQ4OvnI52nrV3N+wveJPkBRD1XVLH5zzGS1CSdhNKg4KHGNA2ObtGTRoGt+fJRkZw1
	OqmgoBMNS+OGdHzkSWAsOsVT8aYOBCH201gUmsjV6acfbC9pKZjSOa
X-Gm-Gg: ASbGncsuktpYh2lXHp63KzjLsSU+L6+w3bHGnorLcuC8RtW3kjb4fL9Fp6+FcdJeP1i
	hIsaew1/46/B5jqC17eFKnzVMlr/spCrZEfFGjo6apxw0YxQjH7Hm7JF4sJCadulgSiltx6hELA
	Trg4cC
X-Received: by 2002:a17:906:9fce:b0:abf:7453:1f1a with SMTP id a640c23a62f3a-adec562448fmr149444666b.36.1749787651903;
        Thu, 12 Jun 2025 21:07:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFItAqpf54wDMXKTO0jAkwDKvWOIDymCCilfXYf88iyvSgbiUT3Tc1aLUKeS2ber5NqG1J59f6M6J56ZnmHses=
X-Received: by 2002:a17:906:9fce:b0:abf:7453:1f1a with SMTP id
 a640c23a62f3a-adec562448fmr149443166b.36.1749787651455; Thu, 12 Jun 2025
 21:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPza5qfw-ExyCFnWa5JoUE7eUsk_es8yx=H0YDFcY-=J8OtHpQ@mail.gmail.com>
 <aCNYxyaGNBuKTqX3@gardel-login> <CAPza5qdAogcH8T9aFPCXs+=gSVAY48Z4TUGxz1Pm0ZENRZjVcA@mail.gmail.com>
 <aae34fa0-9b39-43a9-a784-352aa29ed02f@redhat.com> <CAPza5qfpXRe4mOwfz3Kdy-35rhjPa-cakmna3eA4RJM5YHcfqA@mail.gmail.com>
In-Reply-To: <CAPza5qfpXRe4mOwfz3Kdy-35rhjPa-cakmna3eA4RJM5YHcfqA@mail.gmail.com>
From: Chengen Du <chengen.du@canonical.com>
Date: Fri, 13 Jun 2025 12:07:20 +0800
X-Gm-Features: AX0GCFvRYmw4HsKzvs1KlJCnCthNFfCwsJXrF03YuTc5N8YivO8pnMc99x3HtH8
Message-ID: <CAPza5qfRH8R2SMD8zh9gD-tRGZLNzY1py=wcweD88cYTBHFv3A@mail.gmail.com>
Subject: Re: [systemd-devel] [Discussion][device-mapper] Enabling Block Device
 Access Locking in systemd
To: Lennart Poettering <lennart@poettering.net>, dm-devel@lists.linux.dev, 
	linux-lvm@lists.linux.dev, christophe.varoqui@opensvc.com, 
	systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 12:18=E2=80=AFPM Chengen Du <chengen.du@canonical.co=
m> wrote:
>
> Hi Zdenek,
>
> Thank you for your feedback on this issue.
> Your input has been valuable in moving the discussion forward.
>
> On Wed, Jun 4, 2025 at 5:06=E2=80=AFPM Zdenek Kabelac <zkabelac@redhat.co=
m> wrote:
> >
> > Dne 04. 06. 25 v 5:33 Chengen Du napsal(a):
> > > Hi DM developers,
> > >
> > > On Tue, May 13, 2025 at 10:35=E2=80=AFPM Lennart Poettering
> > > <lennart@poettering.net> wrote:
> > >>
> > >> On Di, 13.05.25 16:08, Chengen Du (chengen.du@canonical.com) wrote:
> > >>
> > >>> Hi,
> > >>>
> > >>> Apologies for including everyone in this message, but I=E2=80=99d l=
ike to bring
> > >>> your attention to a fix [1], which may require your input.
> > >>
> > >> As mentioned in my comments there: we can certainly enable the locki=
ng
> > >> stuff again for DM block devices too, but only if DM maintainers sig=
n
> > >> off that this is OK. Hence ping the DM people about this, otherwise =
we
> > >> won't move on this.
> > >>
> > >>> To mitigate such issues, systemd-udevd normally acquires a LOCK_SH|=
LOCK_NB
> > >>> using flock on the main block device before processing.
> > >>> However, commit #e918a1b5a94f (udev: exclude device-mapper from blo=
ck
> > >>> device ownership event locking) disabled this behavior for device-m=
apper
> > >>> devices, which appears to be the root cause of the boot hang with e=
ncrypted
> > >>> swap.
> > >>
> > >> iirc dm for some reason is allergic to us taking a bsd lock, because
> > >> they don't want us to hold an fd open while the udev rules run
> > >> (because bsd locking implies holding an fd open as long as the lock =
is
> > >> kept).
> > >>
> > >> But only the DM people can shed some light on this. if they are fine
> > >> these days if we relax this then we can certainly cover their stuff
> > >> via the locking, too.
> > >
> > > Apologies for reaching out again, but may I kindly ask for your input
> > > on this issue?
> > > Your assistance would be greatly appreciated to help move things forw=
ard.
> >
> >
> > Hi
> >
> > We have overlooked the issue which seems to have origins most likely in=
 the
> > lost uevents due to switch from initramfs to rootfs and should be possi=
bly
> > addressed by a new socket flag.
> >
> > But anyway let's looks at the current locking mechanism.
> >
> > So for lvm2 to be able to 'deactivate' DM device - such device must NOT=
 be
> > opened - so taking a lock on an open descriptor to deactivate DM device=
 is
> > likely not going to work.
> >
> > lvm2 however could be possibly enhanced to at least grab these bsd lock=
s maybe
> > when processing PV - that does not looks like a problematic part.
> >
> > But adding bsd locks when processing DM  (active LVs) looks like not so
> > trivial task - there are DM devices which are  'private' to DM stack it=
self
> > (i.e.   cached raid LV  - for a single  public  DM device - there might=
 be
> > tens of 'private' DM devices associated in a device tree - and for none=
 of
> > these devices lvm2 expects anyone using them - so any 'device stack tre=
e'
> > manipulation basically aborts when an unexpected user is there  (public
> > availability of these 'private' devices is however useful thing for var=
ious
> > 'recovery/debugging' reasons - so there is very good reason all devices=
 are
> > present in users's /dev/ directory - but administrator should not blind=
ly open
> > them)
> >
> > For protection against udev access to these private devices - were have
> > originally used some uevent flags - those however were not 'permanent' =
as if
> > udev was restarted with the clear database - all this info was lost  (l=
ike one
> > of the reason we asked in the past for this DM exception).  Later on we=
 added
> > UUID -suffix solution - but this is not yet 'decorating' all device typ=
es -
> > and although we now try to add them - it's not a simple task - so likel=
y some
> > nearby future version of lvm2 could be better - and in such a case - if=
 this
> > newer  version of lvm2 would be in the system - and there would be no a=
ccess
> > to any device with UUID '-suffix' from udev tools chain - we can possib=
ly
> > reconsider this DM exception and see whether we can make it work someho=
w.
> >
> > Yet - for locking itself - I'd probably see some usage of separate lock=
ing dir
> > in /run  as more usable approach - as the case where device needs to be
> > 'removed/instantiated/....' cannot be 'lock protected' if the device it=
self
> > must be held open.
>
> I actually considered this approach earlier.
> We could achieve the same goal by introducing a file under the /run
> directory and using it as a target for flock.
> One potential challenge might be reaching consensus on the file name form=
at.
> While this method may not be as straightforward as using the main
> block device, it could help address the issue of deactivating a block
> device that's being held open.
> I'm not an expert in this area, so perhaps Lennart could provide more
> informed insights.

Hi Lennart, would you mind sharing your thoughts on this? I believe
this could be a viable approach to achieve the same goal while also
avoiding the need to keep a block device open unnecessarily.

>
> >
> > But as a short term solution - we would rather need to see the actual e=
xact
> > problem which seems to be missing this locking - as is could be possibl=
y
> > something unrelated to this locking...
>
> The issue we're aiming to resolve currently lies within systemd.
> During the boot process, the system may hang while waiting for the
> encrypted swap device node.
> This appears to be caused by the absence of block device access
> locking for device-mapper devices during udev event processing.
> This problem could potentially be addressed by reintroducing locking
> during udev processing, as systemd already wraps operations using
> systemd-makefs, which implements the necessary locking logic.
> I understand that additional work may be required on the lvm2 side
> before block device access locking can be fully considered.
> One of the main concerns with this proposed fix is that the main
> device may be opened if a BSD lock is held during udev processing.

Hi Device Mapper maintainers, I=E2=80=99ve elaborated further on our
adjustments in this email. Please note that I=E2=80=99m not requesting the
adoption of block device access locking at this stage, as I understand
there may still be some preparatory work required. Instead, I=E2=80=99d
appreciate your confirmation on whether it is acceptable for us to
acquire a flock on a block device while handling udev events. This may
cause the block device's open count to become one.

>
> >
> >
> > Regards
> >
> > Zdenek
> >
