Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B62FDC20
	for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792653; cv=pass; b=o+5gWOYoW2QF6H+RpVW+EqOT4J40KXwO/A7Pw5bKEta817GvsUGn5WIts7f/DWpxvC8rr73c5xb+WtW6QZ0o1Ejl1c8ChKQ24DaTmb7or1SZmqhouMEWb2giqlC3zuxXwEGnqULb/uGt7bCEQ4I6VLK6DiFH/r1yYdRA0Phc7LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792653; c=relaxed/simple;
	bh=U37AsN/1UTKLKRmcr/j4qEpMRKwQ2ngyuIgpcIpD1qA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdyFrlmWPS/1TRKz5unXSdladlZYEn/AuF4o1RE/NLMmgMRCfnK450ebzxnAMgLDrVIVMg6D9Zjy/MrWpYVkWM5QPmUJ6TWt36P3bNL4YrfOOJWPih/b804VdvZJFpMIBn9ay0GBo4lIGQAUCo+dpIZRJcvm78ZXh/RF50qlo90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKjxodIx; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKjxodIx"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a535e7c00so19321777b3.3
        for <linux-lvm@lists.linux.dev>; Thu, 09 Apr 2026 20:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775792651; cv=none;
        d=google.com; s=arc-20240605;
        b=kYiI5mn1vLp7qaaOSKlIrKPgMWwYk74/7Q31I7FgmqMZCE4ekK7ZL42JJ7yZHBf3tB
         kJ7kwKQm8e0NcB8nUW7++yfKaomV7lu789YMhU+JuPJ+lBrZ+QYWIr3xRx3JsWQs87D7
         GarUovqr0e+tROVq5+Xj8mjngbclVkWmVGNrQ4EaeKlg5ygtKuVaJfw1nofQFx/aSnoD
         RnixzgNFXMSn8/ZW+6fGYpeJgTCQPcFwCD3oKk6WA32PJ0vuVKOePchkF+SFk5l0DZX7
         WC9Nu5Ogrl1WQhg/kSC41CkJFOf/krlUIBw+/PqqslObVOhJH2BNHkkNxcRf6Ifr2UtH
         uwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AiVXE4tnBDFoH1Nnm/GDPenPdgeJ+kazawnlrpaVu8=;
        fh=7brrFWOyL47WF52CZ3sW2M6TxwdCpeqsTXFUj5At1FI=;
        b=EHct28pWLEFHhgUTLYgjmq3u7qL00fafdz8goTeh5BBrSVipKespfridbi4krksgIs
         cYiTbzT7g7X50A08DpLDN/U+cTX8hBDqP7LSaLIvAezeU/lnlLJrS08W87lmxWGqISrb
         1xEMfWUIBKaC9VW8iBgrH/4LDNAC2/5YspYCgAPu/vCqaFMfWuk3PpsxmGXhs2OfpXYF
         UGDqE5RiC6ZF8Ga4ewOY5CmCcqXbFJazLlwgYVdPvCeMxhnJMeIpFs0NFSrtJoSMszQb
         8a/rKXRBU+F6y6LPtXtm74s+7Dm3nx1YnZAFssOoSQfQ5aOxLaHWvzqN8D3JmdsVuD5z
         p2Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775792651; x=1776397451; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AiVXE4tnBDFoH1Nnm/GDPenPdgeJ+kazawnlrpaVu8=;
        b=RKjxodIxmjleqe94QqUf0UDg3f0p98Y5JFUp3bGLPBPchFzFZJIHWrQGIGHSKAOKZY
         HJvDeBEpaAck9rB4XgiWIRhbhpN/cPOAi+VZcCM1C1CsSapy7t2qKK0gjkRXeB87jAIv
         4wc1b6EIMX8d2GoZsYnNUjmDx3Ht7bKsXbwbhuv40PMwyWzFARg4d0XHZWOj3PByPERc
         9SnoLaz4iRbTDmfZzf0e7G9QJGlpQBfAmwOjWbwajSYPYjDF7GvEjKJxwP+Rlw4mIvKW
         lNUx1a3QoMtwGuitN66nmlScQtl8k72t+2V/aWAQoeRIv6aH+aveqNvGZaFBCXskrR3a
         rSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792651; x=1776397451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2AiVXE4tnBDFoH1Nnm/GDPenPdgeJ+kazawnlrpaVu8=;
        b=Z131stMXsZXViEbRjrkhqfZE75f7yNzzZg3dP8wigIygJ+1MLZAthbmgTXYutu+CqA
         nQikY1ZKnQTMr2Ja0fZbmCOrL5UjsgEN5RWEwQAcq1XN+5tfIyhWV/quCkbfW5JFiK+B
         iemVhN+SbICQgrThaQ5aErgTdaDqh4HK73s2ekeU8Yyo0yNmGgpvbXzAuWo2MhJJG+W/
         tbaHeZS1o20j6Pv+FlNdYzUaP/NPOgP9/SKlcSJLEE9QQZctJrvnkgTjz3oWRjEVx4bP
         4f3KEal1Vij7Ql0ElAAFnMCWju64MnacO/FPnwTEk1jlElq1u1DwTwIW+x6rQIF0v0ju
         bXPw==
X-Gm-Message-State: AOJu0Yz62RHSvlUF3n+YyoJy6igW4xq7SdP/Hfwnqx4C0l8fNyryFtVG
	NSaPlmYgwjVLvumelTuG8M98QqNely6tSjkrPBIpkzC8ffKcmXKaLUC6WCYwhAVx1aAif69lGEP
	4fdbvZVKHMJjWCcQPzSU2NdBlYKt1NfE=
