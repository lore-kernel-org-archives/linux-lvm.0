Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB26C8E0
	for <linux-lvm@lists.linux.dev>; Sun, 16 Feb 2025 21:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739742350; cv=none; b=Gy5lt0ac6lhkey9pq3P5yu/GZh2v68jZNQ86+QT7Djz8yWs3T4xS4Mf+Jta1lCYoQMGHqfWNVBUWLlGA7+UsmHmAMCIv5MOIyKi+AMvn6U4yYc+IdHSTgEaBHzbixKNM4YjFiisjp6gd2O/L1NE+3/1atN2uDCZ5Dweqpd7wvag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739742350; c=relaxed/simple;
	bh=QcAfIBMLdxOh5gUdWhbV5HwjKhERuAtea19PhmWk4qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2kufx7nBfOVufPhXx+8PQc/zImtiaMrRkIop568AzN7oC6QAAqZ4vaD5ISKctsImZ56ItF3SVA8+0RpIoZhtH1YXZtUGtSH2Ks68uNkc1wA9aePZ72k3obam2nF1ovCCp0BrLHPuS1AvjRnEa5cTpZYK1l8NA2AJOUQHF9TkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4azL07k; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4azL07k"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d04932a36cso35135875ab.1
        for <linux-lvm@lists.linux.dev>; Sun, 16 Feb 2025 13:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739742348; x=1740347148; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bM0panVz4kqolX7UpiUkHMzrjO6YengUEGgQs8ZkGmo=;
        b=c4azL07kV9mMsYXQZgORQpXypFJwJGLo6lh0qwyiKH3LHIMti64bYUK2xMBkAxGV9X
         OnfUO4IrPX/29fYm5w/9Pnr2wrpXUC9ljrFs/dpgPi8ZFpY/+wYfjrzMPyTCSD9euYXc
         DGgd4dkibQOyJkwGCnXNDfWkb8lGuQrIRfJgmM4qzHXmFxUlwHj2eLky6hfv4wlqXBMV
         S2umxIN9Xzg/d0yzP/YsTlMm/zpD6TyrQwxzXchS/2HDWLTk8DoADDoQfn31F63/i/+q
         AjzJW701l+nctsn/MNTmgequ1o+8D/HzKMV7CXPyY+h8Y3YtnVB0wPychJpKRKP5wbSl
         Ef7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739742348; x=1740347148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bM0panVz4kqolX7UpiUkHMzrjO6YengUEGgQs8ZkGmo=;
        b=ftdQWjJfVdxPzPM4UGQ7umjZ3sdTYcoKACS9HOeXlWJ9QEJRp/iMluzhxKRrM47/WE
         1dHTaSL3Pfr3wX3QRosGTq0gB7a9K3KxitlvNwuoYOZ3KMf0focClPT8FJrjieA+vJAp
         cCnjfkal8MaEjfGuAuygc+SwXd1wiVQLxJHUCU4xkNP7i+U8I9iA2vVgEpnzczsqL1ZA
         Pbco6HYxPFOB1EHG+RnEClVkOhnWiVI4Rjx8RY1D0RnoERpV4ikXIDroK8VlfZXK/Peo
         uXdxjBgxXAboUdM/oCbW2qQE8E0/gsVT4bTU05sJ0oWAYZl6f6Lx9hOdO7QL+jEswETH
         PT6g==
X-Gm-Message-State: AOJu0YzJ4J1zX1wTmUhkjH5fNv865NiNS9dryimIpQAIVV3CilwUv4fa
	aptBKdvf2mZ/ghi/MRlFTOlDJHPfh1mcd4VwdxO/4MUTeMfIN0KD1r+G9VysMn3NXsIYt38XPUw
	AxuWJTQqeXsK0W/eGPwEdouhrUrs=
X-Gm-Gg: ASbGncujlG7Jms34yCWRVuvLypRxZCXqP25XIW7frX0wUPKpZiqsoqqFYqcAeYK4i6c
	k0lzB/aOckalHS5pHoccQgIQrgngFH+chAZjCBXR/lkRfITf3K+xfbhj5/RtsUd9fv4HpK73pOw
	==
X-Google-Smtp-Source: AGHT+IESSZ5nbUDDsD4uIRiuSjxDo5OpEkFsWIY3LHG/O7Wc3xFIF+mkTW+r6Xymu2JpFEu+Bs+5DfxiVTtKLgBPO9o=
X-Received: by 2002:a05:6e02:1a8b:b0:3cf:c8bf:3b87 with SMTP id
 e9e14a558f8ab-3d28076c338mr50888105ab.1.1739742348119; Sun, 16 Feb 2025
 13:45:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fa068a4eabaece5fcddca5ea5adf0557f26387a2.camel@gmail.com>
In-Reply-To: <fa068a4eabaece5fcddca5ea5adf0557f26387a2.camel@gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sun, 16 Feb 2025 15:45:37 -0600
X-Gm-Features: AWEUYZn9-luptHIyNGJw0tILtJW0LaFGwMOiZ2jkzR9FdPoLeOgedQCGoqev-Xw
Message-ID: <CAAMCDecz1tp3ErfusOc7U3j48-h+qSsGfBX1wRntd-hBh8BkKw@mail.gmail.com>
Subject: Re: lvm2 weirdness in Fedora 40
To: christophe.ochal@gmail.com
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The first thing I would do is change the mount line to add ",nofail"
on the options so that a failure does not drop you to single user
mode.

Then you can boot the system up and with the system on the network
figure out the state of things.

In the old days I have seen lvm2-lvmetad break systems on boot up in
bizarre ways.

I disabled it on my systems(and the 1000's of enterprise machines I
used to support) because it caused random PV's to not be found
sometimes.   Typically if something causes a pv to not get found it
will be repeatable on that given system(likely some timing problem).

The only useful thing it does is it speeds up scans when a disk is
spun down and/or when you have 1000's of disks.  But it does not speed
anything up that much unless you have a huge number of disks that are
spun down.  On large san systems the testing I did said without it it
would take 2-3 seconds to scan 1000's of disks (worth the wait given
the random failures that caused havoc), verses immediate.

And tiny changes in lvm/udev rules have changed it from working to broken.

On Sun, Feb 16, 2025 at 9:11=E2=80=AFAM <christophe.ochal@gmail.com> wrote:
>
> I'm at present fighting with LVM2, for some weird reason I can't get my
> lvm volume
> to be activated & mounted at boot resulting in me having to do
> "vgchange -ay" at boot (after I'm dropped in a shell & prompted for my
> root password,to make debugging even more troublesome I can only mess
> with this over the weekends, i've included the lvmdump to this mail,
> any more help would be very welcome, as i'm at a loss of how to
> proceed. this might also have relevant information.
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2338735
>
>
>
>
