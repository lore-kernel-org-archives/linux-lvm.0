Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57C64C
	for <linux-lvm@lists.linux.dev>; Fri, 26 Jan 2024 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706232130; cv=none; b=oGW3Op3GME+hCtd3VXzbPNhSpEj0axY06qcfwwk/uQobn4aYCqGS+NMkNyG6qw1JtJ3cyBm842HjYevfjrLB7k++UwS/dR/xXdbVnm8VqP3j1TG5UW0T6GUUlVslCldRuAkPmfdLVnTNhjfpWZCzQ5Cz60H/Yoi8SdLGhBN8zKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706232130; c=relaxed/simple;
	bh=gxH/GWFiVov3GxHVGxB52u4w3pWiGV0vNbHi93t/pyU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XEBA0PZ70/V+oxAgguSZfpChyzm1QFP5fvxjzIGZoszkaWVnURII3KhvHSqNCy586OzMkOJjztRnkyPWdF6YufgCJvxncXoqF2/D2ojuFV99YiGTR2JegkBDGh92cvvn3qR+4/MVM4Y/oWJmKoeutFT/rx/fxppiucey8YDjQDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=efficientek.com; spf=pass smtp.mailfrom=efficientek.com; dkim=pass (2048-bit key) header.d=efficientek-com.20230601.gappssmtp.com header.i=@efficientek-com.20230601.gappssmtp.com header.b=2GRy2DUn; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=efficientek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficientek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficientek-com.20230601.gappssmtp.com header.i=@efficientek-com.20230601.gappssmtp.com header.b="2GRy2DUn"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5ff821b9acfso67849077b3.1
        for <linux-lvm@lists.linux.dev>; Thu, 25 Jan 2024 17:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=efficientek-com.20230601.gappssmtp.com; s=20230601; t=1706232127; x=1706836927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XlEMEO1AApZnheMRehcFLxqvarl5mahHQ47BUyJGUy4=;
        b=2GRy2DUnYExoeY9cGutZ9gg+FA1RXnQJN0uLpeduH+/2pyz1LXWWQAkgoG/zW3QMm2
         i25WtVekNHK5A2TqfARDv/lhwI0n7tnTosRbIo9DZbzKwqcuiRv0PD9xtT8YGeyPeby4
         U97Om6MedYb/pteKBnwcGDZUWYFEEzWhrGaQT29SCKCzYzlaVbICz7ihqqW6cMYRsKEm
         v07uMClmAfBvGSzj+qA6zEaExFh7HGlZ+Jt5k2pKgn8xNbHaQoPH1iqxfjY6W+jwN5xO
         Xahg5lhr4iO4pt8LuMG+Wiwkk77i7eoqOfx0EN9uRRijX40oxT7IikL6T0GTC8glnV0+
         YGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706232127; x=1706836927;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlEMEO1AApZnheMRehcFLxqvarl5mahHQ47BUyJGUy4=;
        b=IPUdnwzCyveMJxCjF7YKVe9HZoQGaA2d8pl7bwk4fBv3CeJMBAddq60SWCCz2K9KOI
         S3TuFXzIdR0qE0QBn0O0XvV4uWVqokeq5VFmZdJdTQZVCFaiyEXnBqPH2JoLJ3M9eIL+
         +50fV+/Rz/xnkASMaEyfThMj4HkikiiWPy96QYeAfic59UtsfZV8v2HY+AKxFMPstlC6
         nxseRU5JQzd6VYI55pg9tTxejq41wZgE9rO47+hxNO0i8E6pWnxAI2Kj/zrZ394Wfu4e
         ASEZgybLVQjT6FvhCSye7wbAp+sWxHwXhlMt6+RuFZ57hiDJRKQnxwZi9GCZD4iNE9+V
         eKhA==
X-Gm-Message-State: AOJu0YxMcQvYIUlTb+luOTaGNccDzrXOazntubOGk7BAYlYVJKe3fErd
	PzZnhqhF4O+gl9iEqCKCD/jiOuw1z9iPPaoK/lofeDHaDlgD/5mSc6wBoJO0ig==
X-Google-Smtp-Source: AGHT+IH774KlZYXp6iMD2BSd8MeNmCpzOIhGb83F5dwPu72nnWkzXbXM+Q/8GqCQR2c9BozLaT//sQ==
X-Received: by 2002:a81:9849:0:b0:5e8:8890:8afe with SMTP id p70-20020a819849000000b005e888908afemr654488ywg.78.1706232127072;
        Thu, 25 Jan 2024 17:22:07 -0800 (PST)
Received: from crass-HP-ZBook-15-G2 ([37.218.244.249])
        by smtp.gmail.com with ESMTPSA id fu8-20020a05690c368800b005ffbee10d14sm38761ywb.10.2024.01.25.17.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 17:22:06 -0800 (PST)
Date: Thu, 25 Jan 2024 19:21:55 -0600
From: Glenn Washburn <development@efficientek.com>
To: Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <20240125192155.2dbab92c@crass-HP-ZBook-15-G2>
In-Reply-To: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
Reply-To: development@efficientek.com
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jan 2024 07:30:51 +0000
Andy Smith <andy@strugglers.net> wrote:

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

I've had this issue before and there is a very simple solution. It does
not work at the LVM layer though, but I suspect what you really care
about is having it work at the software, as opposed to hardware or
firmware layer.

Since the software that created the image did so assuming a 512b sector
size, create a block device that has that sector size. The trick is to
use loopdev to create a layer that does the translation from 512b to 4k
sector size. See the "--sector-size" argument to losetup.

Glenn
