Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1052E1EEA5D
	for <linux-lvm@lists.linux.dev>; Wed,  4 Jun 2025 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028005; cv=none; b=cHUr9UuL0pX15gipZwYWL98ITuJ6jK6Z9tnP9h8nCRHYt+Lv7dmNVl3lJ2hx5651f2kNXM4tE4dxUgJEmjh6g/pgKjCTpMSjdp31PYwWYO1kwR4TXxYsgjJ9NXE3At6EihctC2WLvuu78SV/+6gvC2xFyL3TRu1xPx8TSvq1wUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028005; c=relaxed/simple;
	bh=ZUz92YJcBaZoG4e0IX8CEpK+lU6Crf4YT2t7V0y8SBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hitiBfmGtU8eqZ0X5HnUHfRkvsRSFUqGsdou9uTuwKE5OnPWJ/JWsn0cP2fqjBtFyO/Hft5iI9zpNE2Sn5uCmD6krGGYWBq5eKd0u1mt0os5cD6Q93dEFg6KLwEQxdGrFJp5MJSMyRtGk4+MDDfSf5PP3MGu+BqmadonumVa83Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aJ+cbjOe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aJ+cbjOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749028003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kxiKFOwpTvjgJGpWUdcPWbUSPnBt7Yzas1mm+Gg9KLk=;
	b=aJ+cbjOeL+Df1bQu8eS0m8vMUQI8bsBW+sBAYpUMJC3BXSAjTnV3xXnS+fCkWOT+1t+92x
	t/AqJDKZRbc/cKSD0HABwG1c8xYxec66qMB3elj61Wdd4KnI3m3W702+XBHvMNxaJpVdlo
	SnsrWPONlGteJq9DIx433dFDw1tNh/4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-y-Grk3HRNzWJPIdvl4rXEQ-1; Wed, 04 Jun 2025 05:06:41 -0400
X-MC-Unique: y-Grk3HRNzWJPIdvl4rXEQ-1
X-Mimecast-MFC-AGG-ID: y-Grk3HRNzWJPIdvl4rXEQ_1749028001
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso1774588f8f.3
        for <linux-lvm@lists.linux.dev>; Wed, 04 Jun 2025 02:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028001; x=1749632801;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxiKFOwpTvjgJGpWUdcPWbUSPnBt7Yzas1mm+Gg9KLk=;
        b=afLOHFJXHC5PijJdJxsYnvi+DnTvAoxF/3HPgxDmidBdQMgHN4/UC6w9gTY6/BAubi
         2obgnX4Pq7Le+DhL6LUt6SawXqxy8EZWKgfyfAvbGhgfQ/zWhm43wOPm88XVmYwx5lQC
         SgCFqyyoyuKO2oAYSp07MtZQtIJU8dP22PyD3z9YrBGhwpODKtMovUU3NHsfqOXaxGAf
         qwPzbkcITeOc67Yx4LOmx5JBAJPmPQ1BVmUtWKNUz0ZpxKQjYLc1DWYS7DWQ4QzgHYgP
         OSSzP1NfAKPIBKnxEvsh8hBOJvS3HfTvQO8/v471aPMXtpHBQkvi/l6kYG9oWqG5i2G2
         Le2A==
X-Forwarded-Encrypted: i=1; AJvYcCWCg1kZByoZa+YnyIFLX1kZ5lRTi7gEGa+qkohVWcqEKk8P8EfWuD6XH6Xx7Urch5+rXqMFJ4FeBMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKNRQpNx3TvyUEI7EtcgRXFqh+5UIBbt13LA2TWVvmtmfOsL9O
	KJQq6AqCs+v82zTwX/e/6HpokXFSNrBsPaIhYoTUs6/R1/KSRz7g9IZIUHH4Gm6RQKSjpnVqpdv
	a2nJFlq0qp1xJiRgT83zOXRkR+qOwe4LvKM7ldCpIO0zAPOSJJXbEA4ctC/NBuA==
X-Gm-Gg: ASbGncuStQaBrYDa5aNwFNTqQlHeX/xNToq+fGhX9X2FMee37V7tQkibULi4wUhaTnD
	WPOseYeqzOT0jAW2OX9zRxY0jBvcdv0ZlNbf1k7vIClNhgGdOoNsH8SYOhoSM6HKD3ydgZLKLyL
	aIPGM1CMQI2jeB0Fq2X97PiEFIXLcM7grFh0DDzfxrOQmBDVcDKuOIMdEftXlCXj+5GT1DFJUm4
	3yWXE84Tk5MB9Myxx9ELrKClJyiiBrqW0SCLfL3696WH1X9J93ySCa2Bhq+UUk3u2p7DsCRgdov
	N9Hf4Njh2Ng=
X-Received: by 2002:a05:6000:2486:b0:3a4:f8fa:9116 with SMTP id ffacd0b85a97d-3a51d8f71b0mr1274004f8f.8.1749028000666;
        Wed, 04 Jun 2025 02:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtp2WNK0Z2hRLwL7VCIPD8d6l3gEAqQRadPM2xHE3KdfhDtETcpOLZetigs7OOHYsxSMiGag==
