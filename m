Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938E137F
	for <linux-lvm@lists.linux.dev>; Fri, 29 Dec 2023 00:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiPLwcsx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3333b46f26aso6105712f8f.1
        for <linux-lvm@lists.linux.dev>; Thu, 28 Dec 2023 16:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703810882; x=1704415682; darn=lists.linux.dev;
        h=content-transfer-encoding:disposition-notification-to:subject
         :autocrypt:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifpf3DPMvRe+MXnSodq6g2yasqtFR6eqwy+ELKAoIyY=;
        b=SiPLwcsxHK3vyLWJStW2F4HgqViCPE7QXjmObH05CBlDonmg75If6GnxeWh2tcn/iw
         ulykFqdshaoLc/A425Lb+8rHabe6cM7BHWVimKoKTZ0HHwbHi+GN0mLYUWSlV5gOoTDe
         BS2BoPeCfhgALQMosqqRr286vTr5ey1XLgxvDb/lQcioHKl6XP2YN9T6sE8UNgIDpVVe
         S/+W1Aj6FvpXEgMZ9ETFYBvZr69mjA7QlYceZF6GZv2abx+n3vUuRQlxDmmHlv0qhfBx
         3vvIhiKR7ori6hxB8gUyzAoYN9kKaZegDljYDFqrkyilE3EcwR70wQ0ZGEGJoih7Qok2
         b1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703810882; x=1704415682;
        h=content-transfer-encoding:disposition-notification-to:subject
         :autocrypt:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifpf3DPMvRe+MXnSodq6g2yasqtFR6eqwy+ELKAoIyY=;
        b=MB5Cyqq4mE+2udWL4iNsxtEoeQXvq8d1Y95c2se50Cv0He7Fl5YN8IKI+YowDbQVG3
         WFoAj2z3nc7fy4rdzxXNSg+5x6KABPAqi49QRavrTtK6IihRUPCvUdKeaqUq908wPgTB
         dMsgQQ/y4zASaZtc5SuIAFcwj8nNiNd4zOxY9DG3DiSxdSNs0wiP2ylDnww1wyq9Nicu
         cikQlHVBWNfR/avGPywe2H6xckcSI4l14l8PLXQUMP8DCBTCR9mcvsc027UwXy7mKQZE
         eZ614w0oK8iSuBK4QbCvIwv4J5cuFSXdm8XucQRcvPtRkKCXMEBqYqDdMs0dJQRnHNAD
         wrag==
X-Gm-Message-State: AOJu0YxKzTIuCgr30yM4qnjTpnYP4eUhST40zQJlvv5ZRDzuBgqXY6YD
	jyz1qtJloVEyRPrrpBdWoHulx2I9wq8=
X-Google-Smtp-Source: AGHT+IHNGa3hP94if5Pv0LtdRvumOAAdmXlLuKbt1oNfz/eKwF4WkdVIO1tmHMBDJY6xU7pWKGPyhg==
X-Received: by 2002:a5d:52c5:0:b0:336:c9ab:593a with SMTP id r5-20020a5d52c5000000b00336c9ab593amr2628962wrv.141.1703810882503;
        Thu, 28 Dec 2023 16:48:02 -0800 (PST)
Received: from localhost (user-5-173-65-57.play-internet.pl. [5.173.65.57])
        by smtp.gmail.com with ESMTPSA id ev12-20020a056402540c00b005537b9f7ce7sm10273767edb.68.2023.12.28.16.48.01
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Dec 2023 16:48:01 -0800 (PST)
Message-ID: <5ccac2f3-f554-47fe-bec9-d74b08e85e5e@gmail.com>
Date: Fri, 29 Dec 2023 01:48:00 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-lvm@lists.linux.dev
From: Mikhail Morfikov <mmorfikov@gmail.com>
Autocrypt: addr=mmorfikov@gmail.com; keydata=
 xjMEXRaE+hYJKwYBBAHaRw8BAQdADVtvGNnC7y4y14i2IuxupgValXBb5YBbzeymUVfQEQvN
 L01pa2hhaWwgTW9yZmlrb3YgKE1vcmZpaykgPG1tb3JmaWtvdkBnbWFpbC5jb20+wpYEExYK
 AD4CGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUC
 Y2+BTgUJChtjVAAKCRAy2ctjR5bMocamAP9IDZfiCI48rykaKOsSWTn5WLKb+Fok6YK+s8xN
 v9sBJAEA/y9e22B2q9vkY5o37G/hpbz7UhvrXA1JxKpiSpjzRgLOOARdFoT6EgorBgEEAZdV
 AQUBAQdA1vPaWR/g6H2DzFqi6zjEBCqEv6bOg+N6lahCEuhLc24DAQgHwn4EGBYKACYCGwwW
 IQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCY2+BXwUJChtjZQAKCRAy2ctjR5bMobgPAP9pJvfy
 NkYiTStwBu26LeHT35XZJaYAOmcYWCwItr40iQEA5LlzxZn4r/d70X6pCQuH1FWmuxtMIxEb
 ROnRLyiuVgQ=
Subject: Should issue_discards be enabled when e2scrub is used on an SSD?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I've got the following setup: LUKSv2+LVM on an SSD drive, and I have trim/discad enabled
for encrypted container. I also use e2scrub for Online ext4 Metadata Check which uses a 4
GiB LVM snapshot. I currently have 10 logical volumes, which are periodically (once a week)
scanned for errors. I've got a question concerning the *issue_discards* option that can be
specified in the /etc/lvm/lvm.conf file. What actually happens when this option is enabled
and the LVM snapshot is removed after fsck finishes its job? Will the whole 4 GiB be erased
on the flash? Is it safe to enable this option in such case, or is it better to leave it
disabled?
