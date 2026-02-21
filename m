Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB747263B
	for <linux-lvm@lists.linux.dev>; Sat, 21 Feb 2026 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698926; cv=pass; b=miHeEr2qTVAv0N9k3kS9XHUZwmnXfV0w3HTrTyQYmMqUca+M2Id5PGkC7JWM5uKLmE9v4DL+1g2Xjkcn2sGAiPX9l6M94iKD6WkjHg98Xgj5wSv0Y3kgocGw84erc4H9L7U4mfRZTyAqj7FEokbg58WBZZ/YnJ7Sb/nWeHPK3T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698926; c=relaxed/simple;
	bh=4ZSm6iiHmmQR0xQ5rdPlch4gGoFnjLcjqKcHNeGMtBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6BHma7a6XnELkK/gTsvuZk2RHoI/Jr7cpOHrhbOFNkpA497xtAgzQM/78FuRbzO8KXV+N7t5vNp0HX0rjPWcM+/bkBiZYJ4lqqs9mtZBPz+96K7h5HG/J8JjkP6d7/HIS4Vza/MS4nrzr+nzCqWj5E7tz9NxJIvC4C7fpbiQLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZa6HtEX; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZa6HtEX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65b94e0a875so4404252a12.0
        for <linux-lvm@lists.linux.dev>; Sat, 21 Feb 2026 10:35:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771698923; cv=none;
        d=google.com; s=arc-20240605;
        b=k2/dy1Aw8g6TjINVaJzqK7lfX6eEGjVCRRysB/FLgvgECAjxMWmwi+PUhVyo5Uc193
         AWnFyPpG3IbBEl0H/5BFJsTy8OydIdXs1YRf+Ov8WbEjkdTX4gELlRN2K34pnxagaLIg
         SEFhXLqrAmUqJDbroPA8FR7BeTROZGl6Z3g8y+YtBTAaZkipJ82CpIRGG9LbDlDZjuMk
         XpPqV4tjZi3q6BDQW/kFHEjILdAKaeC+aKb3ICYL+126QcvO90jd4N66QQ5l4tESRtkX
         vhR1NBzACJd8NkvPdl3qxvkAs8APMzO7og05U8OWHY9/C3g/mQ120JCfyv4SAkNTHu6w
         Zv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X6Ouy1fwOPnc6izV/ZIO7Z1UQssZLqI+zk6LMnA3KZg=;
        fh=rfQXkchmHx7/NRVg/81+RrSLz4V1OuUOBKZKqzxU3ME=;
        b=ZtUg/R2udRcL0gDP8PU/Y+FU6u6By+fOkR1hPNGrJUmC7hxcrpd+1dNm70KFtsKDA1
         jBW0Dmukzc2xQ+fREDGvj3Tat4PubM/6k6757Hzic3i/ghq/AMfAFM/xColCQSNdXQyc
         mugySS75WBm15wZl6KFfDN9Le4dB2XrSjYQ7FQNs80le7AbcpDrK1GCD/YtG2GpoJx+8
         qP96WXNvj3m+mPSA8/2k9iuCLzXQuXMbnopbqZ7m1tXh2uIWY+OhRr5+qtczCBZQLTtx
         eC2PXKq8t2lL5SEU37LrzsfSezZPGVvFgAiz1Sq1rO7Xm33BHnrBzkYAxjDFjxCEDF9Q
         QGBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698923; x=1772303723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6Ouy1fwOPnc6izV/ZIO7Z1UQssZLqI+zk6LMnA3KZg=;
        b=EZa6HtEXHgArfd5RWZM3vQ8ESmOD1q01ySlS+2V9GySRmvBc5QAHZxkdVSsqvFsudR
         qe7rdS72S8syh5NaBeLwTiOxCeqk7BvqIRpOHby4NuqNUifRzfrowk5XFXy8/dT9UHJq
         mIghc9RuxEYN84DJ0Co5xLyNJTZKFjjbTTTx1b6ovUfR8UhsI4Sffupru0fkh6fgBK7k
         nhBHgg54QMZG+/KmnT5d52TX2dFK77bKG52nwNAGK/BE7xeQZcYCSVcQRjPRp14Tz5CK
         26LJMuFEPmDnp2vb2VSuMq3rNtaYVYhP64fA/CTprATdHzw1JDl5v4+kEuPUh0guT7gi
         iKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698923; x=1772303723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6Ouy1fwOPnc6izV/ZIO7Z1UQssZLqI+zk6LMnA3KZg=;
        b=Eu9mO2AM0jJmAohSc8gXOXwIUkncoz0epNk5WvrSGKVyHElKyfAtR++l9ESgs9ATjE
         e1nyOOvOz2TWbEx85FvJTPdHa//GkOVhrkNIntGWstpud3x3aGLRcL7UZThS4/B2s5oK
         /Z66l0kSSUCBNW+NtMlQt9GNL9p0HN7isaoo4jc4cotM4Z5ql/Eo3ecZfz4EVGsvqeYU
         38PzcbtEBJqB2EeadEPCoCOF45nEVB0eqfI+BTXV2v8kWFMJg9mhLv5rpvlb0LcCAWUW
         SCrfhJXCiyFyMu68n6mNg7h2xIYMn3lMP0SoyauvLW8NlPlwZcvlzvcYcUYE0PgZ4eHT
         m4VQ==