X-Received: by 2002:a05:6000:2486:b0:3a4:f8fa:9116 with SMTP id ffacd0b85a97d-3a51d8f71b0mr1273967f8f.8.1749028000105;
        Wed, 04 Jun 2025 02:06:40 -0700 (PDT)
Received: from [10.43.17.62] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc281csm199555775e9.40.2025.06.04.02.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:06:39 -0700 (PDT)
Message-ID: <aae34fa0-9b39-43a9-a784-352aa29ed02f@redhat.com>
Date: Wed, 4 Jun 2025 11:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [systemd-devel] [Discussion][device-mapper] Enabling Block Device
 Access Locking in systemd
To: Chengen Du <chengen.du@canonical.com>,
 Lennart Poettering <lennart@poettering.net>
Cc: dm-devel@lists.linux.dev, linux-lvm@lists.linux.dev,
 christophe.varoqui@opensvc.com, systemd-devel@lists.freedesktop.org
References: <CAPza5qfw-ExyCFnWa5JoUE7eUsk_es8yx=H0YDFcY-=J8OtHpQ@mail.gmail.com>
 <aCNYxyaGNBuKTqX3@gardel-login>
 <CAPza5qdAogcH8T9aFPCXs+=gSVAY48Z4TUGxz1Pm0ZENRZjVcA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: RedHat
In-Reply-To: <CAPza5qdAogcH8T9aFPCXs+=gSVAY48Z4TUGxz1Pm0ZENRZjVcA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nAJwDyeAYVVfp1DmCOgCcrqa1Mlh1MwumKV4SBG9UoM_1749028001
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 04. 06. 25 v 5:33 Chengen Du napsal(a):
> Hi DM developers,
> 
> On Tue, May 13, 2025 at 10:35 PM Lennart Poettering
> <lennart@poettering.net> wrote:
>>
>> On Di, 13.05.25 16:08, Chengen Du (chengen.du@canonical.com) wrote:
>>
>>> Hi,
>>>
>>> Apologies for including everyone in this message, but I’d like to bring
>>> your attention to a fix [1], which may require your input.
>>
>> As mentioned in my comments there: we can certainly enable the locking
>> stuff again for DM block devices too, but only if DM maintainers sign
>> off that this is OK. Hence ping the DM people about this, otherwise we
>> won't move on this.
>>
>>> To mitigate such issues, systemd-udevd normally acquires a LOCK_SH|LOCK_NB
>>> using flock on the main block device before processing.
>>> However, commit #e918a1b5a94f (udev: exclude device-mapper from block
>>> device ownership event locking) disabled this behavior for device-mapper
>>> devices, which appears to be the root cause of the boot hang with encrypted
>>> swap.
>>
>> iirc dm for some reason is allergic to us taking a bsd lock, because
>> they don't want us to hold an fd open while the udev rules run
>> (because bsd locking implies holding an fd open as long as the lock is
>> kept).
>>
>> But only the DM people can shed some light on this. if they are fine
>> these days if we relax this then we can certainly cover their stuff
>> via the locking, too.
> 
> Apologies for reaching out again, but may I kindly ask for your input
> on this issue?
> Your assistance would be greatly appreciated to help move things forward.


Hi

We have overlooked the issue which seems to have origins most likely in the 
lost uevents due to switch from initramfs to rootfs and should be possibly 
addressed by a new socket flag.

But anyway let's looks at the current locking mechanism.

So for lvm2 to be able to 'deactivate' DM device - such device must NOT be 
opened - so taking a lock on an open descriptor to deactivate DM device is 
likely not going to work.

lvm2 however could be possibly enhanced to at least grab these bsd locks maybe 
when processing PV - that does not looks like a problematic part.

But adding bsd locks when processing DM  (active LVs) looks like not so 
trivial task - there are DM devices which are  'private' to DM stack itself 
(i.e.   cached raid LV  - for a single  public  DM device - there might be 
tens of 'private' DM devices associated in a device tree - and for none of 
these devices lvm2 expects anyone using them - so any 'device stack tree' 
manipulation basically aborts when an unexpected user is there  (public 
availability of these 'private' devices is however useful thing for various 
'recovery/debugging' reasons - so there is very good reason all devices are 
present in users's /dev/ directory - but administrator should not blindly open 
them)

For protection against udev access to these private devices - were have 
originally used some uevent flags - those however were not 'permanent' as if 
udev was restarted with the clear database - all this info was lost  (like one 
of the reason we asked in the past for this DM exception).  Later on we added 
UUID -suffix solution - but this is not yet 'decorating' all device types - 
and although we now try to add them - it's not a simple task - so likely some 
nearby future version of lvm2 could be better - and in such a case - if this 
newer  version of lvm2 would be in the system - and there would be no access 
to any device with UUID '-suffix' from udev tools chain - we can possibly 
reconsider this DM exception and see whether we can make it work somehow.

Yet - for locking itself - I'd probably see some usage of separate locking dir 
in /run  as more usable approach - as the case where device needs to be 
'removed/instantiated/....' cannot be 'lock protected' if the device itself 
must be held open.

But as a short term solution - we would rather need to see the actual exact 
problem which seems to be missing this locking - as is could be possibly 
something unrelated to this locking...


Regards

Zdenek

