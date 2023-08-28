Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27C3C83F12
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Aug 2023 06:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693292058;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SpOr2O46A7l9ALOAKvuElrrD6YWjYRZbpzC3PD/BUi0=;
	b=KsK5UWxeOEC7hItkbTR+jR4WVBc9vgfq2Qo94IdYmDqVKmDDM2YnwAKkccYkpX54gjX4Xv
	4TPksPx5xCu7VP1sKEi74XPCzXNCPRoHNh7LKE0cxxkplBebg0FXmIoyz95d6Br/40Sc4i
	v3YoC6b+vavFke4hP5n0zdmkOtr/7lE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-xUKAO9OVOYqXVudTvl_8QA-1; Tue, 29 Aug 2023 02:54:13 -0400
X-MC-Unique: xUKAO9OVOYqXVudTvl_8QA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E15A800CAF;
	Tue, 29 Aug 2023 06:54:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 411D040C2063;
	Tue, 29 Aug 2023 06:54:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 256A319465B6;
	Tue, 29 Aug 2023 06:54:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C020E1946587
 for <linux-lvm@listman.corp.redhat.com>; Mon, 28 Aug 2023 17:02:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF5751121319; Mon, 28 Aug 2023 17:02:00 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A74EC1121318
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 17:02:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87C403C147E3
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 17:02:00 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-XQvjMoiJN7mkEOqu7zlf1A-1; Mon, 28 Aug 2023 13:01:57 -0400
X-MC-Unique: XQvjMoiJN7mkEOqu7zlf1A-1
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d7838958d17so2974073276.2
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 10:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693242117; x=1693846917;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=su4CzTxMiVQNlFLf71o4mVwfPVAwxOWnxZJyPwMixsA=;
 b=dZ3ZRzl3YjbuHumRwu9F4cGwrwLFz6Css5W1sKvIkRhU/cis4OCw8EFkVTFKlbb0jn
 62JuGlrOTlLMt32vvqz8B0DjZWUrPQHbu8IHW6HMPX1katktHifBW8LuYH0oOUpS5tGi
 /n2z98HPxjjItcBenopq1vj+IrraFipbwxp1dwGK8r9UEAPHeJzPa5/NMgP1DJC4MJIH
 ZeR4FLilvRRMjDd1qILg2RnUn5xNDm++fgMW35zkmTSgvTO5ecWDPomWdqMThylWViym
 lxyvU1Qt9YTfQkA4TeFt4KxolJWk8gk51aV5IHBp5Y/Ihhnt+uBLK3wlXaWA2mQAStpC
 HKlA==
X-Gm-Message-State: AOJu0Yya/3JEXHflJWqblKJdrjQcpEjcsJv/c/A6hGHrNVy2OQhm3G5W
 B2BzYjMxH2kTzvnYtdz5udsp+CS8c0GuuhcXez8JpqDfF60=
X-Google-Smtp-Source: AGHT+IHgHxXd5s7eOGSAXvkAEQvev3w1t7Z090krMxIAK5ADq8voc2/5RXXCm1gLeYItgMBzXugFSFnLlwB89NM+eO0=
X-Received: by 2002:a05:6902:566:b0:ced:6134:7606 with SMTP id
 a6-20020a056902056600b00ced61347606mr24587868ybt.30.1693242116591; Mon, 28
 Aug 2023 10:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
 <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
 <CABh+8g6O4_zgiZjoJn4yEyEP-Lh+en0hdyH2ZO6G7Z=8PW9xAA@mail.gmail.com>
In-Reply-To: <CABh+8g6O4_zgiZjoJn4yEyEP-Lh+en0hdyH2ZO6G7Z=8PW9xAA@mail.gmail.com>
From: Roska Postit <roskapostit99999@gmail.com>
Date: Mon, 28 Aug 2023 20:01:45 +0300
Message-ID: <CABh+8g7i+=_bWEofrEBrzj2yPXt2GaAH5WEyZdEcd68LpwVVBw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Tue, 29 Aug 2023 06:54:05 +0000
Subject: Re: [linux-lvm] Swapping LLVM drive
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============8450532730034069915=="