X-Gm-Message-State: AOJu0YwBWb+9u0xpjfZhgTx5d93vWNiJkvyXVJbWFoWa2z+kEigltyKm
	kqTyHxnYABZj276xa7CoeXv42dvnduhmDL9pi8crvyZ4XOHsguttzckfD/wcoY9HmYI11OPB5dZ
	+m5XoTFCocTznTuSfBl4cBjMxnOaLDDc=
X-Gm-Gg: AZuq6aLj+DjXLa6oVGphREzwEuMCAuCo+PgX9HNmXsXaYNSCQ+WmXhhXFwl/Pk3wSLW
	td6S9psyxjuG83Tg4RFLZuUnkGG00aaOZCDVXN8zXMjDt2zENFeMhUqhcyP+X8VDgcacKyH5H6C
	Xlxb9F/aTRuz4tEPcAY8GhMeyxYm833H59q+OM+qjN0XGemkrNysH4WVd+uc7swKgqojDZBl6XH
	5/UJxzCXXhQUG4uzFRpUnKqcSUFO5kylFVkm7F//W2BJkGpV7scaO6c6Z2DrvBYLGXoXoNAjWcz
	Nmfdrg==
X-Received: by 2002:a17:907:d8b:b0:b87:1c20:7c63 with SMTP id
 a640c23a62f3a-b90819bfa47mr233468766b.20.1771698922856; Sat, 21 Feb 2026
 10:35:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260221185816.34fab009@ThinkPadT15g.lan>
In-Reply-To: <20260221185816.34fab009@ThinkPadT15g.lan>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sat, 21 Feb 2026 12:35:11 -0600
X-Gm-Features: AaiRm53qnOIDdpZLXyUggPmoIjChrXFm55JzCB51eOPgco8WrxKi503_1OoSb7M
Message-ID: <CAAMCDedhcQdTaQYdoDmTJO62+Go8tYCfza2BHHJrSLUGPbUiaA@mail.gmail.com>
Subject: Re: is it possible to use LVM AFTER system installation?
To: =?UTF-8?B?RnLDqWTDqXJpYyBCYWxkaXQ=?= <frederic.baldit@free.fr>
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That seems pretty close to right.    Step 1  I would label the
partition as LVM, not that it really matters since the labels seem to
not be actively used in Linux) I did not look at every last step in
detail, but that is pretty close to what should work if executed
correctly.

On step 7 you probably need to execute it with the primary user logged
out and from a non-gui login(or a root login assuming root's home is
/root and not in /home)  to get a clean copy.

You may need to make sure your initramfs has lvm built into it, it may
not really matter for home given it can mount much later than say /
(if using lvm for /).

On Sat, Feb 21, 2026 at 11:58=E2=80=AFAM Fr=C3=A9d=C3=A9ric Baldit
<frederic.baldit@free.fr> wrote:
>
>
> Hi everybody,
>
> I'm a debian 12 user, running it on a system which was initially
> installed without LVM (on a thinkpad laptop)n with classical netinst. My
> system is totally installed on a unique nvme disk, with distinct
> partitions, among which a /home partition for all my personal data.
>
> I recently installed a second nvme disk (512G capacity). I would like
> to extend my /home ext4 partition (which is now exclusively on
> /dev/nvme0n1p6, 436G) so that I can keep my old data but have
> the possibility to split /home on the initial disk and the second
> recently added disk.
>
> This seems to be possible with LVM but only when decided at the
> beginning of the installation. Right or wrong?
>
> Or would it possible to:
>
> 0) install lvm2 on my system
> 1) create a new ext4 partition (512G size) on the new nvme disk (using
> all available space, 512G, on it)
> 2) create a new PV with this partition
> 3) create a new VG containing this unique PV
> 4) create a new LV on this VG
> 5) format this LV as an ext4 filesystem with mkfs.ext4
> 6) mount this LV on a new system directory, say /home1
> 7) migrate all the data on my old /home to the new /home1
> 8) modify the VG created before in order to add to it the
> /dev/nvme0n1p6 PV
> 9) resize the LV so that it can use the new PV added
> 10) rename /home1 to /home
>
> Is this globally correct??? Step 7 if crucial, as I really don't want
> any loss or corruption of personal data during the transfer.
>
> Thank's in advance for any help to my two questions,
>
> F. Baldit.
>
>
>
> --
>   Fr=C3=A9d=C3=A9ric Baldit
>
