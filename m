Return-Path: <SRS0=LqjO=FG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B971AC64E8A
	for <linux-lvm@archiver.kernel.org>; Wed,  2 Dec 2020 09:55:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C42C206C0
	for <linux-lvm@archiver.kernel.org>; Wed,  2 Dec 2020 09:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C42C206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-FBow-GH-M-qDkyz-fbtshQ-1; Wed, 02 Dec 2020 04:55:51 -0500
X-MC-Unique: FBow-GH-M-qDkyz-fbtshQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB3F28558F0;
	Wed,  2 Dec 2020 09:55:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1C519C47;
	Wed,  2 Dec 2020 09:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B5F75002F;
	Wed,  2 Dec 2020 09:55:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B1EPjRI014387 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 1 Dec 2020 09:25:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 84BCB110F73F; Tue,  1 Dec 2020 14:25:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8016D111287B
	for <linux-lvm@redhat.com>; Tue,  1 Dec 2020 14:25:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64BC78039DD
	for <linux-lvm@redhat.com>; Tue,  1 Dec 2020 14:25:43 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-543-eUNg34B5PG-LNIrLnCM-HA-1; Tue, 01 Dec 2020 09:25:40 -0500
X-MC-Unique: eUNg34B5PG-LNIrLnCM-HA-1
Received: by mail-lj1-f182.google.com with SMTP id y10so3180591ljc.7
	for <linux-lvm@redhat.com>; Tue, 01 Dec 2020 06:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=1zVCoEn849K5ircQNiDP1Fz/eF8dXFVPscQ66IvmEwY=;
	b=Qv7bGzPeHGnklUQ9iyi29wWQN6T7JUpve7vp8r8CIWeiPSH1WYToLCndhRn2H2WGOT
	FurMGr9SVFT8l0jZ0weZ5NMGNP637l+8nU4+WRpQm3f0YUz4Kcp6HYpJkkdN2L8kcOoL
	3Cntog13RSsbjJuVU+ppB0qshIzVqlzB4xKQkoXqb/PhooVVUxSGOok7Wy/9nJUsXwkS
	QuPU/GfFfZLqfWRs3TSXQgRkwy6G+uSysOJ2Sy6Ya/sOtDHD1YE29uZ5YW6cuof32w2l
	eDM7pXzsP4nbCaG1mrhTIS+4yFwyhynhkFv0dajchWgu+3WR8sjT0bjsSR6YjdShcrW/
	vrRA==
X-Gm-Message-State: AOAM533BVdv6HlfTAQbHg3Xzg3lYoEMJIhFnslS9Xb+ARcdCElLxD/QQ
	T5DIGy5ilKdz1dfLmembwvdKiPqeYZYcxpOBCWNi82LmOfZ1Nw==
X-Google-Smtp-Source: ABdhPJxaz5hP3TgbkOTMavqq1TjxCcvgTSrnKbpAIdLxn8vU3X2B1zNC3M8KALaWPgzbORN+Ebr80wsZ/xRjxbaDWKU=
X-Received: by 2002:a05:651c:3cf:: with SMTP id
	f15mr1400962ljp.118.1606832738267; 
	Tue, 01 Dec 2020 06:25:38 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXtCk662ZfaG-crzrrKpi_efQqqOLbVCnSvLDsCOpLS0zw@mail.gmail.com>
	<24517.28961.127885.638522@quad.stoffel.home>
In-Reply-To: <24517.28961.127885.638522@quad.stoffel.home>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Tue, 1 Dec 2020 19:55:26 +0530
Message-ID: <CAMaziXtWxjq03yzdBWc57rBBj2UnL1KK9avgTbBFnX+PdwWTPQ@mail.gmail.com>
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
X-Mailman-Approved-At: Wed, 02 Dec 2020 04:55:17 -0500
Subject: Re: [linux-lvm] System completely unstable after migrating to thin
	pools
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6310672357726423363=="

--===============6310672357726423363==
Content-Type: multipart/alternative; boundary="00000000000093f61d05b567e675"

--00000000000093f61d05b567e675
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 1, 2020 at 3:55 AM John Stoffel <john@stoffel.org> wrote:

