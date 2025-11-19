Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B542D0C66
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573471; cv=none; b=mFe45rKOW6P85+NjHf0LaG0v2fI97ZaOWcQGMlt0WZJomQhLz6I6ZHWc+pYrnnmy99pNoXg4V0+J9E0ELf24J/YQCfmFTWKkDTHBpYA5CNkN4MSPW5sHM9ErOypOwhVTO2yyKDwMy2Bdss2ePn+odYsT5dqG4q2Wst9Kp2lU480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573471; c=relaxed/simple;
	bh=hDY3+4qqHVKb6M4+5I+/gfuSUd/J3T+gXTrjfs9WjGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Uat5sINn0TEeNCjfDUAV9z99kWXT+/QWtdRLNpJCxSdPKRTnJjmSTR0xC3KS7OY7M6atn+UuNCmbaWX/q1HmQGz397SIFwoqjkiXkKY88fNxgdmFXjdEcihzC9MEfC+LExLanbVOJ6+xWKUOanyjAh9MNhOtLMLLPxJXP5LcQz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxf+DOag; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bxf+DOag"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so69975e9.2
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763573463; x=1764178263; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LVI6he/LPyDx2VI/EDr/5FsDD24Qo7172GZ0WRsHW0=;
        b=Bxf+DOagnWfLydgsinMiVaS7wFWddiOBesEIkcYCP1X3QbnCq0kvkHMqjJ2Oe9E83h
         qLRHXwHzxEzCB9C6r8u8EyYpvd4aIQy1fzldKk1TfRWZTg1x15NTP+TsWJIGpJCdYzgE
         ZM+SW0dG2Ngl+SEVGPAYhMoQ8egy5TkdbzmpFHy/MXRCD+v2lPCVUaONykUvwx9nvAZT
         B2Z0seIfsfiaFw+d/z1Ubz4RTpc3ttBkhNnpuK2d1Op06Kx3RV0rFok0N7L+8pjcvIKZ
         cJddXybFuM/NqCTK6aiwf8fdYvHa2L+y/VaiHJsaDtPKIfrz9UEwdEPcVPs0bMI9hQQv
         Xo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573463; x=1764178263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LVI6he/LPyDx2VI/EDr/5FsDD24Qo7172GZ0WRsHW0=;
        b=it0vGPOtbkadgT1neTHFGXI2zIrmTAYbqdbDlNs5QEdK+R9Fk+BYX3SXLnHu8dqrIz
         /zZnTGLUWbkUNo6PbLKeuH4NjczbS6Qweps8HKVTx2uHoNoGvNNQ/5xWx6BMyTHLq0Ic
         hz1t5Uw93U1SrTuZGsR/kIYf09JoBs1beBnF1obc4GuwFA6bMdk3FFs9bCmk4X1T9eXG
         y3eYFFhHZf5G1cWNHiVECpOSVsawY4wrVK8WddZ61n794jgsmQU1v03UDHhJBYoLGk9R
         PWJAwTY6vSo6LLDEbJDYbAGt0oCrQpfnRBRep1bJxMK+o9S8Az0rQqzDWl68XJykop/B
         jn5w==
X-Forwarded-Encrypted: i=1; AJvYcCXqOm8nQNbcwSD42moFis8IKq+psdrF3hF2yQRRmZAFwtrjGMr76hdXySavLDGmdB08RfViW7idZ4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi1+Kf43WYUA0gVC0qcTMQ8/daqDUGyXPg21Y6LSu7Nt60gk2i
	2KML5+Kvi/f0E6hh/4WfxM2eIwkJyDLke/fL/VAxuZrN7Zl74PSXKfHy
X-Gm-Gg: ASbGnctAaTN9KlYhggI8T4XzPmIGlzo8yY1G3ycmdJTUAqT0Yf933beUcu6q4YmRkfc
	DkKJE8S8LrPn75ovEqpiXlb5fk2eJkgQmuwjKKwnIK2iotys/I9XaZSrwqx2tDkZYr15qWi6m00
	Cob6k2AxuEjiaTs3tbsMNsz4Aw4cPpPfV7rGT1YdkmPExWE+RzwHO+SEERHrDkoYiR0/dMbJfgz
	JPa4cZ3+QchH7DcIvP/ROchJbvVnk2YJkFVRp5VC7ny5906niAF1P1U8f7d1m3FXN+6lTvqtyUc
	Xdcu84bwKB+h+RJSDhZA07al4lo4U0qcuaIiGrSLxQ29r6HVtBA3Z5wb8FiDPQFJAFWh6ETBcnQ
	Rxf+ookcNbbZBgGKonLmqURvUk/ygl+7+4dC5n9No1VYMX4pnzR3h04QJWf7SNDXBoiUlcpR8mw
	L7zAIh0f1eIiE542sXWhLPNQ/bKK2ifaHz
X-Google-Smtp-Source: AGHT+IFM7W2V99HgTCi0SL9zF/Lx/7fNPBobglopKcYCRDKmdm62EYheFzpOPH/qn+RQhCSErZ1/hw==
X-Received: by 2002:a05:6000:2901:b0:42b:3e60:18cd with SMTP id ffacd0b85a97d-42b5933dfdemr19394684f8f.11.1763573462565;
        Wed, 19 Nov 2025 09:31:02 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35b7sm315912f8f.20.2025.11.19.09.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:31:01 -0800 (PST)
Message-ID: <42516759-f09a-407a-9c2d-1f82d0db19af@gmail.com>
Date: Wed, 19 Nov 2025 18:31:00 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: matthew patton <pattonme@yahoo.com>,
 "Brian J. Murrell" <brian@interlinx.bc.ca>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
 <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
 <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
 <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
 <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
 <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
 <94679191.5310372.1763572932545@mail.yahoo.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <94679191.5310372.1763572932545@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 19. 11. 25 v 18:22 matthew patton napsal(a):
> Right,  so LVMThin(1) conveniently omits "Oh BTW standard functionality like pvmove() is not implemented."
> 
> lvmthin is a sub-set or sub-class of LVM, therefore any reasonable person would assume all functionality cascades down. Because it pretty much does for everything else.
> 
>> lvm2 has 'no idea'  which disk space is in-use for any individual thin LV.
>> (there are tools like 'thin_ls/thin_rmap' for that)
> 
> And any reasonable person would assume lvmthin would have implemented the necessary hooks so that pvmove() would work by lvmthin handing lvm back a linked-list of all of the pieces in the correct order so they could be written to lvm(thick) or to another lvmthin pool. This is not that big of a cognitive leap.
> 
> That Linux LVM thin is missing "obvious" functionality is fine, it just needs to be stated very clearly.


Yep  thanks this is a  legit complain, we will improve our doc to be way more 
clear about this.

I've been also thinking - that adding support of 'dumb' mirroring of thinLV 
into pvmove - isn't a very difficult request - so we will see - although 
obviously copying  10TiB empty thin volume isn't going to be 'a fast 
operation' this way - but it's not any worse then a 'dd'.


Regards

Zdenek

