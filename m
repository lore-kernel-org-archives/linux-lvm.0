Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0546B168A9
	for <linux-lvm@lists.linux.dev>; Wed, 20 Dec 2023 07:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT/c8WxC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33664b6d6abso3083215f8f.2
        for <linux-lvm@lists.linux.dev>; Tue, 19 Dec 2023 23:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703055707; x=1703660507; darn=lists.linux.dev;
        h=message-id:cc:to:date:from:subject:content-transfer-encoding
         :mime-version:user-agent:thread-topic:references:in-reply-to:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BfYtQy3waN3/R5PT6ny26Fr390YN5/wBaKOHobNMOvY=;
        b=DT/c8WxC0XWSPK/KOtmmsGN0U8HZEEd1kcRsyPnskBAm1o5mkc8wVr0CWdt8tVd2If
         ul+7KDjASy13ltVRO6VGgrkyQugfxyVbEES0XwOngDqXs+gmLAp26a+RTbmTlir6YIoo
         6e38lJB5KGX38OF+bDs6OEXvBrTZHjbSMDqWeIzVOgtr4zQwPTuR4Wi3CZf8HORfX86g
         B1wU34xBsK7S0rE2vtwJRFhdbrU97UaYq+gVKIb1zXHu5a2KNMphGwZcgBMbtfmOP0qC
         DyVm8ZpQsOoLE5KqxqMyzu+CJZ5bP4qksHQNsNW5liyhtZmY1ZeWu1aI5nxq/bVZUyvM
         zPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703055707; x=1703660507;
        h=message-id:cc:to:date:from:subject:content-transfer-encoding
         :mime-version:user-agent:thread-topic:references:in-reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYtQy3waN3/R5PT6ny26Fr390YN5/wBaKOHobNMOvY=;
        b=V4d7j16f8bV9dF4WPjXprMJIL5gU3LFi07GlI9AOzszFTKkDvdLidml9kQ9vpzDXkE
         9sFXw6dYNmgK0HZxpjmOGQXM20Q4kRvoaErOmhPXjDd+yy82EfbER/kpDbbP6m6QsQn6
         8x49iEqfTaJJ/yk+Fa3H1FTv9Ibyn+UOLQThU37I8Dep3xRR9mZL4w/IFA7pJSmRZbb+
         UwyJO8VMiNxAJvd3ETrP6BfKZ89H4+7zy+D0sMVnCYEdfFbZsgJnF3TCl1x1LLCJ+BgZ
         T/t+VE7fj68eyZLzoHYSjRgf5C0YON53W2TEgVCyLptwVWZKHz87fIDRrbTCWVsSHvQz
         lLMw==
X-Gm-Message-State: AOJu0YwhMaQb3/DGQrTBZcYHZKBTgaO172h8jnl1S11y6jDcCYOxSbL0
	sab+RJg5VpkQtj9ortIl3Nk=
X-Google-Smtp-Source: AGHT+IH7N5B7R/2SAXLRe+Dyg9ZCVriURAzO55OZnP1TM0rGPnCnSyb4yj9EZ6dEEam7f0FKairhWg==
X-Received: by 2002:a05:600c:2154:b0:40c:246c:bd84 with SMTP id v20-20020a05600c215400b0040c246cbd84mr9832174wml.9.1703055707178;
        Tue, 19 Dec 2023 23:01:47 -0800 (PST)
Received: from [100.72.76.9] (net-93-150-238-8.cust.vodafonedsl.it. [93.150.238.8])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c1d8200b0040596352951sm6480095wms.5.2023.12.19.23.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 23:01:46 -0800 (PST)
In-Reply-To: <cd95e52c-1f72-4dd3-b7b1-3581fb76a7b3@interia.pl>
References: <cd95e52c-1f72-4dd3-b7b1-3581fb76a7b3@interia.pl>
X-Referenced-Uid: 74227
Thread-Topic: lvmcache not promoting blocks when there's free RAM
User-Agent: Android
X-Is-Generated-Message-Id: true
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Local-Message-Id: <7bbc0a0f-209a-4164-b061-3056b8cf6aa2@gmail.com>
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: lvmcache not promoting blocks when there's free RAM
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Wed, 20 Dec 2023 08:01:47 +0100
To: Wolf480pl <wolf480@interia.pl>
CC: linux-lvm@lists.linux.dev
Message-ID: <7bbc0a0f-209a-4164-b061-3056b8cf6aa2@gmail.com>

A part your whole description


Our 15 years experience on hard disks data =
recovery, suggests to avoid the spin down and spin up of the storage's HDDs=



