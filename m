Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644D1531C8
	for <linux-lvm@lists.linux.dev>; Wed,  4 Jun 2025 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749008054; cv=none; b=tXEpgt9xP0kLVmiFUz3sCBgfQLpuRVFk6vKFz0To9xj/g72lnnaGKN9k2pfYFurTIbARdD21EbmOnb61Q9CCx3j6Yt21Y4+hAr+mAk1FP7d2uL4Acp51OiJ4VQLqgBbxsD8oD16Q6CUPZnCsdJs5RcJlAuk4A4XJl8qxl7nLuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749008054; c=relaxed/simple;
	bh=vO9FkFf1ziYmJ7q+UryN+vG+SDvHsyTvgigDgjVTxmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOL74cHKEckVJZk9qLjSbqcoImpZLN6oZ5DvIazfnpCxpDIKBEzg3h/5ANns0gpvCQVrztzuGzAqRpDiEjBI13/8k4353OHcCNYMnqB/K+00qYNR83ZSsT3aVhCc5pjysaQnNL9kD1IlV6ok0NlBlqKz4SXPuH/0p9uvi0NtKkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=CtY8pUlo; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="CtY8pUlo"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8EA933F686
	for <linux-lvm@lists.linux.dev>; Wed,  4 Jun 2025 03:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749008044;
	bh=vO9FkFf1ziYmJ7q+UryN+vG+SDvHsyTvgigDgjVTxmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CtY8pUloYK5HHqPLOBQZ88uXBOubPRmU/DoG/1A5b337HooTprBNU28VxXAoKz0bc
	 suYk150OpmVulDPYLTFOpV4VgP1nkEsOZ5Tf83o3FmN7OQAy0vlQ60sQjZFngU8C45
	 8s1A7wPjwqVSbf180cYr1BOxul/m2BYGEeb1AOj/+a2N3ocE9HaEmPMevnxl9Lbkpc
	 qjGQ+TccGefEg2JkoVSLM4epl/S4bEYbYsY8jiA/Zg9xRo8lPNyh2ojyjekhpxFk6j
	 pEWv2j/ZOw3D8YzPUnT7GwuPPGguLBEMeRtpjK9yfQ8KJIgm11Kk0W620dXD7vFcHG
	 rHeae4AkuqB7Q==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-adb32dbf60bso547061866b.1
        for <linux-lvm@lists.linux.dev>; Tue, 03 Jun 2025 20:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749008044; x=1749612844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO9FkFf1ziYmJ7q+UryN+vG+SDvHsyTvgigDgjVTxmo=;
        b=BbIXR+Ie1a6as20fadG4vra9sC5wgZOAB8naYbv13xSD/qig8BlTtVN7RKBJALMyRs
         QtB9DceG9ObNOrnrPJwMgKgbA6XlsxXXZKs75oHbMxA3gVvdTe6sBDk404E9LqHTWBAE
         QOh9n87CVJABFNg5oeo6mWVN1c+No+yk9aThoEpbrPgEubSSF8ptNqS588Z1i1+uWKib
         7Vp0yyZu4C3dfv7AWTdMrYltjOWiri2WIbq5G5xcJQWunGK6rSdEqH3hltCdxyaMh0G8
         f5JpEg/JJ93aF6P6UAi2BOCsKvT4p7H9BCZzpuyFJGji+ZGVkdfHkaZqCV3aLBtobvad
         ZZJA==
X-Forwarded-Encrypted: i=1; AJvYcCWrfvb60WpwqZwBS8LZzz+tirqjeFWhh01ApHw8ylkr9y2IERumEsawwKpJ3kbHSgWu+1JSlHU5ru0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9M9iq8VgSnnjNGBQ1v8CcMu/+ANE1w8SNJP9kE4Sx7E37foa1
	a2VlgVldDt/rb+Ez4+xgeoJaygeAQeVX+21QoiKg5r/2JOzv+lHrnjD4sIXxiYjReihVcBzbmdM
	B0/4sNRj1rIyTxrNOMhFUBjgHIWSB6VA2IHkcf0qzS7ALa/9j1UKc3amYBCOsU+5IaGeV6khaQX
	rq37dPi7dtlvgn+IQ23O0U8cERGcNl+Kx+oXDyzqZgV9p3ALffSZ1v
