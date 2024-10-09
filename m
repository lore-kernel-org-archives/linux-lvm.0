Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E218C02D
	for <linux-lvm@lists.linux.dev>; Wed,  9 Oct 2024 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728466122; cv=none; b=QxDA2XRhJg6uSIMh0HQy+18z6CcZ9JABzqZg0/dhcRTMlCUyRL/6tFFK8tRuy6mUu0/S0HdlpO2j5p3X2GNsWqPSFvniIxgXGx3lrLuusPPHC/7Usdxq0uEImGL6XyrmVbWby8RQdihfESkCMnaL1KrJjtk5ODzHQZy+0R9AwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728466122; c=relaxed/simple;
	bh=qAR7M7WJifu2MEv2jZNwN0TNirpdwKVnmYOd9tgGRzY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=De08A7/EGyRGah9WMkRgsFHHv7O5b9nvMjyhT3bhpCGjOth73o7LewGXSStQc3SHIbDgQbiAMw9Uxa5DsnJHAqkFzqvFwycoRDNpjQdE+L77AF1ppJjpbJE1kKpZwugSkFJY/SXkgw9Jn3wDyUy8+HtHfXOQeo2TXyYADrCsnIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notfab.net; spf=pass smtp.mailfrom=notfab.net; dkim=pass (1024-bit key) header.d=notfab.net header.i=@notfab.net header.b=Wi8lXSRk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notfab.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notfab.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=notfab.net header.i=@notfab.net header.b="Wi8lXSRk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c876b6c061so1018749a12.3
        for <linux-lvm@lists.linux.dev>; Wed, 09 Oct 2024 02:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=notfab.net; s=google; t=1728466118; x=1729070918; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IKXwUCrSbS75ocnKPqW6WU3hHIH/xd6NQ815P+MdESY=;
        b=Wi8lXSRkcU7tzoAdwp93grlvfSlArtVYmYjYLvdhV0tuyOlr5Njss/KL14rxWAe9Vb
         LE2I+RJhHPb5NpzhwTc8cTw4aWUb1/4lz8rtqHcJizvKQSVfb3iuZ9jX/vs9Y0FUWCvB
         QSfLALVi7sFqb0a/GRyFcGT9Rb3UosLPRndo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728466118; x=1729070918;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKXwUCrSbS75ocnKPqW6WU3hHIH/xd6NQ815P+MdESY=;
        b=t0RYK7wr0hWu3Wfc3DjDC47UbmvXhJ7O8pxdoR+4ySvTXmSN6OYyu1cmvnBNOCsTB1
         3ScEOtTc3BHpv4gDQzXx+k0es2TZrPvYlyGfLTKiY77FbII68Ty+QUWax7JJvK3lI3Ob
         ASLVJZgZKmbzQzUipcaTreTChW82BhflP9yl/eYGiFWwFsLbqY4sCSx+MlqWL1JRIAHK
         gOyanIAJ2uei9T5nBvrwdC+MGU/r+1XY1HiN7ObZHZ9lnpPJJ2gvYWjvn/hbkL2dYHkV
         AOMCx72OM50hEaxzJ6vnVxnosgl1vBfkxSMpOeu5sQet7p508GCp636wBydbtUZNFrRA
         dg0g==
X-Gm-Message-State: AOJu0Yw8ypX+nu54Vu13YsLOTcHvGe6rXxfRJQ9/f21aPf0nJgJCsvN+
	g1Wbqp7EARbrBSXzvTn2PTatBi4dKOzI4C0pLLk8/rMVkEYmJLtzOuZsWvVNay4s0OR+ElnwLtS
	BAXDh3xg99mpwvLJvud8zsyvlLk8GkGXSK3N4KPWGBd1zAnhgHm9kuA==
X-Google-Smtp-Source: AGHT+IHZ4vyYEFB4lfNYHJ4OAocfxm/wIM1qMDWZOM9EcdW4YqRcvYCrk3mkxrYRi90MINCa84Nod+BxJS8b73kVXw4=
X-Received: by 2002:a05:6402:3512:b0:5c8:97b9:5863 with SMTP id
 4fb4d7f45d1cf-5c91d68c78amr594740a12.6.1728466118179; Wed, 09 Oct 2024
 02:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Fabricio Winter <admin@notfab.net>
