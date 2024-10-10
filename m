Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B46BB5B
	for <linux-lvm@lists.linux.dev>; Thu, 10 Oct 2024 02:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728528262; cv=none; b=lmpOYfqG9GIxgLZTEZuevxtEYbg3KK9omH8TJAE/Jblib3e8vNl4WZiJESncMq1HVdaXJ41ZJ26krLZ12A16GAU/RlUi+922V58wRlMDGlEe/RR/xSnWUvG5ly3pKsR+hGsgH4pW4dZzR5ngDohHQmScI1T429ESCUPZmpeEbiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728528262; c=relaxed/simple;
	bh=Q19fOo/keRdlg1w+IhMrjpIeyBEAy/G/TTO7/4C69y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdXTGDn6fe3ULhSwGBfx0LfzwmDDWYiAUg4BSR8ZdrowyvinR4NT/62mnqqc7bwJ/J33YednZazCfwmumkH6TvCOYEMvKFWZPwC/iXAKp+HWVjUctXl7HxJec3hIYwMns3nniuQ9ZUMoVa5Wj5TKeqVZoqH3ctnaCqryxt58rJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notfab.net; spf=pass smtp.mailfrom=notfab.net; dkim=pass (1024-bit key) header.d=notfab.net header.i=@notfab.net header.b=LOIInTt0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notfab.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notfab.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=notfab.net header.i=@notfab.net header.b="LOIInTt0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c877f18276so58308a12.1
        for <linux-lvm@lists.linux.dev>; Wed, 09 Oct 2024 19:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=notfab.net; s=google; t=1728528259; x=1729133059; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfZrbUlzBzvRQCOujkxZdlUAmeae6dgH2JWCDezM9gk=;
        b=LOIInTt0wf1DQHJrj1F+BgHDjhhsCRLluV/KCr3UHNFLp5uln2Sj1hiV2rfUzqcpHc
         mIR73Zq8fMYr/Sw84lITWTJntodaXHpM8OeqJJjt9GYZgUWtZ0kc1EXEk2bs3l3VUeaF
         cfA2dgoZYoqBEtIE56N+23urzVT8xeiJ1AweM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728528259; x=1729133059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfZrbUlzBzvRQCOujkxZdlUAmeae6dgH2JWCDezM9gk=;
        b=KcsdHPIWZj6n13EIY5pIrYj+87BtNGy0Lic6YkYoNCXJ1LCI3pskSJqnH1LolK6lwg
         ynA+oHEcgiAYCX5GrNxCptG9aTYZW5bwpkvEr3xv6FUG5aQ51BxCd9aGE8TCh3+OrZp5
         i5dkVUvBSzD0fESBpvsIB9hVHHAFHdExVgXn5XXvMo303Y3Xnc8nIRGSu2ZcbZHP1gvW
         vYYHdGAs28eVmG5lOZVavX7VzTt5TDPVhdAl5T/Xa2lbh+l4B2e9GgY71S8lIAfYf/PC
         f674xx7vRcu6TQCwqB5qnllntWwwopWjoNMCIgajixIQIFEmxuyA84Wkdu/gS3KPqclv
         fA6g==
X-Forwarded-Encrypted: i=1; AJvYcCX20EL44Hh1CdlS3t5T44/fvKfVh24bD1XmSNMJxTleXyOLXfV4f4igD/JuodHkzQkxSOwWjg2h8Hc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/LYZn6mCrsz2n5/AX1Nqo5EsV4ze3WHr/Bgd/r1rK5k0ImWze
	w23TZL+J5atrQLXk/wPsEFbHPdX+znS2Zfu/Pt73HhP4qxHZNnsB6j1dREurAaGbkNsWafVmlfx
	HYMv9XTh85FvJRe887cv2J8F2qNsn4sncxsVbSzAe5jckCbG6UpeF6g==
X-Google-Smtp-Source: AGHT+IGYP4+ofbK/gm7q+PjoSM37qf88KiRAjp8F8HJTBuFjrFGdvgE5y6vUtU81KgPg9Ln0ug472iwCn9Jf34Fhksg=
X-Received: by 2002:a05:6402:51ca:b0:5c3:eb29:5400 with SMTP id
 4fb4d7f45d1cf-5c91d727f01mr1598589a12.8.1728528258703; Wed, 09 Oct 2024
 19:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKP6pzFDt42gCDjwg7m_o5YRh7MGCSfxrXkNt=nPV_B=-pRAQw@mail.gmail.com>
 <ZwaYvaL3Vh0YCZlL@redhat.com> <68130b26-27a6-43dd-905a-84a94f88b047@erwinvanlonden.net>
