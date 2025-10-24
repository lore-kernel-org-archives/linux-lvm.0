Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC53242D97
	for <linux-lvm@lists.linux.dev>; Fri, 24 Oct 2025 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323514; cv=none; b=PxGOJkP+E43q1SbPPnnHyXESagPxKENy0C5qKfACxdYGNVUMenERsVZXSOX6bm3MMyuJv13wNMV3KwpfMBofMdfHlYGT/PhggDv7GQ9e45OVe3K7WDbOhsD4FuOmdE1rO+e+ewCGwJShNIqJFWF+HdjAYV9R85wGAP+6r4WhFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323514; c=relaxed/simple;
	bh=2sni659oKETAt3mg4JWKS26aiVXJeHNTGhbFaOETvpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsL/67CnWLZ04ik8JbSXV5UeRTmWgVPNHZTa6npkJODUMzNUFZxrmdrhCnKFxprvKPYCFMUnNUAsH10u1/QrafyPYWjooEslwxEPZW659K7+FzTlKixRj5Osl+ASuMlQr7tHSMIFRBWIRxCtPe6Lub9SbpaoqvsTN9v6rnDBN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdFczxX5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdFczxX5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so3527141a12.2
        for <linux-lvm@lists.linux.dev>; Fri, 24 Oct 2025 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761323510; x=1761928310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU6+xLScjAoCvkgYL37muGkf8RRryUsuClOGQPNvZ0U=;
        b=HdFczxX5tZoWsHoPJ/RDA6Uv4d94HZmuli9YrhHhymLZlm2MIlruQ8dghPot4o7ajm
         /WsEbjTL8J8HmcRSw5BCzd0f/LQfB4SdhI53t2FMlL9lPa9trP3sZLtPCINY/svF5Oav
         Ex9MXs+ry7yP1NWiq8/estOvbldgYj8Qhb7om67L+toCCkUByqU8nTwGUNbXIrEaoHKy
         JXnhY9yrRf6KKydxe/DiQWsskDjOIj5blRS/7MkF1MqJ/p7ulYRSnAwf6FaODHMRTeC4
         nIaeDQiFGjDps1ZSRabYM7j1+bLsNOzJ/1lVB0MInE5JZQrs3gYGLBr/KuagscQYatCQ
         upng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323510; x=1761928310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OU6+xLScjAoCvkgYL37muGkf8RRryUsuClOGQPNvZ0U=;
        b=XMD7Fj7BcboHgaMa/Qus5w/R5X9VR3P/KojKCQbF0QPzZBYvZLrecHMmu3m6hrsbuM
         gvTjKTJfkV80GB+5KQGkghiMv/oOAxsQsfjcGGtAWAoau1efKP3HuFHr48S5flPHH9Jj
         7Onsp54pPCHnMsQWZQyb5gkzi1oBFwJce2XveyuhAy6kxLx53I4giyI7XUH1v6WfjXUf
         EHN03e0eREIzaVWAJt8L/qNL29g+f97fcb1a5p1f8l2vwG5ptJV7r+vEHtxtCeaWI/O1
         5nrNdngl5Nuvoaf4KB9jQiS7QRnJ2rLqp5ktuVm6UZl2PjImyJxeRNOmSrPzOvRR/JwY
         Qe1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4uOaUbLxoC9lHhZQk9akbjqEbYeyUsaMkTITFFnbkLoJX3+6kzbyY8r5GP3WC/o8pxnkQjoRxzw0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNyGjsUwUgTiO3/KlFFMbpPqUZWNReneWWId/bbelc5fYT7cIL
	cluDEAHN+TAHRvLMdU7SH9kKMgC281i8KtlUbcvrjSl6obVxtKvwQvXm
X-Gm-Gg: ASbGncujW7lqmuRQOmIaWoN+5fqMPqlZqmEL0AXu7zGleynAUu2HbQz8pjQemjfG+Vg
	7OwtJfqfzj3DZPIdDtX1COmSpvxwAveUf7qfCdPKyuRXd0xRelECMegLC0xw12i/uWmde0VuDtW
	B8x0sZirm7TWAY9YX0Qt3pday1hlKNYwQ8wRMowUdMAbvvEgzZhG/qF6bZ775imVvCBakujN77D
	Ml0lob139ech8fRdBMrbkeCoO5YSQ6nWmGWsm5lclkiSIaArM2WFl2eNTWZovpELCYOAtLB0e+z
	NlnrD5EjNBSxI7+yntbd5wSaRJagCVEn8nKEMBLswFUY8g5QrzL2031y/FizA2qHDlwbI52eZ5D
	uTGRSxdV8Nl4brvpga6AJqMlx3nP0U93GiFrPHF5btstJyi4YvqKoIFgBin/DSfPCVtTNEN96jX
	jv
X-Google-Smtp-Source: AGHT+IGJrzUB5n97Ss2T/JTlLzP7kGDtRqESJivToHOWW6+qmykXupmsLuZ+wNfM3MQ1VRw6GaGwKg==
X-Received: by 2002:a05:6402:42ca:b0:63b:fbd9:3d9c with SMTP id 4fb4d7f45d1cf-63e6002459emr2596805a12.15.1761323509904;
        Fri, 24 Oct 2025 09:31:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e3f316b64sm4717822a12.22.2025.10.24.09.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 09:31:49 -0700 (PDT)
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
Date: Fri, 24 Oct 2025 19:31:42 +0300
Message-ID: <20251024163142.376903-1-safinaskar@gmail.com>
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

I just wrote script for reproduction of this bug in Qemu:
https://zerobin.net/?4e742925aedbecc6#BX3Tulvp7E3gKhopFKrx/2ZdOelMyYk1qOyitcOr1h8=

Just run it, and you will reproduce this bug, too.

Also, I just reproduced it on current master (43e9ad0c55a3).

Here is output of this script on master:
https://zerobin.net/?68ef6601ab203a11#7zBZ44AaVKmvRq161MJaOXIXY/5Hiv+hRUxWoqyZ7uE=

As you can see, hibernate succeeds, but resume fails so:

+ blkid --match-tag TYPE --output value /dev/mapper/early-swap
+ TYPE=swap
+ echo 'Type: swap'
Type: swap
+ echo /dev/mapper/early-swap
[    0.446545] PM: Image not found (code -22)

Also, I just noticed that the bug sometimes reproduces, and sometimes not.
Still it reproduces more than 50% of time.

Also, you will find backtrace in logs above. Disregard it. I think this
is just some master bug, which is unrelated to our dm-integrity bug.

I will answer to rest of your letter later.

Also, I saw patch, I will test it later.

-- 
Askar Safin
