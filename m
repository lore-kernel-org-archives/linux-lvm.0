Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A7C1FCCEA
	for <linux-lvm@lists.linux.dev>; Sun, 23 Feb 2025 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740302436; cv=none; b=sMrjI3UiUVAUR0Y1G2uFDcKVR9c3FWjOb6RazgJCaNwqubYjyKDdPCbInXan6juUkHPHaDPVRTvXiE0CXUJCUgqEpVOMH84FqpwxorQBh9SrQBb+sqJX1ZUQ2gw2OfQSmucxnGxI2Ffn62wWsmsdNHEesOfCaljZ5TduRRNPdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740302436; c=relaxed/simple;
	bh=PBZ1Ib4qZGuiyKPaCy+tdaHpc9fj90HCWPMprAZE3XE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=It2PG1CwBr6R2GyoUzAmk/E4F+Ed42wyeE+HzfCbDfjuYexk3aweYnFKE/A6sLNRrWNIDAEnsympu8/rfy+yAifafyxDiQs18/56+6SB+/uj2Mol22McM3ngvv4Ruft3L/mFrH7/GO3ZTmncrjFfpZoLDnFmaEn2k5F9BMgob5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJFiAiHH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJFiAiHH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f488f3161so1806032f8f.3
        for <linux-lvm@lists.linux.dev>; Sun, 23 Feb 2025 01:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740302433; x=1740907233; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3mjvJqYFFBvONuTg+dcoMRoGyCVcOu6LCEJr5ydLDBU=;
        b=FJFiAiHHxKw1JYwxS2KySrNayqA8q5xT5o0VEugwPDm/9Nq8P8U6C/TEpp2e60gFjL
         f4Nf2yrCllVqLAQYLnesX8W1iwr0+cLi/f7w56/rzw78mZUIeDXfEFPan0EBGSQJRKPa
         cmn3biX4zwBwUu3zmAhDpKzS/joiKMQcbNjFGcUVyYcUygNVUU8wmRYCMTzawLOxeLuQ
         HIyuOlhCKAwSaI0NUSVz71Qv0JdEYFuAVvi4HqEp5y/SOOElz/3SmGge3mGFZQwJLf2/
         FTOY6xfUq/7mKfbERpuc49r8ooP4ba3sIZhRrIHv1xrYTTyOQZN7gG2GiPBunMctNL1G
         UfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740302433; x=1740907233;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3mjvJqYFFBvONuTg+dcoMRoGyCVcOu6LCEJr5ydLDBU=;
        b=MVliDYMxNdP9LJRRnUoiPuB9tlNwJJ1jSIma0x7YcSCP+uJttJA3Xyr2LjwhUOpEmA
         ff24g+5YJeaBFY8JZJCBKv6r5eMJ5zfsCKbfokTfHBipnwpfhm7dxCOHDvQJzKLNUpg6
         pvMI+3CVTvgITe+arhkXBmrzq5A9Ssgoi0ihKR9mJuSX1eICBFZ+lrSbtiZbv5oV9HMB
         3kUyfMy664bsAnfdBvgRjGtPgzlyEy/sbX49Nj3KN0Eci1S6eqUvBaehj4j4xNb7nB89
         ooTkqdanRTtocCv+5UFY2Bxue9Jny4OL75zlIGxb5xsWLjKuBOl8FZTVg+OQpyHtBNfE
         640g==
X-Gm-Message-State: AOJu0YzmNfpUxn62oLgI9se2rRySlG8JVNjXsKnEFXeOT33AIMHavYGX
	NA7pmDS8LU50QDfotwJotL2zedBcIRfYp5aJABbibhUGOyViAFoO
X-Gm-Gg: ASbGncu69lxpbSoWcK/83P4Ol8i+Sn5IyUtNBmWF/l9rYi2Ng02jPw7er9Hgh9lC2c8
	fYX6ZqNt4kDngeZWCXl4C3LsRnfod5HXvmwFbN7mGLB5RXOsyH2jWlTekngPfrJgzWU68qF+CAa
	O2rE3NqtNTwywGGEbK6M70tf6LueZH1J6U5DOGdjv3WaT88vCfF7yGCOO84GXQY7+wDogChbvjG
	2AMlLuOX7tIb5aEIEW8efamHQGwjiJMjPVWWjLQeyVB8om+9b4sEL7+U+KkbM3yEuv/58vj7id/
	3zs6Sc5yJR9U9pmaImd0+wpxPEyqKlQ/wI5OQus0J3CAesTl0fvBdlYgawlXFoIiF3Uo
