Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B5DF46
	for <linux-lvm@lists.linux.dev>; Tue,  2 Jan 2024 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNHeWwAG"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-554909ac877so7248947a12.1
        for <linux-lvm@lists.linux.dev>; Tue, 02 Jan 2024 03:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704194010; x=1704798810; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :autocrypt:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcybi2N0JmL5chEWlEVgkr70TfEfKGdNOOWLjxlL0A0=;
        b=fNHeWwAGXrfLpDqgV29N9W9OyB6Ep8A30YRzovWGkOqaIAdKc+SblsC14cnmf12JpU
         in+RLRQpzXwZsiziW8KHDs0Y3f7lRjBmNzHOsFtB54s2hjfIVtLRCHUApswsKOWhCagS
         XDP3jvk+EdA+MGgG1TNtY+E0uK/WMGK+Yb+Cr13Do/ByrLYZNBwvGD6IlYuQKzw1EBYP
         U2Ug2pNbRAGZwdnq+/W60gqIeTZDGV6NA5HJfcZIhbYin8NkXaEix/Mqd5b85YixcOUj
         8KgEZEM7N9YkK62+DkiIc8t80nWFKS+hO5a+0Br9n5/armO7U8e1aumnTx8yRjakuFN6
         fCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704194010; x=1704798810;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :autocrypt:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zcybi2N0JmL5chEWlEVgkr70TfEfKGdNOOWLjxlL0A0=;
        b=YYnk2J9yMxCqd3dd29+Xjbn6w9aMG6T6ttdA5/E+lCea3o91Xkj3an/REyebD4FlxB
         BK7PfZIYeBEOeZ535xa5vm9dHCCHoa3BrWL6yjAZJDm8wdq0VI984WIoKMgzjSOKYomE
         6pBfgygMb8hYR6ezwA/Xm4F/imwmXtDvhPLCvNLJN6n5vtHaHTiqjtdY4pAz/DwPXWOp
         63u6wrGZE7NnZCXZqlOyNvi/6p8Nm8mOhvOvwI+xS1NsvuYCi1h7Ait/CLgG8mbd4Fst
         cHkeiVUIWJzCM2KqxdUx9e24ifHNTyMw6N+wrQPUqpwYtARH2XgXvTI/rzNyWGk2MI5N
         Skdw==
X-Gm-Message-State: AOJu0Yw8/98+qbGQQAS0O/09ef6qHpMAsrvt4PJkBjkn4bqY+RWa1gMc
	/5dNmkIfo5eJCuPwc1XJLghGcApLt38=
X-Google-Smtp-Source: AGHT+IE+PWDaSghOK2LmcGqqVmWHDHTJnJ9/xMbZDHmmNmFNrSQJpEXOTs1KnQ/WU8Qa4bqZJfpJ4Q==
X-Received: by 2002:a50:99da:0:b0:54c:4837:93fe with SMTP id n26-20020a5099da000000b0054c483793femr11700910edb.69.1704194010250;
        Tue, 02 Jan 2024 03:13:30 -0800 (PST)
Received: from localhost ([5.172.255.220])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm15735275edp.22.2024.01.02.03.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 03:13:29 -0800 (PST)
Message-ID: <fc9e7a1e-a566-4a5c-8a4a-9e26a5651b65@gmail.com>
Date: Tue, 2 Jan 2024 12:13:28 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should issue_discards be enabled when e2scrub is used on an SSD?
Content-Language: en-US, pl-PL
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
References: <5ccac2f3-f554-47fe-bec9-d74b08e85e5e@gmail.com>
 <a15677b8-70ef-49a5-98ac-3ccf839fdad7@gmail.com>
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
In-Reply-To: <a15677b8-70ef-49a5-98ac-3ccf839fdad7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2024 11.41, Zdenek Kabelac wrote:
> Dne 29. 12. 23 v 1:48 Mikhail Morfikov napsal(a):
>> I've got the following setup: LUKSv2+LVM on an SSD drive, and I
>> have trim/discad enabled for encrypted container. I also use
>> e2scrub for Online ext4 Metadata Check which uses a 4 GiB LVM
>> snapshot. I currently have 10 logical volumes, which are
>> periodically (once a week) scanned for errors. I've got a question
>> concerning the *issue_discards* option that can be specified in the
>> /etc/lvm/lvm.conf file. What actually happens when this option is
>> enabled and the LVM snapshot is removed after fsck finishes its
>> job? Will the whole 4 GiB be erased on the flash? Is it safe to
>> enable this option in such case, or is it better to leave it 
>> disabled?
> 
> Hello
> 
> issue_discards  is relevant only when you *REMOVE* LVs  - the free
> space in VG  is after such removal 'discarded' - which is only useful
> in case you i.e. pay for 'provisioned' space for your VG (or you have
> some very very very old ssd) - so this will make you VG space
> consumption smaller - but it will also make restoring of accidentally
> removed LVs impossible as the recovered LV will be simply just an
> empty disk space.
> 
> So for 100% you don't need to enabled it for e2scrub as discards are
> normally passed through to your LV device as you may easily check in
> your sysfs dir:
> 
> /sys/block/XXXX/queue/discard_max_bytes
> 
> Regards
> 
> Zdenek
> 

I understand, but the question concerns rather the amount of data written
to the SSD disk. So I have a 4 GiB LVM snapshot, which will be removed
after fsck. Will the whole 4 GiB be written to the disk when issue_discards
is set in the /etc/lvm/lvm.conf file?
