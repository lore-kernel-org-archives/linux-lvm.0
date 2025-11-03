Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC83148B1
	for <linux-lvm@lists.linux.dev>; Mon,  3 Nov 2025 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762185234; cv=none; b=ao3hjvYzubiGHc6tzhyLNpKr2AzBSlP7KtVm7kqvXdoPEbd6DvdU+U1zodNVSadcD5NGKNRnWd7QzuzF4otN9QTYz+1vahSl2voODH+BS1w0qRweADzGfVEpzeY+T4RtlpgB8/htDGa1tWbTcb9ILb1nUxAzNQ3G8+IrwRmG6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762185234; c=relaxed/simple;
	bh=qrT9BCtX5Q+ZrBSV86ofie64KLKL7GM3W7AojJFifCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtK8V6AXYQrkMfR+/0ktEQFUsuIkMFdQN4uIsQFFaxuC0aav6prGet85sDmXOm8VIPvKFxYnEsBxjmzDTBTi47m7MuBNT0r3WrE2Q1L9yvQ5MVYH5P9q3rVzyHZaR3x4Tk24HCdAN0jq58iVwwR7Q6tv7ilBDQDr3SVhZV6Vleg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd4PVMLb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd4PVMLb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-474975af41dso34418905e9.2
        for <linux-lvm@lists.linux.dev>; Mon, 03 Nov 2025 07:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762185231; x=1762790031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLey69Q1yRBIRmkA9w/tF6nJaEmvXdViphT1MNeupw4=;
        b=kd4PVMLbdRQpONULwEuR0i8NtQkxC8OJdP29AMh+QGV01j7kmPyLFDAUnlU/idDbmc
         Cqvp5qKnXaFeFsHlz8mUZc0PvvoUqenkob5g4Qw1CJRI8IJhrpPkjb3y2kWCZi8bR+wU
         /Wss9k6b5a7mr+XpVHyaVc5Tfk79g0QBL2/qm/SvEt3Hz9mIQJrc4S483uDIy+R38sbZ
         SJ8lKC+hkL5gX8Kmp8FIyArd/n8YHaEt5iJpPiRaZBpp5XmyYWTXk1zhxQ42sjhdHyld
         x608EVaOWFNK1+BFqoGEl/5z7Nl/STIy2JGyMYgNwq5CtjDOqQiQ92ekfKaAgrmia+n1
         3IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762185231; x=1762790031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLey69Q1yRBIRmkA9w/tF6nJaEmvXdViphT1MNeupw4=;
        b=wctArtuEc2DZyTiAlq5bx9tvzFLqEglXy+tSEMHJZfgsjKZ69iCwk1BVWF/L7fzSK+
         +fzcnOzqX+w68/U3Hv4Bjv6DWgyxRzIl48dNryhwoCe2qhmP520zCPYwRENUvUzLBKvH
         ch3usqquYuARJOwsDXgvVhWEpka8rWs/KvcuOrtodXmGCl4tjngL6b34HRzAm6R1Pbek
         fAgiWeGtYrar/OXRF5mX94oD1nG9JXuQ+patsmNIdw1w/NR60psPhJHGNO6GgyM8qweR
         Fxeqa+YfbBMPi57sfZsjZi35mPoXVVM/gWQuEt7D6qgG+ZwFACk1QbHiL9ZPXUoFaQvw
         C/KA==
X-Forwarded-Encrypted: i=1; AJvYcCWHqg28hxLLFXQ8ptAFvMA+qECOnFKDcJ9OPqdJ6fd/lAFKxIS+yL91jOInDWjAe9Njrpi7IOfKkxg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh7mxJbUqwuSgn+VhpSzIwflNLUrEEOZgitx/FuSnuCxcM7eMr
	rfUZNJGQ6cYdHx3nucpfBxPRxOedGZzbyvh2i6JpC8tv2XY9lW8S+UsT
X-Gm-Gg: ASbGncv+JaG/VeOSCKNFDr5ZPahj+Igf9T1OuN1uIPkHu21YNY5dkxMnIRc4QBG0xs1
	EteVycKzRFbgicsfcYWx+wyfHRHk2hJjuYSlcmjg6amfbNSr2cXdFblqaLkVrP//NJ3gSNCmC26
	YHeI057on/wRGmSeJrZ+Gpnb50Gdt7ProcsXhgyLU67dFU9GRAcEO6XbfvbthWPd9FCUWq8T4uw
	8d2xLIEd7aXhLEz8YXCgsVRIq56KFQO9Fu2TcYr81wimmS1D78OnOgCuqYrzvFGa0vGYxdzqfDi
	mibx/mhsfPnYFhjHIZVPAEDoyE+V7JmhWeEG9g51mpYnnuQOawQCvrfRrr6MQIUjB6cvZtq4KNy
	536kdJysgRIubSWPlFAAZd3huyuipw73JUl06Fw0c4/TXWlWv6MUWM9weFZMK49RC7ZI5R4JX
X-Google-Smtp-Source: AGHT+IGy41LT8aj0/Xvj0W53yZvKvDn5c9ABQJxOklSZONmqbPHs8HNDAqrjQAZba3bO5xPU/Rodqg==
X-Received: by 2002:a05:600c:3511:b0:470:bcc4:b07c with SMTP id 5b1f17b1804b1-477308a8f36mr118541675e9.37.1762185230454;
        Mon, 03 Nov 2025 07:53:50 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c48de65sm161908635e9.1.2025.11.03.07.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:53:50 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: mpatocka@redhat.com
Cc: Dell.Client.Kernel@dell.com,
	agk@redhat.com,
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
	milan@mazyland.cz,
	msnitzer@redhat.com,
	mzxreary@0pointer.de,
	nphamcs@gmail.com,
	pavel@ucw.cz,
	rafael@kernel.org,
	ryncsn@gmail.com,
	safinaskar@gmail.com,
	torvalds@linux-foundation.org
Subject: Re: [PATCH 1/2] pm-hibernate: flush disk cache when suspending
Date: Mon,  3 Nov 2025 18:53:45 +0300
Message-ID: <20251103155345.1153213-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <c44942f2-cf4d-04c2-908f-d16e2e60aae2@redhat.com>
References: <c44942f2-cf4d-04c2-908f-d16e2e60aae2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mikulas Patocka <mpatocka@redhat.com>:
> [PATCH 1/2] pm-hibernate: flush disk cache when suspending
> 
> There was reported failure that suspend doesn't work with dm-integrity.
> The reason for the failure is that the suspend code doesn't issue the
> FLUSH bio - the data still sits in the dm-integrity cache and they are
> lost when poweroff happens.

Thank you! I hope I will test this within 2 weeks.

-- 
Askar Safin
