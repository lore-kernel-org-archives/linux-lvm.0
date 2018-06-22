Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D51042C8DF
	for <linux-lvm@redhat.com>; Fri, 22 Jun 2018 19:22:53 +0000 (UTC)
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD7AF30820E6
	for <linux-lvm@redhat.com>; Fri, 22 Jun 2018 19:22:41 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id i18-v6so6888005qtp.12
	for <linux-lvm@redhat.com>; Fri, 22 Jun 2018 12:22:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <39a2408c600ed4caf00724eb72c191c2@assyoma.it>
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
From: Ryan Launchbury <ryan@magenta.tv>
Date: Fri, 22 Jun 2018 20:22:10 +0100
Message-ID: <CAG+RErkXvs2Qr08C4h_uHuv__dknkoF80iwTVuHqJ_zCzBo=uA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009d4235056f3ff4bf"
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--0000000000009d4235056f3ff4bf
Content-Type: text/plain; charset="UTF-8"

Hi Gionatan,

My development system is out on rental at the moment. I'll check that for
you as soon as I can.

Best regards,
Ryan

On Fri, Jun 22, 2018 at 7:13 PM, Gionatan Danti <g.danti@assyoma.it> wrote:

> Il 20-06-2018 12:15 Zdenek Kabelac ha scritto:
>
>> Hi
>>
>> Aren't there any kernel write errors in your 'dmegs'.
>> LV becomes fragile if the associated devices with cache are having HW
>> issues (disk read/write errors)
>>
>> Zdenek
>>
>
> Is that true even when using a writethrough cache mode?
>
> --
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
>



-- 
*Ryan Launchbury*

System Engineer
magenta broadcast



magenta.tv

mob: 07939 276 897
support: 020 8050 1920

office: 020 8050 1080

--0000000000009d4235056f3ff4bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Gionatan,<div><br></div><div>My development system is o=
ut on rental at the moment. I&#39;ll check that for you as soon as I can.</=
div><div><br></div><div>Best regards,</div><div>Ryan</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jun 22, 2018 at 7:1=
3 PM, Gionatan Danti <span dir=3D"ltr">&lt;<a href=3D"mailto:g.danti@assyom=
a.it" target=3D"_blank">g.danti@assyoma.it</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><span class=3D"">Il 20-06-2018 12:15 Zdenek Kabelac=
 ha scritto:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi<br>
<br>
Aren&#39;t there any kernel write errors in your &#39;dmegs&#39;.<br>
LV becomes fragile if the associated devices with cache are having HW<br>
issues (disk read/write errors)<br>
<br>
Zdenek<br>
</blockquote>
<br></span>
Is that true even when using a writethrough cache mode?<span class=3D"HOEnZ=
b"><font color=3D"#888888"><br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><b style=3D"font=
-size:12.8px"><span style=3D"font-size:9.5pt;color:rgb(136,136,136)">Ryan L=
aunchbury</span></b><br></div><div><div style=3D"font-size:12.8px"><p><span=
 style=3D"color:rgb(39,64,139)">System Engineer</span><span style=3D"font-s=
ize:9.5pt;color:rgb(136,136,136)"><br></span><span style=3D"font-size:9.5pt=
;color:fuchsia">magenta broadcast</span><span style=3D"color:rgb(39,64,139)=
"><u></u><u></u></span></p><div><p><span style=3D"font-size:9.5pt;color:rgb=
(136,136,136)">=C2=A0</span><span style=3D"color:rgb(39,64,139)"><u></u><u>=
</u></span></p></div><div><p><span style=3D"font-size:7.5pt;color:black"><a=
 href=3D"http://magenta.tv/" style=3D"color:rgb(17,85,204)" target=3D"_blan=
k">magenta.tv</a></span><span style=3D"color:rgb(39,64,139)"><u></u><u></u>=
</span></p></div><div><p><span style=3D"font-size:7.5pt;color:black">mob: 0=
7939 276 897<br>support: 020 8050=C2=A0</span><span style=3D"font-size:7.5p=
t;color:fuchsia">1920</span><span style=3D"color:rgb(39,64,139)"><u></u><u>=
</u></span></p></div><div><p><span style=3D"font-size:7.5pt;color:black">of=
fice: 020 8050=C2=A0</span><span style=3D"font-size:7.5pt;color:fuchsia">10=
80</span></p></div></div></div></div></div></div></div></div></div>
</div>

--0000000000009d4235056f3ff4bf--
