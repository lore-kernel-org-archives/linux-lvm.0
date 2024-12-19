Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B5378F24
	for <linux-lvm@lists.linux.dev>; Thu, 19 Dec 2024 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734583699; cv=none; b=e+PA2+AigNcGdvkbiaMEtPygzbCzquOWs+YoFT90MQhs8yUJ7OyfCrF1+6Q12rXOu52nObpSLwFPTnm2Ld6QLVKfWj9WcyyGsX5U2XorVnhoB3wMKrPmBW6fzg/3QssnVWJF9Wjsq0HhWSlsGIt2vz9fM069LhK7knb28XMeP0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734583699; c=relaxed/simple;
	bh=MXsi2lAZ1VWXqxexLdyVZY+lvDGiStwX/5Hr3gN/GSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC/pKNV/T+IHWE3/e2qfhj83L4uR/U7SmgUzly8gJKC7bNROnY8PmmLN59ryMu4gzU4sYYH3kxSR+t+0XRI5qN2XYwPvAeA7OLerqPFEq9A1WH74rwe3MPJIAxBVzw5+ILu7sSOIvzXdAyhpTg8QEPlA/mUmm+vzcylNyoaWxEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SYWuJPCM; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SYWuJPCM"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-386329da1d9so155531f8f.1
        for <linux-lvm@lists.linux.dev>; Wed, 18 Dec 2024 20:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734583696; x=1735188496; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PkBHUlgEoBmBT3Aes5PnqsSG6lH6IGlVyUCdvGYRet8=;
        b=SYWuJPCMYHEvAHrU+gmVV77ShemOpT5Lq7rccY1Y4bcdM1mvsam1oMiCJ2XhUbwxNh
         jLlLssYEExGexAk23goLXw7Ni8ZRXqT36Dmdmer/U7MsSopm7xqd7qNh1Kc1L7X8mtxg
         NpSlwYeUs6Ed0fuqSnzSpIqYd6O/SV/QRH1xHjIasSjpPl6tu6axqM1673vh6kGsVXOH
         g3hbLuBp4Qfdge0Nqm3ZOiNP2DETgu65nrpZmOhEgmISTYzfaVrXctkliVysxgf6rXHR
         LNsf+lbJjuSB/hWHVMmzAaktWjYIJWwqpqi7V9WSARAXVAw4Jx5cBZASLn8c2UQqlg5v
         LYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734583696; x=1735188496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkBHUlgEoBmBT3Aes5PnqsSG6lH6IGlVyUCdvGYRet8=;
        b=eQRNJEj42LfyFeozbnrwH4J7/7zcTgAnTeMw1ll2Vz9Z2UYPex/nfJqPICpzBXMpx8
         +1/tfoPo30Ie25BYuNRC862kZW8JAy9z0YbxtZK8anKA34r/FmbNkPzjBWzCI+dGFZJi
         0+5NCCYoDYqe0tmEiasTX+AiR0VxFgFPAxl5b/qrAyE+qJh2UDr4r5Gm5+MXPNQinzBZ
         WU4+qFxDxTXB/Acy8KxVyQDrqNXJxcPh8slneb7Y1j86UTd4p10djLY0hqtqn4Nc9zx7
         UfxGdYr2fHvtvSp17RIsNhe5Zzv8GyPiQ8Io5IY35bY75HzRgyVKOGZ9XmpzBgtCncPS
         61/w==
X-Forwarded-Encrypted: i=1; AJvYcCUcSff1unLjgi4/LPr0g/CroXkV9uFpLfxmoNxYfJ8NAvtKDaAj71Mo+fyOAgETI3Oj9a41MAPgicM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKzKmBWOKCL/FXDFSzFWfx1+q4U6LSfSLePDboy76ysUCokS+r
	M74zWlOGGmwdqJXjUmQfO7wpn/D4VxPgxCW2RrlISq+bdSB6dhrfCOv1uY0//Vo=
X-Gm-Gg: ASbGncsoWIGBTHaetYWBMLpndADi2ZzAR8ECvVndL8q7qyMuBJE267V7GozXyNrZWmQ
	ofzIu4hEf5XnDdTQE3XOeXuu9yaSbCjDpoxIhITXSVSlum/dfGOlIyFC3ZNm8pyiDmoDHSgMMj0
	P8ViU1Mas4YaFSZU12N6UAIySvoA+/+5EHDhmNIdCLdpBgrCdLDe9PTaJza5kZZAS1rlrQWeWno
	UzlVcf5512h1/6Ncg0R+ofiGe7n4cvz86w7qA9FT3CBeW/Xa2r/0wcycO0ne9ryBiJBDk9j3kqe
	padP1+IbBnn+2EznyHbil5Ekoxup3KNirjlmT7H49TX29WxO
