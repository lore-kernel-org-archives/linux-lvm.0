Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDCB3914F7
	for <linux-lvm@lists.linux.dev>; Tue, 14 Apr 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161875; cv=none; b=GIo/StOv9dYc/dDyGkJlP5GcUnNanQGej2kHTI43pTZmBpow+AEmGCLSlCvD15eF/EvwgPd0nwxJgso+cbLvUi5lWIAYlNjr7Tm0kZBDkajhwxBUoCdtZJVnwV0DWBpu2l+6IGctrMuSClb+s+l4GQZ4f532nxKtq6TiUVJAIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161875; c=relaxed/simple;
	bh=nvP50rKCqD5fkgkof/oNwFY6YQwBLmhk44b34l6zN40=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:MIME-Version:
	 Message-Id:Content-Type; b=TEdGbXdGdOuFs3LPcS09LZ/JRlQtLPVlkv7b6Z/44zaZJia3NLcHUSe2vChemJRWPa0LrIwc2SRsewKK46nQjC8LVci1jSn0Lh7Gum2p8mE4xq7ED1EfguACEkeZcL0e0rE3F2eUud+OkUHeHdLSDGuq0mUvQrHrjjuOWjaeGEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1596E44ACB;
	Tue, 14 Apr 2026 12:17:43 +0200 (CEST)
Date: Tue, 14 Apr 2026 12:17:39 +0200
From: Fabian =?iso-8859-1?q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>
Subject: Re: LVM-thin metadata corruption on Proxmox after RAID-5 issues
 =?CP1251?B?lg==?= thin_repair/thin_dump fail
To: Ming-Hung Tsai <mingnus@gmail.com>, Ray Davis <ray@carpe.net>,
	Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: linux-lvm@lists.linux.dev
References: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
	<CAAYit8T1jQ-35GApTVRiq2wYd5G2R8fXSm1aEjNcgR8Oi=oC7g@mail.gmail.com>
	<9d9b7ab8-4c42-4359-8f68-c7076b0c59a5@gmail.com>
In-Reply-To: <9d9b7ab8-4c42-4359-8f68-c7076b0c59a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: astroid/0.17.0 (https://github.com/astroidmail/astroid)
Message-Id: <1776161705.p3hov527g7.astroid@yuna.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1776161786708

On April 10, 2026 10:31 am, Zdenek Kabelac wrote:
> Dne 10. 04. 26 v 5:43 Ming-Hung Tsai napsal(a):
>> On Fri, Apr 10, 2026 at 12:08=E2=80=AFAM Ray Davis <ray@carpe.net> wrote=
:
>>>
>>> Hello,
>>>
>=20
>>=20
>> The specific error you mentioned, "value size mismatch: expected 8,
>> but got 24 (block 13182)", suggests it's an older version of
>> thin-provisioning-tools. Hopefully, a newer version will help resolve
>> this.
>>=20
>> Would you mind providing the raw metadata image for me to look into? Tha=
nk you.
>>=20
>>=20
>=20
>=20
> Hi
>=20
> There might be an interesting problem - whether distros like  Debian/Ubun=
tu=20
> noticed the switch to:
>=20
> https://github.com/device-mapper-utils/thin-provisioning-tools
>=20
>=20
> I think you may possibly need to do a gentle ping to maintainers of the=20
> original tool based on now outdated:
>=20
> https://github.com/jthornber/thin-provisioning-tools
>=20
> started to package newer version of these tools.
>=20
> (Possibly there should be a much much bigger reference to new repo :) if =
the=20
> current one is blindly ignored....)

Debian unstable currently has 1.1.0, but there's already a bug open to
update to 1.2.1 which I've pinged to mention the new repository and
version available there.

