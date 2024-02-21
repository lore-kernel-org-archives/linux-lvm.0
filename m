Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62946A4
	for <linux-lvm@lists.linux.dev>; Wed, 21 Feb 2024 03:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708485193; cv=none; b=rW44lsOk4nW/NWVqUjBz8/L46Uyd3GIXgBs98laG1h9xd4ebuTRmolgjPC4lQXJ9LiQ7vbxUgdIw5b6KsBMnJbg7wel0sR8n88Ga6Aj2FeVPCmhmm2sSIB9GiiogArC/SEdTnOV06H3TMvWyRQHYvcoB99NDpyN9B4BCbXWzYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708485193; c=relaxed/simple;
	bh=0fwShsImcitTcJuNzYXEJySRiJCSDRBVbY/huc2DyDc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WbMyRjAeXgsz/4d20sJ/hEyU0eOuvxyx+lPIjF6aedQtgWmLYKqFMAazquac82qJenxsfu0DE93DxAQVKNx1RylAPWyRypCpX9+Ol5WhIajSixaAjEFNgsTtelXkzmmrxORktOSoS9xhpV6LjP9XZf8nbhVncPqGARuQWIANwz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl4KLs1P; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl4KLs1P"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d244b28b95so22055991fa.0
        for <linux-lvm@lists.linux.dev>; Tue, 20 Feb 2024 19:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708485189; x=1709089989; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0fwShsImcitTcJuNzYXEJySRiJCSDRBVbY/huc2DyDc=;
        b=Vl4KLs1P7CNBLCnAkKZaHISwAsGN3rbTVgt1EFORuk+SV3HNtIibcHCmXu4tfAxBNX
         EkWZGwSiFJwC7V8QNRL7DbH6PEW5y/6m/WDp0p7TxxxMKIPjQnWb1Z5pojgpA1ueIAm/
         X8Iyix5Sl/B6UEm4HfMlf7fxJGZRafJetnsAHCnAjgsWziuaBALcgEcqb9X3SQjU/kb4
         vqdxu0h59FTlgBlC3VA1QuiKcIFVNsFpIMxUZN1faL4ZeouqstRFSWtWJSgd/1PLgWDs
         hDeAIYZ+xVvycU8LaNWAH+PIj2khhWGLC099RxoMQ6cxieX0REOz8bOO2TAJA7wYjSbj
         e3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708485189; x=1709089989;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fwShsImcitTcJuNzYXEJySRiJCSDRBVbY/huc2DyDc=;
        b=cMOLvizUl64BzF/MJgqEZkdo4vo8tPybwpSq+Qx7zqGb0FAH+S3y3Nj6vB98MhtoJq
         5my9WI8wGioFDhggkrmYrH9viL0bAh4Q97srmgJpKRaMyAMpM5bvbdvdxHBRbr+NcqDk
         G3RcfulLYqrWNyla3JIyjTsAFOszr7QKYBLu+yt4F4iOgVhs+am00q4tBAp1GGjL4Jsd
         ppY51tGkAyM6paV44QjAQ0RCb4NVyDdBdRu2iInYJQPdUIJ+W73+efAQ/DqjXROyaZ+A
         VOc5vZfT3UyHUTtqN5Hq5ZqhzXDdDRarI+hV3aMaHUURNpAWZNgKdiRykgZjC9ABYJvd
         ARCg==
X-Gm-Message-State: AOJu0YxGV+9FXwdsj3pdPru7dOkUmj9XNRC52oRmgHX5A29ocNGFwiV4
	5sPyEYTRTJdS0HzspN8d9fJQeKm7zcU4NqNR9CVmH2H+LmXfl2gjItgytz3iRGnOU9TClI2oc7e
	IVLBZ8I2XYOaIPb35K8Y22cfHRqYW/F8JzI8=
X-Google-Smtp-Source: AGHT+IHitOgqt172Mi2tXnAGdPZYx9jQYmsuhBZdFzw/0PRJXjhidoRXfdUNYZWYvzbX0dUcRRJ7U+EMf5V3ltIWZNU=
X-Received: by 2002:a2e:8216:0:b0:2d2:39d0:a588 with SMTP id
 w22-20020a2e8216000000b002d239d0a588mr5098868ljg.5.1708485189037; Tue, 20 Feb
 2024 19:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Tue, 20 Feb 2024 22:13:09 -0500
Message-ID: <CAOCpoWdaXbNw8OhW5vqN2HThzwd+sV-HJ8CgGZqyWGBY+gVinA@mail.gmail.com>
Subject: error while submitting device barriers: BTRFS+LVM read-only on newer kernels
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is a very weird error I'm getting. I have a system that I'm
migrating from Debian 11 (5.10 kernel) to Debian 12 (6.1 kernel). As a
part of this process, I'm dual booting both systems, with a LVM pool
that contains three relevant LV's with three BTRFS partitions. Two of
these BTRFS partitions (single) are working just fine. The other one
(also single) only works on 5.10 kernels. Whenever I boot it on 6.1
kernels, I can mount it just fine until I trigger a write, either direct, or
`atime`. Then the BTRFS partition is locked `ro` until
a reboot with this in dmesg:

BTRFS info (device dm-75): first mount of filesystem
00d78dac-3576-435d-b575-61c3d951ff66
BTRFS info (device dm-75): using crc32c (crc32c-intel) checksum algorithm
BTRFS info (device dm-75): disk space caching is enabled
BTRFS info: devid 1 device path /dev/mapper/lvm-brokenDisk changed to
/dev/dm-75 scanned by (udev-worker) (11442)
BTRFS info: devid 1 device path /dev/dm-75 changed to
/dev/mapper/lvm-brokenDisk scanned by (udev-worker) (11442)
BTRFS error (device dm-75): bdev /dev/mapper/lvm-brokenDisk errs: wr
0, rd 0, flush 1, corrupt 0, gen 0
BTRFS warning (device dm-75): chunk 13631488 missing 1 devices, max
tolerance is 0 for writable mount
BTRFS: error (device dm-75) in write_all_supers:4379: errno=-5 IO
failure (errors while submitting device barriers.)
BTRFS info (device dm-75: state E): forced readonly
BTRFS warning (device dm-75: state E): Skipping commit of aborted transaction.
BTRFS: error (device dm-75: state EA) in cleanup_transaction:1992:
errno=-5 IO failure

The only thing I can seem to find online is posts warning that you
should backup your data. But that clearly isn't the case here, because
none of the devices in the lvm pool are giving smart warnings or
reallocation counts. Further, reading is fine, I can read the whole
disk. Finally, I can just reboot back to the 5.10 kernel and it just
works again. 6.5bpo kernel also exhibits 6.1 behavior



I had originally thought this was a btrfs issue, but peeling back the
layers with people in btrfs IRC, I reduced it to be a LVM/DM error, I
think.

LVM setup is 4 HDD in a LVM VG. A Raid1 LV is created, and a nested pv
is created a second VG is created using that LV/PV, and a final LV is
created on the upper VG, That LV has the btrfs filesystem. However,
there is something else going on, because I have 2 other partitions in
the exact same layout, also with btrfs that aren't exhibiting this
behavior. What could be going on here?

Patrick
