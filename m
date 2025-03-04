Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1101FBC9C
	for <linux-lvm@lists.linux.dev>; Tue,  4 Mar 2025 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076996; cv=none; b=PFEEUWrNWxFG+v5FVt2FSBGu5IS43BTqjIHATli8zFsyEScV7c9rPiLOli8/VbqTw6R+lH7Kj61j5wtgxYC2gVwbTK1GflTIzK8xFBvuNHEDSLSHQuHDXJu7wQsTltdujEz3XWTx/3eh/AG9+mb/pJC4P6bXNW6b5K82hZsbgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076996; c=relaxed/simple;
	bh=A+fGiTxwHhMDDqNjTw2nH/j+EDbr92hengyERZKyDak=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=pDXHphIMgqixwpsKLeeY6wi/Udo/ON5a7xFp4pTcCMDt+1viH9ON2V3dKFMxcqmwgrRrYNyTbG5nKl+QWiT1AokyXXox0tFnvVwYyJ5baQLxOY3q7pljK/JIeecB/0zvp9kyF/MOQHe4MMUqpSSKTiHw4DaIqfrktS9dQ2vtV04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULUIrljB; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULUIrljB"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab78e6edb99so740244966b.2
        for <linux-lvm@lists.linux.dev>; Tue, 04 Mar 2025 00:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741076991; x=1741681791; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Feh+mO+c2S09uGKaTFYeN8XfiPiVVWYutP2dbjxR4vE=;
        b=ULUIrljBiDGwkO2e2BuPv9eKUbDWHAjS2k7xkYzL+JaKlyzWxzQ2uMF8h4cnlewZW7
         5W+ECAN3gZWEEZiNfB0zg7qBVjECv08ZI6LleUd6s1MXUtsUK1QtrBafLruk1nEkWyPd
         zErnXPqifD/arG3hS3L0mP/1ub3lqjvi11eD5DvAD/46xWmQOhXw7kwjUntNkdHGqgJQ
         JHrVzthN3eDA8Qjz4DIJhtNqF2ClBXCP8Dtw2dOkIk65GDXJqZJapEhgIQr54JGFukQ7
         sXaULjqtMvyYtC6mCKQCH3dSLDUx0svR2+pg3c4JZ7RC+fxDXb4NdHh9FLzNUbx+8qMN
         yAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741076991; x=1741681791;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Feh+mO+c2S09uGKaTFYeN8XfiPiVVWYutP2dbjxR4vE=;
        b=Fqkg2+3okH4FBejEwmBcxFRmLe/KlnRDg2qEsLoAMEtVOklz00XjTnjtIcibotWCUn
         8OJLTuUB+vcp+lLMi1CKYlKr7Zq2iHM+cceh9oB6Xp4d6pmtD7dyMzsdzHDKr1ltqfrT
         mIT8Kau+N3MaAwxoHOxluKnsp9ueD0uXXYZY9Igc+vBfT2hAOYZZcde9tcYW24AwsZJw
         NoeZdlg5sizGaMmHuXacp5t+ccm18F44NDJixZ2R/fF8MfWfHt4fwMc7jLJUB+SczcpX
         LEL0sCan3h8wOebsKXkNwwJI8FDgZ8vX54kKJmE7Kxff+3Ym0Uk/+Juc0Sbt6Fv8V5eR
         ogzw==
X-Gm-Message-State: AOJu0YwbhYUa3rwLXoAZuqq7xokjuyyuHJ6Gwo+r8C0KFXUvTYXCjE96
	6W5Fiy90M8GxzaFI23UZzr4kaKRRCp+6gyL2ZgQ7LSXH6Ad8uth0hOsbJUus
X-Gm-Gg: ASbGncuYGpfQQ6/XsYuB9lvQtwhJXBfwe0IEQG8YoEYLg92hXFAPOn8N9Y31tuC0x4Y
	5q097yYisx6/0iVc48W7U9/yu5R0cBTJA3j+YcCRedD6XBL6/QPbK7Qk1YEK42EaXUqV9aywf/8
	7O/n7eElWUUfVv31M6OKFSULjnWz9tMQ3UjZj19TOJRyURr8QJzb5J/dFdE/1KFArRzinKZM+dr
	xRgdV3QUX4yrX4byt6HqYC+hmFXXrY3zNuQvxXovAnAz3AsP4zN8t7EHQoYKr1+mNsc3rIbEWqj
	wfuHof1A3WPmaRF5RKvN/wKPhspM3C4W8iLpTPMuSaTOcmAoihOY
X-Google-Smtp-Source: AGHT+IGb4Pr2iDVzjshI56IoRy7DVXwxaD/bJMsXkfMUWm/dnm58V7+EjASVPEY/SyyKGmzAnheSrA==
X-Received: by 2002:a17:907:98b:b0:abb:bcef:837c with SMTP id a640c23a62f3a-abf26802e93mr1907416066b.56.1741076991406;
        Tue, 04 Mar 2025 00:29:51 -0800 (PST)
Received: from [192.168.1.212] ([188.129.249.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1def4cf4bsm208300666b.169.2025.03.04.00.29.50
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 00:29:51 -0800 (PST)
Message-ID: <825942ec-5b4f-48aa-bac2-02198d2a2733@gmail.com>
Date: Tue, 4 Mar 2025 12:29:49 +0400
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-lvm@lists.linux.dev
Content-Language: en-US
From: DeCay <decayhonor@gmail.com>
Subject: LVM2 headers
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

I came across a rust library (https://crates.io/crates/lvm-sys) which 
depends on lvm2app.h. This header doesn't exist anymore, as far as I was 
able to find.

What's the right way to interact with LVM2 programmatically at the moment ?

