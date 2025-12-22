Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F5349AE2
	for <linux-lvm@lists.linux.dev>; Mon, 22 Dec 2025 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442300; cv=none; b=AAMx6aV+ITK0HP10xv1UWKyiF9fUrBlCOL8TQ27FTTIIv6DifGdv7jGiPIrasuTqAqSfNuKgDIbnB4oThm411DL8Hqg73+XuFnX2R35IbReC0OVm9odm+3Nkbv+E1Eh21ZZrau9t0Z5YKbtJUNxpTU2Mly6gSsbYMGNkvyFj4C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442300; c=relaxed/simple;
	bh=t2mLLBvt6h8MFjkmzRQlmaA4RDpz8bVYxKkEkTxbYhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUQFs8BJDo9kdraM74tT0lnt7Jqh+NTpSn9I0rzn3q+BP/GZqBTwhG1g/s8LuEWUbKL2gG3QaecMzIL/gl2+TlFVQyPq8WWq3nUy2zQVEMcdV/PqyDuCGbvzdPkSYMeHC7lNdtq9xJckkwVp4UJNx97pY8x2jVsRDkS7xsgllP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUt9WjKd; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUt9WjKd"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-594330147efso5303225e87.2
        for <linux-lvm@lists.linux.dev>; Mon, 22 Dec 2025 14:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766442297; x=1767047097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn/OAPJtWNCT0eie4rU3UF1I3TWQyxcji+TCrLJ8drY=;
        b=GUt9WjKduVeqq1/HDaUWa8sNcXWVq9wCFyO41MUyBsohU2LvG3iQ++khvz6m8Xoh2o
         wMJ+QUjQTysyHaIu7qKBxDU3M/EAgWHl6dtCPPTCgckfiNoVUrHUtq2Rm/eg7rQds/2o
         vBSqWkcngsPMOcmYL/A24gGRjwIyqweBdu3z9Bctmtk+YN734VvLzU85TT6rVJ2jWhUA
         4JtCX7sz7l2mOTM3zJiIsouWgUlVYMRZnxp/kq/oGhyUGkl0qeGe6YSQp7qjdjSVHE/e
         shxahdwyGLHQuwog5sQT1ePj3oWqenc+VADLXJTgFS8kbxzdb2tA8OtPbm81A/GXrPs7
         5rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766442297; x=1767047097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sn/OAPJtWNCT0eie4rU3UF1I3TWQyxcji+TCrLJ8drY=;
        b=UNy4owDL+6oZ5ljHFn121IhJ6QOAm2SvCNQwYvo/J1ASsoe6pq+eejI2+07zqhxhQ9
         DMXjgJaDqvgF4VF1uFsSM0jkdpqEW9u2ELqM8pcL/5iHW79TxLid2OGYgRpNRk9Aj1bq
         JRFdCjj5N79n/DSlmMGK8qTJ2GeUSHq+boOIc4D9H6gp8ZNCDggZuaJ/E8QIvT8+/LCi
         Wq5Lz5CHm7X1Ag5rFKyVd9+x/+rtGR4UmXotenhd+FuRVFz0kDG//r/KArsf4Nb9ETCq
         PwNG8Dt8pM7VfVCqt+zdHuEAqT0Z89m2xBz4JK2lZizY7gZtIyoUADxY61jaiS4BFPwY
         C+vg==
X-Forwarded-Encrypted: i=1; AJvYcCVdk/YDzsakaPm+33afMJrLf3NkLkoaKMaeKczxOykdgNW3mtBRtAQ0gxaovHLPFTojwIMMByfdLnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm1sGpQLkeyBxIJAqGSUVYMXrc4Z0nbrD750NJX0+VMCuaLIpI
	58qw1zYcBlGsJGuFmX67pR7HE5BYwdAIfr65l1otBYz1C5ew8C5kYN/r
X-Gm-Gg: AY/fxX4fVnudCE99c2/ILW49EXKTydMOQwP3UN7QIAgZ/9Raw4MCVPXK78K7GjFUPKY
	LpJaZ1vBJJcEfvYHR9I727+9z1KJWP4JnQdvnpcyRuFpQLgsQGukl80qawE2u3alWDuvPt3Lo94
	QetyWwioV+mzpdoJaQSDGqbL9dB67Mi6VS+Fp9cGUD0RCk0MyY/5ZdbJ8NcI661vyqlB3vV9DPL
	F1HJS85fpIBXzSX/50sqS9r8axxu1x4N/5WVn/2oTr5q7gtl70NWkSAWQsfdLNPPq0CDltr6kws
	8uWnDB1hBotE7BfHit2TjU8Bo9coMbIvvssP1bM5MAiEWX8G3TGJEU97fyxBUl2qvt+HrtV6D4T
	SOSizC43IVR2N5f6PC7N0UxFYdsdp5ebz5C3xMStqGaMDOix28c/Sh0ZxfUSyDZZ/yu3BIZKryR
	G+Op7xhqQ2MkKNMPr0cDQ=
