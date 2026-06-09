Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714433985A
	for <linux-lvm@lists.linux.dev>; Tue,  9 Jun 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004700; cv=none; b=es6+pK0RDFsKtBZOsS5QxvRFCUaPcRyXtl0f+a5ZwxYmc9vz9sbtv/PmXTgswaxgmUna06rdCYbGNFzE8+Vv6rflUYLyi87sCPDXOOGM3erPaqeIjktxnarH9OHvpUPFThccJaaW5b8NVDsoMRDpZ35u7QkfnJOIhQufglmFO70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004700; c=relaxed/simple;
	bh=Z28hFYCZEYM8p2sbamLm6w3VWGhHWNYqvb7hjF7teaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RKpsmbOdJm0wrjPEfB9BEhDrpSt3yn/IbkRm7+74QhfyuJxajR46ehuAZEXmEM27S0HPWh5j1+mSG5eXQvxviRwQ2i0VBBohs9NcfvhU+R6TQUXLFfS8rLzJVpPG6dL2R6vuSits52qYS57vtUwStoRlFKcpxp9t8WlcTWLOv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TeuxsveL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TeuxsveL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781004697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nlwr8RAur/UvqJEeDLDC9ygHnqJWitK5bDo7keFt30g=;
	b=TeuxsveLZBPm1gr/GzJYkLkHW7Ly4po8DUsqFifWW8lXaO06jjIrLNIFtEtLEC5ghvEYfD
	R3gMVTPfDA9rslMSCGVKIa3ORtjk69w4CiH2W60y13oASWwm59KOWzfsG3A8PZvVVZtu+9
	S/hWp37WUqclqH8wWtCMeuxIoNFdm34=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-f0FIuAR_PeWbJV9dV5ER0Q-1; Tue, 09 Jun 2026 07:31:36 -0400
X-MC-Unique: f0FIuAR_PeWbJV9dV5ER0Q-1
X-Mimecast-MFC-AGG-ID: f0FIuAR_PeWbJV9dV5ER0Q_1781004695
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5aa68cf0a4bso3619853e87.0
        for <linux-lvm@lists.linux.dev>; Tue, 09 Jun 2026 04:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781004695; x=1781609495;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlwr8RAur/UvqJEeDLDC9ygHnqJWitK5bDo7keFt30g=;
        b=Qhq7lA4JpuDFJJDixre8n5DSfacLRnftt6LqX1dQ0Z5v7NlwjQq5sHTARjXcTQqYUS
         lDhbxNJ8qqLvpiPeluqHfl38OC7lIS3c4jN00wBKpxQVuN7n6bKJ8zQ0mOk5hhcNgT0/
         MV9Nveqwa48wpFo2bqHMpuRFowlRawqVByhvENWhQtP9Pzx54SGBo/BZSl+5YlvtA4Vo
         jcBffvYRpdXBth28LzQvBN6vPyDJj6aKLkEpWM3vRD+bxKJdYVygl5B3pMRTZHPgLLoF
         qdXha7Z2Wg8ozvTvt5Ry3OJPg/AtV3sIrtvfMMEoJ4E8Ay525mxcjEolsNvJYdWZiJuE
         MvuA==
X-Forwarded-Encrypted: i=1; AFNElJ8VAZB35/6yCHiAN7E5dP2KJO3IMCIF6ghCNuHahE+xUmUas0hQqN9rLSENTZE7OAwx88dE+VEDBwY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX7wmAuQRrZJUhO7x5yK8gK8S78HneS3LofJe1KBd+v3Tc+hJq
	Dm4NuT2YxScfbWCpWZ7oK4/+h8lox/RLkyTBcLOm1hTbU6M+3Z3SfbsP1f7MgWsEjJW609/mFAQ
	wqBFGN3Q2HUmvWyJq7urtuzsB6Wq8/3fQyWWiXh/Ybb1RWsHnft4BonRXqM18gfRK8fzlwpckhO
	uLACToWYMMqKGWVLDPmQKbSxmihPX8fJF5iAA=
X-Gm-Gg: Acq92OFPjoIxAB8MJpvDZLwyjTX5wboBe1MFLyx+lERvS1EZd0noBJwevLhsPLWmtrA
	khYrsiN+iQkuJH8soByqaGKu3SRfJauo3hBeKryDfQ2/nh6twZGRcEnv3ljhRVQsbVmZziVhP2k
	/dCjQe4Ly1Q05Fxs+TgsUOWnlw66nv8x+NeVABJuPX00a2c0G8BmE+E/EexUqO+XVJkoJdFuLD6
	peVzWmOkDZFg/I=
