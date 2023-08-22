Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77405EE49AB
	for <linux-lvm@archiver.kernel.org>; Wed, 23 Aug 2023 06:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692773610;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TXy+NNfE+Ypyinew5YWnMjMMtP6f+pSktGD4H8K0jCo=;
	b=fIwfq+HLPMCNEEXyz5/TNMvi55ruYMhOa0G3Ay1P+7dUNxBNnhZtE0Lm1ZRU0ESVyqpQ6O
	4fejn4hlRqPJcv5CpDX7u37Tl6a+ad3VoDosBQdR1Lxa4q+ruE5hxrxhduynKKPNkO5xf4
	XDzVNQRWES4NfXOkeXR3cUVMRsfcMDE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-cRfRfozaNLeFWqM7QuO5DQ-1; Wed, 23 Aug 2023 02:53:25 -0400
X-MC-Unique: cRfRfozaNLeFWqM7QuO5DQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B6E51C25A6A;
	Wed, 23 Aug 2023 06:53:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94208140E950;
	Wed, 23 Aug 2023 06:53:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0C3481946588;
	Wed, 23 Aug 2023 06:53:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 43EE81946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 22 Aug 2023 09:01:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0CD63140E96F; Tue, 22 Aug 2023 09:01:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D83140E96E
 for <linux-lvm@redhat.com>; Tue, 22 Aug 2023 09:01:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA8558564F0
 for <linux-lvm@redhat.com>; Tue, 22 Aug 2023 09:01:43 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-2vhfRup-M5WnR9nDemgEGA-1; Tue,
 22 Aug 2023 05:01:41 -0400
