Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987C221F04
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752838705; cv=none; b=quFRApjL+POFhvA+9A85hqQlsNJukJWfOwJsbcQwAvLJNQGoqDC6U4QkziPD528HT0P0CdlPaKuxaplT4eqso0Y+4UKcHf7c9onHlkm+2FPH9ByqtdKLCltZ5xI/mYkpZsfogTZe3GWAb6CUCe6M3dyYb+PeQMwct/Ablj7DCME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752838705; c=relaxed/simple;
	bh=8e5Xw+jg7ZVhvd6sVX6A2Bdyhh11Yy18HQLywbYVOO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jfr7Md/vi0QHqKEhCzzp6BAzKPBCJFZm5asp8vLDdz+t6PIM834HQ1Tzj1AGwfzsDxh9fCoDLzsVp3zQSSsWNsdvVyCRf43/4FMvwsc5xkLlS8ggeFmKmHAURIk3R/TvcGF41NJXD4JSErBSiyZHM3UXFCg4wXt+657F5P75fm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/S/gCWS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/S/gCWS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d6ade159so14462145e9.1
        for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752838701; x=1753443501; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBupp7xvJ5dnHJ86UsVgs75Szw75tfEtdxWL3EOiQjg=;
        b=W/S/gCWSo2mXW9NR2IsYEuLSGTbBMa/flIuzqC+CXxr2La4G2HmxbRNnVEp7acOYIU
         C8dH5WhjQy4T/Tmx8blHyU5eoHHAgiFy/EZoP8H9oXuJFDGxfEmpgbrjLOtBiGetQ16Z
         v4yqOxyyKdyPZ3sfpT+MNnPVXFgSaY0UQmw6SJKo6uh6BKtHrQz97yZYKPk1Xkg8JzRV
         4jhNh4YD4xrm3f6U+VyA/EP/ddTBwRcRbYg/Yu96bJ7vBMcCaN82/lk3wJntrFtIne04
         V3i+ZZjtOqyFtppYCBqugWxTAuckh78DXyG5QBMdXf/K4K21xpxXtJO1LtVqaMNVNj++
         i5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752838701; x=1753443501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBupp7xvJ5dnHJ86UsVgs75Szw75tfEtdxWL3EOiQjg=;
        b=wLdguBTu8PYtzjOXrZnuAxtrT5A2UKh5ldMF/ThcHONQGOD/NjbdEHGrMmSjAwpCD0
         PBrkH+wBLOJYBju1BBTBPBN6T5qd8PAqHDbSTVSTvYXDYNuS1YyCrGt96nUxk0XUkKrR
         HRPC6Vrt+vyzG7tBDVImCLkE/ikPfiovTMdxnUrRTQLuOZe2TAvZa0TbJd4FR8158Mpc
         kM/ioIAMc0u4qkqvvdSzMuGzpBx1Zp0j46cvzi95Xyfzq/PKdx93Ey+i012OQnd96waK
         6UnhtMj5RmXBug0owMeMb2jtYvOZf4o+XEV9YLuqBHEZLi41GJiOdoGMuHAA9aWhyP78
         P5qA==
X-Forwarded-Encrypted: i=1; AJvYcCVD5CXy3VomCWQDHIhBIm7xi7W4FwpjbMCwy18AmL3Y3K1GHw9wsJ7qAt0zD6JqU0lntW5bBBURBaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZmTaSrETBTOer4Z44ULHrSu00GnbhFkwzcVsldDvO9HTpnQt9
	QndE/nf545M1v085hD39ekLBPffty247YIPXuhNqjnroRlgAcsaunMre
X-Gm-Gg: ASbGncs2t1l8CZLpctPN+0KNGytKF0DuS/0V0gDq9NcUQViYJDp0gkeSRJUtmXREHEv
	EwpvXcY2E52tbvwUAZ+13EPiIViLhP/lnAUofMyZbMvPJVAwl4ax4Y+g9g76MFWzi1zrI3oV6xc
	pMjpNfog8drrrc8gaFVCI9bgSrRH4iiRlEnAcmmuJmtSJ+jAFJ3W/e53GWhrhQ6DdgCUQjR86B6
	RvbLddcp+gWOldyKsCVMjCOSJOlk9iqFw5lFeINILYJsKPeJmVQTpitdSSdbPB3W7BAvQJ3NEMQ
	V+Ewr8dE+4dqYmcURrn9UZbLUj3MyxZWmzxmmpVZLC4xPTYVW4u7N5NoqfilKgOKDxbH+peKJr6
	woc1lGmEbiImZo7obtC5W2osTaDP27A==
X-Google-Smtp-Source: AGHT+IFlg1+dwlOCA6VVPWfHvAcmY9eo8yl+KhoMSiY6JKLJFy/VMgVEi1MYX/hrXdaXT17RjrbDwg==
X-Received: by 2002:a05:600c:6097:b0:456:26ac:517a with SMTP id 5b1f17b1804b1-4562e3914b3mr95459735e9.24.1752838701055;
        Fri, 18 Jul 2025 04:38:21 -0700 (PDT)
