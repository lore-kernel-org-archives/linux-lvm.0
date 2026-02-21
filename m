Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8452CA6F
	for <linux-lvm@lists.linux.dev>; Sat, 21 Feb 2026 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771696701; cv=none; b=gPdV26wkoHGFZ2Q0a9Wr5lp/3t9cZEMygI2zCW0FI1nRgozeHz6Tgcy81Snla0F6EBASpSBeLg3FxDxHhGK2naJT2ul0WXoUODP+qrAH/ED7sRTcenLtl3vL8/YJ+aRmAabk91mBxsuEqUGnoLXNd0jDMYHoNPyz7GTnu7c9kOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771696701; c=relaxed/simple;
	bh=wDMbnF2c6WS3XW3d8m9mysG07zzGkYWG7I8/tfXdeNM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=bY9YWA6+IuBoZ8HURNW2+Gg0fgbRxyD0wy3JPL+2Tvts2AoKMo2Z1qcNSSlwVwLCMHOFwj6zND09J74Ay/51sIx4LXoBaiMGkEZc+3EAfen6ImFeicExzlPcxfaAQqHH6nhqKNbVoBbp2DIf+ZKfHUraGto/bquNMTqwBp8sgkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=fybnOo8h; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="fybnOo8h"
Received: from ThinkPadT15g.lan (unknown [IPv6:2a01:e0a:e7d:7200:270f:28ee:c7cd:650])
	(Authenticated sender: frederic.baldit@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPA id 0F82C19F5BE
	for <linux-lvm@lists.linux.dev>; Sat, 21 Feb 2026 18:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1771696697;
	bh=wDMbnF2c6WS3XW3d8m9mysG07zzGkYWG7I8/tfXdeNM=;
	h=Date:From:To:Subject:From;
	b=fybnOo8hOTZea+BxhAZ38D3xcWviEg3LLVoVZhwVkcWZIXddC0JJWaEoOEco8JY79
	 OxVMFhxXg5MkCwFz7hX+hMdoAb4772qOPlHrOhchgZY5xuB0i2U2zuJfaoXh6S/JHI
	 rETv6vmizV0IanVR4bkTJbccCH5WSecUkIH0U9aHhTLQe6h2UGBdtvmiAf7UliaL4V
	 wom0oKkWO3pkYZAoASnfrXxlDyFfhEpCwCEU0OUWIsXd2LbVL7TtWiXDR+ym3Pdhj+
	 yYphQk7bG3QOFvKI2kNc9P+9XQSE7m8NiHnd0BDEaazrup0i+zCJbIf13y1DS/Xgyk
	 JEuu9Wv/ShyRw==
Date: Sat, 21 Feb 2026 18:58:16 +0100
From: =?UTF-8?B?RnLDqWTDqXJpYw==?= Baldit <frederic.baldit@free.fr>
To: linux-lvm@lists.linux.dev
Subject: is it possible to use LVM AFTER system installation?
Message-ID: <20260221185816.34fab009@ThinkPadT15g.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hi everybody,

I'm a debian 12 user, running it on a system which was initially=20
installed without LVM (on a thinkpad laptop)n with classical netinst. My
system is totally installed on a unique nvme disk, with distinct
partitions, among which a /home partition for all my personal data.

I recently installed a second nvme disk (512G capacity). I would like
to extend my /home ext4 partition (which is now exclusively on
/dev/nvme0n1p6, 436G) so that I can keep my old data but have
the possibility to split /home on the initial disk and the second
recently added disk.

This seems to be possible with LVM but only when decided at the
beginning of the installation. Right or wrong?

Or would it possible to:

0) install lvm2 on my system
1) create a new ext4 partition (512G size) on the new nvme disk (using
all available space, 512G, on it)
2) create a new PV with this partition
3) create a new VG containing this unique PV
4) create a new LV on this VG
5) format this LV as an ext4 filesystem with mkfs.ext4
6) mount this LV on a new system directory, say /home1
7) migrate all the data on my old /home to the new /home1
8) modify the VG created before in order to add to it the
/dev/nvme0n1p6 PV
9) resize the LV so that it can use the new PV added
10) rename /home1 to /home

Is this globally correct??? Step 7 if crucial, as I really don't want
any loss or corruption of personal data during the transfer.

Thank's in advance for any help to my two questions,=20

F. Baldit.=20



--
  Fr=C3=A9d=C3=A9ric Baldit
