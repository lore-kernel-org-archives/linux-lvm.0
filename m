Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE134190477
	for <linux-lvm@lists.linux.dev>; Sat, 22 Feb 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740240350; cv=none; b=o353fi6wgfRF9UbY2whB5CK52p8+TjfUObHcyxz/HxFHSgq+/p8Ps2SWKy/skUpxCaFhAJbHxLMWv9LzcXFfEig7ez5IEAXAy1OH9NCXecYl1TP7LCkdeR15Jl0lXinZxr8PIfLipd2ZJAU3F5m1eZBdUWRMy5RyjQSWIuRh2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740240350; c=relaxed/simple;
	bh=/FiJaijEveY2BURmxdyKzj6ukCb8dnWca3cqTSCGWos=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VG2FWuV8Gr6RK44rFDBDxKPbxHj53XC0n6TyH8vBTnN/UuF0H6k7JuCx9KaiPn3KF4M6cTE8IZ10XKmztwUyn9vbdrGEBYxrFK+/ljvjksU4pvzAG6umvGdJmdG9tlTAAbN4+Srd/3n0xGoO+eS7PglhmItsM44GYTxC8oBNywM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bcv4xm3H; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bcv4xm3H"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so28921895e9.0
        for <linux-lvm@lists.linux.dev>; Sat, 22 Feb 2025 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740240347; x=1740845147; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qlxxE6//APCPsZxsojjK9eXnMTGQNuCPCYI5GouRpt4=;
        b=Bcv4xm3HfucWIsO6OsvtFeKGCDgOfkCBYHESURTggYYdOzdrFwqWBVQiLrm6yugqk5
         N2Cib70ouSsJmA8Hrwk/KmLM183d/dOJQLncpcJF6NqKNnDER06YiMXclPNVJm5KijH8
         MBmCD45Z0Un7smBVizudEdFAfPJMC+yaKTSTCTU8VhrI6yDD6RMUWfgfkpUcAUB59XPH
         spt47rVhd+vJ4bsAZZgW0cpifAD3vvQABIM408OCzHWSH/tC+ab7Ak7inRRJKm+TS+2R
         vxNIDReesn5ezU1yThLaJFG0Cm+G2fBiyOlS8osrFLoMrjvhRiAjHu/TFCEygQCehAMX
         GClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740240347; x=1740845147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlxxE6//APCPsZxsojjK9eXnMTGQNuCPCYI5GouRpt4=;
        b=BG6Pu9kmN8uCvBRs4brw3MyAiQOToh1MbdtalotasYHRJmtuIYo0iDuIiLTJuV7FWv
         GMe7ZyuK1qLAEfTtSgv30vhCh1voT1O8hNBbFg3nG/mZmfl8byAs2tzJcbjOvNZ5DG+9
         ivDNf5HRTpFbsXeZ1iFBUf/n+i9bXKfJ2rIRwdeogOsPjyT+AGXmE2lWZUOQizmic6GN
         5ANNghBM8F0tG/zUPtmxAfBNLiQuo+NjSiftzKtwPVtR/wrQ/nIVXc+xkkZVKUDjt7Qt
         rLVl+55/rAgjPGlRX1nwnvnqk+sjEBXH061UdT8ozMOqIaUK09rUtXYZQ+E4Bj9Npy0k
         j/rg==
X-Gm-Message-State: AOJu0YxMVZEBNrIpOyVjmF6JPfaAkL+9kiYhUYJilcDUbxszuOh91FE/
	71WxssLeSF4X0qrQyrrUratL9dxXIqTKEuMMVfQV7gWYyhY/I3gQZhKpAm+Q
X-Gm-Gg: ASbGncvFwjK8Jt54NcuTvYwp1XTA9/gu+IRuXOlfwRFGA7BzH4NPl24kC6qYn3nNclN
	MJQ20s2hxmutV36zVfdDfC+2rsuZbmbEddnN5UdC0WasUxvs+xXAt1bzkKdp1UdYh3hCwURoqJZ
	sf4+IBPBbTZL7P647WvNY5CqN1het1lqXGlM27VgSwe652LKcHRYgAwaFPoEismq7Vf3Aa+PM+1
	pkaJtVvJ4UwDo3uCVao19wYh5NdqLZy8y5CNPO/xmHQh2o8X0DAyTfKiLq8q2eBq9gslxY5mOVk
	q0VILCwVsVAelizLcI0AaPY0aZ3pmzaklr5xsSGJCY0INSsOiFeLHkbtb1HGPmKgI1zH
