Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E040380FE7
	for <linux-lvm@lists.linux.dev>; Thu,  4 Jun 2026 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780549218; cv=pass; b=jwZeevpA/YKuMb3wcoNdfMhtivzz2C3knp8HO+YXmXodPlwOFGaim1Ul8lFA+gEXBejC9Y3NSWL8Bxw+GIJUJMhK47QprlIqgV9IAuMKIL51u80J3NEF6C9dPHbPP5BkhhQFMWQRwhJvzxdDodpyvVl10MXYeJho93sEnrVSIrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780549218; c=relaxed/simple;
	bh=TbQo/fE5dK6wVYn26i1IQLGf9+p7RgdTi/nnYYExxVY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dywcOHq+ijTJ0WFW0oC1PJx2qL4XJ8QM1xOrWb3ykeuIFEtLVLfQw2BgsG/e7TCVlfNvihQczlVIA7vLnIcAWNhjrFTZVxXSZ8KiMx7qzZBUQjzIcx8d6IUIDaVhck15f69OWEeIQcUDjQ1/CtuOHQRHxAHPmX+5IfPz4KFmcj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=aQ+wWXLE; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="aQ+wWXLE"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8573e75425so119746a12.2
        for <linux-lvm@lists.linux.dev>; Wed, 03 Jun 2026 22:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780549216; cv=none;
        d=google.com; s=arc-20240605;
        b=auYPxKA+iIVCFbBB27vgwaCLrasIO1OXbxFUaZ/vmInRNqRlZ7NgAfPiUY24TxeIlr
         sTF+SaK7bDWyAW7t1fL57rxNcsN+5BUY4XnxDQ14D00Yy5wHc7dChgkYl3Hx9dOQW9a1
         QJh9o5uxzKhwIBX0PhU3ZTwWRlm2Xth5TU1AOxaS+jrD7fMP6Azs6WXUkeOh6br9Wq+a
         5jn6qhYlpR/FB2RF5LjIkH7m2OfE7AWTxpwUm9RGNg3YPNDpDuV2DDiH800iJAZzgmm/
         lR6NWIecsnQpykV0c1ygDLup3YePV+/jRw3lKCMyawJKrpTEBIPhfkKf9UcVrha+y24x
         +uCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DUrvqn+0hFW6GxDdU3+bhGXN6Yzq/MuN/NhaZ+jP5mU=;
        fh=iQOWxowsu+faQgcWO2V4Hll1LFv7Q5iitXvpXh+DqLU=;
        b=BAGsEQxuRgAioujLdyXmL9pmc+DPaqe1FktypPySrokNe3Rhdp7uCkDYFzYvS1gKWE
         ljd6vkxZjz8Y1912APJNqifIEM0uR8mQ0wd4Ix1OabklF7MBZgUa6byTNJJPBFjdHOkM
         An+PIYHYZRl5meadFmsomSSaQyv+vVUbkWV8ccWzpfoSYC6YktTcSIG+HT5W3yn9JN5/
         4m7atQIjH/fPa1tbqL6z/AcCXZ5yMGMQ2scWFY3jJC3fQxwnaqEShVMlVMJkPpz7hePZ
         jW+4xzCFo6Fz2zxCXHArlm/v90A9d75nOorh3E1QDTwq2UNKGrNqoAScYZbb7H/pcQx3
         0RDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1780549216; x=1781154016; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DUrvqn+0hFW6GxDdU3+bhGXN6Yzq/MuN/NhaZ+jP5mU=;
        b=aQ+wWXLErAw/yZXkKImLv8X/RIKmaODwkk+SdpDVTOiwmZ4PUsNa5yBVYC9QMvxFYw
         g3oSe/gAdNEjEjy4zmdYW+oFCmCERxRJdGCQun62QqUf9GYyIlxjm/T34Xptcocd3pzl
         T7UvnRxXhc8Vt6oQgY9vzJNYkSjKRMcLGm1xlyZ7Yepmszn33A81x6WqVk5HFWr9i/Eu
         bYDpm3B5epqpo5TUh844DoQzYJ5uvKkYuI+VRqmDBGPQMGdSWKqkZ9gwlhHPG5QOZ3w7
         dAsAS1b7vXBfet5ARYv2GqfIcafPMa31eWuXYOZJDKeVqBux48EFFpQt+Bj5R9hVCu2R
         587A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780549216; x=1781154016;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUrvqn+0hFW6GxDdU3+bhGXN6Yzq/MuN/NhaZ+jP5mU=;
        b=IJ3YZtydpP1iKTyJZrI22oDFbFGQTzEan9CO/zRG3hvlO0ol7dxNFjZigpkb779emA
         meEZjdiqU25v21G+liTtR1pDY2vNFOYfQ9GJd8dlcNL6vpZ6my0+bsa6yEF5ml+QBAIn
         WvJOiAniUjD9nLm3VhFXXrGcr50FIu/PHSFLRrSWyLP7hnlGvsfShDkKapnafdHzX+iS
         jTFK3fdTw/vOHloN4b7xtLEa+Ntxre8GtH94umsTJxStDxvEsEsGKW0UsGX2PcJRncHM
         hY7qjzZ8r+9sf7q/Wyc+Y7z5zjFYrgt2tkAdcYSOq6DfuScR+0KIi3N3mVr1qbZJpc5l
         CjTg==
