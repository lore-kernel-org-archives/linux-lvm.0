Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD3F2629F
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705927726; cv=none; b=E+nP0ag4jFUkrOelE+4UHOt95MVwPwO/l6cIeH+hLTAiChh9NIufh/ERx1dnzuA1iUv715XKe6wci2z+RW2tgAVm+cprTVN/G6km5u9vwFDXn6RHeiWCTvroJ8OqhiX+6jTIqt1ApoC5nsYcsIB9Fp28rNo44NxJvt7Yr9FW7qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705927726; c=relaxed/simple;
	bh=d80RtOxSrN91/YnQUdL4bsT1Tmkk+VdRjAEQZ8fBrT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDoC7eAnmuAY4R3X78H6BSvfFcStqT751oErb5ec76jPCEGKLeg10GvZZaRM3OkGzpqD9ZDrnnO1kmopjliYDFAab/FCy5hw5jdnJVDSJHZo/KqDA8dCJSzCh27pekzevhidCHYiM3E5rJXTz4w4MZ78VuhepF1hCWJ0o2UCmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrZw3Ass; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrZw3Ass"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso40444295e9.2
        for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705927723; x=1706532523; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Om9zheK6bRsiKVNIXSL1pJ5/zCrC85vuo5sZletfmag=;
        b=FrZw3AsslIprBIZl/z9lxN9yds8N8mxfiSXgxJBsIGwpHKA2SMkUXsXUw7Ku8QljCf
         1Vo1ziK5FYDxbuT7vQkrmTJMPS2+eS6uIhHzAPEpjgFm0uYBoNgZyOmBHSZ6Z6k66ERj
         NvTgqzs/H7vCGj2iCLSxipymkiJhZeg5kdnjzJVT/Z9M1eqCyzEU+NibqiQZGAbWpAm1
         gsbCM5+qrTDluQGGB/gUgK4TASpowykIt0Vo0tJ0WZ1eT5IvGThgkUwIpDGgVCWRkYkZ
         C/SacC30q8ESusu+QEvLu5B+hyeFYOexYoz+9Z7bPAoTqyTIH1AlZ8uSRX3xcRlj0nhJ
         wSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705927723; x=1706532523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Om9zheK6bRsiKVNIXSL1pJ5/zCrC85vuo5sZletfmag=;
        b=vygHYPXiO8uPsZOAf1Ez4qVmPTnsFZ1QL+rCxK8/miLSprtGUoumNHUmwb/LnausX+
         i6qoykIFwtRCGxxfLfw95JmMMg3CTUQ7GDOV28eN47JlhW95/wXOvvt4QcetQRp2Cly9
         B9cOPu0rPvkl5LnMpHZzBcEQr+GbjXFDIySlwiLp55XinceZcMKqW+KEcIyuKPmuzqfH
         giRVr2mbAC4/h+785an2yauA7YXJGOvVO6lceqZp64ovYfbzgrAl3cmYwS8uweC/sA65
         ShiSoXvvWghLFlqTqOAwu4pooveGC+Ni0TLCWL552+Bw55kON4NY9t8wfqH0kH8zjNr0
         6G6w==
X-Gm-Message-State: AOJu0YzhA4f52kzFi/ilGXgy8Z10Tbu3ovrLBDqfETopG4Bb9sk8KtmG
	HoI6diWop7rnxg/hdagFIHrQzpfFAWOeWeLLQ5B8tbHY09mQzGvf
X-Google-Smtp-Source: AGHT+IHjQo/OBn8NdnnZkWoay8vGwPKwS+nrbzybSRbOEXN+SENaLtTsb3wyyZDpJv1MOTkGW4RmUw==
X-Received: by 2002:a7b:c3d0:0:b0:40e:4997:b204 with SMTP id t16-20020a7bc3d0000000b0040e4997b204mr2329964wmj.225.1705927722939;
        Mon, 22 Jan 2024 04:48:42 -0800 (PST)
Received: from [10.43.17.38] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c501300b0040e813f1f31sm23449871wmr.25.2024.01.22.04.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 04:48:42 -0800 (PST)
Message-ID: <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com>
Date: Mon, 22 Jan 2024 13:48:41 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Content-Language: en-US, cs
To: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev
Cc: Heming Zhao <heming.zhao@suse.com>,
 Anthony Iliopoulos <ailiopoulos@suse.com>,
 Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
> Hi lvm folks,
>    Recently We received a report about the device cache issue after vgchange —deltag.
> What confuses me is that lvm never calls fsync on block devices even at the end of commit phase.
> 
> IIRC, it’s common operations for userspace tools to call fsync/O_SYNC/O_DSYNC while writing
> critical data. Yes, lvm2 opens devices with O_DIRECT if they support , but O_DIRECT doesn't
> provide data was persistent to storage when write returns. The data can still be in the device cache,
> If power failure happens in the timing, such critical metadata/data like vg metadata could be lost.
> 
> Is there any particular reason not to flush data cache at VG commit time?
>

Hi

It seems the call to 'dev_flush()' function got somehow lost over the time of 
conversion to async aio usage - I'll investigate.

On the other hand the chance here of losing any data this way would be really 
really very specific to some oddly behaving device.


Regards

Zdenek

