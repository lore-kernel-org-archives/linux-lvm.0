Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0311C861D
	for <linux-lvm@lists.linux.dev>; Mon, 16 Jun 2025 07:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057739; cv=none; b=V7zQRx2vlVyEtRw4GGMjv5OuaMtbMYIB82JcfOE52Sma/wl3uK88x+kRn+CZ57Vden46OV5lHNUoGjufyxzUBXLwxLDtkfch/v0ilcRv+qPQDRjRMv7HQ62dHcipmpowu2n4DdQL+bEGX28Ms3LhzyXOBF28pJd/fj97C+K1pI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057739; c=relaxed/simple;
	bh=+NSoLFzlcKB0VJZcS+cVEPMLmQpiRVOtUGXQGF4INak=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WAAEE0UjfhMyIZBLicgUViqx2P7u/j1XvL5g2d6aG3sgUEnA47WURcJ+reruKaxGp66RrJHKt6jnNcKMgBkg8tbR1ZMPZcdxuOuGD/ypUuq0Zk1BWO11BIWP+C42eOykKgvCgHHdROc5OBA4x+9MA08GdEFm/AEWdSEV0asKSf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0dduquL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0dduquL"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade33027bcfso658472766b.1
        for <linux-lvm@lists.linux.dev>; Mon, 16 Jun 2025 00:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750057736; x=1750662536; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JNt0wDukKM5qJ6YBBQxtmKucFQ9xZR/moVLEu75w2k=;
        b=B0dduquLiuIBM4t8KaYFNUxBNBsGWd6kvbOFtWPmk+uZLWZG82zLRtAfBy0FNATy6i
         WqftH9SeNuJ9YjIUNpJNHQ3jgD1apuz3hGH4AmO+HBRQUWqHnROUGldIaz13tmhdXB1i
         fp5rdMNLZ8tsX8x9YGDQbxwRFLqFvk85oBRksJP9xjN3EiqGFu+VXgo75LmKWmouxhjZ
         dfVlooNRUwrx8fx4YTX5OA2r5b61IMRFawsyHtVfknLGV1c8NUajpnncUWym6jKw2t/w
         6AofPYWv3SI10Nf9OAzB+IyD/K9TUXHNxTtdqRu+mfleTc9NPO08a1W9qT8L9R0rjVc+
         XAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057736; x=1750662536;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3JNt0wDukKM5qJ6YBBQxtmKucFQ9xZR/moVLEu75w2k=;
        b=U2W85nJdExR7UYcZndU5X8XGHT9oPZaezsER6RG3oGS6UY7F0iGAMa+CANBY9OW4+b
         hQoHQCo5wTJ4V8gKooJ559uLe6yy+hQf3mNCmgQyKMeAtrcCVWCHwvC1qrssx96JSdK4
         K8D1Frl/SHK+qnVaJhHMXposFh8RFX22rCcSi6mz3T2XNYykFhbCuqu9SNNAcUvN/gac
         0lEgZahCmn74ZPvlmDk+wHZ6MYQcN6yGLtep93gYHUAuCV5TsJeEvP2dhQhTXfXgOknR
         qZz6Yu1RFabWjSTR4RRjubcT27nyZ0rNEV3NIBw4VqKV/0EkcF76LYMg1DkypgFZJ9Xv
         EJTQ==
X-Gm-Message-State: AOJu0Yz4y4Y3xzPaN0TYuQAWMp6w0q2xRGZ2hec8xiftARrbKaxBwlIv
	uschsJ5pCnCNQQRDfTBk76TWfm/HvN8GaPZCXGLOO8yq0UGbZ7qhwq/fsI+pVrij
X-Gm-Gg: ASbGncv4TsLgGO2wUu2MmFdx42e/TrbVI40Nlpk25GwrmnOtUziiTwB7RWzL1BilOYN
	LL5JOyQNuRJaSJLp065TXncmFd+Ja+FykormIWN8sK3XWLJ9oRTkq9yF09mu8PkvVw5plJfL4KX
	tkdt8B5yNO17g6GVuPlGuOqdCa6nUmTepRUF/q/ua0Sqj/rQ9poqJu7yqJ5/aMSOgQ+J1l7Ug6v
	+3RXMsMh3Tf97TdLezv2cACnd9N3XYoKsp9iE7WVVwTP+PhjOGrhahMsjrV+Pv3GHZQvHuQOS0z
	ExZmeYr2MITeHpubsptGf8egYBwMW8+sQcLaMVZD7sXhmz68BauWu8WyATlAUgyGPDVgpA==
X-Google-Smtp-Source: AGHT+IHNemyqXbejc6XZcFIk9ZRChaPzLVDnIh6Wfymg1A+MH1w7elKe9Hb/U6EdAzuS3+q+EVYDtQ==
X-Received: by 2002:a17:907:9491:b0:ade:348f:384b with SMTP id a640c23a62f3a-adfad32be97mr749036766b.20.1750057736107;
        Mon, 16 Jun 2025 00:08:56 -0700 (PDT)
Received: from [192.168.0.107] ([176.221.170.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8928c15sm600188266b.112.2025.06.16.00.08.55
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 00:08:55 -0700 (PDT)
Message-ID: <9322a409-f101-4c81-bade-7ea4700c8379@gmail.com>
Date: Mon, 16 Jun 2025 11:08:54 +0400
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-lvm@lists.linux.dev
From: DeCay <decayhonor@gmail.com>
Subject: [packaging] Who packages LVM2 for Manjaro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!

     I have a question regarding LVM package for Manjaro Linux. Are you 
involved in packaging ?

     lvmdbusd is missing on my system and I want to understand why. I 
started from the Manjaro forum: 
https://forum.manjaro.org/t/no-lvmdbusd-binary-in-lvm2-package/175096

     I was told to look at the package's URL, which is 
https://sourceware.org/lvm2/. I think that it's just a project's site 
and it's not related to the packaging process in any way.

     The packager (Christian Hesse <eworm@archlinux.org>) doesn't 
response either.


