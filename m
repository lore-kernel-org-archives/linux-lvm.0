Received: from atreus.mars.org (atreus.mars.org [64.87.0.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D674040
	for <linux-lvm@lists.linux.dev>; Fri, 22 Aug 2025 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.87.0.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755825104; cv=none; b=dm49uznPx9uCCfx+Up/4SsIASBq9vYAATSBe45z0Y5BcuOaYWp17G19oAnBTC/xjhHBgGXZRaz3a+QQXNywsgi8YDFJPnMMOTLgRRvdLC4wEeZO3fmr0F7PhIjM9XJCPstcHto35BHA9KccV2w52f2OW8PVvY2E+1UYXRqGkhV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755825104; c=relaxed/simple;
	bh=ZlFKM7hntFT82tFvZroV1+TgrCBwhFQZAq8dJkin9Nk=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=CMZ/VdV9rkHTi1QZJVULlw+HgdLS2AwxXPEL/fjG14h5YVe6L0ps/doOx24DA1VRa2K8PPbiC70SYsxJ2Qie0XCuY5WlDnzgwehuEJdcj4SwX0/P6vgg4PrQHDTviGh6+WoJIiZ3sdi9R744czU/dal2TauslYkKlzFUBw6rlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mars.org; spf=pass smtp.mailfrom=mars.org; dkim=pass (2048-bit key) header.d=mars.org header.i=@mars.org header.b=pL8F56Pn; arc=none smtp.client-ip=64.87.0.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mars.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mars.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mars.org header.i=@mars.org header.b="pL8F56Pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mars.org;
	s=05dd1fbb-93df-5ac4-9085-c444c9e8712a; t=1755825101;
	bh=ZlFKM7hntFT82tFvZroV1+TgrCBwhFQZAq8dJkin9Nk=;
	h=From:Subject:Date:To:From;
	b=pL8F56PnUG5KfsYz94uJCXu5wtnWUVECVumTBuRzDpgihWk63+Q3bf2ToMBnwA7Y0
	 wgi1aqtKrxeCA/YWF+FTf7oYNxfWo/N1zOLjIqm30Wvp1frMLJsElsj8YJZoXV81xJ
	 kqvhxtIG6xbYnnGhYlhVbagkHybjriLcGh/KP5cntHZVn0yQbVy++soZ/YXZKKRLvu
	 eNUIO8mcXyKFTQ9Rw/O/3kBPNeSMxhZyVY/AAwIXmKm3VHfoESEAHPvQko1TwU8W60
	 8FdlegkXM18lfAcihOc/3lnIUGbmAa2Llf66q4cqJ9HN3FNkrIytVbPwKGARkNHjGD
	 tD67ncSzVD/9Q==
Received: from atreus (localhost [IPv6:::1])
	by atreus.mars.org (Postfix) with ESMTP id 656902F8A43
	for <linux-lvm@lists.linux.dev>; Thu, 21 Aug 2025 18:11:41 -0700 (PDT)
Received: from smtpclient.apple ([10.6.1.63])
	by atreus with ESMTPSA
	id w297Dc3Dp2iBkDkA0SJLnA
	(envelope-from <rob@mars.org>)
	for <linux-lvm@lists.linux.dev>; Thu, 21 Aug 2025 18:11:41 -0700
From: Rob Leslie <rob@mars.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: LVM_PVSCAN_ON_LVS and layered VGs
Message-Id: <A38B4D56-9D62-4C7F-AF43-D5CBDB232978@mars.org>
Date: Thu, 21 Aug 2025 18:11:40 -0700
To: linux-lvm@lists.linux.dev
X-Mailer: Apple Mail (2.3826.700.81)

> ### Changes to device handling
>=20
> * **IMPORTANT:** When `devices/scan_lvs` is enabled found LVs are no =
longer auto
>   activated, must enable `LVM_PVSCAN_ON_LVS` in udev rules =
(*69-dm-lvm.rules*.)

I got bit by this upon upgrading a system to Debian 13 (trixie). I could =
not find an example of how to accomplish this, however what ended up =
working for me looks like this:

% cat /etc/udev/rules.d/68-lvm.rules=20
SUBSYSTEM=3D=3D"block", ACTION=3D=3D"add", =
ENV{ID_FS_TYPE}=3D=3D"LVM2_member", ENV{DM_UUID}=3D=3D"LVM-?*", =
ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=3D"0", ENV{LVM_PVSCAN_ON_LVS}=3D"1"

I found it wasn=E2=80=99t enough just to set LVM_PVSCAN_ON_LVS; it was =
also necessary to (un)set DM_UDEV_DISABLE_OTHER_RULES_FLAG.

Is this the intended and most efficient method to re-enable auto =
activation for layered VGs?

>     * NOTE: It is not recommended to use LVs for PVs. If you have an =
use case for
>       this talk to us, please.

My use case is I want to have a separate VG for virtual machine storage =
that I can pass to libvirt to manage LV creation and deletion. Rather =
than create this VG from raw partitions, however, I want to be able to =
allocate this space from an existing VG. So I create a LV =E2=80=9Cvmpool=E2=
=80=9D and make this a PV for a separate =E2=80=9Cvmpool=E2=80=9D VG. =
This has been my practice for probably at least 15 years.

Greetings,

--=20
Rob Leslie
rob@mars.org

