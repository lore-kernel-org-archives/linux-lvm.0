Return-Path: <SRS0=rCee=QG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06AFC433EF
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Nov 2021 07:25:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 403D3617E3
	for <linux-lvm@archiver.kernel.org>; Fri, 19 Nov 2021 07:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 403D3617E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637306751;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TpB8eIrl8mMwMlMDG2oqOEKA203HbzzeA53MuPAAAuk=;
	b=MBeICgYGrBJxZ4dYyvrNziAUV8CjiQXhlLVqXl8z1M/Yu8eRVFQ/mEjLNspxwfStifLDtN
	rgdRGM4wfDxQeafTv+Zpq7RIfXiTT4g6RP+onLjH3+uQ+T1/w9FKsi3RDEgYV+KS+8dpyz
	PZlCdi5JzoYramNVWB8hSVNS2VPEgys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-wv_nBAsmPo6lxZQLm5vRLQ-1; Fri, 19 Nov 2021 02:25:47 -0500
X-MC-Unique: wv_nBAsmPo6lxZQLm5vRLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BE1E871803;
	Fri, 19 Nov 2021 07:25:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B445D740;
	Fri, 19 Nov 2021 07:25:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C81734E58E;
	Fri, 19 Nov 2021 07:25:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AIIJBUx006809 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 13:19:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ECC7A218013F; Thu, 18 Nov 2021 18:19:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E47F2218014E
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2021 18:19:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC90D857FAD
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2021 18:19:07 +0000 (UTC)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
	[209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-88-OsCJ7N0QOiOF3muc1dIwEQ-1; Thu, 18 Nov 2021 13:19:04 -0500
X-MC-Unique: OsCJ7N0QOiOF3muc1dIwEQ-1
Received: by mail-yb1-f200.google.com with SMTP id
	l28-20020a25b31c000000b005c27dd4987bso10867164ybj.18
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2021 10:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dxcf1hPAAl1ihX53XMh052IUCB+Uxls2bFPgcoHfmTk=;
	b=MeGtUjk7k5nWGYmlnRLcSLRl2to6ZqTFSVsUmtCaHoKbeH9dbjGjdLmrQf9JCitfFm
	c97xp503pFc78cQmdc23tR2WqfD1UXzxXAxLBDpp07vH55p0sNG00ju9n1nJmLsFSKkQ
	pY+CAEvJvf4XcTokl5XpQv1ccQwYX7oHaqW/c0QNij5XOK5wA1OkzqrXGfMyfLHHgu8X
	BeehyBF94We3ozj+aUK1HZ8q5LIKhqoxyBcqUFKuApPDWzM6lh0dxGNFAApf4C57UYvx
	oBkfQ29Q2OpTrP3XvrMdR//JLR8msVr1D2yeWnaepvUkTDTNsSQW6gon3fc+6h2kaE5g
	3Nuw==
X-Gm-Message-State: AOAM531aWdi/t4MDJ4uwZduigrjMCxBPffLnULJBFUYs7RzWIWJ8rvx0
	EeBSI2pq4immt3o4B7seXz++qAwzUzJwYSLO60xBqBbU8AsgEfdMTXr04Sjb/iBaxxAwWKaI5Lh
	y/oFQlcBJvBUXaBJrgobbQ+pw8UolFkwT
X-Received: by 2002:a25:1344:: with SMTP id 65mr29080902ybt.468.1637259543446; 
	Thu, 18 Nov 2021 10:19:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjDMx9FA799md0VXaFtt5nsv4mkQ2qKAipqg2JJB+Zd5FovS7NOE7uLI9pZn+m7fMTvx89W48BeFmRqHPBJRQ=
X-Received: by 2002:a25:1344:: with SMTP id 65mr29080866ybt.468.1637259543150; 
	Thu, 18 Nov 2021 10:19:03 -0800 (PST)
MIME-Version: 1.0
References: <7a6dbcf6-a764-c71a-a1ee-357f48ad7ca3@suse.com>
	<f8a0b5c1-7b07-d119-5ce0-4fae51123ceb@suse.com>
In-Reply-To: <f8a0b5c1-7b07-d119-5ce0-4fae51123ceb@suse.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Date: Thu, 18 Nov 2021 19:18:52 +0100
Message-ID: <CAM23VxpwpJ+dkYtWgufVrv1ryx802Dygd1b5qYp-QDrwL-xiRQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 19 Nov 2021 02:25:22 -0500
Cc: David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [linux-lvm] (resend) may bug: lvconvert reports "Insufficient
 free space" when doing "--replace"
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6382147663071352489=="

--===============6382147663071352489==
Content-Type: multipart/alternative; boundary="000000000000799ece05d11431d1"

--000000000000799ece05d11431d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hemng,

'lvconvert --replace ..." reports the new PV does  not have enough space
(89 needed/49 available) to suit full replacement and rejects as
replacement requires complete SubLVs to move off respective PVs.

Check lsblk (or lvs -ao+devices) after the pvmove to confirm a partial move
across resulting remaining allocations for leg 0 on /dev/sdh, i.e no
replacement

Use a larger PV to be able to replace.

Best,
Heinz

On Mon, Nov 8, 2021 at 7:46 AM heming.zhao@suse.com <heming.zhao@suse.com>
wrote:

> (I sent this mail some days before, it looks this mail was blocked by
> anti-spam system. resend it)
>
> Hello list,
>
> I may found a bug, when lv is raid1, and each leg includes more than one
> PV.
>
> When doing "lvconvert --replace" to replace one of the oldpv with a newpv=
,
> It looks lvconvert requires full raid array size for a single newpv.
>
> lvm version: 2.03.12, Reproducible steps:
>
> ```
> # vgcreate vg1 /dev/sdg /dev/sdh
>    Volume group "vg1" successfully created
>
> # lvcreate -n lv1 -l 90%FREE vg1
>    Logical volume "lv1" created.
>
> # vgextend vg1 /dev/sdj /dev/sdk
>    Physical volume "/dev/sdj" successfully created.
>    Physical volume "/dev/sdk" successfully created.
>    Volume group "vg1" successfully extended
>
> # lvconvert --type raid1 vg1/lv1 /dev/sdg /dev/sdh /dev/sdj /dev/sdk
> Are you sure you want to convert linear LV vg1/lv1 to raid1 type? [y/n]: =
y
>    Logical volume vg1/lv1 successfully converted.
>
> # lsblk
> NAME               MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
> sdg                  8:96   0  200M  0 disk
> =E2=94=94=E2=94=80vg1-lv1_rimage_0 254:4    0  352M  0 lvm
>    =E2=94=94=E2=94=80vg1-lv1        254:2    0  352M  0 lvm
> sdh                  8:112  0  200M  0 disk
> =E2=94=9C=E2=94=80vg1-lv1_rmeta_0  254:3    0    4M  0 lvm
> =E2=94=82 =E2=94=94=E2=94=80vg1-lv1        254:2    0  352M  0 lvm
> =E2=94=94=E2=94=80vg1-lv1_rimage_0 254:4    0  352M  0 lvm
>    =E2=94=94=E2=94=80vg1-lv1        254:2    0  352M  0 lvm
> sdi                  8:128  0  200M  0 disk
> sdj                  8:144  0  200M  0 disk
> =E2=94=9C=E2=94=80vg1-lv1_rmeta_1  254:5    0    4M  0 lvm
> =E2=94=82 =E2=94=94=E2=94=80vg1-lv1        254:2    0  352M  0 lvm
> =E2=94=94=E2=94=80vg1-lv1_rimage_1 254:6    0  352M  0 lvm
>    =E2=94=94=E2=94=80vg1-lv1        254:2    0  352M  0 lvm
> sdk                  8:160  0  200M  0 disk
> =E2=94=94=E2=94=80vg1-lv1_rimage_1 254:6    0  352M  0 lvm
>    =E2=94=94=E2=94=80vg1-lv1        254:2    0  352M  0 lvm
> sdl                  8:176  0  200M  0 disk
>
> # vgextend vg1 /dev/sdi
>    Volume group "vg1" successfully extended
>
> # lvconvert --replace /dev/sdh vg1/lv1 /dev/sdi  (<=3D=3D=3D failed, shou=
ld
> succeed)
>    Insufficient free space: 89 extents needed, but only 49 available
>    LV vg1/lv1 in not partial.
>
> # lvconvert --replace /dev/sdg vg1/lv1 /dev/sdi   (<=3D=3D=3D failed, sho=
uld
> succeed)
>    Insufficient free space: 89 extents needed, but only 49 available
>    LV vg1/lv1 in not partial.
>
> # pvmove /dev/sdh /dev/sdi
>    /dev/sdh: Moved: 2.50%
>    /dev/sdh: Moved: 100.00%
> ```
>
> pvmove is workable, but I think it's a work around.
> lvconvert should run successfully with above cmds.
>
> Thanks,
> Heming
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--000000000000799ece05d11431d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hemng,<br><br>&#39;lvconvert --replace ...&quot; reports t=
he new PV does=C2=A0 not have enough space (89 needed/49 available) to suit=
 full replacement and rejects as replacement requires complete SubLVs to mo=
ve off respective PVs.<div><br></div><div>Check lsblk (or lvs -ao+devices) =
after the pvmove to confirm a=C2=A0partial move across resulting remaining =
allocations for leg 0 on /dev/sdh, i.e no replacement</div><div><br>Use a l=
arger PV to be able to replace.</div><div><br></div><div>Best,<br>Heinz</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Nov 8, 2021 at 7:46 AM <a href=3D"mailto:heming.zhao@suse.com">he=
ming.zhao@suse.com</a> &lt;<a href=3D"mailto:heming.zhao@suse.com">heming.z=
hao@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">(I sent this mail some days before, it looks this mail was bloc=
ked by anti-spam system. resend it)<br>
<br>
Hello list,<br>
<br>
I may found a bug, when lv is raid1, and each leg includes more than one PV=
.<br>
<br>
When doing &quot;lvconvert --replace&quot; to replace one of the oldpv with=
 a newpv,<br>
