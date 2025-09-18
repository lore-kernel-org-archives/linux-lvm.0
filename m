Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596F4A2D
	for <linux-lvm@lists.linux.dev>; Thu, 18 Sep 2025 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758222461; cv=none; b=entXQFTDZzq1svsee2iifSMk4dXm27sadphl6rdV5trWz73A9p11M6BRP5nFJunlU97rosd6e4syW9hsDYvmz1NjtHjMA4EjfgAMdBOU584mNsDfq7he8Mk/WPcF1ngewSDOyWm8XFYb8yL1X01vUa8xomgRkC/XUp1tM1GF0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758222461; c=relaxed/simple;
	bh=w+JuTPmk3C3v0LOh3w6dNZNHsd7i4lPlUS1OqQRXd/E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=MENdikO3qIi4/EcEm9y6GfYIZr7P11t+K7GA6tbzAiRHS+LOD7zBNlwfs/barKd3UoujYdEIRPXTwuH1dQWLV3seHc/Dmh9cZProaWdoOKOFeTuk4Ve0EomXZ1uQSFaXkBKz1W6nMIQEm8F/o9fWI+YHF1XO3bgEZppB/dYMvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAz5fpAY; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAz5fpAY"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-828690f9128so182366385a.1
        for <linux-lvm@lists.linux.dev>; Thu, 18 Sep 2025 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758222458; x=1758827258; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wQuwWoi2HoHjHhAU3WB0ZfTwJtXhQmxYIUtaZ3kdkTg=;
        b=DAz5fpAYDljEuMkXN2SM6KzH4steawH/GqAXuCDwRy/5y6QiLJwxnerE7aZcsP7qJH
         4QmiW4ozrPK7p5++2oCrh/W7SW76n8yrWJUYgPtTD6S3Su/PWgBuRCeZZJfMUrAikvSW
         B1jT6hFaMskCHvbeXCxOXSkuJOS2iXL4ty2qUoBth5l9WE+7qKJJqCgGjmXfMPrVg3Vv
         pg8haTEZWAcrinznIEsxQUNIjYirjPXt0vMpADFiu6I9MwxztJwNxx//uthFicYdGqRD
         oncQfYvTZ8l+eDqzCov78nRYkpqUEMmBxu3Bfo0CD2MEhk25d3p0Xl6wNxfGz/tmehBf
         yxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758222458; x=1758827258;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQuwWoi2HoHjHhAU3WB0ZfTwJtXhQmxYIUtaZ3kdkTg=;
        b=qJnFRCBI/QMNkyZpVK1TiF4rSM98ldMNfwdqg+Mt60oXN0PANgsjQLspuk9Xhvih+Y
         MCEsFkz4P53YWrUAKbbEwAMWIowRPb/E/eE/5l4ipQGT3TMTTYY0nKCQMMRXeed+jsnm
         sB41yYeNyQHQKJgQ5Pqz3Ty+gCC+2Dhz9/7c2dZUoGU8qMM+Wnc5+ZAuy8EtmhbTdLZd
         VOyHjv5yQ/523elsQm4ozyKCdM2SS4avcTXxraThh9VTSeJXOv4vDzyZyB5rlFYVs1l0
         uKYuwB0Sd1UrNIcJcEJPxlYoOHBkya4rvZrThUlMiH16+C4F/Z5XnK4IYfLC7GlN56Gf
         9U8Q==
X-Gm-Message-State: AOJu0YzVtojgoqG/zfM6ZeAnxULbfvMsEeaUqvhz/3/3+qF8t483Lyz7
	vSd+85p90sEuXRMn/wI8Yz9hA2wZqW2EbkBySykfwiSdUjNaS77GZEj2wzKhRfdb5z5GuhohtYC
	oeAHnCdvGTllxhDLj/uBaLay7jHhew+jYSonc
X-Gm-Gg: ASbGncvnQnol85nHDkg+NvCFfD4KUEZZ2KWVfUdb7MecbKAao02LfP/PT4/mSjJbVPJ
	w4GEg5l4RdHw5zwtC4STYAeClKPlYDfC82r04Nrc9YT1XDjkxl2/Q9SEyXq642uLtyN/OOo2iEW
	cndg46v2SAc0IcrQjbohWMp/12d+T1WvU5Bg41VxdZciRj7/VDqUPeuVt3mXB26qv/gOWsyCcXP
	CIyX9jrBz3LDE9pJJ+jcAU4Cbc=
