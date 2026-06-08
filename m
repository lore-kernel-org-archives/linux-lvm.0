Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E03DF011
	for <linux-lvm@lists.linux.dev>; Mon,  8 Jun 2026 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942907; cv=pass; b=Vo12CauQ+kDjzvmLRL1UYUTuahsu2LstrT6urxSyKxfUA8HJM1hZ78EZwkzs4FFKo1BctmWsxMCYGXD70BdCQ9gtLOmujnu4ShSGFx4sDTB6ukKhO5l/6H1JII1qbTrU9V+pBvsrmjPZqX3Bo2rfbBdrRmlHOSbLaxQ6aoUQ1qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942907; c=relaxed/simple;
	bh=M4Xsamge2oYwosKrDdaOaegPI/+wPCxRY2J/+i/M8UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDXHjabtUih3EQnWmUZxzVKp+6BCAJpjgLKdQQ1PXS1qL5FzTg5IgKx6aDqfvRXyB/mTLnfNQ/XVbHDHiW2snaD8nQXa5mR/6xhcMVCECEKbMYnKWoI81E8ZtHA6mER/llc6OmTxecgou43GTusbn1B5ZfKkfa4FIOp8zogVSFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=S2emUR6j; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="S2emUR6j"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso4126222a91.3
        for <linux-lvm@lists.linux.dev>; Mon, 08 Jun 2026 11:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780942903; cv=none;
        d=google.com; s=arc-20240605;
        b=XW5e14PK6OAFjx6BojZuaGrTEhVm17vie4KT4DdZOLtpOwnnX5gYwC5rYa9ebxjPxa
         9GnUut+pE85053KWXSpXEkZ1fnwv9+VenWkP6pszsOJlEYhRqru4HLwzyrShcJJDbJRh
         KEGOToZt7lwpTHEVFfggVluHj+hkalmyDPKWGUfxUgBRyRW1sSx3ztxSj2rkZeW/21lP
         jLwKosQEhkaXcR3qq6FHA1quCaWWpJlBaglucnfnBivQEwbDt+PapUqJ4P8+qs2sgojZ
         U00/4/siXOFfI9IVo8r3XVWRvPEHqDtPf1mVN670FIihUF9xAPFGzWYrstHfkMwaLLVx
         ABOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ql9UhG+DFHuXv1nGAbs5TUt+4U6dkSM1ciGZ3z3om3Q=;
        fh=fqaLIUSHBsZ/wwOMlaID/Xus83nsAT2bIltEsv9Aw6g=;
        b=eGCs6DuEDDBg/F6XYT1KCitJjngaI6cD1/eT/Dk7+BvYymNCgflr6L6Dh1tg4t3gk+
         HPAGRxkP649tNBfBq6Ocj0yuVK6LzTpLZ3I+GiqHCMcs/O/SmrQV+Sg2rlddDCE3Vl7Z
         fdy6hnpfQGYlwWj6QVqSlwpIWVTBsqfF/lBw1FQnUXdRZbvn23TmzD2dLkCEo4LNAWGO
         3nhgqAvL92DKbSUzeFIB7YfiYets2c5clC2tHXOPZV6ln5GS8jbLoeHTow7uj9JmUXx+
         J7ZvzC1wmXHQsDRQN63ccqDGGPgkjnI7A2rpsLE5N0IdzY46EVPNMfn12wSNkFFIDpJo
         HFFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1780942903; x=1781547703; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ql9UhG+DFHuXv1nGAbs5TUt+4U6dkSM1ciGZ3z3om3Q=;
        b=S2emUR6jc1Z2juw7o0+IN4VRCjt/+NQodvtwW17kB/FX+1mBv5GB8JDPbInCEzSH6h
         6ChEkiibhbo+iPXkTGlUIkZ++W7B0GtjkN+BFcjU2C6CU3v2WU3Idre/qYrtNwtqdUod
         5/x9axO9VcikdiPydNQg8UyO7Sc6Ucp3lkqMfFdsqkGB0TzbDTkV3cQ7v01KV4xRaaGj
         qdlFVe0esNgwTyb12QdTszBqlXbDbT3/qUsAI8lReHtsiFAtH4Cpq06MT6Kjoy8kCHWc
         4IAaJBb41+EQe7HKBUw6/XKwyiJZ1FtVkx88cAYx4PUClK7d1bZu8mqD5yHoOgzBoEBN
         GxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942903; x=1781547703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ql9UhG+DFHuXv1nGAbs5TUt+4U6dkSM1ciGZ3z3om3Q=;
        b=AJOzoiggZtsYIaSbxoLVQX9bkj8l4P7T5Xt9qDdtv+J682kkOPMY0nSKTTpck3VBVz
         hQrvxQqiUVXVQm90+4UPxNYpbOh12rlOvfUikIzKCfumTnjLsuwAsAwxL+JYG4JwUxKl
         9d+aEnmBJ7PbKsMqh5cjSADIsSi83/9N/rTF85wv1OehXaEv4MhkMM78ZvietevOCgj7
         XjZ5Vy0q3ZFaqL6/awGD6Y9ja8nFnD8O7Na/DIHA/ho8jTK0T9Y3lvezdhUJlRwfKiE/
         t/gfALj18ERI2MiQQkacUwRU9g6RpmNlun71XG+X1E1XNJddo+ScV8NGm76Fwcmq/Gpq
         BJgg==
X-Gm-Message-State: AOJu0Yy/lXzxctlVMoWQtWAK4Bj0SomfTlggi5dMqCj1r9StPFTikFQo
	vsYCHem48dCpILtJimM+BFI1pnGitBhz/KEwH57nEAMvCjBXkWhE7FVn1VF6bOnkN3cxfXiSFw2
	ZDHNnJQlf29O+3yI33sop4Fw9Jm+MyXr1zMNf/K4gb26F48KlIuzX3mJBPw==
