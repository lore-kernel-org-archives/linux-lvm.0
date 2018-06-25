Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2F616E38
	for <linux-lvm@redhat.com>; Mon, 25 Jun 2018 17:21:17 +0000 (UTC)
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0B92C04B31F
	for <linux-lvm@redhat.com>; Mon, 25 Jun 2018 17:21:05 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id h5-v6so12617011qtm.13
	for <linux-lvm@redhat.com>; Mon, 25 Jun 2018 10:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
	<326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
	<c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
	<CAG+REr=gFS_3YMo_6s5K32w=ibntEshE7VBOy-7Vt2c7Psi_kQ@mail.gmail.com>
	<213e498ea447f141c7a975c13416281e@assyoma.it>
In-Reply-To: <213e498ea447f141c7a975c13416281e@assyoma.it>
From: Ryan Launchbury <ryan@magenta.tv>
Date: Mon, 25 Jun 2018 18:20:54 +0100
Message-ID: <CAG+RErkPfHbBGS9p90nu_mFErMsPQanPwEYz24DP5Yh3jQUBKg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004285cf056f7a9b8f"
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
	is over 1MiB
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

--0000000000004285cf056f7a9b8f
Content-Type: text/plain; charset="UTF-8"

Hi Gionatan,

The system with the issue is with  writeback cache mode enabled.

Best regards,

Ryan

On Mon, 25 Jun 2018, 18:19 Gionatan Danti, <g.danti@assyoma.it> wrote:

> Il 24-06-2018 21:18 Ryan Launchbury ha scritto:
> > In testing, forcibly removing the cache, via editing the LVM config
> > file has caused extensive XFS filesystem corruption, even when backing
> > up the metadata first and restoring after the cache device is missing.
> > Any advice on how to safely uncache the volume would be massively
> > appreciated.
>
> It is my understanding that a writethrough cache should *never* have any
> data that are not on the backing volumes already.
> In other words, forcibly removing a writethough cache (ie: disconnetting
> the physical cache device) should not cause any harms to
> filesystem/data.
>
> Can you show the output of "dmsetup table"?
> Thanks.
>
> --
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
>

--0000000000004285cf056f7a9b8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Gionatan,=C2=A0<div dir=3D"auto"><br></div><div dir=3D=
"auto">The system with the issue is with=C2=A0 writeback cache mode enabled=
.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,=C2=
=A0<br><br><div data-smartmail=3D"gmail_signature" dir=3D"auto">Ryan=C2=A0<=
br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, 25 Jun 2018, 18:19 Gionatan Danti, &lt;<a href=3D"mailto:g.danti@assyoma.=
it">g.danti@assyoma.it</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Il 24-06-2018 21:18 Ryan Launchbury ha scritto:<br>
&gt; In testing, forcibly removing the cache, via editing the LVM config<br=
>
&gt; file has caused extensive XFS filesystem corruption, even when backing=
<br>
&gt; up the metadata first and restoring after the cache device is missing.=
<br>
&gt; Any advice on how to safely uncache the volume would be massively<br>
&gt; appreciated.<br>
<br>
It is my understanding that a writethrough cache should *never* have any <b=
r>
data that are not on the backing volumes already.<br>
In other words, forcibly removing a writethough cache (ie: disconnetting <b=
r>
the physical cache device) should not cause any harms to <br>
filesystem/data.<br>
<br>
Can you show the output of &quot;dmsetup table&quot;?<br>
Thanks.<br>
<br>
-- <br>
Danti Gionatan<br>
Supporto Tecnico<br>
Assyoma S.r.l. - <a href=3D"http://www.assyoma.it" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">www.assyoma.it</a><br>
email: <a href=3D"mailto:g.danti@assyoma.it" target=3D"_blank" rel=3D"noref=
errer">g.danti@assyoma.it</a> - <a href=3D"mailto:info@assyoma.it" target=
=3D"_blank" rel=3D"noreferrer">info@assyoma.it</a><br>
GPG public key ID: FF5F32A8<br>
</blockquote></div>

--0000000000004285cf056f7a9b8f--
