Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C720DF3
	for <linux-lvm@lists.linux.dev>; Tue, 23 Jan 2024 01:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705974915; cv=none; b=c1V2CB0iqkag5rX/1ijx4/8xEuhMH1QQ0CZQwpkhUZQLzOjAWllaGYluOkDV88WmagxodOgDudrJR0oWPVMNOCfKwa41PfUhbANyuKuUapI0VdXR+nrPcXpsDPjqhHMVQgn+n+qWCTAv9m6QGKyr8ZUBEDVE61/mRN8QuXTWTf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705974915; c=relaxed/simple;
	bh=0ErT7Rhde4MBKqV5Jwu8X5ugJwNT8pgtLVklhwCUQVM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sU4DDRqPqOjwjsb0QcCY0ptWIpLDz6G2ukl9rS8Mk9GkP3V0Xz+o7WucMuHnSXI40VPAKnoyyzMT88cpg9u88NvKU3ek0GYzmEnMHCWbzmxHZPcHaJwxQHhagI+dA4FpVrrC8WSJIrBjx0io/bZrdn4R1Axz5D/M4CisBb27v34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LlcJhiQZ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LlcJhiQZ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cf12a9be5bso1004051fa.0
        for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 17:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705974909; x=1706579709; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opSVQRKNZaTRn/71vdcHcJaStByUcGY1nJL1XC673uY=;
        b=LlcJhiQZYKzfF3WyLaPDFpmH8dp4Zu2aoYh7ziDlY2hOxJkeJZABYgA5wixnifA+Ww
         BWBPXFBNs+hPzJhy7EY8Mpf/RvEaX0ySiC28Md4TwiDEYB17F+Z5RBJP1Eyn1PMeyCna
         wSwrCwp5Sr7lx3UFft9cB2ZbVjgmjQH02HdJLIEsyNBdePpJ2vY3YVRmDJcY0a+LQ0KH
         Am05/6TZGxIq3OTQNR1TaCXZMaDQ4QQwB1GmbiwmBoM6lZqk+4aPIS2NVnw28+99yNgS
         jtCfzDKwMJU39vF0XUo3+RpTuRAUiEw/IoBjehO4YXuwmhPl1v95VGQXXg6AHpLcJtvn
         zDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705974909; x=1706579709;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opSVQRKNZaTRn/71vdcHcJaStByUcGY1nJL1XC673uY=;
        b=FeSZXU4vfOepyoVJAFlLuae+tr8LkyaimwIUJ1yABc7W/piAldZ6K81q9Z8uOTaFDN
         Z8AKK4g7teKNofg/ba1zBnS9N8azUZJSoo1yrAZEPSe/UEPVjcFYUXmL7wzVYZlzitN+
         JUwCmNgMJJl0KaYywW8ZAHHVtSutHItC3syfeQFgr2TFq/ZP2yjhYFjfttrNPiV4+kbI
         cfjhE1V3fiTIMcsEJYiWfT/9IDI6OvMXBn2t1hrIWmd7kDIf8i4FJ99ihwcG5dEQY0qI
         LvkNxuxAaMbu5mLZDSNi0HabxUxObWotzq98VM9rPtupn5EtQOLCGco1rHVzpoX4GYLf
         CLMw==
X-Gm-Message-State: AOJu0YzPMBx21AJvl/qEG8nxI8i3MxiEolIfhFFwbYJ/bmY4MLmH20dZ
	v/CK43Gd3WGdo2w20CQEfE5p1j0TqyFZnWzT6zVyxBwraKPU++kpI1/l9uEEwLw=
X-Google-Smtp-Source: AGHT+IELa49dbp6QqEOyZa1T8DMm6hfNPUJnL+0Yr2AyRksdMYVybxP+NdN3n3QxTLA21b5R/RP9kQ==
X-Received: by 2002:a2e:928c:0:b0:2cf:de4:12fd with SMTP id d12-20020a2e928c000000b002cf0de412fdmr149090ljh.75.1705974909584;
        Mon, 22 Jan 2024 17:55:09 -0800 (PST)
