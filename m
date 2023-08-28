Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7016AC83F14
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Aug 2023 06:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693292056;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3iz9T1f6k6ucGHLSReVWMCdwbupJIspzJq1Ohpwmx/w=;
	b=QriWnuiL6sju/GivfwmgYGWzcxpDRuQX3X9xgSlRs5l3MZ+jJeKVebNEphmffeYkIBCyCy
	CeXAD+Cl9Xg7wVM/68TWLB9MGkwUM8lT62nwIr9Xn2id9xRnTsI+tncXiYQsBOLXk2Hhmv
	JE3jbdOdafkLhpuBR51ZZkq6q7cYdVU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-c_DkT-6SPqm_MYs2vJ_PaQ-1; Tue, 29 Aug 2023 02:54:12 -0400
X-MC-Unique: c_DkT-6SPqm_MYs2vJ_PaQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E86829AA38E;
	Tue, 29 Aug 2023 06:54:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 209BC402D90;
	Tue, 29 Aug 2023 06:54:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8265D1946A4D;
	Tue, 29 Aug 2023 06:54:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 754171946587
 for <linux-lvm@listman.corp.redhat.com>; Mon, 28 Aug 2023 16:31:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 428E7415F37; Mon, 28 Aug 2023 16:31:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F2E401051
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 16:31:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 121D88D40A4
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 16:31:28 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-4vQTnjSWO5uIf9BlLbXgSw-1; Mon, 28 Aug 2023 12:31:24 -0400
X-MC-Unique: 4vQTnjSWO5uIf9BlLbXgSw-1
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-d746ea563f9so3276672276.1
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 09:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693240284; x=1693845084;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r8e2lzJJv5a+eV/XXe1QyqFGVOov38muw03sekSDDcw=;
 b=ZqL82NLJ9RBt7H997shIzg0Btyw8Lvrv2uZzBH5SojNvrjHsz1FhAjmF2r/0Du7HR1
 F088fbBveZmOXECBRsneyMhrXUB6l9g9aGXlUYgDDKBG2lLJHsH/gENbRrqyqWuGcuNA
 DEwW6YHccmb0ahWZL7EAB1+icq4R1QjD4B7B6lPXRFx/D34/wMkgFwq3zNkGG6Gv344Z
 KugQbrEgvc/+bSpwjXYWv/2yDzrTPFamgma7aKf1+w+8UjjmOEDm3S3KmnwGfj++GaiQ
 zYudvVT4+4sngExAk7weh9jF/yvUDLq+awESg+rbzeikXYp4l9o0RFzAyhWRhBzqhydI
 r7YA==
X-Gm-Message-State: AOJu0Yxlla9C+ZBjgX3y5/4/x6mnPe51h/z45vCofMQj/gtxEUm9SGFa
 hmR4ZpPtEAgsDT03kU6fBnWUemed3AuUw82Ms5Ce4OKj
X-Google-Smtp-Source: AGHT+IGemA3EQRAUW/L26wcuG1wdcTw5hsdQ+F0Laj5YNAauXMgWItrxKx2Mvlo/JAmNKSREq7Xr0zTE5GxjfRI1wAM=
X-Received: by 2002:a25:d78c:0:b0:d73:e979:d5c8 with SMTP id
 o134-20020a25d78c000000b00d73e979d5c8mr27172426ybg.34.1693240284292; Mon, 28
 Aug 2023 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
 <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
In-Reply-To: <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
From: Roska Postit <roskapostit99999@gmail.com>
Date: Mon, 28 Aug 2023 19:31:13 +0300
Message-ID: <CABh+8g6O4_zgiZjoJn4yEyEP-Lh+en0hdyH2ZO6G7Z=8PW9xAA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============6090632006282619485=="

--===============6090632006282619485==
Content-Type: multipart/alternative; boundary="000000000000aa386b0603fe39fe"

--000000000000aa386b0603fe39fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you very much for your time. This was very very helpful.

ma 28. elok. 2023 klo 18.34 Stuart D Gathman (stuart@gathman.org) kirjoitti=
:

> On Sun, 27 Aug 2023, Roska Postit wrote:
>
> > What is the most proper way to swap my 500GB SSD drive to the bigger 2T=
B
> SSD
> > drive in the following LLVM configuration ?
> >
> > nvme0n1            259:0    0 465,8G  0 disk
> > =E2=94=9C=E2=94=80nvme0n1p1        259:1    0   512M  0 part  /boot/efi
> > =E2=94=9C=E2=94=80nvme0n1p2        259:2    0   488M  0 part  /boot
> > =E2=94=94=E2=94=80nvme0n1p3        259:3    0 464,8G  0 part
> >   =E2=94=9C=E2=94=80pc3--vg-root   254:0    0 463,8G  0 lvm   /
> >   =E2=94=94=E2=94=80pc3--vg-swap_1 254:1    0   980M  0 lvm   [SWAP]
>
> Since you are not mirroring, just add the new drive.
>
> If this is a laptop, and you can only have one drive, then I suggest
> you mount the new drive via USB (note there are at least 2 kinds of
> nvme interface and you have to get a matching USB enclosure).
>
> Use dd to copy the partition table (this also often contains boot code)
> to the new disk on USB.
> Then use dd to copy the smaller partitions (efi,boot).
> Now use cfdisk to delete the 3rd partition.
> Expand the boot partition to 1G (you'll thank me later).
> Allocate the entire rest of the disk to p3.
> Create a new vg with a different name.  Allocate root and swap on
> new VG the same sizes.
> Take a snapshot of current root (delete swap on old drive since you
> didn't leave yourself any room), and use partclone to efficiently
> copy the filesystem over to new root.
>
> Either a) edit grub and fstab on new drive to use new vg name  or
>         b) boot from a live media to rename old and new vg or
>         c) rename vg just before shutting down to remove drive -
>            I think LVM can operate with dup VG name, but I've never
>            navigated the details.
>
> Swap drives after powerdown.
>
> A modern filesystem like ext2, xfs, btrfs, etc can expand as you expand
> the root LV.  Leave yourself some working room in the
> VG._______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000000000000aa386b0603fe39fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you very much for your time. This was very very help=
ful.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">ma 28. elok. 2023 klo 18.34 Stuart D Gathman (<a href=3D"mailto:stu=
art@gathman.org">stuart@gathman.org</a>) kirjoitti:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Sun, 27 Aug 2023, Roska Postit wrote=
:<br>
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

--000000000000aa386b0603fe39fe--

--===============6090632006282619485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6090632006282619485==--

