Return-Path: <SRS0=nGWe=GI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5960C433E0
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 08:37:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0CC72065D
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 08:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0CC72065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-g-Wto6KhMAi5corAs01jsQ-1; Tue, 05 Jan 2021 03:37:27 -0500
X-MC-Unique: g-Wto6KhMAi5corAs01jsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CBD410051AA;
	Tue,  5 Jan 2021 08:37:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D51D71002382;
	Tue,  5 Jan 2021 08:37:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 397634A7C6;
	Tue,  5 Jan 2021 08:37:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1019o8Ag021421 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 1 Jan 2021 04:50:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 588C82166B2A; Fri,  1 Jan 2021 09:50:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5297A2166B28
	for <linux-lvm@redhat.com>; Fri,  1 Jan 2021 09:50:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2A52800B3B
	for <linux-lvm@redhat.com>; Fri,  1 Jan 2021 09:50:05 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-482-xVh3g2JEMaiuI7n5OoiTJw-1; Fri, 01 Jan 2021 04:50:02 -0500
X-MC-Unique: xVh3g2JEMaiuI7n5OoiTJw-1
Received: by mail-lf1-f51.google.com with SMTP id x20so48286470lfe.12
	for <linux-lvm@redhat.com>; Fri, 01 Jan 2021 01:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XIz75E148brmIgoy/STW9eT2PoK7GRFcEO5WEpahvCE=;
	b=JKe3hEZYYbu1QpwXiG+J42mDL3tk5kad+yJ4sSXeIMioaa8s3y1ta6gl/aP9lqLuF9
	Tml2B2dMwRwSTYCTfuPstwjq3FGgVluaTVGxbYbuIQXLwT4W/NL1qNMRM60PGdtvEP5a
	6Nwl89k4/66RRbgVSY8IO1XPJpMFwd7zsI/54BpzZTfLBJAk9QxSGIx2Csk9N4rdevQ6
	ob8NP345b47GCLaBwPU2lKjgJ7LkXtkInR9ZLJElLULQL2R3PLAftreCNazIGKS4bIIF
	Ev4aPIA606q5DPsdEI+pGFpp2c2VyZluMZTsX0hW+1VKKS0RLypZ6nlc7j/Fn78HCD0i
	DUjw==
X-Gm-Message-State: AOAM532FB7rzlnWKjcFtcnDbX8PVc1fFnMTWoMZj8WOEYXJi0I6IXKFT
	TFkP1b4pj0mAoa9KnRYuDHVB2PpXFYtCFdvoSFEh2roIWJz8lw==
X-Google-Smtp-Source: ABdhPJxNVQzI7OeozFiAPOPdEv3gmeiT2eNwKwXNfttFW/nZ44clhhuUyg1PPTvzt3iGHTatBdCGv8rYhxX206sJicU=
X-Received: by 2002:a2e:a553:: with SMTP id e19mr31919156ljn.454.1609494600921;
	Fri, 01 Jan 2021 01:50:00 -0800 (PST)
MIME-Version: 1.0
From: Songmin Li <lisongmin9@gmail.com>
Date: Fri, 1 Jan 2021 17:49:49 +0800
Message-ID: <CACOXiSRtQDy5gBKveWdUrA+qV7bm_U20TnKqupWhuCHbMm4sOA@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 05 Jan 2021 03:36:58 -0500
Subject: [linux-lvm] there is a vgextend sagfault with missing pv which is
 resolved on master, can we backport it to 2.02 branch
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5835394331669349043=="

--===============5835394331669349043==
Content-Type: multipart/alternative; boundary="000000000000f4b5fe05b7d3a97f"

--000000000000f4b5fe05b7d3a97f
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a lv format with raid1, and one of the pv is fault recently.
I prepare to repair via follow steps:

1. Unplug the fault device and plug new deive
2. Format new device as pv
3. Add new pv to the vg via vgextend (which segfault here)

    # vgextend a /dev/sdc2
    WARNING: Device for PV ZYO8Gj-cxTa-sEUj-vWjM-H5MA-BWgu-Yeuk27 not found
or rejected by a filter.
    Couldn't find device with uuid ZYO8Gj-cxTa-sEUj-vWjM-H5MA-BWgu-Yeuk27.
    WARNING: Device for PV ZYO8Gj-cxTa-sEUj-vWjM-H5MA-BWgu-Yeuk27 not found
or rejected by a filter.
    zsh: segmentation fault (core dumped)  vgextend a /dev/sdc2

4. Repair via lvconvert

Since the segfault, I can not repair the lvm, so I debug into it, I seems
dev parameter is a null pointer, which cause the segfault.

#0  0x000055bec50e4b15 in dev_get_direct_block_sizes (dev=0x0,
physical_block_size=physical_block_size@entry=0x7fff7e169a50,
logical_block_size=logical_block_size@entry=0x7fff7e169a54) at
device/dev-io.c:141
#1  0x000055bec512cb48 in vg_extend_each_pv (vg=vg@entry=0x55bec75d2820,
pp=pp@entry=0x7fff7e169cb0) at metadata/metadata.c:719

