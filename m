Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C612E7166
	for <linux-lvm@lists.linux.dev>; Mon, 27 Oct 2025 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761552547; cv=none; b=uyO4oQdhXwKpvRhOtPe4Dsx5MXpBT0deh/KvXhZ9lEEiR+XdQnBpwsj3rZQBPto2jHr9ySspVlss7/H7f3BgXZYpqsIkrNPItX5Ul+ZMnoNIfuSLeHs0y8xbBVdb7ybfuXMr5aV0AAn4QWLpR9Z6G04v4X2m4iwaxhxH5CT79nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761552547; c=relaxed/simple;
	bh=XeTwlfFrQd3ECaXR1wyhrLcNrq8QGGpB79EUptps7TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f97xjCFcBPqnnjH4HVwCNxdvKaO+Kbn98aNAEBcA0fS2hzRGRPJeBgWwFyTriwHfjLx+uQfbFxsO4fzuMX+lH8h8aeiFzN8WTneiVCHMEaDDW2P8OGjyTRtlT9mEhPQFF6cbBgNNjlvHksEnJaIuLO4zvUq+bLJD2bTE9Hlw6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeSDecBl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeSDecBl"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1040697466b.2
        for <linux-lvm@lists.linux.dev>; Mon, 27 Oct 2025 01:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761552543; x=1762157343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvxeQRhhg830l0sanhrt4dj9VmhvTVyDa0jNQUK1mG4=;
        b=jeSDecBllLgNJ6M6BAlS0NnTZGiwDkrmJMcignnp/3jSiGX1kZi9CWRR+8YzApAXfC
         DnH5OwIh3UXsjiD3bBByTgFU4OYDGb9j7By5WCUJ+R04MAxuJGNF3CdvZMGNlSmqv07Y
         h5L8AOp5lAPRaBEsWjcrjVjGieD/tHAHOLDvkuoqfDZTDk5L72p5Zv0S+Jr9FygKz28A
         F7SAIPjG0/ErBZRiQkvZPBRmDiGEA09B2hkJ8MyOEh3YWoiBwVZ3BYvF9jREMBAwZxY0
         EXYOgFmOqqZ1tssDvR5/IlR57x5Ha5GwIA2PORTxk+yqX70TorkVZ6U5pz8KhiyM4Ghr
         qrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761552543; x=1762157343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvxeQRhhg830l0sanhrt4dj9VmhvTVyDa0jNQUK1mG4=;
        b=nqowcin0a4O4dU3rxBjUO93FApZbinpCvlzLXGuhIScN6DBTGiMcuU+GXzJtakSsFo
         5oW2HZmLbK2/BR1m67qXl6nO27aruiYvrFGH09JBCRthT+nzbvi03hMDL1fzqHt0cEv4
         tMdADtglFn/vmms8Z1FHLY0eeuP+N3Ve+THtzDt6BHENmlIdrUaSrAxr8qxE9FqvBFGC
         Iy2WXD2Y+V8GSIMWUSmt6DWiPoCyonaUU2cnhKxFSN1C0cHujoLUM2x2iT5cf/TIgJzB
         +2DT1WD7Av7iyN/17EStsBy5pO1Mm0xCRcEgxaKx/yLTOHXhi57rqe4URcx9aC9fFALT
         H1qw==
X-Forwarded-Encrypted: i=1; AJvYcCV9UiGOXqvw/qxTmKSbTLsOHQc/z379LzwUfK5Ia0zabRl8AtYrRj5YirPoqzM67T3OobJGcO7lusE=@lists.linux.dev
X-Gm-Message-State: AOJu0YybDpu4kLhrvoIt98i+Sl3eBjTP+A8RrCu2vCZCURxRkqq5HXG/
	yGNugZTSPFJAy7EeLBjktkNZFl4JqQroa3EhoV6SQvVDhAEObpHVWFzs
X-Gm-Gg: ASbGnctODuH0PiqFQst+3pPFtvI586bhfVqcM5MaOePFYFUMvnYvKKDz7oFKUkKXBtc
	6J0tmxuo/Ag3jB362mEOHRnftbRQzDAKU2RqU3Zn0rV6w64dvmdG54YUYfrqyis2WnQq2V2gMpO
	06nlkzRtYJ+oFNKaM1n3ayr9VteDn1ys9vEo3mura4c4NE0JNc2IaUQ+lYy/YYDkq8ZKu66/qgP
	JE2lSAT+KrkQs8aZdEMj7Um41vPyBZ/vOawmWcVcmXRXDUl9SM9pjxeW2PQber+yUc6MLIuQt13
	d4GBDiRexbDG755h39XFw523uP91r/69KakNr1vh6J9nc/IHhvlQoNVeP8Owu4hFKUVZhWlFv8v
	5APvX/dtqWL7kgF4jUso2eeV9H7Y1ir3vONAGmaeFlJWaf1nALFuceTKaSdnEe3Use1gyzEUNg8
	pq
