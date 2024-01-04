Received: from mail.tfdn.cloud (mail.tfdn.cloud [116.202.37.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF22F2C860
	for <linux-lvm@lists.linux.dev>; Thu,  4 Jan 2024 21:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=payet.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=payet.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=payet.io header.i=@payet.io header.b="dXhXmZEU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C5DC118F95F3
	for <linux-lvm@lists.linux.dev>; Thu,  4 Jan 2024 22:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=payet.io; s=dkim;
	t=1704402077; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding; bh=jeoC0zBYuuqAAs+XZWYRtxefwVdT7H9XGh2PBtXjKRE=;
	b=dXhXmZEU2Uic/n80udEIBmb62pmU/Rci1YgNEhsfoPiVwDVbf92ikBr9OyAjeYLYKxCIae
	fdbzMRx4LyH2hFwcS8jfxgT9gxrAztssplnsuwCoN8qiu9kcilENuStMN8x9Pi2kGLBfqy
	VZl5+kFu8NEYmXd0DhgU3/3u++P0htz2aU7M9NLUHAneBbF2p8bWmF3j/a7eRrFbE6QNGL
	ACUSh9bIgZ49rBW+Ns27Jjx5kJZam0vfJMZb2UM4xiBLe5gpPS2ISBka2uSejQzL5i9PZw
	S+61zM/V3RgmppdHwBslf9Nm+mFCwjB8wacO8T5J/2C730c/U+GkUQyCIRa2HA==
From: =?utf-8?Q?Fran=C3=A7ois-Xavier_Payet?= <fx@payet.io>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Unable to resize a logical volume due to wrong reported asked size
Message-Id: <C69E0F8D-AE0A-47DA-BD37-00289EECB867@payet.io>
Date: Thu, 4 Jan 2024 22:01:04 +0100
To: linux-lvm@lists.linux.dev
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-Last-TLS-Session-Version: TLSv1.2

Hello!

I=E2=80=99ve got issues resizing a LVM volume.

I=E2=80=99ve allready resized the filesystem on top of it without issues =
:=20
btrfs fi resize 62T /mnt/user
Resize device id 1 (/dev/mapper/vg_raid-datas) from 80.04TiB to 62.00TiB

But when trying to resize the underlying volume, I=E2=80=99ve got the =
following error :=20
lvresize -L63T /dev/vg_raid/datas
  File system btrfs found on vg_raid/datas.
  File system size (62,00 TiB) is larger than the requested size (1,00 =
TiB).
  File system reduce is required and not supported (btrfs).

Which makes (to me) no sense as 1. the FS is less than 63T, 2. The 1.00 =
TB is not what I=E2=80=99ve requested. And If I try another size, it =
tells me that I=E2=80=99ve asked for a null size :=20
lvresize -L64T /dev/vg_raid/datas
  File system btrfs found on vg_raid/datas.
  File system size (62,00 TiB) is larger than the requested size (0   ).
  File system reduce is required and not supported (btrfs).

So I really don=E2=80=99t get what=E2=80=99s going on here. Anyone has =
pointer on what might be the problem?

Thanks!=
