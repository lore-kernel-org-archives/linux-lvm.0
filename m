Return-Path: <SRS0=MvFQ=PW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB4DC433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 06:51:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D983661051
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 06:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D983661051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-hAXql5fGPMelE4-i4yF-PQ-1; Wed, 03 Nov 2021 02:51:27 -0400
X-MC-Unique: hAXql5fGPMelE4-i4yF-PQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3150C1023F4F;
	Wed,  3 Nov 2021 06:51:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D687860C0F;
	Wed,  3 Nov 2021 06:51:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64A534EA2F;
	Wed,  3 Nov 2021 06:51:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A36fM3E013300 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 02:41:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9EE791121314; Wed,  3 Nov 2021 06:41:22 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97A661121320
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 06:41:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8D371064E6B
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 06:41:19 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-394-aqEedgPiO3G9oGG0nv1lIg-1; Wed, 03 Nov 2021 02:41:17 -0400
X-MC-Unique: aqEedgPiO3G9oGG0nv1lIg-1
Received: by mail-ed1-f49.google.com with SMTP id g14so5587717edz.2
	for <linux-lvm@redhat.com>; Tue, 02 Nov 2021 23:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:in-reply-to:references:thread-topic:user-agent
	:mime-version:content-transfer-encoding:subject:from:date:to
	:message-id;
	bh=kn7LK5VXxkHxoHLELbGiDwziMIjyvceUclg35x7V2r8=;
	b=7E8Y1w4em7MzyjiY5PW420BLRJpGYuWyP1PhDU7g6CYQjepuKIvHrTETZlsRjxM9W0
	DxPPvbc7271OKFGHNrjbc2YlBNmn7UyPpSymbWO2F1jX2iEBzMHJDL5gXbdl2Sx5rfYQ
	LMu6rbGGZSBRy+PcP2OiiZvuVMHvDtqJVG9aeeU5dQ9zgcrLzBieDKZ5xADXfyf0Z/0o
	5ZadAPDzNIyaNbq9OB+aOea1ftLHHyTieR7/D2kXSQAy7Kp1hDKkpiuo5XSLoEBbQVxO
	FYZ43yRCRJGLUMA6eu3a10lFHtevrukoPGa8bzfFkSX0nbRSHBFFC0NQE4NfV2ieIGcy
	jCcA==
X-Gm-Message-State: AOAM5323lgM/PG72HiCS99qOMNYaPA7MRFNpJTp3PJtaeomuU5iGxJ3V
	lNA2eS0LiE5UC6b0qHR0uPbo5u8a8P4eaw==
X-Google-Smtp-Source: ABdhPJyLkFaklZgiAIVOl6bggVRld4JLBVQF8jTNijGBniUaqEFZH+xG6NudnE6C6g7VZf6SeJOeqQ==
X-Received: by 2002:a17:907:7d89:: with SMTP id
	oz9mr54077362ejc.279.1635921676239; 
	Tue, 02 Nov 2021 23:41:16 -0700 (PDT)
Received: from ASUS-Phone.fritz.box ([62.18.234.29])
	by smtp.gmail.com with ESMTPSA id g12sm700319edz.68.2021.11.02.23.41.15
	for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 02 Nov 2021 23:41:15 -0700 (PDT)
In-Reply-To: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
References: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
X-Referenced-Uid: 68344
Thread-Topic: [linux-lvm] Replace Drive in RAID6
X-Blue-Identity: !l=453&o=43&fo=4295&pl=284&po=0&qs=PREFIX&f=HTML&n=Roberto%20Fastec&e=roberto.fastec%40gmail.com&m=!%3AZWZmZjVmYTctYjI3NC00YTQwLTk4YjQtNWJmYTEwOWY4OWJl%3ASU5CT1g%3D%3ANjgzNDQ%3D%3AANSWERED&p=251&q=SHOW
X-Is-Generated-Message-Id: true
User-Agent: Android
MIME-Version: 1.0
X-Local-Message-Id: <8842367a-8991-458e-8494-ee3ab58645d0@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Wed, 03 Nov 2021 07:41:15 +0100
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <8842367a-8991-458e-8494-ee3ab58645d0@gmail.com>
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
X-Mailman-Approved-At: Wed, 03 Nov 2021 02:51:02 -0400
Subject: Re: [linux-lvm] Replace Drive in RAID6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5782594676074400357=="

--===============5782594676074400357==
Content-Type: multipart/alternative;
	boundary="----2324VZPPEWUMSYS0TR319OYVGNRWRX"

------2324VZPPEWUMSYS0TR319OYVGNRWRX
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

If you can't for some reasons succeed=20
we @ https://www.RecuperoDatiRAIDFAsTec.it=20
can recover it with very low flat rates

