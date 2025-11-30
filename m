Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4443AA6
	for <linux-lvm@lists.linux.dev>; Sun, 30 Nov 2025 00:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764464259; cv=none; b=u24cJG4GLkwG9yEscxKYjAavhsATJKamhPBo9+W5vokcg+gO2ePXXJpvVp4eYf5O10mULQcxhhXvn4cfOuKRKuNMdZZFiMNFSt/+wJIt1XwbqbWSiT6vat2CTv4a9thXtMLOnjWeWDJxjz/uHi3yXUCASHVtFP43fDEfCqZjQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764464259; c=relaxed/simple;
	bh=k6FYX/RC2meRZKmLL/rdujICr6cSnEexoqs5r2vGL4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPCrw9G9/hBd32+47durweFKh+gPtN0eqaQ8jZ6c5LoAlUUGzZaO27cQK0yjWxZrFH5Mp4hrRMj7ubaCQbLLN+kRGTfLxvIs9I7rWcrSChj0XHhyI15ehMn9yWSk95g/ecMdgbA1jlGhSIi3MQWDqBCalUVtTTUmRBzWk5TMAc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bha/uTSk; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bha/uTSk"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so3262526e87.1
        for <linux-lvm@lists.linux.dev>; Sat, 29 Nov 2025 16:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764464255; x=1765069055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g49Om8KV5+AE4pKbmfS5SsSZ6jAm9G/Fr+ete77Gs0=;
        b=bha/uTSk4ap/bj6cDuHYOTzjCkob8MxXSAaMqYHgh1Efo2m5IOgaK8tQfJbdOFJBsM
         hHpNRTrz2lwgjjvp+hF/IRGFL+1C0ILehDTOwQiCH8hS8KqBIWsfYcElsAzGqNIbsFxl
         iAHmDy1wTBKMXl7taPGApXoHaRDfN6q9mYqzjQXHnuXELDRu3NhVr/GN1Nu7g0xGcFTt
         IQdd5krGef/wQ5QSTUAEeCzhyQdGAPeJ3cydlMqZzcAnifBbmAFWDeC4jfcANZlU5ggk
         KJ2hegJviZ6AVZhzrSydo6WTa4X3zH3VTIntD3RXH22V+WB9w4xxCDY0Eg0Ummq6RdkS
         Mv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764464255; x=1765069055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+g49Om8KV5+AE4pKbmfS5SsSZ6jAm9G/Fr+ete77Gs0=;
        b=tfzo0iGW1OaGlZx+TNHr2WntBZxIrQjLAOnYTM+m8XtbV4nxDrk2W0gVjhlIupRbad
         9NR555kpzNIWeMnvEXBRMzrty6JX2PiSiIa4Hhb1voVaAa4GgwPTnEAfrxW42dwybSP/
         tkLQF2cmI16NtnpNKx2GJHuDvPc1bV5eZ/8RpVKcxvCWOHcZNMnxD9Kjivm8SKdwH9wa
         cto5MxYGAPW34CNh4OWwNvaqxuJAHWIdLed4hnRwb453OO43FEH1zjn9R+PPkLLZLsX8
         fkEgRXfk3Tw5cctWAhBG5rB8d8sjbHFvmtWUfj0e0KSZhZvcwm5o8qH9kYCAofnmCnjk
         GnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDOhR/dfrtSCHP96LJ/qlSkspsqBgBObsQhMeDS8LlxaqqCWxBu9lWRSHUl+hDwYT2kpjKr4RLSd0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzglngY32OMWzKKdOuX8fcasIi/gGXRdUyMHgoSAfP2jt/4YpbK
	W01xmQsWY9BF7tPxoA1ynCoQdDxP+IoZNcaXQvwQmqI06kGD/ZyYJv4E
X-Gm-Gg: ASbGncsWSbcxqEaKfrzWLCEl2MMKFANKfbdGre7P1yCZok9mFUI8hzaajGqCIVT+tI+
	gE88/2j5Q5SIm3eMr4sMKBM5LRUoaGAAaKS3LNvJ0ABRyunEDMxjSXSGhmzWfr3yB0YIpZFAhFB
	pYUBwpE913Bp60qXx+WrHb+6J/wVcPjwH44S8EDeEZCerAHovDh1GIX8dJKLFsB/y5TXrYRNq2O
	HAoRSOFYZuuNBn7AlcHWoCH8ygZnJvtjacsKkCgISC7RVdO9KDkTlvJuIkRCGKOFaT8PA6Q+cNr
	0kvhuqWe4ewtrrefoft4h/A2zkafUKAYz0+q+40hJUz9oTniB6EjO8ket+ItSnLmVB5QqzMjBy/
	/jrYL3EN3EvZBY1V+M8woCp8+R+Ifx/dwLMErPXoZUDdUqbq/DQq7lS7dR9umOABcHZ8wVS5pVU
	0ni9FkdYo=