I check the file on git, the issue is fixed on the master branch, but not
backport to 2.02 stable now (my lvm2 version is 2.02.187).
The commit in master is:

# git show 98d420200
Alias tip: gsh 98d420200
commit 98d420200e16b450b6b7e33b83bdf36a59196d6d
Author: David Teigland <teigland@redhat.com>
Date:   Tue Sep 3 10:07:56 2019 -0500

    vgextend: check missing device during block size check

    Checking the block size when a device is missing could
    trigger a segfault.

diff --git a/lib/metadata/metadata.c b/lib/metadata/metadata.c
index 6d21ff99c..61906cc4b 100644
--- a/lib/metadata/metadata.c
+++ b/lib/metadata/metadata.c
@@ -769,6 +769,9 @@ int vg_extend_each_pv(struct volume_group *vg, struct
pvcreate_params *pp)
                logical_block_size = 0;
                physical_block_size = 0;

+               if (!pvl->pv->dev)
+                       continue;
+
                if (!dev_get_direct_block_sizes(pvl->pv->dev,
&physical_block_size, &logical_block_size))
                        continue;

After apply this patch, I can repair the lvm as normal.
Can we backport this commit to 2.02 branch so we can repair lvm on disk
fault?

Thanks.

--000000000000f4b5fe05b7d3a97f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div><br>I have a lv format with raid1,=
 and one of the pv is fault recently.<br>I prepare to repair via follow ste=
ps:<br><br>1. Unplug the fault device and plug new deive<br>2. Format new d=
evice as pv<br>3. Add new pv to the vg via vgextend (which segfault here)<b=
r><br>=C2=A0 =C2=A0 # vgextend a /dev/sdc2<br>=C2=A0 =C2=A0 WARNING: Device=
 for PV ZYO8Gj-cxTa-sEUj-vWjM-H5MA-BWgu-Yeuk27 not found or rejected by a f=
ilter.<br>=C2=A0 =C2=A0 Couldn&#39;t find device with uuid ZYO8Gj-cxTa-sEUj=
-vWjM-H5MA-BWgu-Yeuk27.<br>=C2=A0 =C2=A0 WARNING: Device for PV ZYO8Gj-cxTa=
-sEUj-vWjM-H5MA-BWgu-Yeuk27 not found or rejected by a filter.<br>=C2=A0 =
=C2=A0 zsh: segmentation fault (core dumped) =C2=A0vgextend a /dev/sdc2<br>=
<br>4. Repair via lvconvert<br><br>Since the segfault, I can not repair the=
 lvm, so I debug into it, I seems dev parameter is a null pointer, which ca=
use the segfault.<br><br>#0 =C2=A00x000055bec50e4b15 in dev_get_direct_bloc=
k_sizes (dev=3D0x0, physical_block_size=3Dphysical_block_size@entry=3D0x7ff=
f7e169a50, logical_block_size=3Dlogical_block_size@entry=3D0x7fff7e169a54) =
at device/dev-io.c:141<br>#1 =C2=A00x000055bec512cb48 in vg_extend_each_pv =
(vg=3Dvg@entry=3D0x55bec75d2820, pp=3Dpp@entry=3D0x7fff7e169cb0) at metadat=
a/metadata.c:719<br><br>I check the file on git, the issue is fixed on the =
master branch, but not backport to 2.02 stable now (my lvm2 version is 2.02=
.187).<br>The commit in master is:<br><br># git show 98d420200<br>Alias tip=
: gsh 98d420200<br>commit 98d420200e16b450b6b7e33b83bdf36a59196d6d<br>Autho=
r: David Teigland &lt;<a href=3D"mailto:teigland@redhat.com">teigland@redha=
t.com</a>&gt;<br>Date: =C2=A0 Tue Sep 3 10:07:56 2019 -0500<br><br>=C2=A0 =
=C2=A0 vgextend: check missing device during block size check<br><br>=C2=A0=
 =C2=A0 Checking the block size when a device is missing could<br>=C2=A0 =
=C2=A0 trigger a segfault.<br><br>diff --git a/lib/metadata/metadata.c b/li=
b/metadata/metadata.c<br>index 6d21ff99c..61906cc4b 100644<br>--- a/lib/met=
adata/metadata.c<br>+++ b/lib/metadata/metadata.c<br>@@ -769,6 +769,9 @@ in=
t vg_extend_each_pv(struct volume_group *vg, struct pvcreate_params *pp)<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logical_block_size=
 =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical=
_block_size =3D 0;<br><br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!pvl-&gt;pv-&gt;dev)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>+<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dev_get_direct_block_sizes(pvl-&gt;=
pv-&gt;dev, &amp;physical_block_size, &amp;logical_block_size))<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br><br>After apply this patch, I can repair the lvm as normal=
.<br>Can we backport this commit to 2.02 branch so we can repair lvm on dis=
k fault?<br><br>Thanks.<br></div></div>

--000000000000f4b5fe05b7d3a97f--

--===============5835394331669349043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============5835394331669349043==--

