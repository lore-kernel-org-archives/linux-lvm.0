Received: from mail2.carpe.net (mail2.carpe.net [212.96.128.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C628469F
	for <linux-lvm@lists.linux.dev>; Thu,  9 Apr 2026 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.96.128.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750128; cv=none; b=qkH3o7ZvJNwHxzfVRJay08t7Y6+IbBqyRnAtTBfWRWN6KHZ+jBvoMC/NQe+Th/IlZzdeGOQwpgFJL+bmQPAOFY6gPXyX08kpvFGou/h92RTzzqNcGhMJImnbDFCgC6yRVMMzEBUpnvmOY/QvrQ934rpXT8wzQsajfrtF5VE+uyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750128; c=relaxed/simple;
	bh=I3sRrsDTolmAmo2eq1N07xNrVKRIRuEEZlJUe9a1pU4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mEI4sJHwGZ3Ob131m3+OjZRGOTW6HbMhhuLqJe9ZuWlLFhYEJycUdAuJT/LkBovNUsk5tc1VmJskpnlyVhoP3mE3u2opF8sVugOLFpKAVMmaXIO+NMGihZzSomWnC6khDReZlaoD5bhkCFB+jBwpcSyfbne+ZmjjBY1FtG0HEE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carpe.net; spf=pass smtp.mailfrom=carpe.net; dkim=pass (1024-bit key) header.d=debug.net header.i=@debug.net header.b=mXyaexak; arc=none smtp.client-ip=212.96.128.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carpe.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carpe.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=debug.net header.i=@debug.net header.b="mXyaexak"
Received: from mail2.carpe.net (localhost [127.0.0.1])
	by mail2.carpe.net (Postfix) with ESMTP id 4fs4Js4k22zJnCr
	for <linux-lvm@lists.linux.dev>; Thu,  9 Apr 2026 17:55:25 +0200 (CEST)
Authentication-Results: mail2.carpe.net (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=debug.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=debug.net; h=
	content-transfer-encoding:content-type:mime-version:user-agent
	:reply-to:message-id:date:subject:to:from; s=dkim; t=1775750125;
	 x=1778342126; bh=I3sRrsDTolmAmo2eq1N07xNrVKRIRuEEZlJUe9a1pU4=; b=
	mXyaexaknKVs1u6L5v7rr+x0JBnBSbAm54RXdifsgLqYOaUcw1oFTeKr3sMmaYi3
	wyuTyonsvt4skCpK1N8DizuyRy7bu+rTL5BOIJw1rruLOeUPWiUeI2o8FpD8lxc1
	KlWDYvanKAvRBZWf3I7UoSH1mqJigciKz/YZq+uVMhs=
X-Virus-Scanned: Debian amavisd-new at mail2.carpe.net
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level:
Received: from mail2.carpe.net ([127.0.0.1])
	by mail2.carpe.net (mail2.carpe.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ae-DgKfSrzS6 for <linux-lvm@lists.linux.dev>;
	Thu,  9 Apr 2026 17:55:25 +0200 (CEST)
Received: from [IPv6:::ffff:192.168.2.68] (unknown [80.147.131.232])
	by mail2.carpe.net (Postfix) with ESMTPSA id 4fs4Js1JSBzJmmJ;
	Thu,  9 Apr 2026 17:55:25 +0200 (CEST)
From: "Ray Davis" <ray@carpe.net>
To: linux-lvm@lists.linux.dev
Subject: =?utf-8?q?LVM-thin=20metadata=20corruption=20on=20Proxmox=20after=20RAID-?=
 =?utf-8?q?5=20issues=20=e2=80=93=20thin=5frepair/thin=5fdump=20fail?=
Date: Thu, 09 Apr 2026 15:55:24 +0000
Message-Id: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
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

Hello,

I=E2=80=99m looking for advice on an LVM-thin metadata corruption case on a=
=20
Proxmox host. I have stopped further repair attempts and preserved the=20
current state for analysis.

Environment

* Proxmox VE host
* Thin pool: `VMDATA0/VMDATA0`
* Backing storage had RAID-5 issues involving two disks
* After reseating the disks, the RAID came back online, but the thin=20
pool would no longer activate

Original Proxmox/LVM error
`activating LV 'VMDATA0/VMDATA0' failed: Check of pool VMDATA0/VMDATA0=20
failed (status:1). Manual repair required!`

What I tried

1. `vgcfgbackup VMDATA0`
2. `lvconvert --repair VMDATA0/VMDATA0`

This failed with:
`value size mismatch: expected 8, but got 24 (block 13182)`

At that point I added temporary VG space on a USB disk so I could try=20
manual metadata recovery.

Manual recovery steps attempted

* Created temporary metadata LVs
* Used `lvconvert --swapmetadata` to extract the pool metadata
* Activated the extracted metadata LV
* Preserved a raw image of the extracted metadata
* Ran `thin_check`
* Ran `thin_repair`
* Ran `thin_dump =E2=80=94repair`

Current results

`thin_check /dev/VMDATA0/meta_extract` reports:

* `missing devices: [0, -]`
* `bad checksum in btree node (block 79511)`
* `missing all mappings for devices: [0, -]`
* `bad checksum in btree node (block 79506)`

`thin_repair -i /dev/VMDATA0/meta_extract -o /dev/VMDATA0/repair_meta`=20
fails with:
`value size mismatch: expected 8, but got 24 (block 13182)`

`thin_dump --repair -o /root/VMDATA0_repaired.xml=20
/dev/VMDATA0/meta_extract` fails with the same:
`value size mismatch: expected 8, but got 24 (block 13182)`

Current LV state at the time of extraction looked like this:

* thin pool `VMDATA0`
* extracted metadata LV `meta_extract`
* fresh target metadata LV `repair_meta`

What I have preserved

* Raw metadata image from the extracted metadata LV:
   `VMDATA0_meta_extract.raw`
* A second raw copy from the extracted LV device
* `vgcfgbackup` output and LVM archive files
* Diagnostics bundle with:

   * `pvs`, `vgs`, `lvs`
   * `thin_check` output
   * `dmesg`
   * kernel journal
   * `lvm version`
   * checksums

I can provide access to the full case directory or a tarball over HTTP=20
if someone is willing to look at it. I would prefer to share the link=20
privately with anyone interested.

My main questions are:

1. Is there any remaining offline recovery path worth trying with the=20
standard dm-thin/LVM tools?
2. Does this failure pattern usually indicate that the mapping metadata=20
is beyond recovery by `thin_repair`/`thin_dump`?
3. Would it be useful to inspect the raw metadata image further, and if=20
so, what specific tools or commands would you recommend next?

I can provide any command output that would be useful.

Thanks very much for any guidance,
Ray