X-Gm-Gg: AeBDieuza/sp0ocT1xW7tPhizDtBlKVLq8u/QmpPddySpS/ivrFN0CESLOwrDKP+yNu
	3eVYoDyCLrcQLk3P1t0nxUew6TsLoyY8QnsRACBB9tIgheLbH+mnofVRYKi6Y38zkCx+WgBjkI9
	Lh7OQMhZW99Zt9+Zt0ea2reAvthgDAbHHJqzqsIT6S6k7Ekx/WpIQohUbq6ysuaoPbBUxEwkjGY
	AoNd44PTnIqTsPEK6DRxSjzRzE1qcqBwck24QAU7FUldZqp16TwwKS+LKYaeUWnyVe9Cwthlfly
	jk9gPClw
X-Received: by 2002:a05:690c:12:b0:7ae:904c:11ed with SMTP id
 00721157ae682-7af719597demr18647417b3.36.1775792651261; Thu, 09 Apr 2026
 20:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
In-Reply-To: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Fri, 10 Apr 2026 11:43:35 +0800
X-Gm-Features: AQROBzCum3RAW9EN18GkznyiCb0_6UoiKSIaeUbKWj5I511dIHz8va6N5cFFK5k
Message-ID: <CAAYit8T1jQ-35GApTVRiq2wYd5G2R8fXSm1aEjNcgR8Oi=oC7g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_LVM=2Dthin_metadata_corruption_on_Proxmox_after_RA?=
	=?UTF-8?Q?ID=2D5_issues_=E2=80=93_thin=5Frepair=2Fthin=5Fdump_fail?=
To: Ray Davis <ray@carpe.net>
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 12:08=E2=80=AFAM Ray Davis <ray@carpe.net> wrote:
>
> Hello,
>
> I=E2=80=99m looking for advice on an LVM-thin metadata corruption case on=
 a
> Proxmox host. I have stopped further repair attempts and preserved the
> current state for analysis.
>
> Environment
>
> * Proxmox VE host
> * Thin pool: `VMDATA0/VMDATA0`
> * Backing storage had RAID-5 issues involving two disks
> * After reseating the disks, the RAID came back online, but the thin
> pool would no longer activate
>
> Original Proxmox/LVM error
> `activating LV 'VMDATA0/VMDATA0' failed: Check of pool VMDATA0/VMDATA0
> failed (status:1). Manual repair required!`
>
> What I tried
>
> 1. `vgcfgbackup VMDATA0`
> 2. `lvconvert --repair VMDATA0/VMDATA0`
>
> This failed with:
> `value size mismatch: expected 8, but got 24 (block 13182)`
>
> At that point I added temporary VG space on a USB disk so I could try
> manual metadata recovery.
>
> Manual recovery steps attempted
>
> * Created temporary metadata LVs
> * Used `lvconvert --swapmetadata` to extract the pool metadata
> * Activated the extracted metadata LV
> * Preserved a raw image of the extracted metadata
> * Ran `thin_check`
> * Ran `thin_repair`
> * Ran `thin_dump =E2=80=94repair`
>
> Current results
>
> `thin_check /dev/VMDATA0/meta_extract` reports:
>
> * `missing devices: [0, -]`
> * `bad checksum in btree node (block 79511)`
> * `missing all mappings for devices: [0, -]`
> * `bad checksum in btree node (block 79506)`
>
> `thin_repair -i /dev/VMDATA0/meta_extract -o /dev/VMDATA0/repair_meta`
> fails with:
> `value size mismatch: expected 8, but got 24 (block 13182)`
>
> `thin_dump --repair -o /root/VMDATA0_repaired.xml
> /dev/VMDATA0/meta_extract` fails with the same:
> `value size mismatch: expected 8, but got 24 (block 13182)`
>
> Current LV state at the time of extraction looked like this:
>
> * thin pool `VMDATA0`
> * extracted metadata LV `meta_extract`
> * fresh target metadata LV `repair_meta`
>
> What I have preserved
>
> * Raw metadata image from the extracted metadata LV:
>    `VMDATA0_meta_extract.raw`
> * A second raw copy from the extracted LV device
> * `vgcfgbackup` output and LVM archive files
> * Diagnostics bundle with:
>
>    * `pvs`, `vgs`, `lvs`
>    * `thin_check` output
>    * `dmesg`
>    * kernel journal
>    * `lvm version`
>    * checksums
>
> I can provide access to the full case directory or a tarball over HTTP
> if someone is willing to look at it. I would prefer to share the link
> privately with anyone interested.
>
> My main questions are:
>
> 1. Is there any remaining offline recovery path worth trying with the
> standard dm-thin/LVM tools?
> 2. Does this failure pattern usually indicate that the mapping metadata
> is beyond recovery by `thin_repair`/`thin_dump`?
> 3. Would it be useful to inspect the raw metadata image further, and if
> so, what specific tools or commands would you recommend next?
>
> I can provide any command output that would be useful.
>
> Thanks very much for any guidance,
> Ray
>

Hi,

The specific error you mentioned, "value size mismatch: expected 8,
but got 24 (block 13182)", suggests it's an older version of
thin-provisioning-tools. Hopefully, a newer version will help resolve
this.

Would you mind providing the raw metadata image for me to look into? Thank =
you.


Hank