Just make sure you have a vibrations free environment, yes, that is a mu=
st


Any noise in any fan , mean vibrations=2E


Contemporary HDDs (mean ma=
nufactured after 2016-2017) , are high density and heads sliders are now at=
 few air molecules of distance from the platters surfaces


Just that


Mea=
nwhile the drives are really low power consumption, so for just 2 or 4 driv=
es, it is better to avoid those spin cycles=2E We don't put standby neither=
 our 12 and 24 bays storages=2E


Kind regards


Roberto Gini


Technical M=
anager


https://www=2ERecuperoDatiRAIDFAsTec=2Eit




Il giorno 19 dic 202=
3, 23:28, alle ore 23:28, Wolf480pl <wolf480@interia=2Epl> ha scritto:
>Hel=
lo,
>
>I have an x86-64 PC acting as a NAS, it has 2x 3TB HDDs in md(4) RAI=
D1,
>with LVM on top, and LVs for various types of data=2E It also has
>an =
NVME SSD with rootfs and 16GB of RAM=2E I spin down the HDDs to
>minimize i=
dle power draw, and to make them spin up less often I tried
>to use lvmcach=
e for one of the LVs, with cache volume on the SSD=2E
>
>However, barely an=
ything gets cached in the lvmcache=2E Blocks aren't
>getting promoted (base=
d on dmsetup status), despite the cache volume
>being mostly empty=2E
>
>Wh=
en a file is read for the first time, it gets cached in RAM
>by page cache,=
 but not on SSD by lvmcache=2E Subsequent reads never hit
>the block layer,=
 because the data is already in RAM, until I need to
>reboot the machine=2E=
 After a reboot, when something tries to read
>that file again, HDDs will h=
ave to be spun up again, because it never
>got promoted to SSD by lvmcache=
=2E
>
>I looked into dm-cache's smq policy code[1], and it looks like
>for =
a block to be promoted to the cache volume, it needs to be read
>at least t=
wice:
>
>- first read - block gets added to the bottom of the hotspot queue=

>- some time passes, queue tick triggers a redistribute, some blocks
>   g=
et moved to the top of the queue
>- second read - block is found to be on t=
op of the queue, gets promoted
>
>Unfortunately in my case the second read =
never comes=2E
>
>I'm working it around by setting very low memory limit in=
 cgroups that
>often read small files, but I'm curious if a better solution=
 exists=2E
>
>Also, I'm guessing I'm not the first one discovering this - i=
s there
>any bugtracker where I can find or submit an issue like this?
>
>I=
 have a few ideas on how this could be fixed in the kernel, but
>I don't kn=
ow if such patches would be welcome or where to reach
>device-mapper develo=
pers to ask them about it=2E
>
>I'd be thankful for guidance on how to proc=
eed with this=2E
>
>Here are more details about the setup:
>
>     $ uname =
-a
>Linux roy 5=2E10=2E0-20-amd64 #1 SMP Debian 5=2E10=2E158-2 (2022-12-13)=
 x86_64
>GNU/Linux
>     $ head -n1 /etc/os-release
>     PRETTY_NAME=3D"De=
bian GNU/Linux 11 (bullseye)"
>     $ sudo lvs -a
>LV                     V=
G    Attr       LSize   Pool                
>Origin          Data%  Meta% =
 Move Log Cpy%Sync Convert
>archive                greed Cwi-aoC--- 250,00g=
 [archive_cache_cvol]
>[archive_corig] 1,83   24,09           0,00
>       =
[archive_cache_cvol]   greed Cwi-aoC---  50,00g
>       [archive_corig]    =
    greed owi-aoC--- 250,00g
>     [=2E=2E=2E]
>     $ sudo pvs
>       PV =
            VG    Fmt  Attr PSize    PFree
>       /dev/md126     greed lvm=
2 a--    <2,00t <473,00g
>       /dev/nvme0n1p3 greed lvm2 a--  <200,00g <1=
50,00g
>
>
>I have graphs showing IO metrics from /proc/diskstats
>and `dms=
etup status`, but I don't know if/how one should send pictures
>to the list=
=2E
>
>This is my first time posting to the list so please let me know
>if =
I made any mistakes=2E I can provide more details about my usecase,
>or my =
ideas for fixes, but I wasn't sure if this is the right place or
>how much =
detail is appropriate=2E I'll appreciate any guidance=2E
>
>Regards
>
>Wolf=
480pl
>
>[1]:
>https://elixir=2Ebootlin=2Ecom/linux/v5=2E10=2E200/source/dr=
ivers/md/dm-cache-policy-smq=2Ec