In-Reply-To: <68130b26-27a6-43dd-905a-84a94f88b047@erwinvanlonden.net>
From: Fabricio Winter <admin@notfab.net>
Date: Wed, 9 Oct 2024 23:44:05 -0300
Message-ID: <CAKP6pzF5q=VK93KoEipdrYBnZLfEUrHErbFjrx=UOM3qy1v6fw@mail.gmail.com>
Subject: Re: Help diagnosing lvm ioctl log spam
To: Erwin van Londen <erwin@erwinvanlonden.net>
Cc: David Teigland <teigland@redhat.com>, linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Interesting suggestions here, thanks everyone!

I inspected the libvirt config and indeed the virtual machines are not
configured properly to propagate trim (unless the libvirt default is
unmap, but I'm pretty sure it's ignore), this however is also the case
on the newer servers which have not seen this issue (yet?), I wonder
if this could be the ultimate underlying cause (eg: after a few years
of not running trim, slowed down by the eventual rotation of the lvm
disks as vms are deleted and created). I'll be addressing this asap of
course, however the underlying devices do support trim (they are nvmes
after all) so I believe if anything ended up calling trim it would not
cause an ioctl error as the operation would be supported by the
device.

As for dmeventd, that seems to have been the cause! I cleaned up
rsyslog, did a tail on the log and gave dmeventd a restart (dmeventd
-R) and the errors immediately stopped. Is dm-event merely a
monitoring/alert daemon or does it have any impact on functionality
(mostly wondering if restarting this service like this is a "safe"
operation), and lastly, what could cause it to get into this state? I
can understand a fail condition with a fast retry loop but what could
cause a disk to get into this failing condition in the first place -
what kind of operation was it doing that suddenly stopped working,
since no IO issues were happening on the pool (at least as far as I
can tell - disk reads/writes are working just fine). Is this condition
something that would warrant being reported as a bug, or at least the
fast-fail-loop?

Once again, thanks everyone!

-Fabricio Winter

On Wed, Oct 9, 2024 at 9:21=E2=80=AFPM Erwin van Londen
<erwin@erwinvanlonden.net> wrote:
>
> Could it not be that, given the fact this is a volume carved out of a
> thin pool, the underlying free space threshold is near or at capacity
> and the the device mapper is more busy doing garbage collection than
> actual application IO's. I've seen many nightmares with thin provisioned
> volumes if this is not managed properly.
>
> Have you used the "fstrim" command or is the filesystem mounted with the
> "-o discard" option?
>
> Check some setting with, for example, "lvs -o
> lv_full_name,lv_health_status,lv_when_full". If it is a space issue make
> sure that you have enough free space in your volume groups and configure
> the "thin_pool_auto_extend_threshold" and
> "thin_pool_auto_extend_percentage". Also turn on "monitoring" if that is
> not enabled by default.
>
> Another thing that could be an issue is that the filesystem has the "-o
> discard" mount option set, device mapper wants to propagate this to the
> underlying hardware (or in your case a hypervisor which may also send
> this through to the underlying storage array), and that is not supported
> on that hardware. The "Inappropriate ioctl for device" message hints in
> that direction. Has there been movements of volumes to other provisioned
> disks or changes on the hypervisor?
>
> Cheers
> Erwin
>
> On 10/10/24 00:52, David Teigland wrote:
> > On Wed, Oct 09, 2024 at 06:28:26AM -0300, Fabricio Winter wrote:
> >> Hello people, we have been experiencing an issue with lvm2-thin on
> >> _some_ of our production servers where out of nowhere
> >> lvm2/device-mapper starts spamming error logs and I can't really seem
> >> to trace down the root cause.
> >>
> >> This is what the logs look like;
> >> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: device-mapper: waitevent ioctl on
> >> LVM-CP5Gw8QrWLqwhBcJL87R1mc9Q9KTBtQQmOowipTAFuM7hqzHz6pRVvUaNO9FGzeq-t=
pool
> >> failed: Inappropriate ioctl for device
> >> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: waitevent: dm_task_run failed:
> >> Inappropriate ioctl for device
> > It appears related to dmeventd monitoring the thin pools, and the kerne=
l
> > returning ENOTTY when dmeventd does the DM_DEV_WAIT ioctl.  Maybe there=
's
> > a fast retry loop in dmeventd on that error case rather than quitting.
> > I wonder if there's a way you could kill dmeventd when this happens.
> >
> > Dave
> >
> >
>
