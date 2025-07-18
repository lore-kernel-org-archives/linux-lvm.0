Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FE2D8363
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752838143; cv=none; b=l/a3JOz8jzQrzEhL0WuXLyCPsr3pJ2MNy+1RNgIf5QX/zj81Lb9gF6FmG9DlWYnD4b/BGcAOih2WQacqOEEyfdJ+susvikYLvxQw8hfb/O/Vj5VWXSgLFIEeILanDamA6E4tVtPa5zPWceKJF6oe5RKYCJpf6rPvs1Gn1By9gDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752838143; c=relaxed/simple;
	bh=Y4P5unlRfz4OEtWyJSzEGWOKg0bvk1hfwUpPxJkrCgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sb4/oJAG4N52SAdwOtQyjYknsk1DijJ523ajxbq9QOerTPdayCTdHSPX/UpG1Ej62t6UbCxV1i5ojX8yHIwDmtEwP+4zbH99dYpgQ4ooDKnQymK0WG3hyENmlQQ3Ooy0IEwwja2qOc0FB3L18QNj4CvkgxDxAIPm74IlZxWC6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkvKhcFZ; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkvKhcFZ"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-87afea355deso149419439f.0
        for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752838141; x=1753442941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6oydQYc41jqicP07EZ2kuc8rxFJSI2zjtjW2bcFbiU=;
        b=NkvKhcFZJK9w97aixce6f3CtdczSHWpBDWPZkLjeSpayZX6D6Z1Lu4ZIg1IzBf0iSH
         fJMqaf005Gp4Vih9DIFEG18MPQ6yG3K0WLO1pohi7ikJ6iWAvvmQhDIBiCSdCnj82w70
         exPP5wjl+DHCHdmTK7CRrKYSGIWhyTTJHj/ly1G+0bTXa4nF+04fgC/LNq825tzQeelJ
         7ALFjvj8ZBZtx1FZPlwvw1jFUWgL1kpAIob6ezzN61+jt5O7duH4mBe7p6GtS11AezS2
         +2TYtmZHCOwyqOhLeSiK5s3CFmpz2MDfkdor/JUuD1s5qgo58RbdAsm5wHXAOmL6N6SY
         Bc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752838141; x=1753442941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6oydQYc41jqicP07EZ2kuc8rxFJSI2zjtjW2bcFbiU=;
        b=evNd6yCRdx3P+VbQDikRH1WhqhSSWUV8UXPNeOpZXGx87I0HL/IlPngnMavLAeoq2i
         28THg0AO1HUCa8KRm1hevKnK4M7QOq5orGrgstOA6GKUrRDSwSenN5MJsI5CglSMzIzG
         Ra/H1fojgFWzuP+lBRtDP9qdvi2uI+zQt99pYpLjvKAteJ5S0ueupUqcj+Tf756vlKZl
         A2ANOOjXGSIP3tb9t6+PADJGZgXaGY4BiYSc0ktVVRmGNxTTa6FNO76aXvbu8wN2NtS3
         6GEyFq8dkrMfKEHZpUBDuWXD3tybWUlKJGZOwQ05IVGVGVnSVWDBY8YWOWcqgIHWTVGc
         be8g==
X-Gm-Message-State: AOJu0Yycup14X184JNC/qXH4bpF3zmEYDdPhvsOxNmGLVuRnBuanrqo7
	STFiGt06TjRok1v1UvcnHqDo+FsMLOUOjTnoHCv4M2CqUxzVXVWXtpmMSqIzSsJ2GA0kUXGPxhC
	0UUu68Fi8nTYHAwKw1BD2VKxNwqdufIf9Mw==
X-Gm-Gg: ASbGncvtmpbfS1rZdU2j/WlLpua5rNBoajj8p7ud/Y2E1P7SYSAuQmW3Z9antqrY8kV
	k7v/W4rd1J9Wjp7IqsS7zKbI2BPEoqvfgI3rQctGYPdKKihanNPo1Xc/efAPzPyh+WWBddNWmuy
	R7JxYcpXQf+dF+stSTrDh2Ku3WJdDjRvowqCAdKYSWmJEQoJSJSKP26Bv+8FRQ0wOXmQxYu8gn5
	zHBfA==
X-Google-Smtp-Source: AGHT+IHcMobD9l4LsVDYur5kZEuX3Gr4kVIh32Vu1YXqlLrbaj+IzzQiR1Z/4BAgQ/eRJejpAPfrPqJ53tkg7f6Inaw=
X-Received: by 2002:a05:6e02:1a43:b0:3df:460a:ec3c with SMTP id
 e9e14a558f8ab-3e282ecfddemr93787675ab.22.1752838140597; Fri, 18 Jul 2025
 04:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Fri, 18 Jul 2025 06:28:48 -0500
