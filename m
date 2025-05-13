Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CC22BD903
	for <linux-lvm@lists.linux.dev>; Tue, 13 May 2025 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145535; cv=none; b=VAR669bLRPh/udsDFGqVqnFvd6zhhEThlbZ4xjtQ/I5VHTnkq5EhdT9h7rlWXeMKWnEXXKwzRZTejxfUBHsSJwTxHupz1bIDybqsm8Y8zNgwEYRskfpQeririTFaejpQ3BFP+GcmEEFih/EPrUQAlHgbB1EMwxz02/SIw+q92v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145535; c=relaxed/simple;
	bh=1lStfJjeVm0FxrPk8UeqkxuFpAq6qKS1xBhDRNcsY5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJTkWBH+MWsNvIUULqngiCwLlaOtyaTogDTc/Dofghp86W+4JD5iO2ocwJj6eNTLGDzpRBGVA1Aw2b0z2dtg0fCG3EPmDWZvExos5mYglnxqFX5WtYTdNaInMupv8R3wqxxvJ80pW0ogyi9Me1SXZWYXkdy0CunDbSxPRSH1/bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=X5IzILcr; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="X5IzILcr"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8F4E93F825
	for <linux-lvm@lists.linux.dev>; Tue, 13 May 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747145526;
	bh=1lStfJjeVm0FxrPk8UeqkxuFpAq6qKS1xBhDRNcsY5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=X5IzILcr4ExjbNpyCt3k6rzkUUu6I5AaCjriUx6CgaSHyBho0T3AmJbhKkk/3wFDN
	 ln1DIelj4DApV9VK5Yv6wIjF8NzsPGA+EcSZIBcpSgFcbqk8hnuXceGwe+zSip7iB9
	 HeYcnsrR0FbQ9TQRjddPgBVhORKvcJTut1MGSzG9jYkW63JxTUbTddq3L46yusd2nG
	 kVa4GnMvViK0ibW7srVmEPbjwkDaO0mPU/oykmTKEepFgktge6x/mfdX2HmDK1pTe2
	 1D9QNguo6zLckTjAsO9nBZAtABHX4TjxEddkYkq4QwjcVfSuwGXlXOqdnPWVPUwilV
	 o/PNewmkSBQ5g==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad22d68aa6fso366235566b.0
        for <linux-lvm@lists.linux.dev>; Tue, 13 May 2025 07:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145526; x=1747750326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lStfJjeVm0FxrPk8UeqkxuFpAq6qKS1xBhDRNcsY5k=;
        b=pk9rQ5N1l1AiuKK4AL9YaJA8JTUVTSw2sKZW/pS52idfSNQUuWp9nzL05IlruPK9KR
         hjxEyJUv/xZxBhLxu8C2E6pagcu3rhfHnqowLU393ZoolDMGUFs24mHAFzCLq7imp5iS
         fWfQKzSHy/3sn1eaRQ1+pBxJpudvFIcbycAGrMwlxpVzF1KL5Q548oKmLddzRD225j9s
         U8cTjvfbvzqHLMde2LXMdMY8mOc75Yds5AtqiZUBfCYpsb/vWrT6KEf1a1VI3qy4O+1+
         oCOE09AtSIW9l1AOp39ggIKI122KUphsVni9MHeWBhGAzwsVVX6rzATGSETZ0LKmfXHK
         56yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMZJt2HmM1kl5Azak9SMAx/v4npZ6OsJl10xqfaqKdGg46Y9tRy0eaBjsrcj55IsguvzjpH6sEoxg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQPxqq6HAMM+/RkvWKpv2feYS7QqrWRRwj0NkPjbYQcezaDZrI
	Q0sXeMd8d4WrwkHMK02AE/OUsmPge2v/+Zhb1OY6taF4Yv3UwctoRnAEeX4GhEx3oO3BiL+fLBu
	So+rT3tknipyLIwau53mLR+c2+30wUfSw9IUGAspIJVGXF8VZ+bViqb1hMncC5tNyjILpYpdKEv
	bAyuL4rGea1w+yLbBwA0x/SPNoW8sT1sCJVj9apQy//cf+knoKa4k5qo/Z9om8rr+P388=
