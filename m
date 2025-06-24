Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3F252906
	for <linux-lvm@lists.linux.dev>; Tue, 24 Jun 2025 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750509; cv=none; b=Oinag8v4gVroE4gt1L4P6VngLs7gvCEnDRXXhoeE9wqMZIniOZdb/zEe76Wkt6k7R8ctCNRuOAar2wpI3sGcUgDrGErvqvKhAdDoX+f3MAHV5XGRS1r5eqJEEWIPu8TVl7jXn64j9Cw5tf+AtaZ7NkYV4lLHZn2siQfZt7NVHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750509; c=relaxed/simple;
	bh=4yNkZ89p/ICGBPIxtgdeCTV+BFIfHlIFuazLgpDtspw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=N03ZK2VO0B2UbyQrtc3ZsBUY9gBfgNK2tH2z7Z0UTBcM2RrpPrnuYKYs0ZxycK7v51TkylTj/5t3Q3O4sNSEPRSdWE5UkXOWCRb89ctMAo1FR4gvxxGkIZBkBC6/fgAaNvMUqFfI7cG/SWmAEhozZ3jILPbL2oK/S1rwTJdewHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPDf3FTI; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPDf3FTI"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-addcea380eeso822930366b.0
        for <linux-lvm@lists.linux.dev>; Tue, 24 Jun 2025 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750750505; x=1751355305; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4yNkZ89p/ICGBPIxtgdeCTV+BFIfHlIFuazLgpDtspw=;
        b=mPDf3FTItx+IzG3PcBK+ifukzeoSMO9x6F7HFn8gdF4Y3/qUcb4sXEvsqwvOFQFfJt
         PKIpuGv58LPzgmdZZHZ9mdkH8t2RTdnhDMS5lgwCHRuNf9ZIW+x4cKbuwiQqlxwGyuWG
         0mERGQm10N51BAN2nOoeWGLbyO5iPpbordh2kezKB/gWxrpFLo/dRjuGwPq3o5Ou6P/U
         htKUReQhB+sIPgDDYR+vXKuEaukhlCvybAfepWgEWlYirBlBdZCs+HQJCSoLiOHYeQaX
         /3WfHpdw48D96XG4RTGfcGcI8E41xtD8peShAQVuEdbOFNTGXhybElZwxWBzx/idkgHX
         YTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750505; x=1751355305;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yNkZ89p/ICGBPIxtgdeCTV+BFIfHlIFuazLgpDtspw=;
        b=ua5K+aHAiogroaQWXEWpl+Vw5logkpn8qIBzyCcuQP9lKJ+SSg0Et4I2ioOzNrSy1k
         jS2nCcHqpwpNotWCS97HMlHFYXMiYH2D8Ye7a98jGrnEFXU6E0KnknBwBFgzj65dI3+1
         Z8+2KS3zDRzIRPSKIDsnZz6htCexH5IS/E2wt6+nB5FRnyLk6tps/dlIWGBaUpngmTS7
         hFKSzGQgRX/s+8QrYZR+XsS5Wg5bmEWn2R+HLje9qWI7RWZzITK9JxhMQp3Rdx+e1MA1
         wvdAgTZEO3WdtJ3SALPgDVrkUw4B8Gbx16gDjqvoagybUQstvW6SVaILDg2JcTTxOzLk
         K/5Q==
X-Gm-Message-State: AOJu0YyHDN7QLBFFpSJ3VDPnc/7LCHQr8YeZN6QdAvSg8kcDIzVmtJGs
	dloEvLozP3r5L8lCk6Vlkvh8SN6L4G7F3mgesR7gtrGar88B2ar8TOMOLTYDsImaDF203EC8Fbb
	a+zDoZAOhc0E3T8BqaeuitrR1ui7nZuYHlERz
X-Gm-Gg: ASbGncvSRHNJ4q2p1caD7qlR11K26aUQ4n8uGOFe/gei2LJdAFBBlZm2qafvP8R/GeZ
	IGT43IDhXcEPQCXHcrGrcKJMU79tumMI7AowGXu0CAqO0r3rlfK9ZUv7RSQqupFPMWsvuRyTVVj
	Gfmx8q3DKaTZgysguUwXaF7ArJxMBIqlxFTBlirYH4hbPWygUUR/ed3Sg=
X-Google-Smtp-Source: AGHT+IGKIHLGiIgLsEvDub20xQv5pCBvAc0z0/nVtJPbfjijrsyXyDzJl1eyuoaF9tyGXx0vIOxPJYzk1dB+0CeP8Pk=
X-Received: by 2002:a17:907:6088:b0:ade:36e4:ceba with SMTP id
 a640c23a62f3a-ae057f3c214mr1472022566b.52.1750750505369; Tue, 24 Jun 2025
 00:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Pickles Creator <picklesthecreator@gmail.com>
Date: Tue, 24 Jun 2025 08:34:54 +0100
X-Gm-Features: Ac12FXzHCaop9sUrQR5XOnYRMwgcrGn67XgULI_MfprgdiY-zyORb_wG5SP3Uo0
Message-ID: <CAF2YDE7-qsKbpexT+GkiMr8_YtRdnV1N2p0JVWOyEPXSS-xjqA@mail.gmail.com>
Subject: How to detect when LVM RAID1 is in sync for write mostly?
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

Is there any mechanism for automatically detecting when a RAID1 LV is
fully in sync such that I can enable write mostly? I could do this
with a timer or continuously poll to check the status but I'm trying
to understand if there's an event driven way to do this or if there's
any file I could watch with systemd?

Thanks