>
> I suspect you're toast.  What are you trying to accomplish here
> though?  Trying to stuff 10 pounds of data into a 5 pound bag?  *grin*
>
>
I don't know what you mean by that. Do you mean that thin pools cannot be
migrated to from older LVMs ?


> Or are you trying to have the ability to take snapshots of your system
> to make rollbacks easier?
>
>
Yes.


> You need to post the output of your configuration in more detail, with
> dmesg output, logs, lvs, pvs, vgs output, etc.
>
>
$ lvs
  LV     VG       Attr       LSize    Pool   Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  fedora vgfedora Vwi-aotz--  700.00g pool00        16.66

  pool00 vgfedora twi-aotz-- <929.76g               12.54  16.62


$ pvs
  PV                                                    VG       Fmt  Attr
PSize   PFree
  /dev/mapper/luks-2ec7f1ae-6f9b-4896-a7b2-be7809e9d2f4 vgfedora lvm2 a--
 929.99g 120.00m

$ vgs
  VG       #PV #LV #SN Attr   VSize   VFree
  vgfedora   1   2   0 wz--n- 929.99g 120.00m

dmesg:

https://pastebin.com/raw/svTX92SJ


> But really, you do have backups?
>
>
No.


-- 
Regards,
Sreyan Chakravarty

--00000000000093f61d05b567e675
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 1, 2020 at 3:55 AM John S=
toffel &lt;<a href=3D"mailto:john@stoffel.org" target=3D"_blank">john@stoff=
el.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>I suspect you&#39;re toast.=C2=A0 What are you trying to accompli=
sh here<br>
though?=C2=A0 Trying to stuff 10 pounds of data into a 5 pound bag?=C2=A0 *=
grin*<br>
<br></blockquote><div><br></div><div>I don&#39;t know what you mean by that=
. Do you mean that thin pools cannot be migrated to from older LVMs ?</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Or are you trying to have the ability to take snapshots of your system<br>
to make rollbacks easier?=C2=A0 <br>
<br></blockquote><div><br></div><div>Yes.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">You need to post the output of your =
configuration in more detail, with<br>
dmesg output, logs, lvs, pvs, vgs output, etc. <br>
<br></blockquote><div><br></div><div>$ lvs</div><div>=C2=A0 LV =C2=A0 =C2=
=A0 VG =C2=A0 =C2=A0 =C2=A0 Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0 =C2=A0Po=
ol =C2=A0 Origin Data% =C2=A0Meta% =C2=A0Move Log Cpy%Sync Convert<br>=C2=
=A0 fedora vgfedora Vwi-aotz-- =C2=A0700.00g pool00 =C2=A0 =C2=A0 =C2=A0 =
=C2=A016.66 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 pool00 vg=
fedora twi-aotz-- &lt;929.76g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 12.54 =C2=A016.62=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></div><div><br></div><div>=
$ pvs</div><div>=C2=A0 PV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG =C2=A0 =C2=A0=
 =C2=A0 Fmt =C2=A0Attr PSize =C2=A0 PFree =C2=A0<br>=C2=A0 /dev/mapper/luks=
-2ec7f1ae-6f9b-4896-a7b2-be7809e9d2f4 vgfedora lvm2 a-- =C2=A0929.99g 120.0=
0m<br></div><div><br></div><div>$ vgs</div><div>=C2=A0 VG =C2=A0 =C2=A0 =C2=
=A0 #PV #LV #SN Attr =C2=A0 VSize =C2=A0 VFree =C2=A0<br>=C2=A0 vgfedora =
=C2=A0 1 =C2=A0 2 =C2=A0 0 wz--n- 929.99g 120.00m<br></div><div><br></div><=
div>dmesg:</div><div><br></div><div><a href=3D"https://pastebin.com/raw/svT=
X92SJ">https://pastebin.com/raw/svTX92SJ</a><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
But really, you do have backups?<br>
<br></blockquote><div><br></div><div>No.</div></div><br clear=3D"all"><div>=
<br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr">Regards,<div>Sreyan Chak=
ravarty</div></div></div></div>

--00000000000093f61d05b567e675--

--===============6310672357726423363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6310672357726423363==--