Received: from smtpclient.apple ([23.247.139.60])
        by smtp.gmail.com with ESMTPSA id b20-20020aa78114000000b006dbd787aa8csm3549328pfi.67.2024.01.22.17.55.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jan 2024 17:55:09 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
From: Su Yue <glass.su@suse.com>
In-Reply-To: <6af8f729-2766-c316-1f53-a7f89d79235c@service4.ru>
Date: Tue, 23 Jan 2024 09:54:54 +0800
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 Anthony Iliopoulos <ailiop@suse.com>,
 linux-lvm@lists.linux.dev,
 Heming Zhao <heming.zhao@suse.com>,
 Lidong Zhong <lidong.zhong@suse.com>,
 martin.wilck@suse.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D921D3F-1D22-4080-89B3-FFA502F0FAF4@suse.com>
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com> <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
 <6af8f729-2766-c316-1f53-a7f89d79235c@service4.ru>
To: Ilia Zykov <mail@service4.ru>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> On Jan 22, 2024, at 23:26, Ilia Zykov <mail@service4.ru> wrote:
>=20
> On 22.01.2024 17:52, Zdenek Kabelac wrote:
>> Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
>>> On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
>>>> Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
>>>>> Hi lvm folks,
>>>>>     Recently We received a report about the device cache issue =
after vgchange =E2=80=94deltag.
>>>>> What confuses me is that lvm never calls fsync on block devices =
even at the end of commit phase.
>>>>>=20
>>>>> IIRC, it=E2=80=99s common operations for userspace tools to call =
fsync/O_SYNC/O_DSYNC while writing
>>>>> critical data. Yes, lvm2 opens devices with O_DIRECT if they =
support , but O_DIRECT doesn't
>>>>> provide data was persistent to storage when write returns. The =
data can still be in the device cache,
>>>>> If power failure happens in the timing, such critical =
metadata/data like vg metadata could be lost.
>>>>>=20
>>>>> Is there any particular reason not to flush data cache at VG =
commit time?
>>>>>=20
>>>>=20
>>>> Hi
>>>>=20
>>>> It seems the call to 'dev_flush()' function got somehow lost over =
the time
>>>> of conversion to async aio usage - I'll investigate.
>>>>=20
>>>> On the other hand the chance here of losing any data this way would =
be
>>>> really really very specific to some oddly behaving device.
>>>=20
>>> There's no guarantee that data will be persisted to storage without
>>> explicitly flushing the device data cache. Those are usually =
volatile
>>> write-back caches, so the data aren't really protected against power
>>> loss without fsyncing the blockdev.
>> At technical level modern storage devices 'should' have enough energy =
held internally to be able to flush out all the caches in emergency =
cases to the persistent storage. So unless we deal with some 'virtual' =
storage that may fake various responses to IO handling - this should not =
be causing major troubles.
>> However it's clearly a problem which happened while the code has been =
shifted towards the use of libaio.
>> Zdenek
>=20
> More over. There is a very old post about fsync() lying.
> https://brad.livejournal.com/2116715.html
> I don=E2=80=99t know, maybe this is also a post-lie) Or now the =
devices have become more truthful.
> But many devices report that "Write cache" is enabled:
>=20
> hdparm -I /dev/sda | grep 'Write cache'
>             * Write cache
>=20
> And in many cases fsync() flushes data to write cache only.
> But this can be persistent (ssd, flash) cache. Or as Zdenek has wrote,
> "devices 'should' have enough energy held internally to be able to =
flush out all the caches in  in emergency cases".
>=20
> However, in some cases, they may lose some data due to power failure =
and large amount of dirty data in the cache, especially ordinary, =
non-enterprise HDD. IMHO.
>=20
Yes=E2=80=A6 The mechanism of write cache varies in different =
manufacturer and products.=20
Some implements can even lie about the cache flush/FUA in 2024.
For serious enterprise cases, strict tests should be done for devices =
before uses in production lines.

The point is that filesystems and lvm should trust the underlying =
devices write barriers/flushing and make
best efforts to keep data integrity.

=E2=80=94
Su
> ----

