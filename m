Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A50400DE0
	for <linux-lvm@lists.linux.dev>; Tue,  9 Jun 2026 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005153; cv=pass; b=YRm6fauyhE6c0IiHT2CPielxV5hZnysEIfCElkusdOOv6A5sjZYuU83JTCV5Nmc17bhy44vwGENXX1oN/57UhKBCKXUZ0oylo8RkEHOOEPP/zdj/UZK/uw/3de8dac3qaU2Vie20wj5gj6c+oImwnObd4/h8cWNblQh5ihSTA7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005153; c=relaxed/simple;
	bh=0URiZTWNJYM7s8/vYEAkTbrs3J3tgfYWzIHW1MGySR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9Jj5V9U1r9VdK0AyuLTgzI9xr4ZvFOPBeQ/kP62Ry7UEpgY5gcpQN3TIkOlgrPphHwhRktFUQwl1GGXIiit0S9TPy4N4EC8JssLKZpjb3pzEQDGqQnpuH5TSFCKxgN593FnvG1m0u0cSjDFk5AJ5TdL80nDtWczy3r39cRe8LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=tnDL3+We; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="tnDL3+We"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso48488115ad.1
        for <linux-lvm@lists.linux.dev>; Tue, 09 Jun 2026 04:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781005151; cv=none;
        d=google.com; s=arc-20240605;
        b=KPv6B/LwQhhR3/oDndGgZtF7EG4M9xvxfVG8ZIEtPik1RzM8TNYjNWbgDqCnjV6M/g
         +uluQDqMjBaicTMVzvdsu+EROqZqtdmSAn1jaksZRXAXQ6lnU9Olw31WLC2jhO/e2vjx
         Lgbjpg25fws2oPGBl8rxf5tXO0l/52dTiAQIrqQE6mxDd+h2zHFXpZdNtHqkMWbW3xbt
         vH4d03GE/ACLs8iInm8bG5mn6S5hxQZCRrTF3L36KLWzsEoyk/ZWNam+ToSuSyZQFXOI
         ySULsl/4oKHFL6e3DCRd2IW3pFB6JrBDrWGXXHcuMoZIqawDAGnMfkIuzx8G1dGXR8eT
         6tNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Itv7jevTezlkK73iYA+1TY+Pf7bdW0GDL9bOX1UkZM8=;
        fh=ZIyhTZcUpHZWP2x5HHOnRzppmJEI4whRzxLLc1uBYeQ=;
        b=OgaQcKSpUc6IZLJCPoCwYJvG4wLdWPhG7wIvGQLL8YeYk2gaB/t3Iy9BkN1fGEnx12
         mfBwi+QSqSJnK4Cl1e3jzI0B5HWDo53KiszuFrWzQpPAShSHY7R/YjRAZDwGesMsbc4p
         ftADhXuJ/JBoUAGrMptiO2uXEYf409HKvSew2TNopgRM17rVcu5xQqu4vrRUOo6QJnQV
         gpEpqNWDOdlSRz2XOkeLxyyjb4/A+YKW5Gin3mTCWvw/SFU/Hdt7MD9A/jBq7xebBtKt
         s2HLaFj0FRU7x181LsEH19G/pNyH2qdGUWe/utN0zB2hPrV2UGZM++ZD8faANeb9zFio
         FnKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1781005151; x=1781609951; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itv7jevTezlkK73iYA+1TY+Pf7bdW0GDL9bOX1UkZM8=;
        b=tnDL3+We7FNkq4naaUKCqO2M40kvbF9SZ6kK/Pm0vxh8S3RUcjr/czlhrSQ96iKlDQ
         euyCGy57muytWUaYFy+3ZrbKqtPcmFIg7G/8AnZarJ9sW0Zr+g9pdh2GlHRD+NnhSYPB
         zKC8zlMZKW3DWbbL4E9QXgh8UAgQ0M4neVLczyiwXE/RPLgSFZ3w3kxF6L/cbg3hbwbn
         srkO0dZqGgi0RxBDKM6UMRNKlRmSobZP5PdqZnJJuIGCfvv/Cpph0SF00+8r6dcCTbQD
         9ETntui9FYksz0/U9wcM6CrUHWMtR9Als/Kn9Dyt4Jpqp0yOoyswaMwz6RSQCXNzurws
         USNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005151; x=1781609951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Itv7jevTezlkK73iYA+1TY+Pf7bdW0GDL9bOX1UkZM8=;
        b=Tk9hVWySW52JNImjPNbDsIYGGqXxYaSi+Ce0/X0W6w8IOyWaiwMp0NSEIFql+nn1MG
         KOoWAsKrl2i1M+5jJ0NtxC+s6RMC9NhUPXtjRxmgv+SpFXq68Odz/EA0GgIDoLn/7ibe
         Y8Wlls7GnAs8JB25V1it3WHKzSSWs01zZZs0/D5SZFnodLW98UkMkKDhTGfL4yJrAmjV
         KE0ileatRBl96b3yA4RmRoKzqHNZKp8syu+RHXK7rQEuV4V1suRCe6bo5CV/qQk/0KWO
         MscdQbPMAQ2lKFz8ySv5oQYwiF1XCA23GaIp9TNwSkSHHvfTeDcPOwGU38GgucGHnQJe
         FSCg==
X-Gm-Message-State: AOJu0YwuCTM76lRn2m2q4J9hNQADEewoKANAqGt+T5nZ6SNi7/hq3yGn
	hEW0hbfw7f9b/yJ1ka9CAepLML9fy0/LwFV+EAcOXcxInE8xAADxwmJTKmeCBLwpkCJnU/0fLgb
	V9foMILDxfKhRiHV+tHwEPDX7pKB8RyclRPKeJy/OZQ==