X-Gm-Gg: Acq92OH6B2JS3NUf7o9vaHb/Gv0REwZFvXk1siES5zoDob2yYMVRPV9OtbQUJokxV78
	t0OCnG4QNnXHHEU2Ar5PzgZ5WF+1T1wJpjfxiWUSPEQhxMu76W0ebKJKnuqpp9iA81mmSE7vAM7
	EMU95eCflMjcSdDkgqurYrcYZzAn5AS6jioeq/CdVQylE52+pX/yiEDXVHaNVoXNWMJge2dMeKr
	E9C35D/R1/enf+G4IBLn+9bZfxAugYEMXJqPDlZ5kDwFM1jInMZCsdM7xK9vY2hzoO2e0F8Xz6d
	+i+ecLDldrc/rBMHalQm
X-Received: by 2002:a17:90b:558b:b0:369:de03:29c8 with SMTP id
 98e67ed59e1d1-370f122c744mr21613590a91.23.1780942902556; Mon, 08 Jun 2026
 11:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFe+wq0JxH3_GZUdoKhxLM7RxbWphNs6fj0aetQ-VY4H3MXe_w@mail.gmail.com>
 <81b8a5ae-050f-4e8d-bf22-551d959174c3@redhat.com>
In-Reply-To: <81b8a5ae-050f-4e8d-bf22-551d959174c3@redhat.com>
From: Lakshmi Narasimhan Sundararajan <lsundararajan@everpuredata.com>
Date: Mon, 8 Jun 2026 23:51:21 +0530
X-Gm-Features: AVVi8Cc_5RVIsSIpffrV7YH3ixvQj66Q-NzFdkiSq7dHcyG_DvkVC80VFC6H618
Message-ID: <CAFe+wq1owMdqijGNUzu-xxFTmxwoxB9B2iEwWC211x-G5rXo+Q@mail.gmail.com>
Subject: Re: Reg thin pool chunk size and its impact on discard granularity
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 8:07=E2=80=AFPM Zdenek Kabelac <zkabelac@redhat.com>=
 wrote:
>
> Dne 04. 06. 26 v 7:00 Lakshmi Narasimhan Sundararajan napsal(a):
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
>
> Hi
>
> You need to see a difference between released space in thin-pool itself,
> and sending TRIM request to underlying storage used for holding data chun=
ks.
>
> Those are 2 'different' operations.
>
> Also typically TRIM is block based aka 4K - so the kernel can send TRIM t=
o
> individual blocks - and then it depends how the storage itself works with=
 this
> - it may need whole internal stripe - i.e. 128K or 256K to be trimmed to =
have
> some real usefulness.
>
> As you can already see there are several variables which needs to be meet
> together to make TRIM full passing down through whole stack to the core d=
rive
> logic and releasing 'area' within storage.


Hi Zdenek, Thank you for your response.

Either I have not followed your response, or my question did not convey wel=
l.

Assume a thin pool (pwx2) exists with a chunk size of 384K.
Any thin volume created from that thin pool is exported as shown below.
```
root@ip-10-13-163-134:~# ls /dev/pwx2/200599089991732291
/dev/pwx2/200599089991732291
root@ip-10-13-163-134:~# lsblk -D  /dev/pwx2/200599089991732291
NAME                    DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
pwx2-200599089991732291        0      384K     384M         0
root@ip-10-13-163-134:~# readlink /dev/pwx2/200599089991732291
../dm-22
root@ip-10-13-163-134:~# cat /sys/block/dm-22/queue/discard_granularity
393216
```

Now when blkdiscard (TRIM/UNMAP variants) is used, all of it comes
directly from the application (it could work on a raw disk - thin
volume in this case)
or a mounted fs over this block device.
They issue blkdiscard or the ioctl(TRIM/UNMAP etc equivalent).
Now blkdiscard targets an end user mapped/direct extent on the thin volume.
The block device property exported cannot be a power of 2.
This is a bug where the thin pool exports a non-power-of-2 value for
discard granularity.
And this would impact all operations from the app/fs.

There is no mention of thin_trim in my email, but even that is
impacted, as it would internally issue blkdiscard.

And the behavior is undefined in this case!

I cannot fathom anything other than a BUG in the thin pool stack and
there is no workaround too.
Please correct me if I am mistaken.

>
> > a) thin pools can safely support any integral multiple of 64K chunk siz=
e
> > b) thin volumes always export chunk size as discard granularity
> > c) thin volumes exporting a non power of 2 discard granularity implies =
what?
> > d) what else is impacted here outside discard - and its behavior in thi=
s case.
> > Regular IO activity is fine, as discard granularity do not impact it.
> > e) anything else surrounding this context that is relevant to support
> > this configuration.
> >
> > As always, thank you so much for your inputs.
>
> You are possibly overestimating the need of 'trim'  - modern drives usual=
ly do
> not need it - so you may only need this - when thin-pool itself runs on t=
op of
> another 'provisioned' space - where the TRIM might have some sensitivity.
>
> There is 'thin_trim'  currently only 'offline' - which is capable for ina=
ctive
> thin-pool to run through and send large 'trims' - essentially equivalence=
 of
> 'fstrim' logic - and there is some work being done to make this tool onli=
ne as
> need this for proper THIN+VDO integration.
>
> On fast modern nvme you might get possibly better performance with disabl=
ed
> trim pass-through...
>
> Regards
>
> Zdenek
>
