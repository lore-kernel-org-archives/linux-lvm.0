Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539BD38331E
	for <linux-lvm@lists.linux.dev>; Fri, 10 Jul 2026 19:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710857; cv=pass; b=dEYKqqJN5FDuR5aMaZ2Sda4N24q4ILQuWfr6864tV701O0g6Plds0jSpdE7t4f9AwVbpVmEkqKpYCvNYwoPOARz1UM9JinXTKLeJ8TQSdaOMsEDed5jIBMP3fZ5WsGmilVGNJzRJ8BqOoJUDQjPx5SvQrwTcexoOpNbCsN8MqY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710857; c=relaxed/simple;
	bh=PxfaW7uJvp26XEf2FRVWhiK/f9P7SDRV8Dk4LZbyfZQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=U+PoWqCZuzYyqfQIN5q3fpk+XMNdQnJXrQ9zhhyAEun5qp4TWE+pmPia828cSg/T7Z/55zozWXAkuCHzlnJIPDOSjK/YOiMBm/LP+0vO6XUQUInWP2mRBegBHfkkbAInMO6ZnuhMpTadB5Hw4GA6pCsKQRbPEJQ7e6u9TpL8pTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SN6wJPAv; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SN6wJPAv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c7cfa17fedso18003575ad.3
        for <linux-lvm@lists.linux.dev>; Fri, 10 Jul 2026 12:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783710856; cv=none;
        d=google.com; s=arc-20260327;
        b=iB52Uu00/tq9ttTF34RDO1zWYRdrMHwe7PAZL4J3yOl/XAU5MzEJMByQRblcRE0wXh
         VVyiw+GngJJojOnLS5A1kv1BxM8yE8JIlIEb+SumfOQb0H2r01FYfe2sTZHovUrr38Fn
         353FiVyAoSKEzC6wueSWKSjFrKp7Fpt+DheqLjVmELe2T/AYo57YG90vn5eHbrUYtf2R
         3JkhBSjAeB1VFKCRgViPaT1M9Gd3+mBUNbcAVL/NmQfsK3GjlWkFhfahEY40q7olgbtu
         pL0XwtNhs9KUKP51mDPNOmT2hHspi8jxigBjZLxM6NT6xrBWCX+srxBAEyLFuYk/Vd8K
         d+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=82GPZJiRD9Cqo6I8kw7gKtyi1wrx3TlNK7zdQ8EKD/Y=;
        fh=iQOWxowsu+faQgcWO2V4Hll1LFv7Q5iitXvpXh+DqLU=;
        b=Mrwu13BTqTc3aiYmNnp6mTGhldlQ+4VB6WF8jxycEGNXWi0hlpMjFMstR31FG6zIHM
         FloqmdUlOtXKe37Y8QeUKcObyyiYymy9xFvsKvN6iab7F1DqBCQEEng/Koja3EQ799WX
         2fKx8XKjSSjLoIwBm8e+U5um+E48EzGD/PZOSM+QfbtOqp3yp8v4XcRee2Q+k8bYLoP2
         HgqANDGJZ7RLqi720ub7r7lAKeXV6ut6n/BtOLUR4n/6k6OYcgNzmw4P+scwQC9iYHSm
         GcrZmLlIwGaTXE2PwUxKbG/sCD1/eO7d/kFc2/d2nbeLIzf6cUZPMDqas1TBlaBhSi2G
         8jpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783710856; x=1784315656; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82GPZJiRD9Cqo6I8kw7gKtyi1wrx3TlNK7zdQ8EKD/Y=;
        b=SN6wJPAvrySfWMG1I7g5vl+jzGnj6BtCP5uLmDdTVXYf42eD8f9Oq0vjTqFsdq6/02
         /rEbiVi1ArtvtJ7nSiyuiOPXhwMUVc4HKJkiTr8xeP0ei1cNWZg3y1oqFbel7HI5UVEN
         ZgWP5T5dEB7j8eUBM4yyxd08rm48oy2oPIBJgA3YTve+XnKhbdUy1HLworbaaWEhFBCr
         3DFrnbWYjJJowxjPEsbSgvZ7XT5Y8FvLNrrepsI5OPF1elNWTcNLZuAk8DxIFxKhr1yk
         yWae/PQPf04hTSNbaDZIUwIOx2MvNEdIacAdt0klsITg1dgB0HEyu3mk8paLf5qTuJvw
         UU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710856; x=1784315656;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82GPZJiRD9Cqo6I8kw7gKtyi1wrx3TlNK7zdQ8EKD/Y=;
        b=nJfp/LolW50fIgajr7p5q0oM5LwY9qH5dtsObJltkjEfFzoVtxboMU9pMwb5/ceqYZ
         OihyvcBAh0RkhEkisTQf77md7nRmhk58Ztlcb09Nn+SWI9hAq3M0v2rkm7Ft3tQ4ZlzO
         ICVoz9/y7QSeoNtdF+N81UZ9UzwDW+GS2oumRc7ywoHjhPMsUZgs8fNRYRC9UvMOT5Tq
         mzY0PjU0vrgrZdxfj8BnRm2BGYiVSPecjC/w0jqDGU1KVxMdg5MvcPLOLdqJa9IGiUg7
         Z7rXNCVaLhtKm/FM5sXbprUxb/jY7BnLmMm+TLjbjmwlM/xU8JY1AFW1OcGHYfesofuz
         80Mg==
