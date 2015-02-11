Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BLjucl012721
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 16:45:56 -0500
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BLjrx0007370
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 16:45:54 -0500
Received: by mail-oi0-f51.google.com with SMTP id g201so16655912oib.10
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 13:45:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKPhfZM+8kWgR4ScpeSb5qsrj+w_0EhLEz1gC9rvOxkD2Mkf1A@mail.gmail.com>
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
	<54D87F38.4010303@redhat.com>
	<CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
	<CAKPhfZOe2=qPCr4kHeVXw-vrRY5LG4SRLa1KjUW795tQJun3tQ@mail.gmail.com>
	<CAKPhfZM+8kWgR4ScpeSb5qsrj+w_0EhLEz1gC9rvOxkD2Mkf1A@mail.gmail.com>
Date: Wed, 11 Feb 2015 19:45:53 -0200
Message-ID: <CAPcfVV-JVeuNSp5ri93Sh7GCgNC=G2FPahhLNE6tKq-6SRw-zg@mail.gmail.com>
From: Marcos Dutra <macdutra@gmail.com>
Content-Type: multipart/alternative; boundary=001a113306be7d3204050ed6edae
Subject: Re: [linux-lvm] Volume group inconsistent
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001a113306be7d3204050ed6edae
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Eric,

I ran the dd command and I saw the flags "MISSING" yet, if I run pvs, I
don't see MISSING flag.

# pvs /dev/mapper/plt-25
  PV                 VG       Fmt  Attr PSize   PFree
  /dev/mapper/plt-25 platinum lvm2 a--  500.00g    0

The same disk after dd command (dd if=3D/dev/mapper/plt-25 of=3Dplt-25.br
bs=3D512 count=3D4000)

pv23 {
id =3D "CEPd6z-Bklc-BNsq-pqcn-SMhu-jdVS-6GIPI6"
device =3D "/dev/mapper/plt-25"

status =3D ["ALLOCATABLE"]
flags =3D ["MISSING"]
dev_size =3D 1048576000
pe_start =3D 2048
pe_count =3D 127999
}

Now I know why I receive the "MISSING" flag after create new volume, how
can I fix it? Do you have any idea?

Before I restored my lvm backup with vgcfgrestore, I can see now it didn't
work properly.

Thank you

Marcos Dutra

2015-02-11 9:19 GMT-02:00 service hofman <service.hofman@googlemail.com>:

> Hi
>
> dd if=3D/dev/sda of=3D/boor/sda.mbr bs=3D512 count=3D4000
>
> mcedit -e /boot/sda.mbr
> or
> hexedit
>
>
> look lvm list in bootrecord
>
> eric hofman
>
> service.hofman@gmail.com
>
> --
> ComputerAlarmTechnologySystem=C2=A9
>
> http://plus.google.com/105013137826111836446
> +44 77 04 24 74 00
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a113306be7d3204050ed6edae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Eric,<div><br></div><div>I ran the dd command and I saw=
 the flags &quot;MISSING&quot; yet, if I run pvs, I don&#39;t see MISSING f=
lag.</div><div><br></div><div># pvs /dev/mapper/plt-25</div><div>=C2=A0 PV =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =
=C2=A0 Fmt =C2=A0Attr PSize =C2=A0 PFree</div><div>=C2=A0 /dev/mapper/plt-2=
5 platinum lvm2 a-- =C2=A0500.00g =C2=A0 =C2=A00=C2=A0</div><div>=C2=A0</di=
v><div>The same disk after dd command (dd if=3D/dev/mapper/plt-25 of=3D<a h=
ref=3D"http://plt-25.br">plt-25.br</a> bs=3D512 count=3D4000)</div><div><br=
></div><div><div>pv23 {</div><div>id =3D &quot;CEPd6z-Bklc-BNsq-pqcn-SMhu-j=
dVS-6GIPI6&quot;</div><div>device =3D &quot;/dev/mapper/plt-25&quot;</div><=
div><br></div><div>status =3D [&quot;ALLOCATABLE&quot;]</div><div>flags =3D=
 [&quot;MISSING&quot;]</div><div>dev_size =3D 1048576000</div><div>pe_start=
 =3D 2048</div><div>pe_count =3D 127999</div><div>}</div></div><div><br></d=
iv><div>Now I know why I receive the &quot;MISSING&quot; flag after create =
new volume, how can I fix it? Do you have any idea?</div><div><br></div><di=
v>Before I restored my lvm backup with vgcfgrestore, I can see now it didn&=
#39;t work properly.</div><div><br></div><div>Thank you</div><div><br></div=
><div>Marcos Dutra</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">2015-02-11 9:19 GMT-02:00 service hofman <span dir=3D"ltr">&lt=
;<a href=3D"mailto:service.hofman@googlemail.com" target=3D"_blank">service=
.hofman@googlemail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">Hi<br>
<br>
dd if=3D/dev/sda of=3D/boor/sda.mbr bs=3D512 count=3D4000<br>
<br>
</span>mcedit -e /boot/sda.mbr<br>
or<br>
hexedit<br>
<span class=3D"im HOEnZb"><br>
<br>
look lvm list in bootrecord<br>
<br>
eric hofman<br>
<br>
<a href=3D"mailto:service.hofman@gmail.com">service.hofman@gmail.com</a><br=
>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
ComputerAlarmTechnologySystem=C2=A9<br>
<br>
<a href=3D"http://plus.google.com/105013137826111836446" target=3D"_blank">=
http://plus.google.com/105013137826111836446</a><br>
<a href=3D"tel:%2B44%2077%2004%2024%2074%2000" value=3D"+447704247400">+44 =
77 04 24 74 00</a><br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></div></div></blockquote></=
div><br></div>

--001a113306be7d3204050ed6edae--
