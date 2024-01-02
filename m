Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B595F9C4
	for <linux-lvm@lists.linux.dev>; Tue,  2 Jan 2024 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF3poYr7"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso6593585e87.1
        for <linux-lvm@lists.linux.dev>; Tue, 02 Jan 2024 03:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704195920; x=1704800720; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2v02Zh1crHesOPWylkdyM/6jLtvBt3+nuzVu9CBXlIo=;
        b=lF3poYr70FHfTr56ZD7sQFgvr0oAzg5eC7NOXiR22MtZKq1oC3/tXQSPz7QknlgXa+
         VQwKrPf4Ez2pPUVxNM5j534Jve3n85Li2UNzAua5LYYNe6MnNImnc6E71MRWXwb2iepG
         PelB4DYnCUL5OD9ZvKHf9ZOm2rfJ9pa7HHJVvP/oH82CuRKrazlNdwe7ptbi+5LMYvw6
         BhsvZtssW9d6DUDsmqPC4w1+b4XIqrfRl6CvPr0/2DhKRJ11T2Zj3OOp2gp2GofevTjA
         Q6f1iBdQ3fgIEppCmQz5Xi3hoyQ2IwhGaqi+pUZ1yKDwhNR8Si2VVpk+ph+RhWlmIarG
         B6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704195920; x=1704800720;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2v02Zh1crHesOPWylkdyM/6jLtvBt3+nuzVu9CBXlIo=;
        b=oynnZGAYITng3JQbCmXoqkNWTOzXpsm4G9dY7lwchwSxdYcMpRCV/DBHO5zV6UKEEQ
         mJ6FHqtxKmuk4Hx0PXli8eLJpEXVn46aqtFzCaTgKoRkE7oXY5m1zrstaMc5hGyV0VfN
         19Iv8P2D6MwaeFcMp1TOxuX2aMym/L8H2u590j9VSAkhrSmzn0Dn7/zihyU+SvcWQgZv
         NBlNb7ewXmRyJ7GwuOjy6RgGv96chSFPzCVlfmB1XAf0zSPvf5TPZnIOgBRepB017UQ7
         L7JG4q3D6/Qwmn7i6WoCoyeU+wUkNjlgn7qGhL+t2tqWZE9gBipFrfA9oDQWFfqDkgDQ
         oPwQ==
X-Gm-Message-State: AOJu0YySHzsiwQLvuuJGfeowg44WrFBNBaUtZ/ZMTIUnPMGBCkTefHEq
	7B1+lb+hOBBoKnPLFc4h/VU=
X-Google-Smtp-Source: AGHT+IF0Tz6UCvcsoiFKROItkHoWCk0huep/4yxLmEhkztbryMQk/wLa8//vXQfJKvbB3K0fMfnpCw==
X-Received: by 2002:a19:384e:0:b0:50e:384c:6982 with SMTP id d14-20020a19384e000000b0050e384c6982mr6902111lfj.42.1704195920220;
        Tue, 02 Jan 2024 03:45:20 -0800 (PST)
Received: from [192.168.0.99] ([94.142.239.37])
        by smtp.gmail.com with ESMTPSA id fg8-20020a1709069c4800b00a1fa7e39957sm11766563ejc.136.2024.01.02.03.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 03:45:19 -0800 (PST)
Message-ID: <d635d089-eb5c-4d51-b41f-f4c61b1aa77c@gmail.com>
Date: Tue, 2 Jan 2024 12:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should issue_discards be enabled when e2scrub is used on an SSD?
Content-Language: en-US, cs
To: Mikhail Morfikov <mmorfikov@gmail.com>, linux-lvm@lists.linux.dev
References: <5ccac2f3-f554-47fe-bec9-d74b08e85e5e@gmail.com>
 <a15677b8-70ef-49a5-98ac-3ccf839fdad7@gmail.com>
 <fc9e7a1e-a566-4a5c-8a4a-9e26a5651b65@gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <fc9e7a1e-a566-4a5c-8a4a-9e26a5651b65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 02. 01. 24 v 12:13 Mikhail Morfikov napsal(a):
> On 02/01/2024 11.41, Zdenek Kabelac wrote:
>> Dne 29. 12. 23 v 1:48 Mikhail Morfikov napsal(a):
>>> I've got the following setup: LUKSv2+LVM on an SSD drive, and I
>>> have trim/discad enabled for encrypted container. I also use
>>> e2scrub for Online ext4 Metadata Check which uses a 4 GiB LVM
>>> snapshot. I currently have 10 logical volumes, which are
>>> periodically (once a week) scanned for errors. I've got a question
>>> concerning the *issue_discards* option that can be specified in the
>>> /etc/lvm/lvm.conf file. What actually happens when this option is
>>> enabled and the LVM snapshot is removed after fsck finishes its
>>> job? Will the whole 4 GiB be erased on the flash? Is it safe to
>>> enable this option in such case, or is it better to leave it disabled?
>>
>> Hello
>>
>> issue_discards  is relevant only when you *REMOVE* LVs  - the free
>> space in VG  is after such removal 'discarded' - which is only useful
>> in case you i.e. pay for 'provisioned' space for your VG (or you have
>> some very very very old ssd) - so this will make you VG space
>> consumption smaller - but it will also make restoring of accidentally
>> removed LVs impossible as the recovered LV will be simply just an
>> empty disk space.
>>
>> So for 100% you don't need to enabled it for e2scrub as discards are
>> normally passed through to your LV device as you may easily check in
>> your sysfs dir:
>>
>> /sys/block/XXXX/queue/discard_max_bytes
>>
>> Regards
>>
>> Zdenek
>>
> 
> I understand, but the question concerns rather the amount of data written
> to the SSD disk. So I have a 4 GiB LVM snapshot, which will be removed
> after fsck. Will the whole 4 GiB be written to the disk when issue_discards
> is set in the /etc/lvm/lvm.conf file?

The whole size of removed LV will be discard.

It's mostly equivalent of using  'blkdiscard /dev/vg/lv' just before calling 
lvremove vg/lv.

lvm2 doesn't interpret in any way what has been used physically used within 
the LV.


Regards

Zdenek

