Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E087E760
	for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706131052; cv=none; b=jg/reSlxv5vEkdidxkJLw5uhaAkyyOlNaeGmz6XP8oVI6O5jaMEta87uCDUyHuRzgC+IeN2C12RiF1/ZA6zryfsfr8177W85BMPeqYgUJRt9WU7lkDOU3n0JTaq7Io34QABkJgN87g6CsK3fcrXBsrnAUeEPFpVP69QM5czPCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706131052; c=relaxed/simple;
	bh=iQJTKxELY7UtJKsG8u/t1PrYFAnblyq6VOQj07sKtaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uM+dy1vZ5duf4J0kypzOi91jfAjhOnoh7RccK/7PVMjA7awKtxW2cYEUHdR0HRE1tJvgbZSJFP3XCXmvjPupgWcuJfROb7neJfTIdjucv7pdhtNZ61BWbi8mu6lWAG1YA9VNdu1MheulMgRpwZtkZJ9Wt+MdnKa4Xfi4jGDkYEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7QM1cly; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7QM1cly"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7ba903342c2so339493039f.3
        for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 13:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706131050; x=1706735850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M9QDm7BbBZCcJbvgeMO3aeVFOgyZondoruQhHCcBJo=;
        b=H7QM1clyTY7Ur4v0aNxm22Z3+zRex4E7hcp/GV9rS4hfCZIu9VTw9eUYCvo9nvtoC+
         f+ZAJDxubZWaAdfoZal36ZZrD1lPM0rYX4cIH2CW/Ze1bO3L+B7h90vMSpSKznhSfq8x
         w5h+OlYq5KM3od0gX4bfFazqgWKHIW2+dOT31RIeYmxqA3WakTlqMcx6MXh4YEo1UgPX
         VXuBvAraRIvYut8PbBau93Ch5px3vRafWjmzoHUXnahL97fudWxfL0hU9mN3ryJuGdEa
         AQEQ69r5e6j3UYVLqtATLc829tnK4VtLUGYI9i4nQHRgSlNc4nES3v4jZw+wjkC/o7K0
         R69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706131050; x=1706735850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M9QDm7BbBZCcJbvgeMO3aeVFOgyZondoruQhHCcBJo=;
        b=uNMRN/2NMkA4Scf7QzT5Bi9Cih5Dk8WMcioD+Ne/2PAH0fa33Z2CP7bN3iMe9guipC
         CdeCjtn1VSmmKMvky8MNE/Ee486oSpqJ8sgX7UrtGPKHnksVQCF42oAk07Nu2AM7e3+R
         OAo5226LqejOFuX7C+hxQRv2KgGC682OW2X4opCSEg8QxmstKTNqrVm7RecxzH6Bh7tb
         ssclZJc5tskfSti4GEf0p5GSzriSGeUcD5ZRWccxXbKqJcgHeoQvEmZYFBYHGrP4qWf2
         6FP2lG5xk/5m5k6xROnuvvG/2ZsbrxrMEleXThqDMWRIlxBqPqp11Ez3PXFAAysijt6e
         68ug==
X-Gm-Message-State: AOJu0YzAIGMNAxEM1RHvuGnFh3l+AYUo3bNY34+6L6ju5YCoJmAofFH6
	D5S8V37LV11eT6jsTH0VVJk9a9eltjjJRy+onOC6LFdzoAMOicGfJKfxRucpaCKKbW9a7wtgkAM
	mbsK/N9ElVDrHMojglJ4KyGH+9GPgAObp
X-Google-Smtp-Source: AGHT+IEuEPNBXhvdNBzt8HpAMHZvd5EJoO0U5yu+kazRJp9Qsrb2gjNvquy0nqeqtKPvAYSZRT1F6Bi4iHuQSaoWzss=
X-Received: by 2002:a05:6e02:6ce:b0:361:acd0:8148 with SMTP id
 p14-20020a056e0206ce00b00361acd08148mr68572ils.53.1706131050422; Wed, 24 Jan
 2024 13:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com> <87y1cp9lwi.fsf@vps.thesusis.net>
 <ZabjW4HWOSfy8sRN@mail.bitfolk.com> <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
 <87frywcapk.fsf@vps.thesusis.net> <ZatP7wb9k5jzV59y@mail.bitfolk.com>
 <87v87nnauh.fsf@vps.thesusis.net> <ZawzYqFyvDu8PgZ3@mail.bitfolk.com> <8734umiu1v.fsf@vps.thesusis.net>
In-Reply-To: <8734umiu1v.fsf@vps.thesusis.net>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 24 Jan 2024 15:17:19 -0600
Message-ID: <CAAMCDed_g0Hy2gTaAwo=PrH6dMoxo9=p1LwReWvU6CHbdxo-TA@mail.gmail.com>
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
To: Phillip Susi <phill@thesusis.net>
Cc: Andy Smith <andy@strugglers.net>, linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 10:19=E2=80=AFAM Phillip Susi <phill@thesusis.net> =
wrote:
>
> Andy Smith <andy@strugglers.net> writes:
>
> >> Try mount -t ext4.  If that doesn't work, see what e2fsck/tune2fs say.
> >
> > I've not needed that before and my instinct is that if it is needed,
> > something has gone wrong. But in any case it did not help:
>
> If the fs is listed in /etc/fstab, then mount finds the fs type from
> there.  Otherwise, you have to specify it.  At least, that used to be
> the case.  This may have changed at some point and I still do it from
> mussle memory.
>
>

I have never had adding the -t <fstype> be necessary and/or work
better than mount without a -t even when the fs is not in /etc/fstab.
 That is going back at least 15+ years (note rhel4 did not need -t,
and it is old).

The mount program seems to find the type of fs (from the first few
bytes on the fs) and handle it, and if it does not mount, then adding
-t <correctfstype> had never made the mount work (usually because the
fs is seriously damaged in some manner, or completely gone).

So if "mount <device> some-location" does not work, then either the fs
is corrupted (for some reason), or the partition table changed making
it appear to be corrupted(data at wrong locations), or the fs module
is not loaded and/or supported in the kernel.

And I have debugged a lot of fs missing, and in the environment I am
in it is usually someone "fixed" the partition table start to be
different for some reason (or removed the partition table), or put a
partition table on top of the fs.

You might do a "dmsetup table" and specify what the lv names is and
maybe a ls -l /dev/mapper so we can see what the partitioned lv dm
mapping looks like.  and a fdisk -l against the partitioned lv, and a
ls -l /dev/<vgname>/