X-Google-Smtp-Source: AGHT+IHqqLvvP2sfFnTWOisjSIYIhy2i6Epx2GFFCPJmKULbpNgQPdTlRmyFokY5qYTyoqCENRLjrA==
X-Received: by 2002:a05:6512:ad0:b0:591:c3f1:474d with SMTP id 2adb3069b0e04-596a3eac18bmr9392825e87.15.1764464254932;
        Sat, 29 Nov 2025 16:57:34 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-596bfa440d8sm2303111e87.46.2025.11.29.16.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 16:57:33 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: mpatocka@redhat.com
Cc: dm-devel@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-lvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	linux-raid@vger.kernel.org,
	lvm-devel@lists.linux.dev,
	rafael@kernel.org,
	Milan Broz <gmazyland@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [RFC PATCH 2/2] swsusp: make it possible to hibernate to device mapper devices
Date: Sun, 30 Nov 2025 03:56:56 +0300
Message-ID: <20251130005656.3644711-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <b32d0701-4399-9c5d-ecc8-071162df97a7@redhat.com>
References: <b32d0701-4399-9c5d-ecc8-071162df97a7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mikulas Patocka <mpatocka@redhat.com>:
https://lore.kernel.org/linux-pm/b32d0701-4399-9c5d-ecc8-071162df97a7@redhat.com/ :
> Askar Safin requires swap and hibernation on the dm-integrity device mapper
> target because he needs to protect his data.
> 
> This hits two problems:
> 1. The kernel doesn't send the flush bio to the hibernation device after
>    writing the image and before powering off - this is easy to fix
> 2. The dm-integrity target keeps parts of the device in-memory - it keeps
>    a journal and a dm-bufio cache in memory. If we hibernate and resume,
>    the content of memory no longer matches the data on the hibernate
>    partition and that may cause spurious errors - this is hard to fix

Let me add some more info on this patchset.

First of all, I already solved the problem for me personally:
I wrote hackish patch, which fixes the problem. My patch is tested on
my real hardware under load. I successfully use it for 2 weeks
(I hibernated a lot of times during this period.)
The patch is absolutely rock solid, and I absolutely sure it is correct.
Unfortunately, it is not generic, it is tied to my particular configuration,
it hard codes paths (!!!), and hence is non-upstreamable.

Here is this patch for your information:
https://zerobin.net/?ad6142bd67df015a#68Az6yBUxHA3AXB7jY1+clSRnR745olFHAByxwPGM08= .

Feel free to use code from it.

So I personally is not in hurry, I already have solution, which works for me.
(But I am still available for testing.)


Your patch has a problem: after "notify_swap_device" call, the pages can
still be swapped out. "pm_restrict_gfp_mask" call in "hibernation_snapshot"
prevents further swapping. Thus "notify_swap_device" should be called
after "pm_restrict_gfp_mask" (but read on).

I attempted to create test case, which would expose this problem. And I was
unable to do so. Still I believe this is a real problem.


Also, our problem is very similar to reason of introducing "filesystems_freeze"
( https://elixir.bootlin.com/linux/v6.18-rc7/source/kernel/power/hibernate.c#L824 ).

See problem description here:
https://lore.kernel.org/all/0a76e074ef262ca857c61175dd3d0dc06b67ec42.camel@HansenPartnership.com/ .

See also https://lwn.net/Articles/1018341/ .

(See also this huge thread
https://lore.kernel.org/all/20250327140613.25178-1-James.Bottomley@HansenPartnership.com/ .)

"filesystems_freeze" logic is already implemented in mainline. It is gated
behind /sys/power/freeze_filesystems .

As you can see, authors of "filesystems_freeze" attempted to solve similar
problem. Thus, we should probably flush buffers in "filesystems_freeze" call.
Ideally, flushing of dm-integrity should be correctly ordered with freezing of filesystems
to support complex storage hierarchies (i. e. swap on dm-integrity on loop
device on some filesystem, etc).

But... call to "filesystems_freeze" happens before "pm_restrict_gfp_mask" call.

So... in this point I gave up, and I don't know what to do (i. e. what the upstream
kernel should do).


Feel free to ask any questions.


I changed CCs for further exposure.

-- 
Askar Safin