--===============8450532730034069915==
Content-Type: multipart/alternative; boundary="000000000000e0d5fa0603fea600"

--000000000000e0d5fa0603fea600
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After reading your answer more carefully I got the following idea:

How do you see if I boot the system (this is a desktop computer and the old
and the new drive are both NVMe SSD) from USB Linux and then just do a 'dd'
for the entire drive (in block level, bit-by-bit). Then I remove the old
disk out of the system. Shouldn't it boot normally now ?

Then I will create a new partition for the all unused space (1.5GB) on new
disk which I then will add to the LVM as a new Physical Volume (PV) in
pc3_vg group. Then I  just need to configure the Logical Volume to use that
new added storage space.

If this is possible I think it would be a bit simpler way to do this.

What do you think about this method ?

ma 28. elok. 2023 klo 19.31 Roska Postit (roskapostit99999@gmail.com)
kirjoitti:

> Thank you very much for your time. This was very very helpful.
>
> ma 28. elok. 2023 klo 18.34 Stuart D Gathman (stuart@gathman.org)
> kirjoitti:
>
>> On Sun, 27 Aug 2023, Roska Postit wrote:
>>
>> > What is the most proper way to swap my 500GB SSD drive to the bigger
>> 2TB SSD
>> > drive in the following LLVM configuration ?
>> >
>> > nvme0n1            259:0    0 465,8G  0 disk
>> > =E2=94=9C=E2=94=80nvme0n1p1        259:1    0   512M  0 part  /boot/ef=
i
>> > =E2=94=9C=E2=94=80nvme0n1p2        259:2    0   488M  0 part  /boot
>> > =E2=94=94=E2=94=80nvme0n1p3        259:3    0 464,8G  0 part
>> >   =E2=94=9C=E2=94=80pc3--vg-root   254:0    0 463,8G  0 lvm   /
>> >   =E2=94=94=E2=94=80pc3--vg-swap_1 254:1    0   980M  0 lvm   [SWAP]
>>
>> Since you are not mirroring, just add the new drive.
>>
>> If this is a laptop, and you can only have one drive, then I suggest
>> you mount the new drive via USB (note there are at least 2 kinds of
>> nvme interface and you have to get a matching USB enclosure).
>>
>> Use dd to copy the partition table (this also often contains boot code)
>> to the new disk on USB.
>> Then use dd to copy the smaller partitions (efi,boot).
>> Now use cfdisk to delete the 3rd partition.
>> Expand the boot partition to 1G (you'll thank me later).
>> Allocate the entire rest of the disk to p3.
>> Create a new vg with a different name.  Allocate root and swap on
>> new VG the same sizes.
>> Take a snapshot of current root (delete swap on old drive since you
>> didn't leave yourself any room), and use partclone to efficiently
>> copy the filesystem over to new root.
>>
>> Either a) edit grub and fstab on new drive to use new vg name  or
>>         b) boot from a live media to rename old and new vg or
>>         c) rename vg just before shutting down to remove drive -
>>            I think LVM can operate with dup VG name, but I've never
>>            navigated the details.
>>
>> Swap drives after powerdown.
>>
>> A modern filesystem like ext2, xfs, btrfs, etc can expand as you expand
>> the root LV.  Leave yourself some working room in the
>> VG._______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>