X-Gm-Gg: ASbGncsvn+wk6AxYjncd1hWcF1CRpAQHUtnPfcKsk8iQbrMm67DRFBfJNZltR0QTOjo
	jt4yPM9NSyY8xms3zpA5qNY1Pxt805rNWj6RqhotEGELd0BilpahjrJurYiIsv04ZfVUvxQ==
X-Received: by 2002:a17:907:9719:b0:ad4:d0b7:c990 with SMTP id a640c23a62f3a-ad4d0b7c9cfmr416841166b.26.1747145525601;
        Tue, 13 May 2025 07:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEetoG+JbfWfOiBwYC+FLbawuLLmpzkGEBr/6taHEbK7kKvENNxvnISJgi+mRc5zYqSvNK4b+/RvZlmMSINkPg=
X-Received: by 2002:a17:907:9719:b0:ad4:d0b7:c990 with SMTP id
 a640c23a62f3a-ad4d0b7c9cfmr416838466b.26.1747145525198; Tue, 13 May 2025
 07:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPza5qfw-ExyCFnWa5JoUE7eUsk_es8yx=H0YDFcY-=J8OtHpQ@mail.gmail.com>
In-Reply-To: <CAPza5qfw-ExyCFnWa5JoUE7eUsk_es8yx=H0YDFcY-=J8OtHpQ@mail.gmail.com>
From: Chengen Du <chengen.du@canonical.com>
Date: Tue, 13 May 2025 16:11:54 +0200
X-Gm-Features: AX0GCFv2JuXVJlE4tYWunqTS8GNjZDnGy0hZca8S17CAcUQVcGriBmOSQHKxCEw
Message-ID: <CAPza5qeh+O+VY6OS025U_7xONTjT5xczFb=j2bLkQvCrLs3WLQ@mail.gmail.com>
Subject: Re: [Discussion][device-mapper] Enabling Block Device Access Locking
 in systemd
To: dm-devel@lists.linux.dev, linux-lvm@lists.linux.dev, 
	christophe.varoqui@opensvc.com
Cc: systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My apologies for not using plain text mode.


On Tue, May 13, 2025 at 4:08=E2=80=AFPM Chengen Du <chengen.du@canonical.co=
m> wrote:
>
> Hi,
>
> Apologies for including everyone in this message, but I=E2=80=99d like to=
 bring your attention to a fix [1], which may require your input.
> The issue concerns a potential hang during the boot process when the syst=
em is waiting for the encrypted swap device node.
> This is caused by systemd-makefs skipping block device access locking for=
 device-mapper devices.
>
> A more detailed explanation and proposed solution are documented here [2]=
.
>
> In brief, systemd-udevd probes block devices for filesystem superblock an=
d partition table information as they appear.
> If another process modifies a superblock or partition table concurrently,=
 the probing can be affected.
> This, in turn, may lead to unintended behavior in programs that rely on u=
dev events.
>
> To mitigate such issues, systemd-udevd normally acquires a LOCK_SH|LOCK_N=
B using flock on the main block device before processing.
> However, commit #e918a1b5a94f (udev: exclude device-mapper from block dev=
ice ownership event locking) disabled this behavior for device-mapper devic=
es, which appears to be the root cause of the boot hang with encrypted swap=
.
>
> The commit appears somewhat ambiguous to me, as my understanding is that =
device-mapper devices should not be deactivated while a udev rule is being =
processed.
> I=E2=80=99ve reached out to the original author for clarification but hav=
en=E2=80=99t received a response yet.
> I=E2=80=99ve also reviewed related projects such as multipath-tools and l=
vm2, but couldn=E2=80=99t find similar examples of deactivating devices dur=
ing udev remove events.
>
> As I may not be an expert in this specific area, I would greatly apprecia=
te it if you could share your insights on the matter.
> In particular, could you help confirm whether holding a flock lock on a b=
lock device while handling udev events might introduce any regressions?
> If this issue falls outside your scope, please kindly disregard this mess=
age=E2=80=94and I apologize for the disturbance.
>
> Since the bug is related to a boot hang, we are eager to resolve it promp=
tly.
> Please don=E2=80=99t hesitate to raise any concerns or suggestions.
>
> Thank you very much for your support.
>
> Best regards,
> Chengen Du
>
> [1] https://github.com/systemd/systemd/pull/37080
> [2] https://github.com/systemd/systemd/blob/main/docs/BLOCK_DEVICE_LOCKIN=
G.md
