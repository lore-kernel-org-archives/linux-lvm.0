Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3752040BD
	for <linux-lvm@lists.linux.dev>; Thu,  6 Mar 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257381; cv=none; b=D0wxCjMi8DFo5RMxPK1GECm9dBd6wDKHiDEs7shyBTbBtgxqamxnEG7h6XLYYlICc4SNhsx4fwfgc8780uzlLNCYqwe9uAxMm6uAvmGkYV59UKJIsAWZLd1j65X0i03HqNOUq+ZG1pfVtGizIp6HsmXu6Jn7y183GTd9/KjJIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257381; c=relaxed/simple;
	bh=GMjTo/sqhXssa0V3g7jJGvS1C2jKh4myNdjJurs2dKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eSuqYHPrQWJrMLzOr3MqsUUN6omhLUvjUVemMuDOg6pdWyHYZzakiHMJDjN1pimrXCzfmQio/ICDC3NLYLNK/A3SQ16h46gDanRaqFBDaq0VdE/cCjJlQQzDl5KI3YASpEW0HldQxJOB3o6uH0Q1bahLitZO8BtZehtbg+0N838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTaBBkf3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTaBBkf3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso4900045e9.1
        for <linux-lvm@lists.linux.dev>; Thu, 06 Mar 2025 02:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741257378; x=1741862178; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fh2lSixx+vOnxAZ5bIxhVEQ2p0AhKL7tQfMp2JyhLjA=;
        b=DTaBBkf3Dm4287fnxlGqXgh8Bd2lOB6jay4O9KWMgauE/kzIfpW5HhxphoMlRLq7g9
         cX4B/95i3wJCAvdgnPpDbg6+bgY66VLfwcssyN1w7W6J8P1hncCISbTLOcqYMjViTm9l
         Uq2Zp6x0e+KVFi1PuFn6NC03BR1wzmdbWxGS/X+vEokxBl7oOb9viKWFYRlkZ7hmUigz
         BtS7Wls43HL2CB2uOmwMwwpYLwXQBTlZQ5BrDxUg0WysuVtQOn4R+gX3XixwaonaTxvE
         x0oKmMPko+h2Wzct1STq7ZVSUaJFrDniKniA1QSDgziPhIIqMumYGlB9audc1UwxHATs
         4kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257378; x=1741862178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fh2lSixx+vOnxAZ5bIxhVEQ2p0AhKL7tQfMp2JyhLjA=;
        b=VQ46m6cLZkSL3Sc9eKgD+5nUAo1ci8+YKgYpwZWKXGPBrzcwX5oqkLwvdH57yCnaRo
         jp992Lm1aCYDROQyf/jSYtPzmvcn2jKSBEieegt+E0om0TSrqMC5NYaW0o9JfQUsY+ki
         2lWuYLq9lczQW6JE9BcypgkdNuZAz6jtv8pEo51n1X9giXh3aiO39Fxi6bDP+/4PZ9pw
         USHXbKenC5SxmQyemaDZOLnqHnkiMR3AzQH/hOYdJpvaje6yYmNHiXeDj5Rz3Xco6JR3
         GG7whZRzSuhd50BV02Gyb5D8KyFBY4QJ+/hkHF6kixAuZCVFFej04nuSOdthsJt7ADIk
         EYbw==
X-Forwarded-Encrypted: i=1; AJvYcCUS42ww541WxUSI2saQKuLvqy+jjQctzNr3Hd2tjy/TCxwqmEGzO6Nup2+CbZawLdSCkVZCPS3NMI8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhD9Wc5Jpnjwy1Hp7wpdjsX1To8LuaUTYEZxsAvBrjmKF/Lpek
	RYXRQ/yUoJD+iwUK9mEtdo+Bd2jVAS2KVLS1QEzOqCAOa2bM7bUvDeeUZ07T
X-Gm-Gg: ASbGncsXOfVwER3u75iD0GHSCoD6LqECHxO1dlgiiBpyFHz1xoMIL+51Glww+Hc5PL4
	FDdA9poFoS5tj8E2L8lzvKAd3Z+JgoRhy9h0aNGg+wMBPXe2ES3vhxVRuCixjPtcgGkBgcM8m7M
	jAJDLZmcmPpZTvo24j5Wm5dNSCXmMvyu/Mjhl1HOzFlZrlevfywpbBONK8fKM+lD4XmHtsXJ55+
	rBN7EZVmrgwmyr3kQ1xuDMzbv+cgZ9m5e7MlhuZeQgGehxtYqTuWFL1AGEauwtE9KViABjNGFA9
	sMdKV75Kl3y7G/BRqWPcuWlLsontykEaVoJEB/i4dEre71tje7iRueWEwidV9SOKTIEL2upPT8o
	7iQ==
X-Google-Smtp-Source: AGHT+IEWgEf0CdaQk1l+CHdee9uI7k7NVhUEQpD9sc104cJGqcRG9fHvY7xId6r90p1C+TujIBcvCw==
X-Received: by 2002:a5d:5006:0:b0:38d:c56e:f1dd with SMTP id ffacd0b85a97d-3911f7adee2mr6010050f8f.38.1741257377553;
        Thu, 06 Mar 2025 02:36:17 -0800 (PST)
Received: from [10.43.17.62] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01567fsm1605636f8f.41.2025.03.06.02.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:36:16 -0800 (PST)
Message-ID: <2dfd3cbf-df15-4f69-9710-24520deda633@gmail.com>
Date: Thu, 6 Mar 2025 11:36:15 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: LVM2 headers
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 DeCay <decayhonor@gmail.com>, linux-lvm@lists.linux.dev
References: <825942ec-5b4f-48aa-bac2-02198d2a2733@gmail.com>
 <0755fea5-22f3-4a90-aec7-07ddb88c2253@gmail.com>
 <31296432-4239-4daf-a0a4-58fdc7c2d955@gmail.com> <Z8eRZnRMMsz1-slY@itl-email>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <Z8eRZnRMMsz1-slY@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 05. 03. 25 v 0:48 Demi Marie Obenour napsal(a):
> On Tue, Mar 04, 2025 at 09:13:54PM +0400, DeCay wrote:
>> Interesting, thank you for your answer! Yes, DBus should work for my
>> use-case.
>>
>> At the same time, I'm looking into lvm2cmd.h right now, but it seems to be
>> designed for the CLI `lvm` you mentioned.
> 
> LVM2 can't be embedded in an application because there are points where
> if LVM crashes, the whole system must be rebooted.  Furthermore, there
> are points where accessing memory that is not mlock'd might hang
> forever.

Yep it's around this logic where lvm2 needs to lock itself into memory
whenever it needs to suspend devices - as this may suspend access to
swap device if such device would be living on currently suspended LV.

There could be possibly some mode where user is 'promising', he is not
using lvm2 on devices he using to run his system - in this case  the
rules might be way more relaxed - but explain all this to all users is 
probably too complex...

> If you plan to frequently perform LVM operations, then LVM is probably
> the wrong tool for the job.  LVM operations often take 0.3 seconds or
> more and are highly disruptive to other I/O on the system.

We are continuously making lvm2 faster but clearly if there is a suspend 
operation that requires to flush all disk IO operation - that may cause a 
significant 'sleep' delay.

On the other hand - if the user does require much higher responsiveness of 
such lvm2 commands - he then needs to significantly reduce  'dirty-page-cache' 
size used by his system - so there are no long flushing delays.

If there are seen more delays for other reason unrelated to suspend IO wait,
I'd like to see them with timed example whether we can run them faster.


Regards

Zdenek