X-Gm-Features: Ac12FXxUC5aIZP_qMfJJfPtwkAZXs6WWhl3S6zhRpp4sTKAUjoubU7cCn8VJ_ns
Message-ID: <CAAMCDecA=sLY9eEyK2Gs7fGd1Zjd5aVz=8YgQS60CYAb1Z4shQ@mail.gmail.com>
Subject: Re: striped LV and expected performance
To: "Henry, Andrew" <andrew.henry@eon.se>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't see where you talk about what real hardware there is outside of the=
 VM.

Are all 3 vmdk's on separate independent disks?

I have only seen adding extra controllers really matter when you have
a large number of disks per controller.  Ie 5 disks/controller works
better than 15 disks on one controller.   And this really only seemed
to matter with read io where the app had many threads (ie not direct
io).  Parallel writes with direct IO breaks down to write an io and
wait to each device...especially when the block size of the direct IO
is similar (or smaller) than the stripe size.

On Fri, Jul 18, 2025 at 2:14=E2=80=AFAM Henry, Andrew <andrew.henry@eon.se>=
 wrote:
>
> I=E2=80=99m trying to improve the performance of a virtual machine guest =
running RHEL 9.6.  I=E2=80=99ve assigned 3 separate SAS controllers to the =
VM, and 3 vmdk disks each connected to their own controller, so there is no=
 kernel bottleneck in the VM on the controller side when writing through to=
 each vmdk under high load.
>
> In the guest, I=E2=80=99m creating an LV as follows:
>
> lvcreate -n swap -i 3 -I 64k --type=3Dstriped -L 16G vg00
> mkfs -t xfs -b size=3D4K -d su=3D64k,sw=3D3 -f /dev/vg00/swap
>
> After mounting, I test write speeds using:
>
> time dd if=3D/dev/zero of=3D/mnt/testfile1 bs=3D8192 count=3D65536 oflag=
=3Ddirect
>
> 536870912 bytes (537 MB, 512 MiB) copied, 41.2043 s, 13.0 MB/s
> 536870912 bytes (537 MB, 512 MiB) copied, 27.3986 s, 19.6 MB/s
> 536870912 bytes (537 MB, 512 MiB) copied, 22.8359 s, 23.5 MB/s
>
> time dd if=3D/dev/zero of=3D/mnt/testfile bs=3D64k count=3D163840 oflag=
=3Ddirect
>
> 1073741824 bytes (1.1 GB, 1.0 GiB) copied, 10.7506 s, 99.9 MB/s  ## only =
did one test here
>
> time dd if=3D/dev/zero of=3D/mnt/testfile bs=3D1M count=3D10240 oflag=3Dd=
irect
>
> 10737418240 bytes (11 GB, 10 GiB) copied, 19.158 s, 560 MB/s
> 10737418240 bytes (11 GB, 10 GiB) copied, 23.0384 s, 466 MB/s
> 10737418240 bytes (11 GB, 10 GiB) copied, 18.3788 s, 584 MB/s
>
> I monitor speeds to the individual discs and the LV itself using:
>
> iostat -xdmt 2
>
>
> My question(s):
>
> When I create the LV using just one disk (linear lvm), I am seeing the sa=
me write speed results as above.  In iostat, I can see that eg. With 1MB bl=
ock size in dd, it=E2=80=99s ~500MB/s to the dm-1 device and also ~500MB/s =
to the physical disk xvda.  When I create the LV as striped, I=E2=80=99m ge=
tting the same throughput on the dm-1 device (~500MB/s), but it is splittin=
g that throughput evenly across all three PV=E2=80=99s, so about ~170MB/s t=
o each xvd disk, totalling ~500MB/s at the LV side.  This was not my expect=
ation.  I expected ~500MB/s to each device with striped LV, totalling ~1500=
MB/s on the dm-a device.  What am I missing?
>
> Second question is:
>
> I=E2=80=99m testing database throughput.  I have the following setup:
>
> DB  =E2=86=92 8KB block size
> XFS  =E2=86=92 4KB block size limited by pagesize in Linux Kernel on x86 =
architecture.
> LVM  =E2=86=92  64KB block size, and have also tested with 4KB, 8KB, 256K=
B, 512KB, 1MB, 4MB
> Xvd[abc]  =E2=86=92  4KB block size on these disks provided by the virtua=
l host
>
> The only part of that equation I can modify is the stripe size on the LVM=
.  Irrespective of which stripe size I choose, I=E2=80=99m getting similar =
results with dd (and fio for that matter) when testing different block size=
s with my write tests.  In other words, it doesn=E2=80=99t seem to make any=
 difference whatsoever which stripe size I choose in the LVM.  Is this a li=
mitation cause by my virtualisation layer?  Would I have seen different (be=
tter) results if I=E2=80=99d used 3 physical disks connected to a physical =
host?
>
> I suppose it=E2=80=99s normal to get low speeds with small block sizes an=
d higher speeds with larger block sizes, but I=E2=80=99m still concerned th=
at 8KB block sizes are writing to a fast disk system at only 13-20MB/s.  Is=
 this common?
>
> /AH