BEWARE if one drive went failed and ALL the drives have the same age
nothing can guarantee that none of the other drives is worn too

the HINT is to clone all the drives as we do on regular base=20

then work with the clones

if you wanna exchange info's, the +39348******* number on the website has W=
hatsApp

Kind regards
Roberto G.
Technical Manager
https://www.RecuperoDatiRAIDFAsTec.it

=E2=81=A3Ottieni BlueMail per Android =E2=80=8B

Il giorno 3 nov 2021, 07:06, alle ore 07:06, Adam Puleo <adam.puleo@icloud.=
com> ha scritto:
>Hello,
>
>One of my drives failed in my RAID6 and I=E2=80=99m trying to replace it
>without success.
>
>I=E2=80=99m trying to rebuild the failed drive (/dev/sda): lvchange --rebu=
ild
>/dev/sda vg_data
>
>But I=E2=80=99m receiving the error: vg_data/lv_data must be active to per=
form
>this operation.
>
>I have tried to activate the logical volume without success.
>
>How do I go about activating the volume so that I can rebuild the
>failed drive?
>
>Thanks,
>-Adam
>
># lvs -a -o name,segtype,devices
>LV                       Type   Devices                               =20
>                                                          =20
>lv_data                  raid6=20
>lv_data_rimage_0(0),lv_data_rimage_1(0),lv_data_rimage_2(0),lv_data_rimage=
_3(0),lv_data_rimage_4(0)
>[lv_data_rimage_0]       error                                        =20
>                                                          =20
>[lv_data_rimage_1]       linear /dev/sdc1(1)                          =20
>                                                          =20
>[lv_data_rimage_2]       linear /dev/sdb1(1)                          =20
>                                                          =20
>[lv_data_rimage_3]       linear /dev/sdf1(1)                          =20
>                                                          =20
>[lv_data_rimage_4]       linear /dev/sde1(2)                          =20
>                                                          =20
>[lv_data_rmeta_0]        error                                        =20
>                                                          =20
>[lv_data_rmeta_1]        linear /dev/sdc1(0)                          =20
>                                                          =20
>[lv_data_rmeta_2]        linear /dev/sdb1(0)                          =20
>                                                          =20
>[lv_data_rmeta_3]        linear /dev/sdf1(0)                          =20
>                                                          =20
>[lv_data_rmeta_4]        linear /dev/sde1(0)                          =20
>                                                          =20
>
># lvs -a
>LV                       VG            Attr       LSize   Pool Origin
>Data%  Meta%  Move Log Cpy%Sync Convert
>lv_data                  vg_data       rwi---r--- 990.00g             =20
>                                    =20
>[lv_data_rimage_0]       vg_data       vwi-a-r-r- 330.00g             =20
>                                    =20
>[lv_data_rimage_1]       vg_data       Iwi-a-r-r- 330.00g             =20
>                                    =20
>[lv_data_rimage_2]       vg_data       Iwi-a-r-r- 330.00g             =20
>                                    =20
>[lv_data_rimage_3]       vg_data       Iwi-a-r-r- 330.00g             =20
>                                    =20
>[lv_data_rimage_4]       vg_data       Iwi-a-r-r- 330.00g             =20
>                                    =20
>[lv_data_rmeta_0]        vg_data       ewi-a-r-r-   4.00m             =20
>                                    =20
>[lv_data_rmeta_1]        vg_data       ewi-a-r-r-   4.00m             =20
>                                    =20
>[lv_data_rmeta_2]        vg_data       ewi-a-r-r-   4.00m             =20
>                                    =20
>[lv_data_rmeta_3]        vg_data       ewi-a-r-r-   4.00m             =20
>                                    =20
>[lv_data_rmeta_4]        vg_data       ewi-a-r-r-   4.00m             =20
>                                    =20
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------2324VZPPEWUMSYS0TR319OYVGNRWRX
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">If you can't=
 for some reasons succeed <br></div>
<div dir=3D"auto">we @ <a href=3D"https://www.RecuperoDatiRAIDFAsTec.it">ht=
tps://www.RecuperoDatiRAIDFAsTec.it</a> <br></div>
<div dir=3D"auto">can recover it with very low flat rates<br><br></div>
<div dir=3D"auto">BEWARE if one drive went failed and ALL the drives have t=
he same age<br></div>
<div dir=3D"auto">nothing can guarantee that none of the other drives is wo=
rn too<br><br></div>
<div dir=3D"auto">the HINT is to clone all the drives as we do on regular b=
ase <br><br></div>
<div dir=3D"auto">then work with the clones<br><br></div>
<div dir=3D"auto">if you wanna exchange info's, the +39348******* number on=
 the website has WhatsApp<br><br></div>
