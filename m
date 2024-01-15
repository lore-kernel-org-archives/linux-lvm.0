Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5371AACF
	for <linux-lvm@lists.linux.dev>; Mon, 15 Jan 2024 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB1x4nj8"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso207981139f.1
        for <linux-lvm@lists.linux.dev>; Mon, 15 Jan 2024 13:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705352881; x=1705957681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0ntn0AxtMLcTzTyFf5Py0ZGj3YmlLGOvoyv3/sTqQ8=;
        b=UB1x4nj81DsLda36KiEisFpz23qbcmGE9ZwVHgFoPHCQNj09Y/3AwNDv7JRD6Iygps
         9nXKKKx/SWzO2Vz+AvO8aURw+KrfPbILivrBHMAUtlv84p9C/gc9/Iw8mrNSN4XHoLdy
         pWdqYSpQkiDMJD1WloPfiKCHmUT1rKPmYhaqGUc6r855HLmmtRUizRZnF6lDKW3TbXJO
         jsqixmma2kyidRIQfKUH1cEoGwaxifY9NpVnQRwabYjRfGJPmqJew47N2tevvNdRlhm2
         Q2zi1Hi1wYGMBm7fEIv9AMVFsIw0Byaae2mxoLQ0ubHQuXg14lkyx28WAjDFUyPCja+h
         2T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705352881; x=1705957681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0ntn0AxtMLcTzTyFf5Py0ZGj3YmlLGOvoyv3/sTqQ8=;
        b=us3T3VBfARG2ZmRx2xqLyd8g3eepgrXbC1KLozDrnN3LKz5+LetnZ6FL/iN84E6SLR
         xbiXmAof63FCQ4eIP0FLw+gIY4+/v0tEvGQJ0pmJQfeD5VRS6U5FI8w0REsmrQtfQxzf
         yTJwESe4hyqqM8j1rG0mU2l4j4ppX/K4whqZ8/vRZ1l0docZ5MW9d6IYPe7Y3CHt+AvK
         ovP60hiJny/9w0RVUVHpdFQcT4ttc40nzSfv2QV+GmAtgwCf9odHXSbqdGiU8ZRdvqxY
         qhrzq2vVvJdlwKK5oJs+lEU4ttmv7AsqL8eKOhkhbEOIFoKSYKZzzkBD8d28cUrxk3mt
         qgvg==
X-Gm-Message-State: AOJu0YzNUj7bjCRwxIKpSnaEYHfdrRR8ZcQ/vi9Q3KdCKlTz1HG7wVgx
	zWMBjE8/2EeLYgcPN+5V6inDxRS/GLqyxaE/q0m69UkF
X-Google-Smtp-Source: AGHT+IESM0RDep3ybpczCwqxxBF10pffQuk9TxBV5IyMX1mNoPEmB/Bon0L7ON4P7y3MWUVh84ISSLeVA8Bb/kyFGCg=
X-Received: by 2002:a5e:a614:0:b0:7bb:ace5:bd7d with SMTP id
 q20-20020a5ea614000000b007bbace5bd7dmr7773272ioi.7.1705352880739; Mon, 15 Jan
 2024 13:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
In-Reply-To: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Mon, 15 Jan 2024 15:07:49 -0600
Message-ID: <CAAMCDefrPmPt83yssKAUJ+jRWbgB3CBLQPNi3m_=JwFsoJ+aPA@mail.gmail.com>
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
To: Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 1:49=E2=80=AFAM Andy Smith <andy@strugglers.net> wr=
ote:
>
> Hi,
>
> On machine 'A' I have a pair of:
>
> Device Model:     Samsung SSD 870 EVO 4TB
> Sector Size:      512 bytes logical/physical
>
> on top of this is an mdadm RAID-1 and that is an LVM PV.
>
> One of the LVs has been partitioned with an MBR and a single
> partition spanning the whole of the 400GiB LV.
>
> I took a dd of this LV and transferred it to an identically-sized
> LV on machine 'B' which has a pair of:
>
> Device Model:     HGST HUS726T6TALN6L4
> Sector Size:      4096 bytes logical/physical
>
> The LV there when examined in a partitioning tool such as "fdisk"
> now thinks it has a 3.2TiB partition and it is not usable.
> Correcting the partition sector numbers allows for use of, for
> example, "kpartx", to expose the partition as a loop device but the
> ext4 driver and fsck.ext4 remain unable to detect a superblock.
>
> I have confirmed with sha256sum that the content of the
> image/partition remains the same on source and destination.
>
> So, clearly the issue is the 512e sector size on source vs 4Kn on
> destination. Is there any way to work around this in LVM? My issue
> is that I would like to be able to move images of disks/filesystems
> around at the block level without mounting/creating filesystem and
> transferring with an fs-level application.
>
> If not, then possibly I can use hdparm to set the 4Kn drives to 512,
> which will obviously involve destroying their contents, but that is
> fine at this stage.
>
> I don't think the presence of a partition (as opposed to an ext4
> filesystem directly upon the LV) is relevant; I think the same
> issues would occur with a direct filesystem. I mention it only for
> completeness. Also, I realise that the problems would also happen
> without LVM. I just wonder if there is any workaround at the LVM
> layer, since that is already used here.

512e vs 4096 should not matter at all for LVM.  LVM and Linux at their
core work at page-size and that is 4k.

You should probably include an fdisk -l <lv> from the working system
and a show what device it is mounted from.  And a fdisk -l
<device-it-was-dd-ed-to>

Note PV =3D=3D physical device (a disk sometimes partitioned).
VG =3D Volume Group (a group of PVs)
LV =3D logical volume (section and/or entire PV's mapped together,
rarely partitioned).

If you dd'ed the entire LV over to another disk, did you put it on the
entire disk or inside a partition on a disk?

And if you put the partition on the LV after the ext4 fs then the
partition may have damaged the ext4 fs.

If inside a partition on a disk, then partitions on partitions get
tricky as I have found you often need to force a read/create of the
partition entries inside that device.  If you find the right command
and run it against the partitioned device (that has its own partition)
then you may be able to mount it (kpartx -a /dev/sdx1, assuming sdx1
is where you copied the LV).  Note this will not survive reboot, and
you will need to run it again).  The device after partition of a
partition is created would be something like /dev/sdx1p1.

If that is the case you may also have better luck copying just the
specific partition inside the LV over that has the filesystem and not
messing with the partition.

And if you changed the start point of the partition were the ext4 fs
is then there will be no ext4 fs were it is expected and nothing will
find it.

Note the partition on the LV means that the ext4 fs does not start
where any tools expect it to start and so nothing can find it, and as
such you need to get the partition mapping defined.