Received: from [10.43.17.17] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b740c51sm17539505e9.19.2025.07.18.04.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 04:38:20 -0700 (PDT)
Message-ID: <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
Date: Fri, 18 Jul 2025 13:38:20 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: striped LV and expected performance
To: "Henry, Andrew" <andrew.henry@eon.se>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 18. 07. 25 v 9:13 Henry, Andrew napsal(a):
> I’m trying to improve the performance of a virtual machine guest running RHEL 9.6.  I’ve assigned 3 separate SAS controllers to the VM, and 3 vmdk disks each connected to their own controller, so there is no kernel bottleneck in the VM on the controller side when writing through to each vmdk under high load.
> 
> In the guest, I’m creating an LV as follows:
> 
> lvcreate -n swap -i 3 -I 64k --type=striped -L 16G vg00
> mkfs -t xfs -b size=4K -d su=64k,sw=3 -f /dev/vg00/swap
> 
> After mounting, I test write speeds using:
> 
> time dd if=/dev/zero of=/mnt/testfile1 bs=8192 count=65536 oflag=direct
> 
> 536870912 bytes (537 MB, 512 MiB) copied, 41.2043 s, 13.0 MB/s
> 536870912 bytes (537 MB, 512 MiB) copied, 27.3986 s, 19.6 MB/s
> 536870912 bytes (537 MB, 512 MiB) copied, 22.8359 s, 23.5 MB/s
> 
> time dd if=/dev/zero of=/mnt/testfile bs=64k count=163840 oflag=direct
> 
> 1073741824 bytes (1.1 GB, 1.0 GiB) copied, 10.7506 s, 99.9 MB/s  ## only did one test here
> 
> time dd if=/dev/zero of=/mnt/testfile bs=1M count=10240 oflag=direct
> 
> 10737418240 bytes (11 GB, 10 GiB) copied, 19.158 s, 560 MB/s
> 10737418240 bytes (11 GB, 10 GiB) copied, 23.0384 s, 466 MB/s
> 10737418240 bytes (11 GB, 10 GiB) copied, 18.3788 s, 584 MB/s

Hi

This is kind of expected - the bigger the chunk is flushed at once to your 
drive - the better the performance gets.

Note - stripping is useful when you have relative 'slow' individual drive and 
you have very fast controllers capable of streaming 'parallel' IO operations.
This way you take the advantage.
If you have very fast storage - and you system can't gain any more by 
streaming in parallel - just stick with linearly joined storage....


2nd. part is - the faster the storage is - the bigger the individual strip may 
likely be needed to be better utilized - i.e. 64k can be too small - maybe use 
256K -giving you total strip size of  3 * 256K = 768K  - the there is 
alignment of writes - where optimal io size can be multiple of this number....

But you need to benchmark this - starting with 'raw' device.
Then add 'DM' layer. Benchmark again which stripe is best.
Then add filesystem on top - and see which stripe configuration again gives 
the best result with the stack.
Each layer may 'drop' some amount of speed - but it should be fairly minimal 
when the right parameters are selected....

>  
> I monitor speeds to the individual discs and the LV itself using:
> 
> iostat -xdmt 2
> 
> 
> My question(s):
> 
> When I create the LV using just one disk (linear lvm), I am seeing the same write speed results as above.  In iostat, I can see that eg. With 1MB block size in dd, it’s ~500MB/s to the dm-1 device and also ~500MB/s to the physical disk xvda.  When I create the LV as striped, I’m getting the same throughput on the dm-1 device (~500MB/s), but it is splitting that throughput evenly across all three PV’s, so about ~170MB/s to each xvd disk, totalling ~500MB/s at the LV side.  This was not my expectation.  I expected ~500MB/s to each device with striped LV, totalling ~1500MB/s on the dm-a device.  What am I missing?


Here we don't know your controller is even capable of handling parallel 
workload -  i.e. if you just you 'dd' on storage itself - no lvm/dm involved - 
are you able to  'stream'   3  'dd' commands on each drive in paralel give you 
the total bandwidth of 1500MB/s   -  you need to check this bottleneck first.

Also note - there are 2 ways how to do striping - one is  'old dm' striped 
target - and other is slightly more modern  --type raid0  striping - see 
whichever works better for you...

> 
> Second question is:
> 
> I’m testing database throughput.  I have the following setup:
> 
> DB  → 8KB block size
> XFS  → 4KB block size limited by pagesize in Linux Kernel on x86 architecture.
> LVM  →  64KB block size, and have also tested with 4KB, 8KB, 256KB, 512KB, 1MB, 4MB
> Xvd[abc]  →  4KB block size on these disks provided by the virtual host
> 
> The only part of that equation I can modify is the stripe size on the LVM.  Irrespective of which stripe size I choose, I’m getting similar results with dd (and fio for that matter) when testing different block sizes with my write tests.  In other words, it doesn’t seem to make any difference whatsoever which stripe size I choose in the LVM.  Is this a limitation cause by my virtualisation layer?  Would I have seen different (better) results if I’d used 3 physical disks connected to a physical host?
> 
> I suppose it’s normal to get low speeds with small block sizes and higher speeds with larger block sizes, but I’m still concerned that 8KB block sizes are writing to a fast disk system at only 13-20MB/s.  Is this common?
> 

Lot's of small write will never be fast - and will be likely even smaller with 
striped storage.  But you should start first figure where are the bottlenecks 
in your system.

Maybe you virtual system does have it self 'a single write pipe' - so any 
parallelization is stopped right there - so maybe you should start first with 
bare metal....


Regards

Zdenek