<div dir=3D"auto">Kind regards<br></div>
<div dir=3D"auto">Roberto G.<br></div>
<div dir=3D"auto">Technical Manager<br></div>
<div dir=3D"auto"><a href=3D"https://www.RecuperoDatiRAIDFAsTec.it">https:/=
/www.RecuperoDatiRAIDFAsTec.it</a><br><br></div>
<div dir=3D"auto"><!-- tmjah_g_1299s -->Ottieni <!-- tmjah_g_1299e --><a hr=
ef=3D"https://bluemail.me"><!-- tmjah_g_1299s -->BlueMail per Android<!-- t=
mjah_g_1299e --></a><!-- tmjah_g_1299s --> <!-- tmjah_g_1299e --></div>
<div class=3D"gmail_quote" >Il giorno 3 nov 2021, alle ore 07:06, Adam Pule=
o &lt;<a href=3D"mailto:adam.puleo@icloud.com" target=3D"_blank">adam.puleo=
@icloud.com</a>&gt; ha scritto:<blockquote class=3D"gmail_quote" style=3D"m=
argin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;">
<pre class=3D"blue">Hello,<br><br>One of my drives failed in my RAID6 and I=
=E2=80=99m trying to replace it without success.<br><br>I=E2=80=99m trying =
to rebuild the failed drive (/dev/sda): lvchange --rebuild /dev/sda vg_data=
<br><br>But I=E2=80=99m receiving the error: vg_data/lv_data must be active=
 to perform this operation.<br><br>I have tried to activate the logical vol=
ume without success.<br><br>How do I go about activating the volume so that=
 I can rebuild the failed drive?<br><br>Thanks,<br>-Adam<br><br># lvs -a -o=
 name,segtype,devices<br>  LV                       Type   Devices         =
                                                                           =
        <br>  lv_data                  raid6  lv_data_rimage_0(0),lv_data_r=
image_1(0),lv_data_rimage_2(0),lv_data_rimage_3(0),lv_data_rimage_4(0)<br> =
 [lv_data_rimage_0]       error                                            =
                                                         <br>  [lv_data_rim=
age_1]       linear /dev/sdc1(1)                                           =
                                            <br>  [lv_data_rimage_2]       =
linear /dev/sdb1(1)                                                        =
                               <br>  [lv_data_rimage_3]       linear /dev/s=
df1(1)                                                                     =
                  <br>  [lv_data_rimage_4]       linear /dev/sde1(2)       =
                                                                           =
     <br>  [lv_data_rmeta_0]        error                                  =
                                                                   <br>  [l=
v_data_rmeta_1]        linear /dev/sdc1(0)                                 =
                                                      <br>  [lv_data_rmeta_=
2]        linear /dev/sdb1(0)                                              =
                                         <br>  [lv_data_rmeta_3]        lin=
ear /dev/sdf1(0)                                                           =
                            <br>  [lv_data_rmeta_4]        linear /dev/sde1=
(0)                                                                        =
               <br><br># lvs -a<br>  LV                       VG           =
 Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert<br>=
  lv_data                  vg_data       rwi---r--- 990.00g                =
                                    <br>  [lv_data_rimage_0]       vg_data =
      vwi-a-r-r- 330.00g                                                   =
 <br>  [lv_data_rimage_1]       vg_data       Iwi-a-r-r- 330.00g           =
                                         <br>  [lv_data_rimage_2]       vg_=
data       Iwi-a-r-r- 330.00g                                              =
      <br>  [lv_data_rimage_3]       vg_data       Iwi-a-r-r- 330.00g      =
                                              <br>  [lv_data_rimage_4]     =
  vg_data       Iwi-a-r-r- 330.00g                                         =
           <br>  [lv_data_rmeta_0]        vg_data       ewi-a-r-r-   4.00m =
                                                   <br>  [lv_data_rmeta_1] =
       vg_data       ewi-a-r-r-   4.00m                                    =
                <br>  [lv_data_rmeta_2]        vg_data       ewi-a-r-r-   4=
.00m                                                    <br>  [lv_data_rmet=
a_3]        vg_data       ewi-a-r-r-   4.00m                               =
                     <br>  [lv_data_rmeta_4]        vg_data       ewi-a-r-r=
-   4.00m                                                    <br><br><br><b=
r><hr><br>linux-lvm mailing list<br>linux-lvm@redhat.com<br><a href=3D"http=
s://listman.redhat.com/mailman/listinfo/linux-lvm">https://listman.redhat.c=
om/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=3D"http=
://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre></b=
lockquote></div></body></html>
------2324VZPPEWUMSYS0TR319OYVGNRWRX--

--===============5782594676074400357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============5782594676074400357==--