X-Gm-Message-State: AOJu0Yx8Y4QrW9IeSqk2ElfYSCkpt1DOSTYmQnJFA11tlSWGutAbuOdM
	g7L7KI/9NBGh02f7VzLlnuPDWy39QXTrbaSqVBbhXbfVNOzzXgHqzL1E0DdS5wAQP6FUvhOAwDV
	u9Qfbo1xJv0g7L8U4lRpTmByF8+3at5TIFuZS/G5js+GS4Tjzyk9WrZc=
X-Gm-Gg: Acq92OHOOsWe5t65MGKALC52K8SkBeFBO0G+O27JCWun4V3u6jHXBb2+lJowMRCJZvF
	peBMPaYza/hrvdoluMRZlJaQcR63NVAUrpf4/24CFDAaDQ0SYwQQ+0SL3VcLIcq+GcfBiM0pHWJ
	fqYwP3SWhds7Kl2UT7IAd08BlxqS9qY6PxhEBS/mUXlqFUdVtsmawg/rTA+XsW4vqahbXjpbs1r
	0n2efx/N8CrF7i+ncpD0JhAJLUK74jmJhARbq3S1DBsyMRWESoKn3x5pgAdnhTCCc1PCbrpkqPO
	GdcsMRXgl1FiPjpkjYTl
X-Received: by 2002:a05:6a21:2212:b0:3b4:71c1:ab29 with SMTP id
 adf61e73a8af0-3b4973e62e9mr7171060637.16.1780549215844; Wed, 03 Jun 2026
 22:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lakshmi Narasimhan Sundararajan <lsundararajan@everpuredata.com>
Date: Thu, 4 Jun 2026 10:30:04 +0530
X-Gm-Features: AVHnY4LisHiWLGA3qFZMz_mdV3l6oQrnjv3mZvW59JC7g_R23_8YxY-pXhSBziw
Message-ID: <CAFe+wq0JxH3_GZUdoKhxLM7RxbWphNs6fj0aetQ-VY4H3MXe_w@mail.gmail.com>
Subject: Reg thin pool chunk size and its impact on discard granularity
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi LVM Team! A very good day to you.

I have a question about the chunk size configuration supported on a
thin pool and its relation to the exported discard_granularity on the
many thin volumes from that pool.

Per the docs, chunk sizes range from 64K to 2M and must be a multiple of 64K.
So I assume , any integral units of  64K, for example, 192K (which is
three times 64K, is also supported, even though it's not a power of
2).

Now, I need confirmation on the correct behavior: I've observed that
thin volumes from a thin pool use the chunk size as the discard
granularity. To my understanding, the block layer code heavily assumes
that the discard granularity is a power of 2.

In this case, this is not honoured, and I do not fully understand the
reason for or the impact of this behavior. Can you please help me
understand what this setting means?

a) thin pools can safely support any integral multiple of 64K chunk size
b) thin volumes always export chunk size as discard granularity
c) thin volumes exporting a non power of 2 discard granularity implies what?
d) what else is impacted here outside discard - and its behavior in this case.
Regular IO activity is fine, as discard granularity do not impact it.
e) anything else surrounding this context that is relevant to support
this configuration.

As always, thank you so much for your inputs.
Best regards
LN
