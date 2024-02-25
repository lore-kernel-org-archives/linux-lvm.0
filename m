Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908B9445
	for <linux-lvm@lists.linux.dev>; Sun, 25 Feb 2024 03:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708833595; cv=none; b=ExwERKeMMJ8gsTwmk11HYN/axLkQpJhNZ7CtAeW5snsM8zLnjUu4XizfTDCVYdpFxwMRBN4ukL/1a8G1Oc6rQzx4ihfqTzCDyifFuKOUeiH7XzXr/e2KnnqUn79nx/1NkDur1QjL71t48Re2tZilfVSmhKkw7Xw9+i/9z4Pix0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708833595; c=relaxed/simple;
	bh=DDqzqu4Q2rFjUaOa1OQ6cesDHO5AHIc6REJw9EJUXkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=N0RRgZlmS94hXowkzaN53zSWZk3ocZMbf3sCp0uZHUUXbC9dCSiARM/NMRoJiRTTIdbaaIBh5ngkkxOUiPTb20TibKT9wdTIx4VFzrbp8k++WFhf7n+WNcXBWpDIjXo0Ew5YMCYZW0Zhh8Fu/2uV0VAbB8DLCz72Ypg1vNVtNUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6cJO7B2; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6cJO7B2"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d26227d508so20545171fa.2
        for <linux-lvm@lists.linux.dev>; Sat, 24 Feb 2024 19:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708833591; x=1709438391; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDqzqu4Q2rFjUaOa1OQ6cesDHO5AHIc6REJw9EJUXkA=;
        b=l6cJO7B2pyjE1QnjxzmSFFth40G8FINcL8FOv08ycyj/2SfsFoijSMK76CTVRx91yc
         D6IR+2y0iIEiNwIabjzW3JOHuhz4rYPJJwmrOFYdzIpt/tUeFVWY6KRxD5WnP3cMKkYz
         iJbOrqan9E1uMNwbB2a2ERgdv8FqMLzRUpm5s+w7xisushapsea6ri96vute8FVUB0rP
         GsOz/Evur3/XQHhaxeaHVkIT4O+tjJd1ofFPTWuyWcOyMkzDSzq/Fcfkd9OFw7X6C/RE
         oUBX+JUOfO5DDK4oBICmwV23B+akvVbJVOMoZO29yCmzCSvF0TMCGnXrP3l1pBThHJI1
         HYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708833591; x=1709438391;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDqzqu4Q2rFjUaOa1OQ6cesDHO5AHIc6REJw9EJUXkA=;
        b=iHg4ioZmkjf2BFHgjak9mBRLBpoPLfaQGZxpPk2pr6ahItfcDQJo6XHi2TuSzec6pV
         BrdE3ytdrlTVMWyayvlMAVT8SFNyrESd1a74ROb9Ngai94qc2j8iDv/tbCHqphsWqEOA
         HxeqOtQlOmbm115hx6nGgkJQ3pYpLXr65zEhyXZw8C8UL2J0eSj2th0GiOqpifKcJGt7
         QjJ29SQb6XsVYaXh9H5eNlUhgsqBaSts02HNvay4Gy+Hnk8IZlEnWL9XEHKgecoillKg
         jOUoGVm4dz/ltjD+RroVZN7uAMg4ViKpCVo+F6EmdPyjaMUCuT1+tZMRTCbKmtGQQMoC
         8vKQ==
X-Gm-Message-State: AOJu0YwUc5iPBA9LQsWOC7ibtWHIIORpFLH/TKMkkU4VhMKVkkwpcSFo
	gP65VZFFX9UScBZK+amCpekgs8ZyTYXRZasA1zh+2LcltrOsivybzqn9ZEIVRLQ52kGpYATaev+
	UJ8nfGyX4Nfhb+TJz/yVZZRz7ax+AUhP+