X-Google-Smtp-Source: AGHT+IHKzpn400t05hIadcb+Wh63yw6NvPoXhFOWLmAT0LANkEjsAg/G6SFnu7Qr7y/2raDb+pTAgA==
X-Received: by 2002:a05:6512:2388:b0:59a:115f:5b8e with SMTP id 2adb3069b0e04-59a17dd70b4mr4476616e87.45.1766442296571;
        Mon, 22 Dec 2025 14:24:56 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-59a1862840asm3524409e87.96.2025.12.22.14.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 14:24:55 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: gmazyland@gmail.com
Cc: Dell.Client.Kernel@dell.com,
	dm-devel@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-lvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	linux-raid@vger.kernel.org,
	lvm-devel@lists.linux.dev,
	mpatocka@redhat.com,
	pavel@ucw.cz,
	rafael@kernel.org
Subject: Re: [RFC PATCH 2/2] swsusp: make it possible to hibernate to device mapper devices
Date: Tue, 23 Dec 2025 01:24:19 +0300
Message-ID: <20251222222419.1814906-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <86300955-72e4-42d5-892d-f49bdf14441e@gmail.com>
References: <86300955-72e4-42d5-892d-f49bdf14441e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Milan Broz <gmazyland@gmail.com>:
> Anyway, my understanding is that all device-mapper targets use mempools,
> which should ensure that they can process even under memory pressure.

Let me give you more details.

Here is output of "free -h":

               total        used        free      shared  buff/cache   available
Mem:            62Gi        47Gi       924Mi       2.4Gi        17Gi        14Gi
Swap:          378Gi        95Gi       282Gi

Swap is located on dm-integrity on real partition.

As you can see, my data does not fit into physical memory, so swap is required
here.

But swap is big, so in theory allocations should always work.

I have a lot of Chromium windows opened (nearly 200).

My laptop is Dell Precision 7780. It is high speced expensive laptop.
I have 64 GiB ECC physical memory, btrfs raid on two 3.5 TiB partitions.
Everything is located on two 4 TiB NVMe SSD physical disks.

Sometimes whole system freezes for several minutes when I open new memory-hungry
Chromium tabs. In such cases I see in logs:

https://zerobin.net/?383b5c32b958aca8#yXmgYidkC8pUFixwQKB+v+O3bkbis4RHduz3gji4DxI=

Notice that all backtraces contain shmem_swapin_folio, so swap is involved here.

Hibernation works thanks to my patch
https://zerobin.net/?ad6142bd67df015a#68Az6yBUxHA3AXB7jY1+clSRnR745olFHAByxwPGM08= .

My kernel is 6.12.48 from Debian with my local patches.

Sometimes I see messages "page allocation failure" in my logs. This is very
strange: I already explained above, that there is a plenty of space in swap.

Here is output of "journalctl | grep -B 10 -A 100 'page allocation failure'":

https://zerobin.net/?4170949dd9a8b25c#p5Z73TfGgpem4O4UsiWllrMCLCoHzDEw+KwJ7n8LWPA=

Maybe my swap is fragmented?

I that logs I notice that:
- Allocation failures often happen immidiately after wake up from hibernation
or suspend
- We try to alloc page of order 4 (what this means? 2^4 pages?)
- GFP mask is "GFP_KERNEL|__GFP_COMP" or "GFP_NOIO|__GFP_COMP". Failure to
allocate in "GFP_NOIO|__GFP_COMP" case is somewhat understandable. But
what about "GFP_KERNEL|__GFP_COMP"? As well as I understand, we are allowed
to do I/O, so we can drop everything to swap. And swap is big. So why we
fail?
- In all backtraces "dell_smbios_call" is involved

Hibernation always works, but takes a lot of time. Usually several minutes.
When hibernating, I see in logs this:

Dec 20 10:02:18 comp kernel: PM: hibernation: Allocated 26015132 kbytes in 193.21 seconds (134.64 MB/s)

I. e. 3 minutes to allocate space in memory for hibernation image.

And sometimes even this:

Dec 11 08:34:26 comp kernel: PM: hibernation: Allocated 25942484 kbytes in 348.90 seconds (74.35 MB/s)

Also sometimes I notice that in browser background for one site is replaced
with black rectangle. So, I assume that browser failed to allocate something,
too, but I unable to find this in logs.

> Anyway, my understanding is that all device-mapper targets use mempools,
> which should ensure that they can process even under memory pressure.

This seems to be not true. I see a lot of words "alloc" in dm-integrity
code:

$ grep alloc drivers/md/dm-integrity.c

And it seems that allocation happens not only in initialization,
but also in normal operations (but I didn't looked at code carefully).

Also, I see a lot of mentions of bufio in dm-integrity code.
As well as I understand, this is some cache layer. But, as well as I understand,
in my case there should no be any caches, everything should be written
directly to partition.

So, how to debug this next?

Maybe there are some ioctls, etc, to avoid this problems or to enable
more verbose logging?

I even okay with inserting some printfs to kernel code, just send me patch.

-- 
Askar Safin
