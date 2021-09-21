Return-Path: <SRS0=iYY7=ON=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2684DC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 07:24:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 862A360F70
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 07:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 862A360F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-PDBBEvVXOWW8132-bU9lHQ-1; Thu, 23 Sep 2021 03:24:28 -0400
X-MC-Unique: PDBBEvVXOWW8132-bU9lHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D44BD1808305;
	Thu, 23 Sep 2021 07:24:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 937A660854;
	Thu, 23 Sep 2021 07:24:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E08F54E9F5;
	Thu, 23 Sep 2021 07:24:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18LNawcJ017311 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 21 Sep 2021 19:36:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE80E114B300; Tue, 21 Sep 2021 23:36:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9E3B114B2FC
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2021 23:36:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BF61100B8DA
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2021 23:36:56 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-VkTfyMhEO_yG4nv1aMVeFg-1; Tue, 21 Sep 2021 19:36:54 -0400
X-MC-Unique: VkTfyMhEO_yG4nv1aMVeFg-1
Received: by mail-ua1-f45.google.com with SMTP id f24so543944uav.8
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2021 16:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=uuzIunEuh7QHEMXRorezmkcID9hTWHEj9AOxmiGWVUc=;
	b=cBbyQuvsU2kovPpnfdSEhCx2vtqvaqAEeYfG0x40j7I3XoN7qTiKyF3YsOf5HaYIvh
	qMyJp5k1JaviRCHy0JQFMqHbjQIXE7/I/LVrMY8uNnq2YvrMhPUMA1xiLQwAMnrvq2oq
	GV+nBDAy0lFVC7ghKL68SsKqwMtg/vXdxW91mf4Zc9MMkvzmCmsqX5CD9QTWZ3AZJtQU
	VyWSw6BKCADKS8g2weBLsK5Mz0N7h0e6MSQ428M4sWKXsjsfZFPlfWn6EPGg1XPyqTbR
	xh3e6PUn/yE2l+D178+xHBKxDqbtn4NSeJLzxGzjDkFq13WRjX9waGy0YEkwQ38rlnOA
	K/zA==
X-Gm-Message-State: AOAM5302j7hqg1fsu40vnvYlrJljj9p/p+MhSLxV1ZyTJ1Md3QF+/FfO
	ryD4+1B5wHWdDKcSXzEhuQp5ZnPS+aWMoURIp6ZPOYB9gi5nfQ==
X-Google-Smtp-Source: ABdhPJxQ1lspCi7JZiQIv5tSyowZ5Wvxak6fx034K730LlSbB49MuT8wyXyXawlYC/3RgV9llZQF9NBRhVrJ7yB3928=
X-Received: by 2002:ab0:1444:: with SMTP id c4mr18982902uae.58.1632267413349; 
	Tue, 21 Sep 2021 16:36:53 -0700 (PDT)
MIME-Version: 1.0
From: alessandro macuz <alessandro.macuz@gmail.com>
Date: Wed, 22 Sep 2021 01:36:41 +0200
Message-ID: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 23 Sep 2021 03:23:38 -0400
Subject: [linux-lvm] " Failed to find physical volume <ZFS block device"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7800127679888910037=="

--===============7800127679888910037==
Content-Type: multipart/alternative; boundary="00000000000059eb0c05cc89df06"

--00000000000059eb0c05cc89df06
Content-Type: text/plain; charset="UTF-8"

Hi all,

I sought the web for the error " Failed to find physical volume
"/dev/zd96p5"." but the closest discussion in the LVM archives I found was
one of mine back in 2014

https://listman.redhat.com/archives/linux-lvm/2014-June/msg00016.html

This time though it seems pvs fails to find the physical volume when
lvmdiskscan does recognize it. Do I have to really upgrade lvm2 or is there
another way to have pvs recognize the volume?

root@server:/etc# lvm version
  LVM version:     2.02.133(2) (2015-10-30)
  Library version: 1.02.110 (2015-10-30)
  Driver version:  4.34.0
root@ server :/etc# lvmdiskscan -l
  WARNING: only considering LVM devices
  /dev/sda5             [      74.05 GiB] LVM physical volume
  /dev/zd304p3          [      19.00 GiB] LVM physical volume
  /dev/zd96p5           [    1023.52 GiB] LVM physical volume
*  /dev/zd112p5          [    1023.52 GiB] LVM physical volume*
  0 LVM physical volume whole disks
  4 LVM physical volumes
root@ server :/etc# pvs -a /dev/zd96p5
  Failed to find physical volume "/dev/zd96p5".

Thanks, Alex.

--00000000000059eb0c05cc89df06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"font-family:arial,sans-serif">Hi =
all,</span></div><div><span style=3D"font-family:arial,sans-serif"><br></sp=
an></div><div><span style=3D"font-family:arial,sans-serif">I sought the web=
 for the error &quot; <span style=3D"font-family:monospace">Failed to find =
physical volume &quot;/dev/zd96p5&quot;.</span>&quot; but the closest discu=
ssion in the LVM archives I found was one of mine back in 2014<br><br><a hr=
ef=3D"https://listman.redhat.com/archives/linux-lvm/2014-June/msg00016.html=
">https://listman.redhat.com/archives/linux-lvm/2014-June/msg00016.html</a>=
<br></span></div><div><br></div><div>This time though it seems pvs fails to=
 find the physical volume when lvmdiskscan does recognize it. Do I have to =
really upgrade lvm2 or is there another way to have pvs recognize the volum=
e?<br></div><div><span style=3D"font-family:arial,sans-serif"></span></div>=
<div><span style=3D"font-family:monospace"><br></span></div><div><span styl=
e=3D"font-family:monospace">root@server:/etc# lvm version<br>=C2=A0 LVM ver=
sion: =C2=A0 =C2=A0 2.02.133(2) (2015-10-30)<br>=C2=A0 Library version: 1.0=
2.110 (2015-10-30)<br>=C2=A0 Driver version: =C2=A04.34.0<br>root@
<span style=3D"font-family:monospace">server</span>

:/etc# lvmdiskscan -l</span></div><div><span style=3D"font-family:monospace=
"></span></div><span style=3D"font-family:monospace">=C2=A0 WARNING: only c=
onsidering LVM devices<br>=C2=A0 /dev/sda5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ =C2=A0 =C2=A0 =C2=A074.05 GiB] LVM physical volume<br>=C2=A0 /=
dev/zd304p3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A0 =C2=A019.00 G=
iB] LVM physical volume<br>=C2=A0 /dev/zd96p5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 [ =C2=A0 =C2=A01023.52 GiB] LVM physical volume<br><b>=C2=A0 /dev/zd=
112p5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A01023.52 GiB] LVM phy=
sical volume</b><br>=C2=A0 0 LVM physical volume whole disks<br>=C2=A0 4 LV=
M physical volumes<br>root@
<span style=3D"font-family:monospace">server</span>

:/etc# pvs -a /dev/zd96p5<br>=C2=A0 Failed to find physical volume &quot;/d=
ev/zd96p5&quot;.</span><br><br></div>Thanks, Alex.<br></div>

--00000000000059eb0c05cc89df06--

--===============7800127679888910037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7800127679888910037==--

