Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC12D837B
	for <linux-lvm@lists.linux.dev>; Tue, 23 Dec 2025 05:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766467809; cv=none; b=qZxPoiHf0gSDTjHbOVaRw0Vz21jmzN1pdVWf1ywO9e3Q/JHYkSlNKfft2Q+b4sRHmCVdfm/XL1EWZsrrMoCD8o0rYT85AeZOII5TW/NVZjpfXa0PeUDro8YCEUXky4DwNGEMpdnkJ2sz4UAhbEVBIPXkSBKP2vYPVpCStm+qX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766467809; c=relaxed/simple;
	bh=LeHgaTCg3sZgaNtwPEbjvh+7JlJOUXsNXjaOCgEgLN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jn6UzUXfUTOJevhywqV9OeZuF0eK4OEzQLNSElup9hlnlMhjGDzHf2tmMFK1I95NAQau/qJZik8U+Lca9jfQo9QK4gxz52xUgwt3l9ZSV9LVZmpctgVu4einNMv9MSFjX2/PJpOEd3xhVrY600FojGDBr0AMs3/jWOH5kgazp7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCMiUbuG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCMiUbuG"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5943d20f352so5093864e87.0
        for <linux-lvm@lists.linux.dev>; Mon, 22 Dec 2025 21:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766467804; x=1767072604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjrVs5qAijx5UEiplGDR4bSOktnBgAEK/U0XoVs0/GM=;
        b=XCMiUbuGoig+6ARL14x6zTOkC2vTVaIKR4of892zwJU3py5CQ89QSzezCw+Mlin9Kz
         k9exm0eiosfnwXwg7a2cTLB3Djsa3klvPmct/vi+U0ylKR5BiQGC95ZQNNy7MvnotSMX
         QeByiLCOo6dc1zYRJnZQJusObAQPbNtkU2ivB2FTQ5PSMGuvvmuBQpXHUxGaIzIt1tNE
         NXuyHDaacGTQiAFNoMJG7IshbJ//iusJonl7P7nR9boCI5W0v3wrSYCZzqlYJdmxnrRC
         WwXXYIXEC9ffAyE7pJaBXMsbZITJ2j32C2T87v+goexhpFsiMWth9uEirUg0JLsXqMFi
         w4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766467804; x=1767072604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CjrVs5qAijx5UEiplGDR4bSOktnBgAEK/U0XoVs0/GM=;
        b=uOJchi5B+RPfdtPEQvDB1wo5Ficks1WJFx5QY1+MIPyVHCwOqTE+6i3n7LafjYwqxE
         s1qRTKxTugsc2tb8SQqpYid2iDoLT+kcNGblZsV1cC7L8Wm3XzrPF2CbjF4WOik8bBT6
         Apk5DstxmW4rciT06vULIkYsdyZVv2/hMy9m7LGFHr2w3Ug2pmOBaTmk1FNFICYnA3er
         kufp4nXnRwOdDlRAnb7l0lFJq5154XJrQ4qqMBGaKKcIKm1Vhoo5vud+vDWMqDHC9S+q
         XEgX+JJLbDYKRz3OCPbHEAqF9TinJEEq/ogevTi9C5qTa6dFQmhOwPewwOiWRt2BXBXx
         Ag3w==
X-Forwarded-Encrypted: i=1; AJvYcCXAHktRgQOeLXYaWIxPWh1s8FzGYDGiaiZXiYmTHkBtFvHXFcgoHBESIR6ddZ8hNeGNEmcYMfKBRmE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8DDf+gRpzu+n/sQUxCME0ORW7pzsTuW0LZLQiB+QNlXObuR+9
	9iemN3wP7qbpfmqb+HmoTFjLXInqK7KKYHIqbV/31SJ5JF9t4TrHt1Hv
X-Gm-Gg: AY/fxX4enhU+QDyaZ/f8F+fwTp+1v43WQWEcsJPFuNpWSYd8fTZ2yoaqRMfI7K5vZS8
	uQYxHfAVdlQQS42tf1ePug1mW0cTAHzjQeeR/kf7IHj7K6iY5lukGofcu7otO++lZ2vKNGtncVv
	kcFRzUxzB5yed6eDBtI922K8ofXQIxML1vPvT4kZrx44XqN+XR6PmjB401A8B9q9CvGrSLzezo9
	eKNBuLoH4xyzXWWr8P3VWubHIZlQjpxRJGS+yKU3JLxuPvLbLzggXy42u/skUnM4YPpcFOdNrjR
	RWHDQ+xm45NnIoKLqpT5vmGd1i194rIlUM/AUScvjivJZqdgZUhiibCyB/9psS3BmAKyYpEaiB9
	Rew1+BS5EsGjqc5ppv044lwPPpVlrfg+TU4/MgkByvPPvR0XwGpu67s0cHu0BRYG8MAnWXNYjJD
	6uMljcXzcA
X-Google-Smtp-Source: AGHT+IFBJ4czf5dy7NoHG6Z5fLR0sF8QwzLoI7Shb3fIF5XKnuFbQtFm8MSKsqZe2birAQ3bGk4BUg==
X-Received: by 2002:a05:6512:3a85:b0:598:8f90:eff5 with SMTP id 2adb3069b0e04-59a17df6969mr4474213e87.53.1766467803957;
        Mon, 22 Dec 2025 21:30:03 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-59a18618ce8sm3818747e87.54.2025.12.22.21.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:30:02 -0800 (PST)
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
Date: Tue, 23 Dec 2025 08:29:52 +0300
Message-ID: <20251223052952.2623971-1-safinaskar@gmail.com>
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

I used journal mode so far, but, as well as I understand, direct mode is
okay for my use case.

Okay, I spent some time carefully reading dm-integrity source code.

I have read v6.12.48, because this is kernel I use.

And I conclude that dm-integrity code never allocate (not even from mempool)...
...in main code paths (as opposed to initialization code paths)...
...in direct ('D') mode...
...if I/O doesn't fail and checksums match.

(As I said in previous letter, mempools are bad, too, as well as I understand.)

I found exactly one place, where we seem to allocate in main code path:
https://elixir.bootlin.com/linux/v6.12.48/source/drivers/md/dm-integrity.c#L1789
(i. e. these two kmalloc's).

But I think this okay, because:
- we pass GFP_NOIO, so, as well as I understand, this should not lead to
recursion
- we pass __GFP_NORETRY, so, as well as I understand, we will not block in
this kmalloc for too much time
- we gracefully handle possible failure

Other strange place I found is this:
https://elixir.bootlin.com/linux/v6.12.48/source/drivers/md/dm-integrity.c#L1704 .

But I think this is okay, because:
- integrity_recheck is only ever called from here:
https://elixir.bootlin.com/linux/v6.12.48/source/drivers/md/dm-integrity.c#L1857
- that integrity_recheck call is only ever happens if dm_integrity_rw_tag failed
- as well as I understand, dm_integrity_rw_tag can only fail if we got actual
I/O error or checksum mismatch

So, this mempool_alloc call is okay for my use case.

So: in 'D' mode everything should be okay for my use case.

Another note: I used very stupid way to search functions, which allocate:
if function has "alloc" in its name, then I consider it allocating. :)

And final note: there is an elephant in a room: bufio.

As well as I understand, when pages are swapped in my use case, they first
will get to dm-integrity bufio cache, and only after that, they will
actually hit disk.

This, of course, defeats whole purpose of swap.

And possibly can lead to deadlocks.

Is there a way to disable bufio?

Or maybe bufio is used for checksums and metadata only?

-- 
Askar Safin
