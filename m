Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF0190468
	for <linux-lvm@lists.linux.dev>; Mon, 18 Nov 2024 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923601; cv=none; b=bc3q0Jb0vFRhVt787Tg8wlXCHc7Cgx5SrgYBb7Ao+tQ9+hKt93hf913Bvtr/aAndDBU/hNvN2WPg9H84kqf8BPZRAM66N5RZHZ5ZyNiWTz8+/cfUgMWkV791njIR8Bo/JNTwxRSZH5M/L7v32y5MGw/1noQjkwQ4We8Q70baM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923601; c=relaxed/simple;
	bh=1KaNkA40gUV5VIEKEYrnGSNMVUAuP5X4OC98t/qpKJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PEDOOwYHI9qlZtiguippkjAvBXIHJ/+vXfZvsz0qOChYgPZM5m2XM1sQ3TrgDpOxTf7VLZW6MQCttz/XdP67vpbxEmOLhbFQDd87Rb0vVbRZOMG0XIcD5GjAmXicMYmYth7iBVT3/CkLTcJqzbkpFOyVk7LexNW974LCXUnkRQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU7wLAUG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU7wLAUG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3824aef833bso84091f8f.0
        for <linux-lvm@lists.linux.dev>; Mon, 18 Nov 2024 01:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731923596; x=1732528396; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U8KR+74s0T7AaGG3tiR/pZuBMbhncGpyCSkHKWoV4Uk=;
        b=JU7wLAUGu+pSER2dzk6MSz8m7+00PzQwOqvkXrTC7k24dSim6+zBb6FNoM82JMQwRf
         dYmpS8K8FwbPvvZ0d5ojMc6Qxjsw7KxRcVADwNPrpwrRGJnAJv0VPMyfPfkzGyHKbpSF
         xlLx8Nwzm2F1etWFl2w+HP8tIHQlvQKIu6M6DnpsbQR3jaHW8+ve3heV+JlFs05J3oCu
         l1kolaLmvr27KAZGqcrlFNghQez0hYqMSCDrnMzI/eCB6pfGLQY5RXQol+NNadbNIXTb
         sszSphnRVfMSxciCR+xlFb2tPnJ+xrt7Ar4YRrqGSxebu6xWGMRqqMd7wyd1TR8Zc3Vj
         aSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731923596; x=1732528396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8KR+74s0T7AaGG3tiR/pZuBMbhncGpyCSkHKWoV4Uk=;
        b=UiLJguDXSqsrJC/k3C67Z5nEVMLjy8auHHFq/jfXPJVsQocB3gR2UcF1mTFSf5ZVFf
         7QGqPwLXhn/4Ev4aJP4bBVN7jDLDyTpIU7zT8CsjcpqFl5Fhbt1ILu4jV9jJLyJY/5Y2
         wxr8QW1tzu2oQTnIGpGtHuOD2eJ64kOa5S31H2CY2AFE0wbC2CUcw+XJtSAXNVImhLtC
         1mq0U7WMdYXcsBaFXdSPATHSxW6IsBeCzPdGbBG6umZppZEUsE3BOdRtvRfIZDOWDlV5
         RT7X5MThBuuhdfrGshn9/vnfRQdAgvc6YQvBORZQOgzN5v+Ku7T22yyFv0fgj+I/5vxs
         /7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXgmb7uKwyaZdlXl9iWmSI+UdL843walu+wTxaVyrIktCLLYf4oJGN2q0zRrCJWTwmgHKobYW2clIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyYao8YIAFoUvmql4Nvz99+zDI1KOokH02UdQyfBslZxHedelq
	16/WbsQGGfAEHwvxUcDYWqUSq578gRESyvG86h84GZjCan8gOxb+OiqbUw==
X-Google-Smtp-Source: AGHT+IGSZ8aLdHpVnJZpi2FnVc6Ke1XE5MTBru74XhM5UbsfX/zpOJ3wFd54iapfoJDp5meieFMnPw==
X-Received: by 2002:a05:6000:400b:b0:382:450c:2607 with SMTP id ffacd0b85a97d-382450c29f3mr3078058f8f.4.1731923595900;
        Mon, 18 Nov 2024 01:53:15 -0800 (PST)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382417f33b8sm4382697f8f.45.2024.11.18.01.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 01:53:15 -0800 (PST)
Message-ID: <218e6c33-c5d3-473b-9f5b-3c5684563b30@gmail.com>
Date: Mon, 18 Nov 2024 10:53:14 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Import duplicate VG from a read-only device
To: Gionatan Danti <g.danti@assyoma.it>, linux-lvm@lists.linux.dev
References: <65d1cd8d1b9189ffcd7eb919c91c1b59@assyoma.it>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <65d1cd8d1b9189ffcd7eb919c91c1b59@assyoma.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 15. 11. 24 v 21:07 Gionatan Danti napsal(a):
> Hi list,
> is it possible to import a duplicate VG name from a read-only device?
> 
> I know about vgrename, but it needs to update metadata - which is not possible 
> for read-only device.
> 
> I tried to un-manage the host native read/write VG, deleting it from 
> system.devices, but lvchange -ay shown an error about not being able to create 
> the /dev/VG/LV symlink (and a "device busy" issue, probably related to the 
> already-existing symlink). I also tried to activate the specific LV via 
> lvchange -S lv_uuid, but it shown the same error as above.
> 
> In this specific case I put the device in r/w mode and solved the issue with a 
> plain vgrename. But what if I could not enable writes on the device? Is the 
> only solution to mount it on a machine without the same VG name (ie: on a live 
> USB), or can a VG/LV be enabled specifying a different path for the symlink?

Hi

You can always write appropriate  lvm.conf  filter or use  devicesfile  to 
list only those devices/PV you want to use and not cause 'duplicate VG' 
problem for command processing.

However there is no chance to activate duplicated VG/LV as clearly there 
cannot exist 2 DM devices with the same name/uuid - they must be unique!

So perhaps maybe you can 'rename' VG of the system you are running from - if 
you cannot change the metadata on you read-only device.

Here I'd probably suggest to simply avoid creating such problems upfront,
AKA - if all your systems are using the same VG name and then you want to 
'share/swap' such devices between your systems - you should always pick a 
unique VG name for each such system. That way avoids all the problems....

Regards

Zdenek


PS: I think ATM lvm2 is already complicated enough to creating some 'overlay' 
level of referencing  lvm2 names in the system through some 'abstract' 
mechanism to solve the issue that can be easily eliminated ahead makes not 
much sense to implement....