X-Google-Smtp-Source: AGHT+IFJAHo4/cAF9yKui8cYrOboSPXKjEPjd5jFSncoV4Y7tmvYzx2qfNubFVTf7fkIJ+3KxzZQaA==
X-Received: by 2002:a5d:47c3:0:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f70772b51mr6700777f8f.2.1740302432555;
        Sun, 23 Feb 2025 01:20:32 -0800 (PST)
Received: from ideapad.fritz.box (94.105.127.6.dyn.edpnet.net. [94.105.127.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02d8859sm71295455e9.16.2025.02.23.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 01:20:31 -0800 (PST)
Message-ID: <c3a94f90644d15fa41f176403051dacc8e5b58b3.camel@gmail.com>
Subject: Re: lvm2 weirdness in Fedora 40
From: christophe.ochal@gmail.com
To: Roger Heflin <rogerheflin@gmail.com>
Cc: linux-lvm@lists.linux.dev
Date: Sun, 23 Feb 2025 10:20:29 +0100
In-Reply-To: <CAAMCDeef0QwdV3WX8X56K2TrxYuXkdV7Y=xPgj3w+geSUtnhVA@mail.gmail.com>
References: <fa068a4eabaece5fcddca5ea5adf0557f26387a2.camel@gmail.com>
	 <CAAMCDecz1tp3ErfusOc7U3j48-h+qSsGfBX1wRntd-hBh8BkKw@mail.gmail.com>
	 <75fa5ea9867b3b998c62693730e3f5bfa0a271a1.camel@gmail.com>
	 <CAAMCDeef0QwdV3WX8X56K2TrxYuXkdV7Y=xPgj3w+geSUtnhVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-02-22 at 10:55 -0600, Roger Heflin wrote:
> On Sat, Feb 22, 2025 at 10:05=E2=80=AFAM <christophe.ochal@gmail.com> wro=
te:
> >=20
> > On Sun, 2025-02-16 at 15:45 -0600, Roger Heflin wrote:
> > > The first thing I would do is change the mount line to add
> > > ",nofail"
> > > on the options so that a failure does not drop you to single user
> > > mode.
> > >=20
> > > Then you can boot the system up and with the system on the
> > > network
> > > figure out the state of things.
> >=20
> > I wasn't aware of this option, but I'm not sure if this is any
> > better,
> > right now I can just run vgchange -ay end exit to resume the boot
> > process, to end up in the Gnome envronment, if add nofail to /home
> > i
> > stil end up in an unussable state because gnome can't load my
> > user's
> > files
> >=20
> > > In the old days I have seen lvm2-lvmetad break systems on boot up
> > > in
> > > bizarre ways.
> >=20
> > I'm not sure that fedora uses lvm2-lvmetad, and google isn't
> > helping
> > me,=C2=A0 any hits i find are for red hat 9
> >=20
> > I wonder if this is relevant:
> >=20
> > From lvm.conf:
> >=20
> > =C2=A0# Configuration option devices/scan_lvs.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Allow LVM LVs to be used a=
s PVs. When enabled, LVM
> > commands
> > will
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # scan active LVs to look fo=
r other PVs. Caution is
> > required to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # avoid using PVs that belon=
g to guest images stored on
> > LVs.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # When enabled, the LVs scan=
ned should be restricted using
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # devices file or the filter=
. This option does not enable
> > autoactivation
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # of layered VGs, which requ=
ires editing LVM udev rules
> > (see
> > LVM_PVSCAN_ON_LVS.)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # This configuration option =
has an automatic default value.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # scan_lvs =3D 1
> >=20
> > I had no luck on googling LVM_PVSCAN_ON_LVS
> >=20
> >=20
>=20
> That is only if you put a pv on top of a vg.

I do recall that I have 1 PV on one Volume Group (on top of 5 Spinning
Rust drives and one  PV on top of 2 ssd's that used to function as a
cache that was setup in mirrorring=20

the cache has since been retired but I have no idea how to move the
data that is on the PV on that VG to get rid of that one last layer

I hope this is clear, I'm not at the workstation in question at the
moment

> Fedora may have finally got rid of lvmetad so it may not be the
> issue.
>=20
> What does cat /proc/cmdline look like?
>=20
> If /home is listed as mounting early but is not explicitly in cmdline
> (either a list of LV(rd.lvm.lv=3D) or VG(rd.lvm.vg) to turn on at boot)
> it will be missing.=C2=A0 And if you configured it after initial install
> and/or changed the name of the LV then it won't get activated early
> and will fail early.=C2=A0=C2=A0 I always use rd.lvm.vg to active everyth=
ing in
> the boot vg at startup.
>=20
> you might try a "systemd-analyze blame" and see what it dumps for
> timers.
>=20
> The typical disk missing timeout is like 60-90 seconds were the boot
> should pause(and fail) before it gives you a emergency mode prompt.