X-MC-Unique: 2vhfRup-M5WnR9nDemgEGA-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [172.20.35.190] ([37.24.118.138]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mm9Zi-1pqTrP2tmq-00iFZd; Tue, 22
 Aug 2023 11:01:39 +0200
Message-ID: <bd62f79b-7962-d6ff-0533-0d106a9111c8@web.de>
Date: Tue, 22 Aug 2023 11:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Marian Csontos <mcsontos@redhat.com>
References: <fa206f6a-2675-95c9-d6fe-7ef8466a0dd5@web.de>
 <5f40e362-e6b9-d66e-312b-6999e40ba951@web.de>
 <CAJNi=Xo+4ti+bwfAWMO1Ocxa9zaiz0989pHQAoC0-2hhYOij-g@mail.gmail.com>
From: Roland <devzero@web.de>
In-Reply-To: <CAJNi=Xo+4ti+bwfAWMO1Ocxa9zaiz0989pHQAoC0-2hhYOij-g@mail.gmail.com>
X-Provags-ID: V03:K1:8Dk6fjmcftnAycL6mnB/7vRCYurGzINpkLe1xun/lTlvI2IEA6M
 tzZzMuPN6XAmpFmWFFphpkvNfu7pNkdMTICNXt8CHNvONb8C0Bc7w9MGOidwlIhAGOU88iZ
 YiGxl6/j2iiVPw6vSirPHlF1S/QNZ2QiODYPI+gQ4SfqTxJ0UpiDcBTxj7eAcDI51sUy2EG
 4Z0t+qsiTkdTX2aojDc9w==
UI-OutboundReport: notjunk:1;M01:P0:Ez6s0x841xs=;IZlKhC1HbdpHSsva1STcrimfUp3
 hzHlemr7o/vXwNkTGAcAGcNDppb/j+1MytcioBNKFEd+5/lvzOnrUyo2TMIbl968qvra/d3x2
 iUAG+s3oIUOh/cSPIkSDQmaLY9dKsdqU03V4iRWxjusxjkvZt1nzZ9n4o5iEBoG6Ua94FN+ui
 BbKCpx5qUC1hEroGkkIjqIzoRa+BCY5zKdrDHXlCLl25HgYZCCmWuTPp7Uk3cCkJzghgDZuLz
 maFMbiDtL41CKRtW+8B6YIED7PMRt0gsYEm4ZiNJV8Br5J16JjhnvMalXLCHbKcoqDSH/8/zY
 2pwWzf1eTZqHXKVyw3UvtjPAUnPGa3vEJY+Pv+ayxLSX35lH6Y3RrgNdjA4BqYoY2XtQHC+hh
 JT9dgBqTddbEc+CqIcENo0Hj2mNjIhaoQXxaB90neM86B4u1JS/IwRhdndvW8nhCWtPPxZrl8
 jIzXnCK7b6EOKNO8p1IrFTy429qDrKDkLwl9tBv4qm5FSKTfgK6b9acMtPNVgbHpOLKHG7oAe
 YXJyNo7Q4xC9qw+UnSExaeM6aSH1b+yX1j5W4GEXwysleTgcFYOGmPwL5YndU72Pgfkt8G+eJ
 9d4SwpcoIxMTKFvQP9hBpNO/0XfEUTPJYUBgSYM7fxCgnpAgxfrt7Ben9zeKoKeA6atJZdOia
 bBrHV0F1M0NvP0PPLQZnR8Z6j68h9a3UumznbLOy3U7mgTDGURifSshRd1B0h18hb30YaxzCN
 dAjK9b1EURWgLfpQ/Y2mtEx6mkxaIXQts8XgZgpFWSYa2U80ksTJT3MCHKgFYSF37lRbbU8LZ
 lHSJVBuuAypsSeudZmyHypkqFeOBmYyG7RWxizIm5cR5Oiv2SK27ERdKnBXWWzKEBLcNv9umG
 TrB5XPYnqTH1h4jpaOQwEEooYDYtpwyV/7vvaXBLyqwV/jOgOFjVqvN2dE7EOjbOkcERS2Nk2
 Lk9HEQwU4kWevsQfsrbn9W/APYs=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 23 Aug 2023 06:53:12 +0000
Subject: Re: [linux-lvm] indistinguishable column names ( BA Start Start
 Start Start )
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: web.de
Content-Type: multipart/mixed; boundary="===============8225787046850717418=="

This is a multi-part message in MIME format.
--===============8225787046850717418==
Content-Type: multipart/alternative;
 boundary="------------vvPXUw0wbCfwOhWi3P1TkBAh"

This is a multi-part message in MIME format.
--------------vvPXUw0wbCfwOhWi3P1TkBAh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

 > Hi Roland, is `lvs --reportformat=C2=A0json` or `lvs --nameprefixes` goo=
d
enough?

good when using scripting / automated processing - but not good, when we
need it human readable.

i'd even would call it a bug, when using same strings for "translated"
names.

would anybody accept something like this (just for saving column space)
?=C2=A0 ok, that's a little bit over the top - but i wand to underline what=
 i
mean

getpersondetails -o forename, surname, streetname, cityname

name=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 name=C2=A0=C2=A0=C2=A0 name=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 name
john=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 doe=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 highstreet=C2=A0=C2=A0 =C2=A0 washington


roland




Am 21.08.23 um 18:00 schrieb Marian Csontos:
> Hi Roland, is `lvs --reportformat=C2=A0json` or `lvs --nameprefixes` good
> enough?
>
> On Sat, Aug 19, 2023 at 6:06=E2=80=AFPM Roland <devzero@web.de> wrote:
>
>     =C2=A0> furthermore, it's a little bit weird that some columns being
>     printed
>     by default when using -o, is
>     =C2=A0> there an easier way to remove those besides explictly removin=
g
>     them
>     one by one with several -o options ? "-o-opt1,-opt2,..." doesn't work
>
>     sorry for this noise, i was too dumb for that , "-o+opt1,opt2
>     -o-opt3,opt4" works as desired (as documented in manpage)
>
>     =C2=A0> themselves,and there also seems no way to add separators in
>     between
>     (like with printf) for separation/formatting
>
>     also sorry for this, as we can use --separator=3D"," (apparently did
>     have too much coffee and had overseen that in the manpage)
>
>     the question regarding native column headers/description remains
>
>     roland
>
>     Am 19.08.23 um 17:20 schrieb Roland:
>     > hello,
>     >
>     > does somebody know how we can have native (i.e. non translated)
>     column
>     > field names in first line of output of pvs ?
>     >
>     > in its current implementation, output is hard to read ,
>     difficult to
>     > distinguish and also not scriptable/parseable, as whitespace is
>     used
>     > for field separator and there are fields which also contain
>     whitespace
>     > themselves,and there also seems no way to add separators in between
>     > (like with printf) for separation/formatting
>     >
>     > # pvs --units s -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start
>     > =C2=A0 PV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fmt=C2=A0 Attr PSize=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 PFree BA Start Start
>     > Start Start
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S
>     > 2097152S=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 0
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S
>     > 2097152S=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 1
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0
>     5309
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0
>     5587
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0
>     5588
>     >
>     > i mean like this:
>     >
>     > # pvs --units s -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start
>     > =C2=A0 PV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fmt=C2=A0 Attr PSize=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 PFree pv_ba_start
>     > seg_start seg_start_pe pvseg_start
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S =C2=A0=C2=A0 0S
>     > 2097152S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S 0=
S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S
>     > 2097152S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S 0S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0
>     =C2=A0 =C2=A0 0
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0 5309
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S 0S
>     > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5587
>     > =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 11720982528S=
=C2=A0=C2=A0=C2=A0 0S 0S 0S
>     > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5588
>     >
>     > furthermore, it's a little bit weird that some columns being
>     printed
>     > by default when using -o, is there an easier way to remove those
>     > besides explictly removing them one by one with several -o
>     options ?
>     > "-o-opt1,-opt2,..." doesn't work
>     >
>     > # pvs --units s -o+pv_ba_start,seg_start,pvseg_start,seg_start_pe
>     > -o-vg_name -o-pv_name -o-pv_fmt -o-attr -o -pv_size -o -pv_free
>     > =C2=A0 BA Start Start=C2=A0=C2=A0=C2=A0 Start Start
>     > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S 2097152S=C2=A0=C2=A0=
=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1
>     > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S 2097152S=C2=A0=C2=A0=
=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 1
>     > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0S=C2=A0 5309=C2=A0=C2=A0=C2=A0=C2=A0 0
>     > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0S=C2=A0 5587=C2=A0=C2=A0=C2=A0=C2=A0 0
>     > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0S=C2=A0 5588=C2=A0=C2=A0=C2=A0=C2=A0 0
>     >
>     > roland
>     >
>     _______________________________________________
>     linux-lvm mailing list
>     linux-lvm@redhat.com
>     https://listman.redhat.com/mailman/listinfo/linux-lvm
>     read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO athttp://tldp.org/HOWTO/LVM-HOWTO/

--------------vvPXUw0wbCfwOhWi3P1TkBAh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Hi, <br>
      <br>
      &gt; Hi Roland, is `lvs --reportformat=C2=A0json` or `lvs
      --nameprefixes` good enough?<br>
      <br>
      good when using scripting / automated processing - but not good,
      when we need it human readable.<br>
      <br>
      i'd even would call it a bug, when using same strings for
      "translated" names.<br>
      <br>
      would anybody accept something like this (just for saving column
      space) ?=C2=A0 ok, that's a little bit over the top - but i wand to
      underline what i mean<br>
      <br>
      getpersondetails -o forename, surname, streetname, cityname<br>
      <br>
      name=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 name=C2=A0=C2=A0=C2=A0 name=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 name<br>
      john=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 doe=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 highstreet=C2=A0=C2=A0 =C2=A0 washington =C2=A0=C2=A0 <br>
      <br>
      <br>
      roland<br>
      <br>
      <br>
      <br>
      <br>
    </p>
    <div class=3D"moz-cite-prefix">Am 21.08.23 um 18:00 schrieb Marian
      Csontos:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAJNi=3DXo+4ti+bwfAWMO1Ocxa9zaiz0989pHQAoC0-2hhYOij-g@mail.gmai=
l.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">Hi Roland, is `lvs --reportformat=C2=A0json` or `lvs
        --nameprefixes` good enough?</div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 19, 2023 at
          6:06=E2=80=AFPM Roland &lt;<a href=3D"mailto:devzero@web.de"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">devzer=
o@web.de</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0&gt;
          furthermore, it's a little bit weird that some columns being
          printed <br>
          by default when using -o, is<br>
          =C2=A0&gt; there an easier way to remove those besides explictly
          removing them <br>
          one by one with several -o options ? "-o-opt1,-opt2,..."
          doesn't work<br>
          <br>
          sorry for this noise, i was too dumb for that , "-o+opt1,opt2
          <br>
          -o-opt3,opt4" works as desired (as documented in manpage)<br>
          <br>
          =C2=A0&gt; themselves,and there also seems no way to add separato=
rs
          in between <br>
          (like with printf) for separation/formatting<br>
          <br>
          also sorry for this, as we can use --separator=3D","=C2=A0=C2=A0
          (apparently did <br>
          have too much coffee and had overseen that in the manpage)<br>
          <br>
          the question regarding native column headers/description
          remains<br>
          <br>
          roland<br>
          <br>
          Am 19.08.23 um 17:20 schrieb Roland:<br>
          &gt; hello,<br>
          &gt;<br>
          &gt; does somebody know how we can have native (i.e. non
          translated) column <br>
          &gt; field names in first line of output of pvs ?<br>
          &gt;<br>
          &gt; in its current implementation, output is hard to read ,
          difficult to <br>
          &gt; distinguish and also not scriptable/parseable, as
          whitespace is used <br>
          &gt; for field separator and there are fields which also
          contain whitespace <br>
          &gt; themselves,and there also seems no way to add separators
          in between <br>
          &gt; (like with printf) for separation/formatting<br>
          &gt;<br>
          &gt; # pvs --units s
          -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start<br>
          &gt; =C2=A0 PV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fmt=C2=A0 Attr PSize=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFree BA
          Start Start=C2=A0=C2=A0=C2=A0 <br>
          &gt; Start Start<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
          0S <br>
          &gt; 2097152S=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 0=
<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
          0S <br>
          &gt; 2097152S=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 1=
<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S 0S
          0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 5309<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S 0S
          0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 5587<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S 0S
          0S=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 5588<br>
          &gt;<br>
          &gt; i mean like this:<br>
          &gt;<br>
          &gt; # pvs --units s
          -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start<br>
          &gt; =C2=A0 PV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fmt=C2=A0 Attr PSize=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFree
          pv_ba_start <br>
          &gt; seg_start seg_start_pe pvseg_start<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
          =C2=A0=C2=A0 0S <br>
          &gt; 2097152S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0
          0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S <br>
          &gt; 2097152S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S 0S
          0S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 <br>
          &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0 5309<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S 0S
          0S=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
          &gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5587<br>
          &gt; =C2=A0 /dev/sdb=C2=A0=C2=A0 VGrecycle lvm2 a--=C2=A0 1172098=
2528S=C2=A0=C2=A0=C2=A0 0S 0S
          0S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <br>
          &gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5588<br>
          &gt;<br>
          &gt; furthermore, it's a little bit weird that some columns
          being printed <br>
          &gt; by default when using -o, is there an easier way to
          remove those <br>
          &gt; besides explictly removing them one by one with several
          -o options ? <br>
          &gt; "-o-opt1,-opt2,..." doesn't work<br>
          &gt;<br>
          &gt; # pvs --units s
          -o+pv_ba_start,seg_start,pvseg_start,seg_start_pe <br>
          &gt; -o-vg_name -o-pv_name -o-pv_fmt -o-attr -o -pv_size -o
          -pv_free<br>
          &gt; =C2=A0 BA Start Start=C2=A0=C2=A0=C2=A0 Start Start<br>
          &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S 2097152S=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
          &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S 2097152S=C2=A0=
=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
          &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0 5309=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
          &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0 5587=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
          &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0S=C2=A0 5588=C2=A0=C2=A0=C2=A0=C2=A0 0<br>
          &gt;<br>
          &gt; roland<br>
          &gt;<br>
          _______________________________________________<br>
          linux-lvm mailing list<br>
          <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">linux-=
lvm@redhat.com</a><br>
          <a
            href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://listman.redhat.com/mail=
man/listinfo/linux-lvm</a><br>
          read the LVM HOW-TO at <a
            href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">http://tldp.org/HOWTO/LVM-HOWTO=
/</a><br>
        </blockquote>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">______________________________=
_________________
linux-lvm mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:linux-lvm@redhat.com">=
linux-lvm@redhat.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://listman.redhat.com/mailm=
an/listinfo/linux-lvm">https://listman.redhat.com/mailman/listinfo/linux-lv=
m</a>
read the LVM HOW-TO at <a class=3D"moz-txt-link-freetext" href=3D"http://tl=
dp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
</pre>
    </blockquote>
  </body>
</html>

--------------vvPXUw0wbCfwOhWi3P1TkBAh--

--===============8225787046850717418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8225787046850717418==--