--000000000000e0d5fa0603fea600
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After reading your answer more carefully I got the followi=
ng idea:<br><br>How do you see if I boot the system (this is a desktop comp=
uter and the old and the new drive are both NVMe SSD) from USB Linux and th=
en just do a &#39;dd&#39; for the entire drive (in block level, bit-by-bit)=
. Then I remove the old disk out of the system. Shouldn&#39;t it boot norma=
lly now ?<br><br>Then I will create a new partition for the all unused spac=
e (1.5GB) on new disk which I then will add to the LVM as a new Physical Vo=
lume (PV) in pc3_vg group. Then I =C2=A0just need to configure the Logical =
Volume to use that new added storage space.<br><br>If this is possible I th=
ink it would be a bit simpler way to do this.<br><br>What do you think abou=
t this method ?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">ma 28. elok. 2023 klo 19.31 Roska Postit (<a href=3D"mailto=
:roskapostit99999@gmail.com">roskapostit99999@gmail.com</a>) kirjoitti:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Th=
ank you very much for your time. This was very very helpful.<br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">ma 28. elok=
. 2023 klo 18.34 Stuart D Gathman (<a href=3D"mailto:stuart@gathman.org" ta=
rget=3D"_blank">stuart@gathman.org</a>) kirjoitti:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Sun, 27 Aug 2023, Roska Postit wrote:=
<br>
<br>
&gt; What is the most proper way to swap my 500GB SSD drive to the bigger 2=
TB SSD<br>
&gt; drive in the following LLVM configuration ?<br>
&gt; <br>
&gt; nvme0n1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:0 =C2=A0 =C2=A00 =
465,8G =C2=A00 disk =C2=A0<br>
&gt; =E2=94=9C=E2=94=80nvme0n1p1 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:1 =C2=A0 =
=C2=A00 =C2=A0 512M =C2=A00 part =C2=A0/boot/efi<br>
&gt; =E2=94=9C=E2=94=80nvme0n1p2 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:2 =C2=A0 =
=C2=A00 =C2=A0 488M =C2=A00 part =C2=A0/boot<br>
&gt; =E2=94=94=E2=94=80nvme0n1p3 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:3 =C2=A0 =
=C2=A00 464,8G =C2=A00 part =C2=A0<br>
&gt; =C2=A0 =E2=94=9C=E2=94=80pc3--vg-root =C2=A0 254:0 =C2=A0 =C2=A00 463,=
8G =C2=A00 lvm =C2=A0 /<br>
&gt; =C2=A0 =E2=94=94=E2=94=80pc3--vg-swap_1 254:1 =C2=A0 =C2=A00 =C2=A0 98=
0M =C2=A00 lvm =C2=A0 [SWAP]<br>
<br>
Since you are not mirroring, just add the new drive.<br>
<br>
If this is a laptop, and you can only have one drive, then I suggest<br>
you mount the new drive via USB (note there are at least 2 kinds of<br>
nvme interface and you have to get a matching USB enclosure).<br>
<br>
Use dd to copy the partition table (this also often contains boot code)<br>
to the new disk on USB.<br>
Then use dd to copy the smaller partitions (efi,boot). <br>
Now use cfdisk to delete the 3rd partition. <br>
Expand the boot partition to 1G (you&#39;ll thank me later).<br>
Allocate the entire rest of the disk to p3.<br>
Create a new vg with a different name.=C2=A0 Allocate root and swap on<br>
new VG the same sizes.<br>
Take a snapshot of current root (delete swap on old drive since you<br>
didn&#39;t leave yourself any room), and use partclone to efficiently<br>
copy the filesystem over to new root.<br>
<br>
Either a) edit grub and fstab on new drive to use new vg name=C2=A0 or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b) boot from a live media to rename old and new=
 vg or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 c) rename vg just before shutting down to remov=
e drive -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I think LVM can operate with dup V=
G name, but I&#39;ve never<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0navigated the details.<br>
<br>
Swap drives after powerdown.<br>
<br>
A modern filesystem like ext2, xfs, btrfs, etc can expand as you expand<br>
the root LV.=C2=A0 Leave yourself some working room in the VG._____________=
__________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div>
</blockquote></div>

--000000000000e0d5fa0603fea600--

--===============8450532730034069915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8450532730034069915==--

