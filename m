Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B065D750
	for <linux-lvm@redhat.com>; Sun, 24 Jun 2018 19:19:13 +0000 (UTC)
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17C0237E7B
	for <linux-lvm@redhat.com>; Sun, 24 Jun 2018 19:19:02 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id s190-v6so6400614qke.10
	for <linux-lvm@redhat.com>; Sun, 24 Jun 2018 12:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
	<326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
	<c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
In-Reply-To: <c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
From: Ryan Launchbury <ryan@magenta.tv>
Date: Sun, 24 Jun 2018 20:18:49 +0100
Message-ID: <CAG+REr=gFS_3YMo_6s5K32w=ibntEshE7VBOy-7Vt2c7Psi_kQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000031a364056f682334"
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

--00000000000031a364056f682334
Content-Type: text/plain; charset="UTF-8"

Hi Zdenek and Gionatan,

Thanks for your reply's.
Something else of note: on systems which are unable to flush the cache,
data is still being written to the origin LV somehow, because there is
200TB of data in the LV, but the cache is only 1.8TB, so somehow it is
working. However when running any commands to flush the cache, or uncache,
it seems unable to.

What sort of admin work needs to be done/can be done to force the flush and
remove the cache?
I've tried the cleaner policy, however, it doesn't seem to be flushing
anything.

In testing, forcibly removing the cache, via editing the LVM config file
has caused extensive XFS filesystem corruption, even when backing up the
metadata first and restoring after the cache device is missing. Any advice
on how to safely uncache the volume would be massively appreciated.

Please let me know if you need any more logs or data.
Best regards,
Ryan


On Sat, Jun 23, 2018 at 11:09 AM Gionatan Danti <g.danti@assyoma.it> wrote:

> Il 22-06-2018 22:07 Zdenek Kabelac ha scritto:
> > When cache will experience write error - it will become invalidate and
> > will
> > need to be dropped - but this thing is not automated ATM - so admin
> > works is needed to handle this task.
>
> So, if a writethrough cache experience write errors but the
> administrator is not able to immediately intervene to drop the cache,
> what problem can arise? Stale reads? Slow performance?
>
> What about cache *read* error? Is the read simply redirected to the
> underlying slow/main volume?
>
> Thanks.
>
> --
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
>

--00000000000031a364056f682334
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Zdenek and Gionatan,<div><br></div><div>Thanks for=
 your reply&#39;s.</div><div>Something else of note: on systems which are u=
nable to flush the cache, data is still being written to the origin LV some=
how, because there is 200TB of data in the LV, but the cache is only 1.8TB,=
 so somehow it is working. However when running any commands to flush the c=
ache, or uncache, it seems unable to.</div><div><br></div><div>What sort of=
 admin work needs to be done/can be done to force the flush and remove the =
cache?</div><div>I&#39;ve tried the cleaner policy, however, it doesn&#39;t=
 seem to be flushing anything.</div><div><br></div><div>In testing, forcibl=
y removing the cache, via editing the LVM config file has caused extensive =
XFS filesystem corruption, even when backing up the metadata first and rest=
oring after the cache device is missing. Any advice on how to safely uncach=
e the volume would be massively=C2=A0appreciated.</div><div><br></div><div>=
Please let me know if you need any more logs or data.</div><div>Best regard=
s,</div><div>Ryan</div><div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Sat, Jun 23, 2018 at 11:09 AM Gionatan Danti &lt;<a hre=
f=3D"mailto:g.danti@assyoma.it">g.danti@assyoma.it</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Il 22-06-2018 22:07 Zdenek Kabelac ha scritt=
o:<br>
&gt; When cache will experience write error - it will become invalidate and=
 <br>
&gt; will<br>
&gt; need to be dropped - but this thing is not automated ATM - so admin<br=
>
&gt; works is needed to handle this task.<br>
<br>
So, if a writethrough cache experience write errors but the <br>
administrator is not able to immediately intervene to drop the cache, <br>
what problem can arise? Stale reads? Slow performance?<br>
<br>
What about cache *read* error? Is the read simply redirected to the <br>
underlying slow/main volume?<br>
<br>
Thanks.<br>
<br>
-- <br>
Danti Gionatan<br>
Supporto Tecnico<br>
Assyoma S.r.l. - <a href=3D"http://www.assyoma.it" rel=3D"noreferrer" targe=
t=3D"_blank">www.assyoma.it</a><br>
email: <a href=3D"mailto:g.danti@assyoma.it" target=3D"_blank">g.danti@assy=
oma.it</a> - <a href=3D"mailto:info@assyoma.it" target=3D"_blank">info@assy=
oma.it</a><br>
GPG public key ID: FF5F32A8<br>
</blockquote></div>

--00000000000031a364056f682334--
