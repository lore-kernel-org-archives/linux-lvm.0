Received: from mail2.carpe.net (mail2.carpe.net [212.96.128.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411B39E17E
	for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.96.128.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809771; cv=none; b=ni1YwfYs+43WML/LrcOtMTSfeY5ISvAi2OvQBTq0nJCTNF1s8fuzMWaepHwRM4Eklq23RavXPWdrxCyCtDz67tkX4OoPU5tVJMDJ7oLXm/gET28NoH1sXuKfG5vC6bgu3gG/m6lL2QCUZkvHMQHzZM7UyGwHnk7iuHO3QF1bXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809771; c=relaxed/simple;
	bh=2nhVnKfmbsjgN2xVYHFqoUHHm1bTUdo1R8/DnnS5Mo8=;
	h=From:To:Subject:Cc:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFfgmSOSGKHgv1e4EqrHFqoGE+pMVIb59WbPy24bBK++KtT9knqmluNMkTRAreyeFKeGOJQCDk0vK44WBHc+1gtiHfKhgWEATTnUyGa9OH367ui79Lux5DxOlfsFtokmSyPgksJwRGypn3stivSSyxtnvovcOuF3t3CxJ8oz61k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carpe.net; spf=pass smtp.mailfrom=carpe.net; dkim=pass (1024-bit key) header.d=debug.net header.i=@debug.net header.b=eh3+7/91; arc=none smtp.client-ip=212.96.128.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carpe.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carpe.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=debug.net header.i=@debug.net header.b="eh3+7/91"
Received: from mail2.carpe.net (localhost [127.0.0.1])
	by mail2.carpe.net (Postfix) with ESMTP id 4fsVMr5SzhzJnGm
	for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 10:29:28 +0200 (CEST)
Authentication-Results: mail2.carpe.net (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=debug.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=debug.net; h=
	content-transfer-encoding:content-type:mime-version:user-agent
	:reply-to:references:in-reply-to:message-id:date:subject:to
	:from; s=dkim; t=1775809762; x=1778401763; bh=2nhVnKfmbsjgN2xVYH
	FqoUHHm1bTUdo1R8/DnnS5Mo8=; b=eh3+7/91t/SOIgz0b0xBk2TtSOFrOv5jj7
	bM8985d4HpoFS+K9PQi2UochmahF/ri8ySzQV28cUvUlzh9Mn3tte0MuEErWJUFu
	5YWd2hVkCFYWa24piG5YHzi1bGh0eQZMVlUafa4G4ICEgI/JL/j3L0sJxi/aENWt
	CptnamIKQ=
X-Virus-Scanned: Debian amavisd-new at mail2.carpe.net
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level:
Received: from mail2.carpe.net ([127.0.0.1])
	by mail2.carpe.net (mail2.carpe.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AYuPPOuTY9Zn for <linux-lvm@lists.linux.dev>;
	Fri, 10 Apr 2026 10:29:22 +0200 (CEST)
Received: from [IPv6:::ffff:192.168.2.68] (unknown [80.147.131.232])
	by mail2.carpe.net (Postfix) with ESMTPSA id 4fsVMk5n1ZzJn13;
	Fri, 10 Apr 2026 10:29:22 +0200 (CEST)
From: "Ray Davis" <ray@carpe.net>
To: "Ming-Hung Tsai" <mingnus@gmail.com>
Subject: =?utf-8?q?Re=5b2=5d=3a=20LVM-thin=20metadata=20corruption=20on=20Proxmox?=
 =?utf-8?q?=20after=20RAID-5=20issues=20=e2=80=93=20thin=5frepair/thin=5fd?=
 =?utf-8?q?ump=20fail?=
Cc: linux-lvm@lists.linux.dev
Date: Fri, 10 Apr 2026 08:29:22 +0000
Message-Id: <em063edf19-7dd2-4a33-8c53-c869a286dd64@carpe.net>
In-Reply-To: <CAAYit8T1jQ-35GApTVRiq2wYd5G2R8fXSm1aEjNcgR8Oi=oC7g@mail.gmail.com>
References: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
 <CAAYit8T1jQ-35GApTVRiq2wYd5G2R8fXSm1aEjNcgR8Oi=oC7g@mail.gmail.com>
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

Hi Ming-Hung,

Thanks for the reply!  The thin-provisioning-tools are version 0.9.0-2.
Maybe I need a better repository? Here is the sources.list:

deb http://ftp.de.debian.org/debian bookworm main contrib
deb http://ftp.de.debian.org/debian bookworm-updates main contrib
deb http://security.debian.org bookworm-security main contrib
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

The raw metadata is about 17 GB.  Would it be better for me to make it=20
available for download or just let you log into the machine directly?

Thanks,
Ray


------ Original Message ------
From "Ming-Hung Tsai" <mingnus@gmail.com>
To "Ray Davis" <ray@carpe.net>
Cc linux-lvm@lists.linux.dev
Date 10.04.2026 05:43:35
Subject Re: LVM-thin metadata corruption on Proxmox after RAID-5 issues=20
=E2=80=93 thin_repair/thin_dump fail

>On Fri, Apr 10, 2026 at 12:08=E2=80=AFAM Ray Davis <ray@carpe.net> wrote:
>>
>>  Hello,
>>
>>  I=E2=80=99m looking for advice on an LVM-thin metadata corruption case=
 on a
>>  Proxmox host. I have stopped further repair attempts and preserved the
>>  current state for analysis.
>>
>>  Environment
>>
>>  * Proxmox VE host
>>  * Thin pool: `VMDATA0/VMDATA0`
>>  * Backing storage had RAID-5 issues involving two disks
>>  * After reseating the disks, the RAID came back online, but the thin
>>  pool would no longer activate
>>
>>  Original Proxmox/LVM error
>>  `activating LV 'VMDATA0/VMDATA0' failed: Check of pool VMDATA0/VMDATA0
>>  failed (status:1). Manual repair required!`
>>
>>  What I tried
>>
>>  1. `vgcfgbackup VMDATA0`
>>  2. `lvconvert --repair VMDATA0/VMDATA0`
>>
>>  This failed with:
>>  `value size mismatch: expected 8, but got 24 (block 13182)`
>>
>>  At that point I added temporary VG space on a USB disk so I could try
>>  manual metadata recovery.
>>
>>  Manual recovery steps attempted
>>
>>  * Created temporary metadata LVs
>>  * Used `lvconvert --swapmetadata` to extract the pool metadata
>>  * Activated the extracted metadata LV
>>  * Preserved a raw image of the extracted metadata
>>  * Ran `thin_check`
>>  * Ran `thin_repair`
>>  * Ran `thin_dump =E2=80=94repair`
>>
>>  Current results
>>
>>  `thin_check /dev/VMDATA0/meta_extract` reports:
>>
>>  * `missing devices: [0, -]`
>>  * `bad checksum in btree node (block 79511)`
>>  * `missing all mappings for devices: [0, -]`
>>  * `bad checksum in btree node (block 79506)`
>>
>>  `thin_repair -i /dev/VMDATA0/meta_extract -o /dev/VMDATA0/repair_meta`
>>  fails with:
>>  `value size mismatch: expected 8, but got 24 (block 13182)`
>>
>>  `thin_dump --repair -o /root/VMDATA0_repaired.xml
>>  /dev/VMDATA0/meta_extract` fails with the same:
>>  `value size mismatch: expected 8, but got 24 (block 13182)`
>>
>>  Current LV state at the time of extraction looked like this:
>>
>>  * thin pool `VMDATA0`
>>  * extracted metadata LV `meta_extract`
>>  * fresh target metadata LV `repair_meta`
>>
>>  What I have preserved
>>
>>  * Raw metadata image from the extracted metadata LV:
>>     `VMDATA0_meta_extract.raw`
>>  * A second raw copy from the extracted LV device
>>  * `vgcfgbackup` output and LVM archive files
>>  * Diagnostics bundle with:
>>
>>     * `pvs`, `vgs`, `lvs`
>>     * `thin_check` output
>>     * `dmesg`
>>     * kernel journal
>>     * `lvm version`
>>     * checksums
>>
>>  I can provide access to the full case directory or a tarball over HTTP
>>  if someone is willing to look at it. I would prefer to share the link
>>  privately with anyone interested.
>>
>>  My main questions are:
>>
>>  1. Is there any remaining offline recovery path worth trying with the
>>  standard dm-thin/LVM tools?
>>  2. Does this failure pattern usually indicate that the mapping metadata
>>  is beyond recovery by `thin_repair`/`thin_dump`?
>>  3. Would it be useful to inspect the raw metadata image further, and if
>>  so, what specific tools or commands would you recommend next?
>>
>>  I can provide any command output that would be useful.
>>
>>  Thanks very much for any guidance,
>>  Ray
>>
>
>Hi,
>
>The specific error you mentioned, "value size mismatch: expected 8,
>but got 24 (block 13182)", suggests it's an older version of
>thin-provisioning-tools. Hopefully, a newer version will help resolve
>this.
>
>Would you mind providing the raw metadata image for me to look into? Thank =
you.
>
>
>Hank