X-Gm-Gg: ASbGncskKzBhzMceF029TPKl0Cbtq0jUjTxW/bD1TCSb/nlBW6tl/N+WkoM+Wb62v46
	gSKE+ziHPy60VeF4pFLxJcvBwHiknSsrAWmRqs1T8zfQl/UFd3I/azoaSzvF2YWNptxTymQ==
X-Received: by 2002:a17:907:3e11:b0:ad8:a935:b8f7 with SMTP id a640c23a62f3a-addf8c98fb0mr85693566b.12.1749008044109;
        Tue, 03 Jun 2025 20:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxOkGaWlfM7Uzy8tASNc7gckcS20l8Sq4rVlGNMms+P4givmwr3fR+u3FOaGyF2CvVj+IQaG9rZBy0LMZOngo=
X-Received: by 2002:a17:907:3e11:b0:ad8:a935:b8f7 with SMTP id
 a640c23a62f3a-addf8c98fb0mr85692366b.12.1749008043807; Tue, 03 Jun 2025
 20:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPza5qfw-ExyCFnWa5JoUE7eUsk_es8yx=H0YDFcY-=J8OtHpQ@mail.gmail.com>
 <aCNYxyaGNBuKTqX3@gardel-login>
In-Reply-To: <aCNYxyaGNBuKTqX3@gardel-login>
From: Chengen Du <chengen.du@canonical.com>
Date: Wed, 4 Jun 2025 11:33:52 +0800
X-Gm-Features: AX0GCFtEeudDqNDvtLr_TbP8WDTX8_ao5Uj5jAosIJUgfbjWfYGzh6F-6zSwRd4
Message-ID: <CAPza5qdAogcH8T9aFPCXs+=gSVAY48Z4TUGxz1Pm0ZENRZjVcA@mail.gmail.com>
Subject: Re: [systemd-devel] [Discussion][device-mapper] Enabling Block Device
 Access Locking in systemd
To: Lennart Poettering <lennart@poettering.net>
Cc: dm-devel@lists.linux.dev, linux-lvm@lists.linux.dev, 
	christophe.varoqui@opensvc.com, systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi DM developers,

On Tue, May 13, 2025 at 10:35=E2=80=AFPM Lennart Poettering
<lennart@poettering.net> wrote:
>
> On Di, 13.05.25 16:08, Chengen Du (chengen.du@canonical.com) wrote:
>
> > Hi,
> >
> > Apologies for including everyone in this message, but I=E2=80=99d like =
to bring
> > your attention to a fix [1], which may require your input.
>
> As mentioned in my comments there: we can certainly enable the locking
> stuff again for DM block devices too, but only if DM maintainers sign
> off that this is OK. Hence ping the DM people about this, otherwise we
> won't move on this.
>
> > To mitigate such issues, systemd-udevd normally acquires a LOCK_SH|LOCK=
_NB
> > using flock on the main block device before processing.
> > However, commit #e918a1b5a94f (udev: exclude device-mapper from block
> > device ownership event locking) disabled this behavior for device-mappe=
r
> > devices, which appears to be the root cause of the boot hang with encry=
pted
> > swap.
>
> iirc dm for some reason is allergic to us taking a bsd lock, because
> they don't want us to hold an fd open while the udev rules run
> (because bsd locking implies holding an fd open as long as the lock is
> kept).
>
> But only the DM people can shed some light on this. if they are fine
> these days if we relax this then we can certainly cover their stuff
> via the locking, too.

Apologies for reaching out again, but may I kindly ask for your input
on this issue?
Your assistance would be greatly appreciated to help move things forward.

Best regards,
Chengen Du

>
> Lennart
>
> --
> Lennart Poettering, Berlin
