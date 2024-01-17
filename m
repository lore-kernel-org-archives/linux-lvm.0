Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B231BF31
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705487790; cv=none; b=Q3g3ngkME3iaaDbII0qeNTC+yYO1CMS5NsiO+UOOYFZUxKTaPzEAuJiUYioOKlV+SHfbNSCF0l++DVi8A2D/0emYyT/comheR4++kSUfZs6JEf5HbdbFZ7lmcltZMP+Et0oapDtkmpTYbW0rVTA8Oi/Yn1vfTnozzf9sv6ks3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705487790; c=relaxed/simple;
	bh=sTuySbang0QScxBP0CGJ6xkyQBU1oe2oyKtCOHq6vZw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=VYx25FrX6NQl18v/6PngpqXw/+1R4nvQyhjTcgGtoPzBsYDMfc3Ic9kvysB4ob0SURp3hgeHBNRUxLzn5BODCE/avvUPa3jf+ywELNLKVlii2ZWP8M4PS0RsHdvCbPCO2oebzHGbRCJ4I5C+xjEz/B3fKTs0mAX7kX6gQahFivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIPREOBf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIPREOBf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e8cf57d03so1441125e9.0
        for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705487786; x=1706092586; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIi+i54vo/8YBPwoYpAsQ//xvRF3peDLsNUygdXNJ6I=;
        b=DIPREOBfKAGxJ8P0KI4+plBg1zDcLKIF3cjRoR599pdwIk4VMX3eRsqFO6W05XlAxo
         /BzV3OVdSfdh58GNgqNzobUIhBbzdaW2wimoU241JXS+4K58/PWRZXoxWHbg1xctuNKY
         hFyp1XX1LQn/+Mq0osxYB/texD6rCkbNCysCcLSsO/vFPADTOzQteDNvwBo9uR0adhMc
         i7eoL2uBNmpDgcr5zGIgcOdZOgR3aFg1cecCHkhlwd201mymNOUg8QzrsrzWLZGtTcpo
         jQFRZ22vKc/pbgZs/YH0+wd0HtVxHLClDi22npR4hOa0PzOrdSvMgTdmnGlf0mtgIpSE
         uM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705487786; x=1706092586;
        h=content-transfer-encoding:in-reply-to:from:references:cc
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIi+i54vo/8YBPwoYpAsQ//xvRF3peDLsNUygdXNJ6I=;
        b=p2k4hlxvDf8E5bwpo9YCuul47zYBziowc60mBCG2zuQKRHUEzNZXU2SanANbOxLjru
         pH1rKb+lvnpPcXq5c4fMLPbTxNuDyuCQieHdWssZ8SGAyt2CZBI4F+qrw6Lssw8EKc+v
         GqDl3IIowalgAArO6w6K11i8AtrR20VFzrfmHD8yPmQD6MgjjbSTk24+nMknXQVbJuUM
         0auKDRxXWoFvcwTKSltZO0k8M59pxpYaxPXyrhuNqa2QagYO/B1FOBGlt/9RWK3ZA14M
         lSzdTZPh5GqlBldyb6NyTdUBZyCUEm4dFT4TnTDjAFT6EZHZrt2MrBkK5BPaciG/1i5z
         rSxA==
X-Gm-Message-State: AOJu0YxDxRPEFdm7E2mE8gSIs5+xzZ7+WyRtLnIm3VmqR/BjRSWA0sCq
	5QWfBRGQaGhGlEtgdBglwdFQHyfdh5eLrA==
X-Google-Smtp-Source: AGHT+IEmv2Uj3gL7WND52YnrSGcUWMxIGnczI7aKKwh3ekaM7bc4lsIi9USGDF36jT733D8lk/VQGA==
X-Received: by 2002:a1c:6a0b:0:b0:40e:5a18:7fe3 with SMTP id f11-20020a1c6a0b000000b0040e5a187fe3mr4678447wmc.63.1705487786175;
        Wed, 17 Jan 2024 02:36:26 -0800 (PST)
Received: from [10.43.17.38] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id p18-20020a5d4592000000b00336a0c083easm1353327wrq.53.2024.01.17.02.36.25
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 02:36:25 -0800 (PST)
Message-ID: <fbaf0486-790a-48a2-b9f3-f7a1c8e30952@gmail.com>
Date: Wed, 17 Jan 2024 11:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Content-Language: en-US, cs
Cc: linux-lvm@lists.linux.dev
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
 <ZabkWx401gDBehBZ@mail.bitfolk.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <ZabkWx401gDBehBZ@mail.bitfolk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 16. 01. 24 v 21:17 Andy Smith napsal(a):
> Hi,
> 
> On Tue, Jan 16, 2024 at 10:30:36PM +0300, Ilia Zykov wrote:
>> Sorry, I could be wrong, but I was encountered this problem a long time ago.
>> You cannot transfer ext4 from a device with a phys sector 512 bite to a
>> device with phys 4k sector device.
> 
> I have read several other accounts which agree with this. I will
> test just directly putting an ext4 fs on an LV that's backed by 512e
> drives and then copying an image of that to an LV that is backed by
> 4Kn drives, just to see what happens, though.
> 
>> In datasheet for you model tells:
>> * 512e models can be converted to 4Kn format and
>> vice versa.
>> I don't understand what is it mean, but maybe you can try convert to 512e if
>> possible.
> 
> I think it means that using hdparm to set its sector size to 512 is
> possible, though that would invalidate all the data currently on
> the drive (which is fine in this case).
> 
> There would of course also be vendor tools to change the sector
> size, but I think hdparm should work if the data sheet says the
> procedure is possible.
> 
> I'll let you know!
> 

Some words from lvm2 perspective.

Lvm tool as such doesn't really have any problems with mixing 4K and 512b 
disks within a single VG - however there are number of issues that will rise 
when an LV starts to be 'mixed' and using such 2 different devices together. 
This is confusing number of filesystem (XFS is one of those), where it 
suddenly starts to fall apart - as devices have different level of write 
atomicity - so it may severely corrupt your filesystem.

So in lvm2 we rather decided to disable the mixed usasge - if the user is 
skilled enough to deal with troubles, such protection can be disabled (see 
allow_mixed_block_size in lvm.conf).

Regards

Zdenek

