Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460726E165
	for <linux-lvm@lists.linux.dev>; Sat, 25 Oct 2025 05:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761370008; cv=none; b=mKayQdDe0IQahR79WvJYKkrfgeEG0mWHSbPhgqSdOCZT2T19lLutZCg1RPP4UH3EeW0UJfhgcme+0XZnhF05n4uwFayP5kQUKGI/YhKmMSy9G0rm5lY0V0GWni4sN4fPfAik9C1llG3oG8q2wV1myOV7kP+rKA4vU9Z6yGeXrLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761370008; c=relaxed/simple;
	bh=/zQwfhMEJhTOa5/FV1euV1Dku1nFTDlTsbnBQjlqjDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtO/NLMGHzvXqAruYTjMXfrJP/xzT2AXafzYAT4u/pVfXsiTWqIiTvt6VZJ7uebGuIiBU1ixR4ft5LCWpUIUD4upGAkaBU1Psq4i5h/UGWzCq/lfncz3Yuzmxf1k97DBtW0fQQPihuN6rTY1MzPuUVXktwjHGMD4MUuDqc4t5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP9LRKrF; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP9LRKrF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c2d72581fso4244629a12.0
        for <linux-lvm@lists.linux.dev>; Fri, 24 Oct 2025 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761370005; x=1761974805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mV8buuSZQP0rHOq5S4b8K+cOmbjRvDVQwA71gPDHBAE=;
        b=JP9LRKrFUu+tsGy0esuaoYE2yDegJdOOwqNi1CDdQQ+sC3zBYEe+PUXzP3Vq7o9lX4
         L/8wQ5+hbiYrm/UdbSQKOu8NHvjAcZbBEs3JqR5YABN/yLjgacjxFaAnowTrabzgY3IX
         0jd2o0va91UKiExAE36Ffl/9UDuJfCbF7LxubR9tR9eKsuCGByLTk45U9VGQ/o0BjLE2
         y0K9BYqkt20w1inCU/raYVo+66zIjlhX8lP/lJt+pN6X6uRxA5orgk3ROhh4oQSUZfyJ
         WjsoxCxlKUMwAjD1uxv95K4/L8VW5OLM0peMgETqXOFgGqzj/AVAgth6Pz7Vy4RK5w4b
         PX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761370005; x=1761974805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mV8buuSZQP0rHOq5S4b8K+cOmbjRvDVQwA71gPDHBAE=;
        b=TPBtADHPZ2RLGwDcB3Nfuh49vI10quXoO67vcVj7E+x9U8ImMaNkPzjrB0pGsA+Guq
         55aT3cMuVFRTIN/TAQlBNkuwC+ncv5Z6BF/ReigpLhvGsau833jxoRmQN41Z3I/nsvSP
         hM/cZOVD7W/J48zZytr8/pVKeXTMomJOcggjfaYM9FtxyS3p8lBsDPnVSuZsEHF2QxkE
         uC7pgaIku7mri73gh6Vce5Nu30LMOEpE4SYQVXlFgGXyyiTObwwW6FFq4GSiE60WxJRU
         dZnNLUbyjsSjLKx5WwxqfFk9mp33zwbZ709EvI+KSoxFYi55LbN+1zVUS+JIyf24Jvgf
         oYUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhgqQUVvMuFKs9m71UMvurqVyhDkKjUVL+fXZf0Vp7xcVUxzas8I0CMDbCzAW5RQ23QGQarpLd6VI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoxldZ//mIve7TnLfWr3HZ7MO52zgfE3bf/l+oHT8MERSqlkFi
	8a4d0mRBUWLO3EHSD3A66j5u42uf5zQFKXMT0f/H26Q8b6GCQxFXlJw4
X-Gm-Gg: ASbGncvC/cXGEB7HaT9zh2G51bUZrq4CQMRccdwt5/eXgMqTdfrN5g+jErHmtMldslT
	6XxOjIvIiRqPTlL7Wo0zKaYsebI6FPV+QTjqKrAAiGOxj0P0jWnNnWrdYXgqwT9gieMM6NbL7vE
	36Gt5iz5KaoEXn/wWZokR8fd4wgU1ZbL7/RHrzActTWP8qGGok97aoSNItirqe9U/cfQwofP1NG
	FW6Jg9G8kJo38aPXcaee8+3nvVWlXuLhlr63mZBt+zc5d4k/pMaw7P4RkzxQ+xuEH7B9zsI+mtO
	EANk6lcsaVCnlu/qi8Oq2YrK7sGGNpufc9aqmyhXf4Q39oLKwDDUBYWUNwU83yS1D2pmRnnoKlg
	c02C64QjRudW6Anw6ef4eTEVGD66e2zRf5eqyMPbXcCAb6f1OxWc71iOaVHtRwccuRiMhW1cKnT
	33cX9EXhnKjDY=
X-Google-Smtp-Source: AGHT+IHk4JGeekekahtUg2k/EhAC9kyrxVTGjCsIExfHrDtgIcN62P8FCtHZWZXypDamfyJkpyvf/Q==
X-Received: by 2002:a05:6402:40d5:b0:628:5b8c:64b7 with SMTP id 4fb4d7f45d1cf-63c1f64ec00mr33191598a12.6.1761370005212;
        Fri, 24 Oct 2025 22:26:45 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e7ef96105sm880960a12.19.2025.10.24.22.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 22:26:44 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
Cc: Dell.Client.Kernel@dell.com,
	brauner@kernel.org,
	dm-devel@lists.linux.dev,
	ebiggers@kernel.org,
	gmazyland@gmail.com,
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
	torvalds@linux-foundation.org
Subject: Re: dm bug: hibernate to swap located on dm-integrity doesn't work (how to get data redundancy for swap?)
Date: Sat, 25 Oct 2025 08:26:37 +0300
Message-ID: <20251025052637.422902-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251024163142.376903-1-safinaskar@gmail.com>
References: <20251024163142.376903-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Askar Safin <safinaskar@gmail.com>:
> Here is output of this script on master:
> https://zerobin.net/?68ef6601ab203a11#7zBZ44AaVKmvRq161MJaOXIXY/5Hiv+hRUxWoqyZ7uE=
[...]
> Also, you will find backtrace in logs above. Disregard it. I think this
> is just some master bug, which is unrelated to our dm-integrity bug.

That WARNING in logs is unrelated bug, which happens always when I hibernate.
I reported it here: https://lore.kernel.org/regressions/20251025050812.421905-1-safinaskar@gmail.com/

-- 
Askar Safin