X-Google-Smtp-Source: AGHT+IHO0Z4aqiaudaWZhWatNZDHCAkYU5pnrRWSNyCbv0ypOe6ECZRHsdVCEUd/nJbp+G6LdVriCYD7RA/3Kyokyog=
X-Received: by 2002:a05:620a:821e:b0:827:e9b0:2745 with SMTP id
 af79cd13be357-83bad30b3d3mr75375785a.80.1758222457512; Thu, 18 Sep 2025
 12:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alessandro Brega <alessandro.brega1@gmail.com>
Date: Thu, 18 Sep 2025 21:07:26 +0200
X-Gm-Features: AS18NWAklfGVAwowPJaxPmT4icuwkn2IALq3IfMkMc6G69rY6RlPBjhLJWre1ec
Message-ID: <CALAmg3ZyCczjzovtB9LwWgo265JDwjzNbfGGnTT4Kq4XdDuFvA@mail.gmail.com>
Subject: =?UTF-8?Q?LVM_RAID1_thin=2Dpool_shows_=E2=80=9Calignment_inconsistency?=
	=?UTF-8?Q?=E2=80=9D_warnings?=
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

on a new debian trixie server (kernel 6.12.43-1, lvm2 2.03.31-2) I=E2=80=99=
m
trying to set up an LVM RAID-1 thin-pool with these commands:

pvcreate /dev/nvme0n1p5
pvcreate /dev/nvme1n1p5
vgcreate nvme /dev/nvme0n1p5 /dev/nvme1n1p5
lvcreate --type raid1 --mirrors 1 --name thin_raid1_data --size 100G nvme
lvcreate --type raid1 --mirrors 1 --name thin_raid1_metadata --size 100MiB =
nvme
lvconvert --yes --thin-pool nvme/thin_raid1_data --poolmetadata
nvme/thin_raid1_metadata
lvrename nvme/thin_raid1_data nvme/thin_raid1

The thin pool is created successfully and works as expected, but the
kernel logs warnings such as:

device-mapper: table: 253:4: adding target device (start sect 0 len
209715200) caused an alignment inconsistency

Here=E2=80=99s a sample of the full log while running the commands (truncat=
ed
for brevity):

Sep 18 18:43:01 r02-s01 kernel: device-mapper: raid: Superblocks
created for new raid set
Sep 18 18:43:01 r02-s01 kernel: md/raid1:mdX: not clean -- starting
background reconstruction
Sep 18 18:43:01 r02-s01 kernel: md/raid1:mdX: active with 2 out of 2 mirror=
s
Sep 18 18:43:01 r02-s01 kernel: device-mapper: table: 253:4: adding
target device (start sect 0 len 209715200) caused an alignment
inconsistency
Sep 18 18:43:01 r02-s01 kernel: mdX: bitmap file is out of date, doing
full recovery
Sep 18 18:43:01 r02-s01 kernel: md: resync of RAID array mdX
Sep 18 18:43:01 r02-s01 dmeventd[13507]: Monitoring RAID device
nvme-thin_raid1_data for events.
...

My partition table looks aligned; both NVMe drives share the same layout:

# fdisk -l /dev/nvme0n1
Disk /dev/nvme0n1: 1.75 TiB, 1920383410176 bytes, 3750748848 sectors
Disk model: KIOXIA KCD8XRUG1T92
Units: sectors of 1 * 512 =3D 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 131072 bytes
Disklabel type: gpt
Disk identifier: AFD9F465-0F1F-4453-A92A-EB3EC6C142B0

Device            Start        End    Sectors  Size Type
/dev/nvme0n1p1     2048       6143       4096    2M BIOS boot
/dev/nvme0n1p2     6144     530431     524288  256M EFI System
/dev/nvme0n1p3   530432    2627583    2097152    1G Linux RAID
/dev/nvme0n1p4  2627584   34084863   31457280   15G Linux RAID
/dev/nvme0n1p5 34084864 3750748159 3716663296  1.7T Linux filesystem

I don=E2=80=99t see any misalignment here. Does anyone know how to resolve =
-
or safely ignore - these =E2=80=9Calignment inconsistency=E2=80=9D warnings=
?

Thanks for any insights.

Kind regards,
Alessandro