X-Received: by 2002:a05:6512:1416:b0:5a8:89d6:93cf with SMTP id 2adb3069b0e04-5aa886c9d81mr4182201e87.17.1781004694846;
        Tue, 09 Jun 2026 04:31:34 -0700 (PDT)
X-Received: by 2002:a05:6512:1416:b0:5a8:89d6:93cf with SMTP id
 2adb3069b0e04-5aa886c9d81mr4182192e87.17.1781004694232; Tue, 09 Jun 2026
 04:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFe+wq0JxH3_GZUdoKhxLM7RxbWphNs6fj0aetQ-VY4H3MXe_w@mail.gmail.com>
In-Reply-To: <CAFe+wq0JxH3_GZUdoKhxLM7RxbWphNs6fj0aetQ-VY4H3MXe_w@mail.gmail.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Tue, 9 Jun 2026 19:31:21 +0800
X-Gm-Features: AVVi8CfOfxZhYMFVoLLtSzogPbaZTC8bFmJtszJq3eSfCipeVQnFPDkDLb0bkis
Message-ID: <CALjSBEvjbiGDVewuapWKhGDtaxZwcn4=22raUiBEOyj22rY7-g@mail.gmail.com>
Subject: Re: Reg thin pool chunk size and its impact on discard granularity
To: Lakshmi Narasimhan Sundararajan <lsundararajan@everpuredata.com>, linux-lvm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z2j5wG7i4zDLPK1RV89o2P2kJ7urR_jmk72pw2p28QQ_1781004695
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 1:06=E2=80=AFPM Lakshmi Narasimhan Sundararajan
<lsundararajan@everpuredata.com> wrote:
>
> Hi LVM Team! A very good day to you.
>
> I have a question about the chunk size configuration supported on a
> thin pool and its relation to the exported discard_granularity on the
> many thin volumes from that pool.
>
> Per the docs, chunk sizes range from 64K to 2M and must be a multiple of =
64K.
> So I assume , any integral units of  64K, for example, 192K (which is
> three times 64K, is also supported, even though it's not a power of
> 2).
>
> Now, I need confirmation on the correct behavior: I've observed that
> thin volumes from a thin pool use the chunk size as the discard
> granularity. To my understanding, the block layer code heavily assumes
> that the discard granularity is a power of 2.
>
> In this case, this is not honoured, and I do not fully understand the
> reason for or the impact of this behavior. Can you please help me
> understand what this setting means?
>
> a) thin pools can safely support any integral multiple of 64K chunk size

Yes

> b) thin volumes always export chunk size as discard granularity

Yes

> c) thin volumes exporting a non power of 2 discard granularity implies wh=
at?

Because the block layer's bio_discard_limit() assumes a power-of-2
discard_granularity, a thin device with a non-power-of-2 block size
may fail to reclaim space at certain offsets. For example, given a
thin-pool with 192kb block size, discarding a single block at offset
384kb fails because round_up() misaligns the bio split point,
producing two partial-block bios that are both dropped:

blkdiscard /dev/mapper/thin -l $((192 << 10)) -o $((192 << 11))

This is an issue introduced by 9b15d109a6b2 ("block: improve discard
bio alignment in __blkdev_issue_discard()"). That commit honors
discard_granularity to avoid bio boundaries falling mid-granularity on
the device, but it uses round_up()/round_down() which require
power-of-2 arguments.

While this could be addressed in the block layer or worked around in
dm-thin, further investigation is needed.

> d) what else is impacted here outside discard - and its behavior in this =
case.
> Regular IO activity is fine, as discard granularity do not impact it.

Right, regular IO is fine.

> e) anything else surrounding this context that is relevant to support
> this configuration.

Some filesystems also assume a power-of-2 discard_granularity. For
example, ntfs3 uses bitwise arithmetic on the value for discard
alignment, which would produce incorrect trim ranges on a thin volume
with a non-power-of-2 block size.

For now, it's best to avoid using non-power-of-2 data block sizes for
thin-pools.


> As always, thank you so much for your inputs.
> Best regards
> LN
>