X-Gm-Gg: Acq92OFtthopI4SOxgaQ8rCaw76rxTWp4IDVZAC2dXmXU4XjwT+HVrShVbn3huxsuiN
	vOZnF58O+orSmPYMKZ9xG0dIVSfhp9T5XhGO+cbJ8rdb33o+Tz+1Chv8zN15cbKP0p6AONueAXA
	ejEach7Ua4NrOPnLRY2yBJEktStY1ouZWRqaEyalqDyy2+XZCl2v/zfxKM2D6Eubuyf3PdmbrUl
	M2asbg1I31pmFGJRRUXS3vUpPnG12dMFAhq7j7QJLfDP6gawZFoWm0LytbPQ2Hacy1nXdjDsNnq
	EQMzsnwn60Nw9w3lVtKs
X-Received: by 2002:a17:903:3847:b0:2c0:c262:b917 with SMTP id
 d9443c01a7336-2c1e80e429amr234069275ad.5.1781005151130; Tue, 09 Jun 2026
 04:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFe+wq0JxH3_GZUdoKhxLM7RxbWphNs6fj0aetQ-VY4H3MXe_w@mail.gmail.com>
 <CALjSBEvjbiGDVewuapWKhGDtaxZwcn4=22raUiBEOyj22rY7-g@mail.gmail.com>
In-Reply-To: <CALjSBEvjbiGDVewuapWKhGDtaxZwcn4=22raUiBEOyj22rY7-g@mail.gmail.com>
From: Lakshmi Narasimhan Sundararajan <lsundararajan@everpuredata.com>
Date: Tue, 9 Jun 2026 17:08:49 +0530
X-Gm-Features: AVVi8Cd0GKFM7aQgwan6fFg_6ES3a2gsTUZuFSgkyXJxW43W0xEISIKywc9XSoQ
Message-ID: <CAFe+wq1m4Fgtywg5i50bvAJrij_GCCrYbi3-vUhM1XvXxfrWZg@mail.gmail.com>
Subject: Re: Reg thin pool chunk size and its impact on discard granularity
To: Ming Hung Tsai <mtsai@redhat.com>
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> For now, it's best to avoid using non-power-of-2 data block sizes for thi=
n-pools.

That suggestion is good for new deployments.
But we can't do much now, given the thin pools are already constructed
and in the wild.
Thank you for confirming, there is no impact to the RW workflow.
I hope this incorrect bit logic does not spill over to erase extents
outside the given range, could you confirm on this again.

Thank you again for your response, Best regards.

On Tue, Jun 9, 2026 at 5:01=E2=80=AFPM Ming Hung Tsai <mtsai@redhat.com> wr=
ote:
>
> On Thu, Jun 4, 2026 at 1:06=E2=80=AFPM Lakshmi Narasimhan Sundararajan
> <lsundararajan@everpuredata.com> wrote:
> >
> > Hi LVM Team! A very good day to you.
> >
> > I have a question about the chunk size configuration supported on a
> > thin pool and its relation to the exported discard_granularity on the
> > many thin volumes from that pool.
> >
> > Per the docs, chunk sizes range from 64K to 2M and must be a multiple o=
f 64K.
> > So I assume , any integral units of  64K, for example, 192K (which is
> > three times 64K, is also supported, even though it's not a power of
> > 2).
> >
> > Now, I need confirmation on the correct behavior: I've observed that
> > thin volumes from a thin pool use the chunk size as the discard
> > granularity. To my understanding, the block layer code heavily assumes
> > that the discard granularity is a power of 2.
> >
> > In this case, this is not honoured, and I do not fully understand the
> > reason for or the impact of this behavior. Can you please help me
> > understand what this setting means?
> >
> > a) thin pools can safely support any integral multiple of 64K chunk siz=
e
>
> Yes
>
> > b) thin volumes always export chunk size as discard granularity
>
> Yes
>
> > c) thin volumes exporting a non power of 2 discard granularity implies =
what?
>
> Because the block layer's bio_discard_limit() assumes a power-of-2
> discard_granularity, a thin device with a non-power-of-2 block size
> may fail to reclaim space at certain offsets. For example, given a
> thin-pool with 192kb block size, discarding a single block at offset
> 384kb fails because round_up() misaligns the bio split point,
> producing two partial-block bios that are both dropped:
>
> blkdiscard /dev/mapper/thin -l $((192 << 10)) -o $((192 << 11))
>
> This is an issue introduced by 9b15d109a6b2 ("block: improve discard
> bio alignment in __blkdev_issue_discard()"). That commit honors
> discard_granularity to avoid bio boundaries falling mid-granularity on
> the device, but it uses round_up()/round_down() which require
> power-of-2 arguments.
>
> While this could be addressed in the block layer or worked around in
> dm-thin, further investigation is needed.
>
> > d) what else is impacted here outside discard - and its behavior in thi=
s case.
> > Regular IO activity is fine, as discard granularity do not impact it.
>
> Right, regular IO is fine.
>
> > e) anything else surrounding this context that is relevant to support
> > this configuration.
>
> Some filesystems also assume a power-of-2 discard_granularity. For
> example, ntfs3 uses bitwise arithmetic on the value for discard
> alignment, which would produce incorrect trim ranges on a thin volume
> with a non-power-of-2 block size.
>
> For now, it's best to avoid using non-power-of-2 data block sizes for
> thin-pools.
>
>
> > As always, thank you so much for your inputs.
> > Best regards
> > LN
> >
>
