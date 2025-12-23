Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE332FFDEC
	for <linux-lvm@lists.linux.dev>; Tue, 23 Dec 2025 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766471647; cv=none; b=ufj93Wt7tr2Gw3zeYOM4komxofoQu3BDHKTwGkJNMXE6jLSAcZ5dewY9XOHqnGW7CLxN9Mh7oQ1fpJfztct7nX8qBMc6lD3T/z4SDwJghlZmkiYHYCKKrnA2a3TLh8Ruo8VzNUvMBG/S063GDifR+8OXBtX4IF5hp+/FedHDZQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766471647; c=relaxed/simple;
	bh=zQMCxWwv+vy2hbOmutXkA1vn5ZNuVRvD6yhOueNtNZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nflj1T4hzDon7qgr7ulnuLU+G+GgxXMJJuQA2mZQamkjQB/kN5Z2lLEugpbo2HZpxli+Bowhw2YJDvc/O2lWsXILkjQae4w7Xmmy/luSyjQ4B1BSSfbMpz0Fq5Z85kjdWdjDH0bn0Bstr5mNSjjN5dyO7TCwIZDXwpPuYpEV4jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfnyrO0H; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfnyrO0H"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37bac34346dso34521501fa.2
        for <linux-lvm@lists.linux.dev>; Mon, 22 Dec 2025 22:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766471644; x=1767076444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=048jzD37H8lsx/zZlGI/PEx4g5lnBiNM8RokzD3mdsY=;
        b=dfnyrO0H1Nq7ZRPIt2C/vGpxIe4Jz/qAkoW35IgXAd7d1d5PEbRjbqsbDZT4/Krv9F
         kvS6NSixruTPv46NDsUL5Q6XGpFZrNcLYiTXMIjnZoL4FznwLJE1ejAekwHQrFjAdMZ/
         rHzvIC0QUF7Qw9iQSe/8brdCNwgyVXVcZG0TkkYnRDpFAlvWXpGduJL7KrPvt5Ntmian
         I+t3nFf40mHK2RFRUkpjz/uoTztQnQvUIzUgUd0jv29E7NY8mGpZluiCm3i6FCzJFB11
         aQ28h+wNKhDZCLDuXsQxzTrEuFj5RQbgUWCUYgl0sn5sxHVTkKCHxQDOvwmYJZyGrsfH
         dw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766471644; x=1767076444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=048jzD37H8lsx/zZlGI/PEx4g5lnBiNM8RokzD3mdsY=;
        b=OuDT/xH26ThFZItO4yzp5mVVGsMOMj8MzkOk8Auztev39wp9jEU3QCy9Wa041xEDD/
         h3zvtke9Ee/7bGOWsmnY1QWg3tXlRjU6ZLNw3y4ipe4vyjzPtpW5xkz00bU2XotSW2Is
         gdrlnrDIutWLgJ8ufKokkFEssaMnwngey19X/LI6aW7AKjgKFzPtZmWd3kapGU8yRTiL
         oUfQAqaeffKCUDxboET6HFs0PZT1TCk5XjH0ys2MXVGg9xgnQ8XpRJbwSkwU7ieR1wmE
         AOo5tI3WSYHzO58VlEzTYN3guDCxY0FLnAp8kUfSdJHcxdXeGvb582AwGFn4rsiEWazV
         CEGA==
X-Forwarded-Encrypted: i=1; AJvYcCUs6AYzNvwyszjQtzuuXeUF5qceQIn0W+NKJYsvQrRMKnlp+f5olkamgWYyMR2/o8gOs45Dvv24uQU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiGO/8Pz/jm5C9tmDuB5psEsZd3RynogNOgJMhEkuFkV9Yfbo8
	PAkQc0O8WBde+0MmpU1XphxavTg+sA21/CmEr4LA6bJccmQLbKWNfan4
X-Gm-Gg: AY/fxX7D4+KW0q4yao31eRsxBl+Kw3NV/1YCULaA6OicB4xPYusms0eDZUuKrK+iOjp
	asjr8jlfVXCFCHjVcTot4e9nOwtdr04ylGRLHB864h790kU5SGuI7J3y6aSM5Z6290p3hJiDJiv
	8upiFE79jDb2KzFn/O1mx2IC/tUmh7ggAZYHxDYNzp+juaXTCPz69IQoolE4VtOT17KtrMS2ZUw
	rGVsxhb+L1t83hCqzbGV9bOq6bqVJ8bY6JQaeI+HhASycEHK46P3jKYSN/Nt0JEzVXeWgy0Ywif
	yypY1fzIT+NjbVpUMwVwMMULRHe6WGapS8qyrgGpvxT1whWVbm+GPWkzsDQTYVbRvo18Kxl5mPO
	6zlUnur7ivhVBSssnFl8sDX4wNUITOIxXPhEa2pvAvkwhCLWKpInD4pOEmg0h4G/I8vAA/DWsMV
	NbexMeSFxp2oaxk+14Xug=
X-Google-Smtp-Source: AGHT+IFaFE0nlDnowk+Ou3U+M9eX56ZCvZ4aEX/mIAF0sQ5oS0z9Fh1vnyWDY8DQIpJC2t19J66zfQ==
X-Received: by 2002:a05:651c:1506:b0:378:e055:3150 with SMTP id 38308e7fff4ca-38121566b66mr43783861fa.5.1766471643890;
        Mon, 22 Dec 2025 22:34:03 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-381224de6eesm33742031fa.6.2025.12.22.22.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 22:34:03 -0800 (PST)
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
	rafael@kernel.org,
	safinaskar@gmail.com
Subject: Re: [RFC PATCH 2/2] swsusp: make it possible to hibernate to device mapper devices
Date: Tue, 23 Dec 2025 09:33:55 +0300
Message-ID: <20251223063355.2740782-1-safinaskar@gmail.com>
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

Okay, I just read some more code and docs.

dm-integrity fortunately uses bufio for checksums only.

And bufio allocates memory without __GFP_IO (thus allocation should not
lead to recursion). And bufio claims that "dm-bufio is resistant to allocation failures":
https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/md/dm-bufio.c#L1603 .

This still seems to be fragile.

So I will change mode to 'D' and hope for the best. :)

-- 
Askar Safin