X-Gm-Message-State: AOJu0Ywa5h/o6DlAMZsN/aC0IyyuOqWoSiRliJttWsVvTQhvXgmFa9T0
	QM7z5i95/MxRu6oDJFIltme83hDgI33gfmAEQoaPNwKeSPDrTNchftj/x9jTF7Ny/Jt9kfz0sOj
	dIqngLNxU4LK30/cEBKeEC6WATQXZO+getyDV
X-Gm-Gg: AfdE7cl+WteT1x/3egxYmXA1m2S66zjj5oXehHlvdEepef9sLEHLcLbzrxeN6CISUtt
	ZHwxMUySwLyEg/SSb69Q5zCF4xu5iULLf8Fh/XNbZ27hP2B77LRQxry0VU7n65ijo5GWNBhpmnG
	Kk5ZS2AWJQoAxy6Oa2l6g3ZK7nL0KPr1cO2yJKY/+ZYbEM3lSstpyIGZ7qLp+vuMF/x19XEQ0nl
	Pg2sJpHA1C9RXIkS5GEkS5giQKbocXR2tshF1aHVN6LRmieB2pXHWJ8cSVPWrq7eNbfT4gpQHSK
	WOgH4ndWTDdEFdqmgteMkxKznH+s
X-Received: by 2002:a05:6a21:398e:b0:3bf:6fb1:ce0d with SMTP id
 adf61e73a8af0-3c11018d907mr356890637.21.1783710855794; Fri, 10 Jul 2026
 12:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mohamed Eltamawey <tammwy22@gmail.com>
Date: Fri, 10 Jul 2026 22:14:04 +0300
X-Gm-Features: AVVi8CdCE97d8ZqIgYVFzfxcEv0cPkdVRivNd08qhLhlL0SjFukyfW8Jv1dONBI
Message-ID: <CAC7Ui73Mmbriuhb=9mz0kJi-nzE5o=K9prAMg72J-Sab2F6fTw@mail.gmail.com>
Subject: Thin pool: safe pattern for disposable per-session snapshots over a
 shared read-only base?
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm designing a storage layout for a virtualization framework and want to
sanity-check the approach against a real thin-pool user before I commit to =
it.

Setup:
- One VG, one thin pool
- A small number of read-only "base image" thin LVs inside the pool
  (set with lvchange -pr)
- Per-session thin snapshots of those base images ("writeback" disks) =E2=
=80=94
  each session writes only into its own snapshot, and gets lvremove'd
  when the session ends

Questions:

1. Is there any way to mark a thin LV as "low value / freely disposable"
   so that pool-level health/monitoring treats a failure on that LV
   differently from a failure on the read-only base LV? As far as I can
   tell there's no such attribute and tags are the only practical way to
   distinguish them for my own tooling =E2=80=94 is that right, or is there=
 a
   built-in mechanism I'm missing?

2. If a single snapshot LV is reported as partial/failed by dmeventd,
   is it always safe to lvremove -f just that LV without affecting the
   pool's metadata health, as long as the pool itself isn't reporting
   failed? Or are there edge cases where a single bad snapshot can
   still corrupt shared pool metadata?

Happy to share more detail on the workload if useful. Thanks for any
pointers =E2=80=94 I read through the pvcreate/lvmthin man pages but couldn=
't
find a definitive answer on point 1 and 2 specifically.

Thanks.