X-Google-Smtp-Source: AGHT+IEkq3dCsTGzTEPa5xhQohIlF2o2eBzIg/MpMX8j9T6cDBvLEAE25oTkm/HkMLp4tNj5rTwfng==
X-Received: by 2002:a5d:47a9:0:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38a19b37052mr1418406f8f.41.1734583695708;
        Wed, 18 Dec 2024 20:48:15 -0800 (PST)
Received: from localhost (2001-b011-300c-1872-7e57-58ff-fec7-948b.dynamic-ip6.hinet.net. [2001:b011:300c:1872:7e57:58ff:fec7:948b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cf4sm3714615ad.25.2024.12.18.20.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 20:48:15 -0800 (PST)
Date: Thu, 19 Dec 2024 12:48:12 +0800
From: Michael Chang <mchang@suse.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Karel Zak <kzak@redhat.com>, Zdenek Kabelac <zdenek.kabelac@gmail.com>, 
	Glass Su <glass.su@suse.com>, Heming Zhao <heming.zhao@suse.com>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, grub-devel@gnu.org, util-linux@vger.kernel.org
Subject: Re: is it possible to add a new filter to detect unusable partition
 types
Message-ID: <jcqrtifxjk2adtngyykvyoffh6ab3twulqra4ugq7satddqob7@rngyhl7nuyhk>
Mail-Followup-To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	Karel Zak <kzak@redhat.com>, Zdenek Kabelac <zdenek.kabelac@gmail.com>, 
	Glass Su <glass.su@suse.com>, Heming Zhao <heming.zhao@suse.com>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, grub-devel@gnu.org, util-linux@vger.kernel.org
References: <826b5136-7ee1-4664-98d6-a3441883f53e@suse.com>
 <43D73CB9-32E4-405E-93A9-E985C94F4A9E__33327.0934455626$1734427189$gmane$org@suse.com>
 <ec0d03c0-40b0-4719-a020-9bae7a3241ec@gmail.com>
 <yjiu3c3e4aknayawhw7lw52kev6fvp4wm6n6wte4t27hx3fr4u__21682.4523567752$1734439545$gmane$org@cc5bu2ij2ia3>
 <dbc7728b-352b-4982-a171-d8f177388a19@gmail.com>
 <hdqz3hun3f5ftfwvimlopkmuujimtz5ilovkuajqesy6p4a7jd@7w6nkryhr2y7>
 <860960db-bb66-453c-a392-1495690bb2ff@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <860960db-bb66-453c-a392-1495690bb2ff@t-8ch.de>

On Wed, Dec 18, 2024 at 06:05:54PM +0100, Thomas Weißschuh wrote:
> On 2024-12-18 15:44:45+0100, Karel Zak wrote:
> > On Wed, Dec 18, 2024 at 11:12:59AM GMT, Zdenek Kabelac wrote:
> 
> [..]
> 
> > > And in the same way blkid should expose installed grub loader - currently
> > > the partition with installed grub looks 'empty' with blkid....
> > 
> > The issue I see is that boot loaders can coexist with filesystems on
> > the same device. This can lead to unexpected warnings when attempting
> > to view the contents of the device using mkfs tools.
> 
> Isn't this specifically about the grub second stage on GPT systems
> inside a dedicated partition?

Yes, GPT has no unallocated space similar to the MBR gap in the MSDOS
partition table that can be repurposed for grub second stage, therefore
a dedicated partition has to be defined and allocated. A similar scheme
is also used in PowerPC, where a dedicated firmware PReP boot partition
must be allocated for the boot code.

See Also:

https://www.gnu.org/software/grub/manual/grub/grub.html#BIOS-installation

> There should be no valid coexistence with a filesystem.
> 
> So having a probe in blkid looks reasonable to me.
> 
> Not that it helps in the specific case mentioned above, where everybody
> is using --force anyways.

That's the reason I think adding such a check in grub-install doesn't
help at all. After adding the check, I believe the tools managing the
bootloader installation will start to use wipefs or enforce --force to
grub-install to make sure no leftover can get in the way. In that sense,
it seems like unnecessary breaking change to the toolings.

Thanks,
Michael

> 
> 
> Thomas
