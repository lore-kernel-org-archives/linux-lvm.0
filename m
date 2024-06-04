Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39E14264A
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498142; cv=none; b=jNhCQ2JIpl91PNjJkRQNa5eipkIK+5J/D3gtA1jb9QL7V2Kz8iuabBq2w/Xocz6AZ/5jOrTmhB+vhYwIvvs8XZZvvDuYa+w8m1xKU9hBf4rxCz+0xLdbO0003JLWSsOrt2ONF3YzcHkbJCxVtZpWzJqWhgrpPk31E5xurQY2/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498142; c=relaxed/simple;
	bh=wW3vpg6K+YRYMlUe4g1ZBrO3BSNwYcwsLOyTfqIQqkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fg+fd4qIMi/Exp+tTUxmtPjSsDxiAzxiOW5X5PYfCWtt6oCu5UFBicpq4esUki/xD+PCuNi5SJ1lMr+cYwlUBvzafu2HQL6N6xNpjuRKPgytooq3t5M6xhf2D3gNyEmfDSWZVOi6Vr4EWaqI3yvQUih7lwbUpn49Un2yIlnGbL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGVOYKeI; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGVOYKeI"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7eb0b9fa610so136314939f.3
        for <linux-lvm@lists.linux.dev>; Tue, 04 Jun 2024 03:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717498140; x=1718102940; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rePnzXMOHDSIVYcEYNTz+aYZcCILASeXorA3HHBnQfI=;
        b=VGVOYKeIsYmYRp0fhj0u7wQRdEGI4Vk5T4nLV3QA0Nm6/sNMs6rYvjBMCLch/25YWb
         aW1I9cHs3mZTAX7yE+K99tQW1gDQWWnS6NxaE2JloKD6Fwne7FXyxKc/eiClFlMJVLUK
         3KJlKt93/SxrcrTfLzsPlLsYKX9u5QDA1zQ9EhPKH9SLqgrN1UWYVCCmdzIVBgJTezVD
         DUjREdegsVFGEJwJeQ5/ED22MPiGn1WLds6F9yiGLQ4uX+Z5M1+4pagwGN0pbxHg5KEO
         tyi/rYRKPOCZtIJGgdVxyglu4CSvfNhFVY1b2Ky64Ha3pU4sGC+FBjkhEkO+eKYPvPFZ
         GiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717498140; x=1718102940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rePnzXMOHDSIVYcEYNTz+aYZcCILASeXorA3HHBnQfI=;
        b=HR0Z3MAsr8c+qo7Q5My6hXtNjNHIdhkJSRalu4nUBlj+MNsZs8NpNXYNAUIDN1A/OT
         bP65eRVC+7G8lt57dlyvhHcn65ZQ98e9IPCwUkG6fhqrCb1GnPFUN0FhLp+HyR/nSIti
         3kgmYatBTJbP0DR6I+ZKs7m8xg+e0oFsl3XbCQNEnjqRVmo64nFZIOW89/3CEc17eLDt
         aHsSH/xudX/TjtCwqJkH1JEy/H8cO8HR8wOwqds4kjw0oYLkMFw2xsRNq1MpZvBllhmz
         lJwd/DPmgoqhl0XH9DD4+V8Kva0iE4u7AqZGdZGQcmUbnS274H3vrzFbseaJPeS2uYnA
         nHFw==
X-Forwarded-Encrypted: i=1; AJvYcCWR1zs1i2sgZQdmVW78LpYrVGkwQyVbJo4LsTGnfcSY0hS74wlM0ko/buYpI5R6cy5gvB4t1kppb2lZWdLPoLEOvl9rDgT60NwW
X-Gm-Message-State: AOJu0Yx5syX6j9IP3PMhNoMmWtZN+CojQ9zbbyTSJ7FeD2dmutxylga0
	5rANyxQC/iHNyfASMAj8cSju+xaeZ3U61bhyHVoRgXv9d1RpcM3wVF+OUJGjI25dSTIhflD3GbG
	Fc4gWQqo2ybHMeaIKWV5urBwRNpc=
X-Google-Smtp-Source: AGHT+IF5oUlxv3C0I3DQH93L5V07afVfDG+F98G4ol/a4G6KzVX1EbRGumsXAGAA3ZDiNjzfD2PTKkWCXHsbqtK2p1s=
X-Received: by 2002:a05:6602:1489:b0:7e1:8dad:20fb with SMTP id
 ca18e2360f4ac-7eaffe6ee76mr1468700239f.4.1717498140167; Tue, 04 Jun 2024
 03:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com> <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com> <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
In-Reply-To: <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 4 Jun 2024 05:48:48 -0500
Message-ID: <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
Subject: Re: lvm2 deadlock
To: Jaco Kroon <jaco@uls.co.za>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 4:06=E2=80=AFAM Jaco Kroon <jaco@uls.co.za> wrote:
>
> Hi,
>
> Please refer below.
>
> >>
> >> This could potentially be due to extremely heavy disk IO, or LVM
> >> itself freezing IO.
> >
> > well reducing the percentage of '/proc/sys/vm/dirty_ration' may
> > possibly help
> > when your disk system is too slow and you create a very lengthy 'sync'
> > io queues...
>
>
> crowsnest [09:52:21] /proc/sys/vm # cat dirty_ratio
> 20
>
> Happy to lower that even more if it would help.
>
> Internet (Redhat) states:
>
> Starts active writeback of dirty data at this percentage of total memory
> for the generator of dirty data, via pdflush. The default value is |40|.
>
> I'm assuming the default is 20 though, not 40, since I can't find that
> I've reconfigured this value.
>
> Should probably remain higher than dirty_background_ratio (which is
> currently 10), dirty_background_bytes is 0.
>
>
> >
> >> I don't see the default value for udev_log from the config.
> >> Explicitly set to debug now, but still not seeing anything logged to
> >> syslog. Running with udevd --debug, which logs to a ramdisk on /run.
> >> Hopefully (if/when this happens again) that may shed some light.
> >> There is 256GB of RAM available, so as long as the log doesn't grow
> >> too quickly should be fine.
> >
> > A lot of RAM may possibly create a huge amount of dirty pages...
>
>
> May I safely interpret this as "lower the dirty_ratio even further"?
>
> Given a value of 10 and 20 I'm assuming that pdflush will start flushing
> out in the background when >~26GB of in-memory data is dirty, or if the
> data has been dirty for more than 5 seconds (dirty_writeback_centisecs =
=3D
> 500).
>
> Don't mind lowering the dirty_background ratio as low as 1 even? But
> won't the primary dirty_ratio start blocking processes from writing if
>  >40% of the caches/buffers are considered dirty?
>
> Kind regards,
> Jaco
>
>

Use the *_bytes values.  If they are non-zero then they are used and
that allows setting even below 1% (quite large on anything with a lot
of ram).

I have been using this for quite a while:
vm.dirty_background_bytes =3D 3000000
vm.dirty_bytes =3D 5000000

ie 5M and 3M such that I should never have a huge amount of writes outstand=
ing.

And you can go lower.
