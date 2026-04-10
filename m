Received: from mail2.carpe.net (mail2.carpe.net [212.96.128.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450933A9635
	for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.96.128.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809179; cv=none; b=VOUNNYtX1o0Jc9ihFnxs6LLcSQ2uh1geqv2LmSUwnEkPWBbIO1SCuxO7EWLI9OrukWlPIRJOQHv7UhfKAFDEYd7bXZn3HCC7+8ZA7/Z6J7gRXh3uW4Wp8NXIzsgl7B1uue1dQ6NG8h48qb96zJ4dPB6Ss4MYhv9DcJ+PpWxOdG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809179; c=relaxed/simple;
	bh=7CGTUuMVpSj0Tyw/Iqisa+4olJP+EHh8XnJGNYzA9fc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyTj1MRNOakZm8ooFuODOCz1ff2SiAJq2ZpRMNjurKtuq1uHnQu5fPVao9P/eIo7vWoE2dN9SWfKA0xAOah4NWJ0k2MwzjZee92r4Taxn2m9bTCMux+vjtNpi89kaT0hkENt/TviN/6HLBH6FmNBhbyOb7i9wmE7C0RfwzNYHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carpe.net; spf=pass smtp.mailfrom=carpe.net; dkim=pass (1024-bit key) header.d=debug.net header.i=@debug.net header.b=XBICHEg/; arc=none smtp.client-ip=212.96.128.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carpe.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carpe.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=debug.net header.i=@debug.net header.b="XBICHEg/"
Received: from mail2.carpe.net (localhost [127.0.0.1])
	by mail2.carpe.net (Postfix) with ESMTP id 4fsV8Q28fkzJnsc
	for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 10:19:34 +0200 (CEST)
Authentication-Results: mail2.carpe.net (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=debug.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=debug.net; h=
	content-transfer-encoding:content-type:mime-version:user-agent
	:reply-to:references:in-reply-to:message-id:date:subject:to
	:from; s=dkim; t=1775809168; x=1778401169; bh=7CGTUuMVpSj0Tyw/Iq
	isa+4olJP+EHh8XnJGNYzA9fc=; b=XBICHEg/mlG7LCUcFV5By5wZApQyZiHwSY
	R7a2s3YN0pmugBjTx9Ek6jN9rGFq1ndBdhVElEref9sFzb6la5goCM0DkXEUGwyI
	h8HNIKp5d2Dx3wbI8tWrrWNYc9dIkeirdq6lTjaXVENehec1cT7e++E/XRUdlxV6
	dv+cI/0NY=
X-Virus-Scanned: Debian amavisd-new at mail2.carpe.net
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level:
Received: from mail2.carpe.net ([127.0.0.1])
	by mail2.carpe.net (mail2.carpe.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X1m7ioM9BEFp for <linux-lvm@lists.linux.dev>;
	Fri, 10 Apr 2026 10:19:28 +0200 (CEST)
Received: from [IPv6:::ffff:192.168.2.68] (unknown [80.147.131.232])
	by mail2.carpe.net (Postfix) with ESMTPSA id 4fsV8J4YZTzJn3R
	for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 10:19:28 +0200 (CEST)
From: "Ray Davis" <ray@carpe.net>
To: linux-lvm@lists.linux.dev
Subject: =?utf-8?q?Re=5b2=5d=3a=20LVM-thin=20metadata=20corruption=20on=20Proxmox?=
 =?utf-8?q?=20after=20RAID-5=20issues=20=e2=80=93=20thin=5frepair/thin=5fd?=
 =?utf-8?q?ump=20fail?=
Date: Fri, 10 Apr 2026 08:19:28 +0000
Message-Id: <em78692aed-adc4-47e5-ae42-4599d9388c11@carpe.net>
In-Reply-To: <77f3dec3-7050-4d57-8928-7c7b68a2537e@gmail.com>
References: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
 <77f3dec3-7050-4d57-8928-7c7b68a2537e@gmail.com>
Reply-To: "Ray Davis" <ray@carpe.net>
User-Agent: eMClient/10.4.0.0
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Zdenek,

Thanks for the reply!  Here are the missing version number=E2=80=A6

root@proxmox0:~# uname -a
Linux proxmox0 6.8.12-5-pve #1 SMP PREEMPT_DYNAMIC PMX 6.8.12-5=20
(2024-12-03T10:26Z) x86_64 GNU/Linux

/etc/os-release says "Debian GNU/Linux 12 (bookworm)=E2=80=9D.

root@proxmox0:~# lvm version
   LVM version:     2.03.16(2) (2022-05-18)
   Library version: 1.02.185 (2022-05-18)
   Driver version:  4.48.0
   Configuration:   ./configure --build=3Dx86_64-linux-gnu --prefix=3D/usr=
=20
--includedir=3D$/include --mandir=3D$/share/man=20
--infodir=3D$/share/info --sysconfdir=3D/etc --localstatedir=3D/var=20
--disable-option-checking --disable-silent-rules=20
--libdir=3D$/lib/x86_64-linux-gnu --runstatedir=3D/run=20
--disable-maintainer-mode --disable-dependency-tracking=20
--libdir=3D/lib/x86_64-linux-gnu --sbindir=3D/sbin=20
--with-usrlibdir=3D/usr/lib/x86_64-linux-gnu --with-optimisation=3D-O2=20
--with-cache=3Dinternal --with-device-uid=3D0 --with-device-gid=3D6=20
--with-device-mode=3D0660 --with-default-pid-dir=3D/run=20
--with-default-run-dir=3D/run/lvm --with-default-locking-dir=3D/run/lock/lv=
m=20
--with-thin=3Dinternal --with-thin-check=3D/usr/sbin/thin_check=20
--with-thin-dump=3D/usr/sbin/thin_dump=20
--with-thin-repair=3D/usr/sbin/thin_repair --with-udev-prefix=3D/=20
--enable-applib --enable-blkid_wiping --enable-cmdlib --enable-dmeventd=20
--enable-editline --enable-lvmlockd-dlm --enable-lvmlockd-sanlock=20
--enable-lvmpolld --enable-notify-dbus --enable-pkgconfig=20
--enable-udev_rules --enable-udev_sync --disable-readline

root@proxmox0:~# thin_repair -V
0.9.0

I did try to "apt install --only-upgrade  thin-provisioning-tools=E2=80=9D, =
but=20
it said "thin-provisioning-tools is already the newest version=20
(0.9.0-2)=E2=80=9D.  Maybe I need a better repository?  Here is the=20
sources.list:

deb http://ftp.de.debian.org/debian bookworm main contrib
deb http://ftp.de.debian.org/debian bookworm-updates main contrib
deb http://security.debian.org bookworm-security main contrib
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

The damage was caused by two disks of a six disk raid-5 array going=20
offline for some reason.  They are both back online and the controller=20
rebuilt the raid-5 without any obvious errors.

Thanks,
Ray

------ Original Message ------
From "Zdenek Kabelac" <zdenek.kabelac@gmail.com>
To "Ray Davis" <ray@carpe.net>; linux-lvm@lists.linux.dev
Date 09.04.2026 22:32:56
Subject Re: LVM-thin metadata corruption on Proxmox after RAID-5 issues=20
=E2=80=93 thin_repair/thin_dump fail

>Dne 09. 04. 26 v 17:55 Ray Davis napsal(a):
>>Hello,
>>
>>I=E2=80=99m looking for advice on an LVM-thin metadata corruption case on =
a Proxmox host. I have stopped further repair attempts and preserved the c=
urrent state for analysis.
>>
>>Environment
>>
>>* Proxmox VE host
>>* Thin pool: `VMDATA0/VMDATA0`
>>* Backing storage had RAID-5 issues involving two disks
>>* After reseating the disks, the RAID came back online, but the thin pool =
would no longer activate
>>>
>>* Created temporary metadata LVs
>>* Used `lvconvert --swapmetadata` to extract the pool metadata
>>* Activated the extracted metadata LV
>>* Preserved a raw image of the extracted metadata
>>* Ran `thin_check`
>>* Ran `thin_repair`
>>* Ran `thin_dump =E2=80=94repair`
>>
>>I can provide access to the full case directory or a tarball over HTTP if =
someone is willing to look at it. I would prefer to share the link private=
ly with anyone interested.
>>
>>My main questions are:
>>
>>1. Is there any remaining offline recovery path worth trying with the sta=
ndard dm-thin/LVM tools?
>
>Hi
>
>Very extensive report - but it looks like the key element here would be -
>what are the versions in use.
>
>
>Kernel ?
>
>lvm2 ?
>
>thin_repair -V  ?
>
>
>
>>2. Does this failure pattern usually indicate that the mapping metadata i=
s beyond recovery by `thin_repair`/`thin_dump`?
>>3. Would it be useful to inspect the raw metadata image further, and if s=
o, what specific tools or commands would you recommend next?
>>
>>I can provide any command output that would be useful.
>
>If you are using latest tools - then authors of this tool will need to hav=
e
>access to the damaged metadata  whether there is something that can be rec=
overed.
>
>It'd also greatly help knowing what kind of 'damange' may have caused this=
.
>
>Regards
>
>Zdenek
>