X-Google-Smtp-Source: AGHT+IGxLGoRJbmDMuy53Prh/t5WYVlNioTH5VRBFlFFo4phVBroLBIKX0aDPgyHGdZMc6s/S7Nvb5240wEo5ltDsGU=
X-Received: by 2002:a2e:904a:0:b0:2d2:71a3:d29d with SMTP id
 n10-20020a2e904a000000b002d271a3d29dmr1771342ljg.15.1708833591380; Sat, 24
 Feb 2024 19:59:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOCpoWdaXbNw8OhW5vqN2HThzwd+sV-HJ8CgGZqyWGBY+gVinA@mail.gmail.com>
In-Reply-To: <CAOCpoWdaXbNw8OhW5vqN2HThzwd+sV-HJ8CgGZqyWGBY+gVinA@mail.gmail.com>
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Sat, 24 Feb 2024 22:59:40 -0500
Message-ID: <CAOCpoWdiLXbjstLS1Uw2dMdk08_zrUr2b085ze=rCF9c3iX40Q@mail.gmail.com>
Subject: Re: error while submitting device barriers: BTRFS+LVM read-only on
 newer kernels
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding some context, I bisected the error to being introduced in
kernel 5.19.0 while 5.18.0 works just fine.

On Tue, Feb 20, 2024 at 10:13=E2=80=AFPM Patrick Plenefisch <simonpatp@gmai=
l.com> wrote:
>
> This is a very weird error I'm getting. I have a system that I'm
> migrating from Debian 11 (5.10 kernel) to Debian 12 (6.1 kernel). As a
> part of this process, I'm dual booting both systems, with a LVM pool
> that contains three relevant LV's with three BTRFS partitions. Two of
> these BTRFS partitions (single) are working just fine. The other one
> (also single) only works on 5.10 kernels. Whenever I boot it on 6.1
> kernels, I can mount it just fine until I trigger a write, either direct,=
 or
> `atime`. Then the BTRFS partition is locked `ro` until
> a reboot with this in dmesg:
>
> BTRFS info (device dm-75): first mount of filesystem
> 00d78dac-3576-435d-b575-61c3d951ff66
> BTRFS info (device dm-75): using crc32c (crc32c-intel) checksum algorithm
> BTRFS info (device dm-75): disk space caching is enabled
> BTRFS info: devid 1 device path /dev/mapper/lvm-brokenDisk changed to
> /dev/dm-75 scanned by (udev-worker) (11442)
> BTRFS info: devid 1 device path /dev/dm-75 changed to
> /dev/mapper/lvm-brokenDisk scanned by (udev-worker) (11442)
> BTRFS error (device dm-75): bdev /dev/mapper/lvm-brokenDisk errs: wr
> 0, rd 0, flush 1, corrupt 0, gen 0
> BTRFS warning (device dm-75): chunk 13631488 missing 1 devices, max
> tolerance is 0 for writable mount
> BTRFS: error (device dm-75) in write_all_supers:4379: errno=3D-5 IO
> failure (errors while submitting device barriers.)
> BTRFS info (device dm-75: state E): forced readonly
> BTRFS warning (device dm-75: state E): Skipping commit of aborted transac=
tion.
> BTRFS: error (device dm-75: state EA) in cleanup_transaction:1992:
> errno=3D-5 IO failure
>
> The only thing I can seem to find online is posts warning that you
> should backup your data. But that clearly isn't the case here, because
> none of the devices in the lvm pool are giving smart warnings or
> reallocation counts. Further, reading is fine, I can read the whole
> disk. Finally, I can just reboot back to the 5.10 kernel and it just
> works again. 6.5bpo kernel also exhibits 6.1 behavior
>
>
>
> I had originally thought this was a btrfs issue, but peeling back the
> layers with people in btrfs IRC, I reduced it to be a LVM/DM error, I
> think.
>
> LVM setup is 4 HDD in a LVM VG. A Raid1 LV is created, and a nested pv
> is created a second VG is created using that LV/PV, and a final LV is
> created on the upper VG, That LV has the btrfs filesystem. However,
> there is something else going on, because I have 2 other partitions in
> the exact same layout, also with btrfs that aren't exhibiting this
> behavior. What could be going on here?
>
> Patrick
