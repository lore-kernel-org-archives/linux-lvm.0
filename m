Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AB2D7DD7
	for <linux-lvm@lists.linux.dev>; Wed, 17 Dec 2025 23:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766013528; cv=none; b=JlDe/SYZXHFflRTcmbOza0LMDilwXX8T9urndgrQmD63NM7ynOu+ErXWeGk3ZijDLInosVa1z66+KhNvu9IykV7q8TKWG7Nc2y4ox1ZFdT6al3Mf7lKkjTg71de+7agrxUCT5FPKX4lAjermKmYf1qZ4N10SgB6prjkqbitDwos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766013528; c=relaxed/simple;
	bh=C1X5R0T9A6CrUnxpIm/QVXVuRULmzTp597QRk97zyjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OX2bq2e0Cn+5T4JfYY83/QUXoQU0tS86k8eY7YP5kd93XhDiLcqmAzEEYvvkn/oi5VbD0o1WxEj4zgqW3zxCzaNvklOdgH8hdlqbPOUHLNiPgnPpJQDvt62Y+UzznHFEmEfREZVPMvKBBco6pFZQh9aUpJ3cFDJXBTtG2sURikA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m712Gq8a; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m712Gq8a"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-597de27b241so17500e87.2
        for <linux-lvm@lists.linux.dev>; Wed, 17 Dec 2025 15:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766013524; x=1766618324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZvc3rVI0di0d/Re6Le5Bvc+vMvJtdhpmIxMnxjb6tA=;
        b=m712Gq8aXTeHqrdEiYNYZFwuKqU3i5ANi2LJWDCUQ3M7qvbUpL0v5Aac8cybpVRT03
         CXXtchIa67nua+K1DRpB9VLCoMmwPelUA0Py9ZfDwRXB9AxjAxZW4aC3+V72V/Z68x1e
         NOu3tIfRsNMPJUIF8xtp0jWKkjAjbgNSrTzdf/HktUMzKxqD50Xdc2nMS+OBhgWPLdEL
         X/EHfhkAJxE67CEKjZZ7kMoDXF8hB9GHzoUn236ubWonYl3tXjDEFS8H2lQxufINlxz0
         Th6ni8Eq0T9GzySne83SID3LMO4n9ftrC/WSCkzCVyPN75z7FJQT6aXvisQuoPVDQKul
         UdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766013524; x=1766618324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZvc3rVI0di0d/Re6Le5Bvc+vMvJtdhpmIxMnxjb6tA=;
        b=by4GIBTz3LxXA7wW1Ct2bUGqI+zbtJhzBZiv64B9KsotE3SYX86u5lQig3ugGiCOat
         e7UOIn7q+La/2vvDx5u1BixTt7Q52yWixdjYDKofsGuRBj/reimOklXBNEi952txvyl7
         0wdiFhA6Vo+39t0g0PNi+JIye05WgB2zoDYmC/yhy0NHCE62o3uqvD/k/cg4wMD8ZLPz
         PYFzjDbu74lE9j+qoThXd9DJE7cRB2cfq70sWFjLMpmrrZr4UZjjR4wH6xSbg664FHPF
         WFiC5ud+xfCtFXqlsh6z6LNsLW/ZP0+gEbwEOOsSW5NMpf2zH5mcavDZFhSB+DXMk5jl
         Q7iA==
X-Forwarded-Encrypted: i=1; AJvYcCWAJ0P+LZc0eeAkjtq3zpeRX7OPDv+3NpQ1Dnwg50gwC7/abwONh1syhpGQyQmVDMkDHNMvfn8zftk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3p9N0EdDzVN3EvNiXqk9j95F2sYiSWUTDFnTdmyc4pfv1Wz3h
	tv250uZvEJIcXfFTMA6XYCP5ldsvH1dtb7RHiPNoX2VdpceurazXsByR
X-Gm-Gg: AY/fxX42Y2QzJh/dRFEqnYIG4A/uE2jPRyA2/jfnwBBn3Es4llEh09mpAxmj2EP79UP
	xnjufboup81Higx3YTGJyQy0Vtpv5F6OdcABXxhC2tFA+0pZGAg28dLd4LNvGjTvw9/3SU+F5jk
	1VwsHLMb7Erfa3uSNcQ369jNavIaIUBDDesgvTb50QPF5Sk2ZUgfqqVwd1VjOt5G7SEJt/C0pOO
	Rzbv/kBIdBjRLyMl+nZnPFvjDmSNsabUUgtMrZl7fgYejzHnPDgV/PO8j1wwIOTUjpahEQ/yaIO
	/4tzS5rpnGVBE3+TOA3Egz0VcUPESeLZAjm9fDFltBBxoJraH9Gkb73Oq7aBi+6vPRFss5Vl4T4
	pU/kAXgITJY7S+btAzsUTWCf66eo1Y0gVcXPV/tAWG90v5575EzDJGeDBHUfNfIsiICenPKgGv0
	QOla6oPmAj
X-Google-Smtp-Source: AGHT+IFoFgIAi9PMNEfIKCxeozWxswujwd1S6MJvMAmdk00BzJYAqN7Mqo6fE4Jz6OZ88KHyEwKy2w==
X-Received: by 2002:a05:6512:3ba2:b0:598:edd4:d68 with SMTP id 2adb3069b0e04-598faa5a3bamr5789014e87.28.1766013524025;
        Wed, 17 Dec 2025 15:18:44 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-381134b5011sm2807821fa.3.2025.12.17.15.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 15:18:42 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: mpatocka@redhat.com
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
	pavel@ucw.cz,
	rafael@kernel.org,
	gmazyland@gmail.com
Subject: Re: [RFC PATCH 2/2] swsusp: make it possible to hibernate to device mapper devices
Date: Thu, 18 Dec 2025 02:18:37 +0300
Message-ID: <20251217231837.157443-1-safinaskar@gmail.com>
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
> Askar Safin requires swap and hibernation on the dm-integrity device mapper
> target because he needs to protect his data.

Hi, Mikulas, Milan and others.

I'm running swap on dm-integrity for 40 days.

It runs mostly without problems.

But yesterday my screen freezed for 4 minutes. And then continued to work
normally.

So, may I ask again a question: is swap on dm-integrity supposed to work
at all? (I. e. swap partition on top of dm-integrity partition on top of
actual disk partition.) (I'm talking about swap here, not about hibernation.)

Mikulas Patocka said here https://lore.kernel.org/all/3f3d871a-6a86-354f-f83d-a871793a4a47@redhat.com/ :

> Encrypted swap file is not supposed to work. It uses the loop device that 
> routes the requests to a filesystem and the filesystem needs to allocate 
> memory to process requests.

> So, this is what happened to you - the machine runs out of memory, it 
> needs to swap out some pages, dm-crypt encrypts the pages and generates 
> write bios, the write bios are directed to the loop device, the loop 
> device directs them to the filesystem, the filesystem attempts to allocate 
> more memory => deadlock.

Does the same apply to dm-integrity?

I. e. is it possible that write to dm-integrity will lead to allocation?

-- 
Askar Safin
