Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0AD42AA1
	for <linux-lvm@lists.linux.dev>; Tue, 17 Dec 2024 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424464; cv=none; b=Dtz06kvXUG9pqn+xfTNGTbhqH31GPzoKkhshhVMH5lVPTv19VtoQNjbPkjR8RdHmNVX9kY6dZxl2OfGj6qFZLwerq5Ox667huB3i4N+P5CfbfP1Yl3bfwqAMlqaDGQnAY9Jnc5mssGecfZ0QXLEAdHHR2l2jo6yLYjhj7r9NQ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424464; c=relaxed/simple;
	bh=Va0omBLZ7DTYr0/RKrUqPozWmGiHPVPv3fWuEwO84EQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VLE8MzHmftGyvd//Z5PFFE4FTTWwBbW12vlYm1v26/ZQ4w0gr+z8iKcxwghJ+Swa8FlywP/BRrm/mEEzi/x7P2qqYe5BcdR9AFhhkvVc7s4oETNbK2MMs2XQdhIMj90IYbu7XKZ8TP7u67AZm5zgRcfa+bouN55U4rTutkf7I5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LQa4bUgK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LQa4bUgK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862f11a13dso512907f8f.2
        for <linux-lvm@lists.linux.dev>; Tue, 17 Dec 2024 00:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734424460; x=1735029260; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va0omBLZ7DTYr0/RKrUqPozWmGiHPVPv3fWuEwO84EQ=;
        b=LQa4bUgKRtQFkr0GnezKqjy2op8ETm2HudauVS1cA2v9r67Bzw7Ar8jcinptWl2BGA
         x68oLxN33tBNf1OweEvTWjGKXJycPgM4QZEiGGif/AmXMNjw8a2i9VIB4hjDeBjj8Phr
         uB1CElMXdADJNM4PH9xbWKOw4R1U1dycpv6cgfnbrowRkOzgqj45UHWz6l8tdjXg3RDZ
         cPOTk+92p2ORQPqXfN2dhzApXwr/mn2j+gbOSnp1BYLx4kY9ixql18HCq9399icJIV8w
         1qquG9yaZT87mavGr/0NqHvGSTToZiQiHINCVSOai7a7+3RR5s6SYT6KrcAJOC6cE1kZ
         5A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424460; x=1735029260;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Va0omBLZ7DTYr0/RKrUqPozWmGiHPVPv3fWuEwO84EQ=;
        b=m6GqzbSQvJmtSll2LX/CSzIITZy0n1Yp5Q9MncmKEv0dmJ79Fk8d0Nk66r4qWr0xeV
         0JiNXupMW7XRE79bxU+Nasx8fyImlboXC8F4OmF6rLaSXLl4wXC40mfGS1WojEFf3QjC
         S/qttvpPfoB7g7ZI0uO1NtMTHc1p3alYMpljDhyyCDAwEWV1TFAvx6Zbduz3907P0Z5n
         FHC331aHOypuiHE/FAzdfPw7Mtl183qgTINEUAw22MYmFN5nypcxFZI942/Gw1DSbCzr
         ZWvEZ+e90FFGgGViZN7WBiNDFObPCoaVyW4Ie37RZMyVmT60+KC9zOSFDTHZwvjmAe7h
         qjlA==
X-Gm-Message-State: AOJu0YzjJ3n5rtgXPIHj6G7Auwi4NGO0dYgYgCucSOCMN42Q7v+Cy7Js
	Rq15Ge4yB4cPDG/iwWO6PsSdXy7/QHx+ie5VOd86D5+4Yg8hkq57y2KHIagtq9lCUxW03Pojbh7
	TcEMnVg==
X-Gm-Gg: ASbGncsR/b9e8bjgqhYuAGqxl+wjduzVoqTwSxNl8X0/OpGUVB5FZIR4OikCOZEh5Us
	BjeElZBBam7Xy9X7h539q1ZWQvAFNP1lZG7vkGhgxw+cpw6XnSjpslf6QnSsr5eycf5MX8cxrfe
	1S2aM407JnFf3Y4lntT05qk7SAOWn4QKDxBBsmfDDph0JJ03JypaiHykkGujfMZt4NIchWmuvI0
	uxa9b5ZyHs5flJ1/LIolXk2tlDFA0P+8xkvKeRt1Aci8g1loVDa6KpBfK5Q
X-Google-Smtp-Source: AGHT+IGYdQgGRFMuaqZL0RusD5Fr6KWcLzIKou1HuSEF1pIabqRFRm/pYSJQ5ooUvC5tDRAVFFeExQ==
X-Received: by 2002:a5d:47c5:0:b0:385:f909:eb33 with SMTP id ffacd0b85a97d-3888e0ac3demr5366049f8f.10.1734424460286;
        Tue, 17 Dec 2024 00:34:20 -0800 (PST)
Received: from [10.202.32.28] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5499dsm52925355ad.126.2024.12.17.00.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 00:34:19 -0800 (PST)
Message-ID: <826b5136-7ee1-4664-98d6-a3441883f53e@suse.com>
Date: Tue, 17 Dec 2024 16:34:17 +0800
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Cc: mchang@suse.com, Glass Su <glass.su@suse.com>
From: Heming Zhao <heming.zhao@suse.com>
Subject: is it possible to add a new filter to detect unusable partition types
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi LVM2 maintainers,

One of SUSE's customers encountered an issue with LVM2. The user created several partitions, one of which was marked as "BIOS boot" (4) instead of "LINUX LVM" (8E). Subsequently, the user ran pvcreate/vgcreate/lvcreate on this partition. During a system update, grub2-install installed GRUB2 in the "BIOS boot" partition, resulting in LVM2 metadata corruption.

The root cause of this issue is that grub2-install targets the "BIOS boot" partition when this lvm2 device is specified for installation. If the user had initially marked the partition as "LINUX LVM", grub2-install would not have chosen this partition.

On the other hand, it would be beneficial if LVM2 could implement a new filter or a filter function to detect and exclude the "BIOS boot" partition from being considered a valid target for LVM2 device creation. This could involve issuing a warning or error message to alert the user of the potential conflict. This may also help user to notice the issue more easily.

Best regards,
Heming