X-Google-Smtp-Source: AGHT+IFijVOlnEStwgdV8OnlKBS1QW3pyY3ndH6Fj16lvbKA8iEuH12vqflityGstfLwZ0jBGpQJHQ==
X-Received: by 2002:a17:906:c43:b0:b6d:7e01:cbc5 with SMTP id a640c23a62f3a-b6d7e01debbmr639439666b.53.1761552543311;
        Mon, 27 Oct 2025 01:09:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6db1c84813sm53108666b.19.2025.10.27.01.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:09:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: gmazyland@gmail.com
Cc: Dell.Client.Kernel@dell.com,
	brauner@kernel.org,
	dm-devel@lists.linux.dev,
	ebiggers@kernel.org,
	kix@kix.es,
	linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-lvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	linux-raid@vger.kernel.org,
	lvm-devel@lists.linux.dev,
	mzxreary@0pointer.de,
	nphamcs@gmail.com,
	pavel@ucw.cz,
	rafael@kernel.org,
	ryncsn@gmail.com,
	safinaskar@gmail.com,
	torvalds@linux-foundation.org
Subject: Re: dm bug: hibernate to swap located on dm-integrity doesn't work (how to get data redundancy for swap?)
Date: Mon, 27 Oct 2025 11:08:56 +0300
Message-ID: <20251027080856.2053794-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a48a37e3-2c22-44fb-97a4-0e57dc20421a@gmail.com>
References: <a48a37e3-2c22-44fb-97a4-0e57dc20421a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Milan Broz <gmazyland@gmail.com>:
> Hi,

That patch doesn't fix the problem. I will send more details within some
days, hopefully today.

Also, I just found that for reliable reproduction you need to do
"swapoff /dev/mapper/swap; cat /dev/mapper/swap > /dev/null" after resume
(assuming you were able to resume, of course).

So here is updated script for reproduction in Qemu:

https://zerobin.net/?0aa379bae218cf92#DDVFMvfi6S3ydCQLSrL+us1lHjXQJIZasW55JI7gEfU=

This script is very easy to use!

Try 1-2 times to reproduce.

Here is result of that script:

https://zerobin.net/?3d9447900052f9ce#ng0htJDAdSsvqVunL+BnoLHXszM6ardt9R3wkbO9L28=

This results are on 43e9ad0c55a3, which is current master, without Mikulas Patocka's
patch, but with this Mario's patch:
https://lore.kernel.org/linux-pm/20251026033115.436448-1-superm1@kernel.org/ .
Mario's patch is needed, otherwise we get WARNING when we try to hibernate.

Again: these logs are without Mikulas Patocka's patch. I will send results
of testing his patch later, hopefully today. But don't expect much. As I said,
his patch doesn't work.

"log-def-1" is output of first Qemu invocation (i. e. first boot) with
default integritysetup options. "log-def-2" is second Qemu invocation
(i. e. when we try to resume).

log-bit-{1,2} is same thing, but with "--integrity-bitmap-mode" added to
"integritysetup format" and "integritysetup open".

log-no-{1,2} is same, but with "--integrity-no-journal".

log-nodm-{1,2} is same, but without dm-integrity at all, i. e. we create
swap directly on partition.

As you can see in logs, hibernate with dm-integrity never works perfectly.
We either unable to resume, either we are able to resume, but then get
integrity errors when we do "cat /dev/mapper/swap > /dev/null".

Swap directly on partition works.

Again: you may need 1-2 attempts to reproduce using this script.

Also: the bug is reproducible even if we do "echo test_resume > /sys/power/disk".

> Are you sure you used --integrity-no-journal both in activation before
> hibernation and also in resume? If not, please try it.

I'm totally sure. (You can see script above and "set -x" output in logs.)

> You can verify it with "integritysetup status <device>" - it should say "journal: not active".

I just checked. It indeed says so.

> And if it does not work, could you try to use -integrity-recovery-mode the same
> way (both before hibernation and later in resume)? This will effectively ignore checksums

So I should pass it to both "integritysetup open" invocations, but
not to "integritysetup format" invocation. Right? Okay, I did so.

I. e. I did this:

integritysetup format --batch-mode --integrity xxhash64 /dev/sda # when formatting
integritysetup open --integrity-recovery-mode --integrity xxhash64 /dev/sda swap # before hibernate
integritysetup open --integrity-recovery-mode --integrity xxhash64 /dev/sda early-swap # when resuming

And something completely unexpected happened!
"swapon" failed immediately after "mkswap"!!! I. e. "swapon" was
unable to read swap signature right after "mkswap".
Here is log:
https://zerobin.net/?ebe34fc9ce94be45#6DWKSXvgUDKIrF4299th0ylhQNEcdqeeBfxzSJjROpA=
This seems like another dm-integrity bug.

> You can verify it with "integritysetup status <device>" - it should say "mode: read/write recovery".

Yes, it says so in logs above.

> You can also try to decrease journal commit time with --journal-commit-time option,

I just put "--journal-commit-time 1" to format and both opens. I got the same
result I get with default options: i. e. blkid returns "swap" instead of
"swsuspend", when I try to resume. Here are logs:
https://zerobin.net/?c5f8320eb89b1cfb#drrxRgnGk817oEDUA8idhn+WEQgocWjtbsAYuEHF5rI= .

> Redundancy? You mean data integrity protection? There is no redundancy, only additional authentication tag
> (detecting integrity error but not correcting it).

Yes, I meant integrity protection.

-- 
Askar Safin