Date: Wed, 9 Oct 2024 06:28:26 -0300
Message-ID: <CAKP6pzFDt42gCDjwg7m_o5YRh7MGCSfxrXkNt=nPV_B=-pRAQw@mail.gmail.com>
Subject: Help diagnosing lvm ioctl log spam
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello people, we have been experiencing an issue with lvm2-thin on
_some_ of our production servers where out of nowhere
lvm2/device-mapper starts spamming error logs and I can't really seem
to trace down the root cause.

This is what the logs look like;
Oct  9 06:25:02 U5bW8JT7 lvm[8020]: device-mapper: waitevent ioctl on
LVM-CP5Gw8QrWLqwhBcJL87R1mc9Q9KTBtQQmOowipTAFuM7hqzHz6pRVvUaNO9FGzeq-tpool
failed: Inappropriate ioctl for device
Oct  9 06:25:02 U5bW8JT7 lvm[8020]: waitevent: dm_task_run failed:
Inappropriate ioctl for device

It writes this to rsyslog at speeds so fast not even tail can keep up
over ssh. I'm really lost as to the reason or how to trace this back
to a process. We use lvm-thin to host virtual machines via libvirt, so
several thin disks under a thin pool one for each virtual machine. The
lvm2 pool is created on top of a vg that is on top of a md-raid1
device.

/dev/md127:
           Version : 1.2
     Creation Time : Wed May  5 16:56:09 2021
        Raid Level : raid1
        Array Size : 1953382464 (1862.89 GiB 2000.26 GB)
     Used Dev Size : 1953382464 (1862.89 GiB 2000.26 GB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Wed Oct  9 07:31:44 2024
             State : active
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : bitmap

              Name :  U5bW8JT7:1  (local to host  U5bW8JT7)
              UUID : 5072120c:b114a0aa:51438cf8:8ebe58b8
            Events : 70525

    Number   Major   Minor   RaidDevice State
       0     259        0        0      active sync   /dev/nvme0n1
       1     259        1        1      active sync   /dev/nvme1n1

I do not know what this
`CP5Gw8QrWLqwhBcJL87R1mc9Q9KTBtQQmOowipTAFuM7hqzHz6pRVvUaNO9FGzeq-tpool`
disk is on device mapper, I'm unable to find it, however the tpool
suffix suggests it's the thin pool so here is what lvdisplay says
about it

--- Logical volume ---
  LV Name                lvol1
  VG Name                lightning-nvme
  LV UUID                mOowip-TAFu-M7hq-zHz6-pRVv-UaNO-9FGzeq
  LV Write Access        read/write
  LV Creation host, time U5bW8JT7, 2021-05-05 16:57:13 +0000
  LV Pool metadata       lvol1_tmeta
  LV Pool data           lvol1_tdata
  LV Status              available
  # open                 72
  LV Size                <1.80 TiB
  Allocated pool data    81.30%
  Allocated metadata     49.28%
  Current LE             471040
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:2

The start of the device name suggests it's part of the vg so here's
also what vgdisplay says:

--- Volume group ---
  VG Name               lightning-nvme
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  52521
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                72
  Open LV               70
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <1.82 TiB
  PE Size               4.00 MiB
  Total PE              476899
  Alloc PE / Size       471098 / <1.80 TiB
  Free  PE / Size       5801 / 22.66 GiB
  VG UUID               CP5Gw8-QrWL-qwhB-cJL8-7R1m-c9Q9-KTBtQQ

Any tips on how to trace this back to a process or a cause or a bug or
anything are highly appreciated. I literally only have these two log
lines to go by, everything else is working as expected until the
server crashes from running out of disk space from these logs.
Restarting the node fixes the issue/log spam until it starts happening
again randomly after several days.

Runnig Ubuntu 18.04.5 LTS - lvm2 2.02.176-4.1ubuntu3.18.04.3

-
--Fabricio Winter