X-Google-Smtp-Source: AGHT+IFdSAYeweTaUdAZvLmAqXDYV2OXvdpceBc4eswPxXjaiyuivxKGfDmQZe8eKWDyrBvySQkn7Q==
X-Received: by 2002:a05:600c:4f88:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-439ae1e6a2fmr71844855e9.12.1740240346936;
        Sat, 22 Feb 2025 08:05:46 -0800 (PST)
Received: from ideapad.fritz.box (94.105.127.6.dyn.edpnet.net. [94.105.127.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399c4ce768sm77242015e9.1.2025.02.22.08.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 08:05:45 -0800 (PST)
Message-ID: <75fa5ea9867b3b998c62693730e3f5bfa0a271a1.camel@gmail.com>
Subject: Re: lvm2 weirdness in Fedora 40
From: christophe.ochal@gmail.com
To: Roger Heflin <rogerheflin@gmail.com>
Cc: linux-lvm@lists.linux.dev
Date: Sat, 22 Feb 2025 17:05:43 +0100
In-Reply-To: <CAAMCDecz1tp3ErfusOc7U3j48-h+qSsGfBX1wRntd-hBh8BkKw@mail.gmail.com>
References: <fa068a4eabaece5fcddca5ea5adf0557f26387a2.camel@gmail.com>
	 <CAAMCDecz1tp3ErfusOc7U3j48-h+qSsGfBX1wRntd-hBh8BkKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2025-02-16 at 15:45 -0600, Roger Heflin wrote:
> The first thing I would do is change the mount line to add ",nofail"
> on the options so that a failure does not drop you to single user
> mode.
>=20
> Then you can boot the system up and with the system on the network
> figure out the state of things.

I wasn't aware of this option, but I'm not sure if this is any better,
right now I can just run vgchange -ay end exit to resume the boot
process, to end up in the Gnome envronment, if add nofail to /home i
stil end up in an unussable state because gnome can't load my user's
files

> In the old days I have seen lvm2-lvmetad break systems on boot up in
> bizarre ways.

I'm not sure that fedora uses lvm2-lvmetad, and google isn't helping
me,  any hits i find are for red hat 9

I wonder if this is relevant:

From lvm.conf:

 # Configuration option devices/scan_lvs.
        # Allow LVM LVs to be used as PVs. When enabled, LVM commands
will
        # scan active LVs to look for other PVs. Caution is required to
        # avoid using PVs that belong to guest images stored on LVs.
        # When enabled, the LVs scanned should be restricted using the
        # devices file or the filter. This option does not enable
autoactivation
        # of layered VGs, which requires editing LVM udev rules (see
LVM_PVSCAN_ON_LVS.)
        # This configuration option has an automatic default value.
        # scan_lvs =3D 1

I had no luck on googling LVM_PVSCAN_ON_LVS


> I disabled it on my systems(and the 1000's of enterprise machines I
> used to support) because it caused random PV's to not be found
> sometimes.=C2=A0=C2=A0 Typically if something causes a pv to not get foun=
d it
> will be repeatable on that given system(likely some timing problem).
>=20
> The only useful thing it does is it speeds up scans when a disk is
> spun down and/or when you have 1000's of disks.=C2=A0 But it does not
> speed
> anything up that much unless you have a huge number of disks that are
> spun down.=C2=A0 On large san systems the testing I did said without it i=
t
> would take 2-3 seconds to scan 1000's of disks (worth the wait given
> the random failures that caused havoc), verses immediate.
>=20
> And tiny changes in lvm/udev rules have changed it from working to
> broken.
>=20
> On Sun, Feb 16, 2025 at 9:11=E2=80=AFAM <christophe.ochal@gmail.com> wrot=
e:
> >=20
> > I'm at present fighting with LVM2, for some weird reason I can't
> > get my
> > lvm volume
> > to be activated & mounted at boot resulting in me having to do
> > "vgchange -ay" at boot (after I'm dropped in a shell & prompted for
> > my
> > root password,to make debugging even more troublesome I can only
> > mess
> > with this over the weekends, i've included the lvmdump to this
> > mail,
> > any more help would be very welcome, as i'm at a loss of how to
> > proceed. this might also have relevant information.
> >=20
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2338735
> >=20
> >=20
> >=20
> >=20