It looks lvconvert requires full raid array size for a single newpv.<br>
<br>
lvm version: 2.03.12, Reproducible steps:<br>
<br>
```<br>
# vgcreate vg1 /dev/sdg /dev/sdh<br>
=C2=A0 =C2=A0Volume group &quot;vg1&quot; successfully created<br>
<br>
# lvcreate -n lv1 -l 90%FREE vg1<br>
=C2=A0 =C2=A0Logical volume &quot;lv1&quot; created.<br>
<br>
# vgextend vg1 /dev/sdj /dev/sdk<br>
=C2=A0 =C2=A0Physical volume &quot;/dev/sdj&quot; successfully created.<br>
=C2=A0 =C2=A0Physical volume &quot;/dev/sdk&quot; successfully created.<br>
=C2=A0 =C2=A0Volume group &quot;vg1&quot; successfully extended<br>
<br>
# lvconvert --type raid1 vg1/lv1 /dev/sdg /dev/sdh /dev/sdj /dev/sdk<br>
Are you sure you want to convert linear LV vg1/lv1 to raid1 type? [y/n]: y<=
br>
=C2=A0 =C2=A0Logical volume vg1/lv1 successfully converted.<br>
<br>
# lsblk<br>
NAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAJ:MIN RM=C2=A0=
 SIZE RO TYPE MOUNTPOINT<br>
sdg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:96=C2=
=A0 =C2=A00=C2=A0 200M=C2=A0 0 disk<br>
=E2=94=94=E2=94=80vg1-lv1_rimage_0 254:4=C2=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 =
lvm<br>
=C2=A0 =C2=A0=E2=94=94=E2=94=80vg1-lv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 254:2=C2=
=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 lvm<br>
sdh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:112=C2=
=A0 0=C2=A0 200M=C2=A0 0 disk<br>
=E2=94=9C=E2=94=80vg1-lv1_rmeta_0=C2=A0 254:3=C2=A0 =C2=A0 0=C2=A0 =C2=A0 4=
M=C2=A0 0 lvm<br>
=E2=94=82 =E2=94=94=E2=94=80vg1-lv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 254:2=C2=A0 =
=C2=A0 0=C2=A0 352M=C2=A0 0 lvm<br>
=E2=94=94=E2=94=80vg1-lv1_rimage_0 254:4=C2=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 =
lvm<br>
=C2=A0 =C2=A0=E2=94=94=E2=94=80vg1-lv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 254:2=C2=
=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 lvm<br>
sdi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:128=C2=
=A0 0=C2=A0 200M=C2=A0 0 disk<br>
sdj=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:144=C2=
=A0 0=C2=A0 200M=C2=A0 0 disk<br>
=E2=94=9C=E2=94=80vg1-lv1_rmeta_1=C2=A0 254:5=C2=A0 =C2=A0 0=C2=A0 =C2=A0 4=
M=C2=A0 0 lvm<br>
=E2=94=82 =E2=94=94=E2=94=80vg1-lv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 254:2=C2=A0 =
=C2=A0 0=C2=A0 352M=C2=A0 0 lvm<br>
=E2=94=94=E2=94=80vg1-lv1_rimage_1 254:6=C2=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 =
lvm<br>
=C2=A0 =C2=A0=E2=94=94=E2=94=80vg1-lv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 254:2=C2=
=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 lvm<br>
sdk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:160=C2=
=A0 0=C2=A0 200M=C2=A0 0 disk<br>
=E2=94=94=E2=94=80vg1-lv1_rimage_1 254:6=C2=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 =
lvm<br>
=C2=A0 =C2=A0=E2=94=94=E2=94=80vg1-lv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 254:2=C2=
=A0 =C2=A0 0=C2=A0 352M=C2=A0 0 lvm<br>
sdl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:176=C2=
=A0 0=C2=A0 200M=C2=A0 0 disk<br>
<br>
# vgextend vg1 /dev/sdi<br>
=C2=A0 =C2=A0Volume group &quot;vg1&quot; successfully extended<br>
<br>
# lvconvert --replace /dev/sdh vg1/lv1 /dev/sdi=C2=A0 (&lt;=3D=3D=3D failed=
, should succeed)<br>
=C2=A0 =C2=A0Insufficient free space: 89 extents needed, but only 49 availa=
ble<br>
=C2=A0 =C2=A0LV vg1/lv1 in not partial.<br>
<br>
# lvconvert --replace /dev/sdg vg1/lv1 /dev/sdi=C2=A0 =C2=A0(&lt;=3D=3D=3D =
failed, should succeed)<br>
=C2=A0 =C2=A0Insufficient free space: 89 extents needed, but only 49 availa=
ble<br>
=C2=A0 =C2=A0LV vg1/lv1 in not partial.<br>
<br>
# pvmove /dev/sdh /dev/sdi<br>
=C2=A0 =C2=A0/dev/sdh: Moved: 2.50%<br>
=C2=A0 =C2=A0/dev/sdh: Moved: 100.00%<br>
```<br>
<br>
pvmove is workable, but I think it&#39;s a work around.<br>
lvconvert should run successfully with above cmds.<br>
<br>
Thanks,<br>
Heming<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div>

--000000000000799ece05d11431d1--

--===============6382147663071352489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6382147663071352489==--

