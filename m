Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A47E7783
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2020 08:18:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2D88888BE2
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2020 08:18:08 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id o18so1619693eje.7
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2020 01:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJHv+s7x_iWxcR5krcyhSqbMTnYFQHjUMej51bCs-jmD-sBe=w@mail.gmail.com>
	<20200825130855.45l2avyiswqwuoik@shell.thinkmo.de>
In-Reply-To: <20200825130855.45l2avyiswqwuoik@shell.thinkmo.de>
From: KrishnaMurali Chennuboina <krishchennu414@gmail.com>
Date: Wed, 26 Aug 2020 13:47:52 +0530
Message-ID: <CAJHv+s56-td1C1uRBNDO=xbxyQwxkMRp1kesyCEigFJTVpPsaA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006ef75205adc3751f"
Subject: Re: [linux-lvm] Regarding the configure error while updating the
	LVM2 package
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

--0000000000006ef75205adc3751f
Content-Type: text/plain; charset="UTF-8"

Thanks Bastian.

I will check further by making libaio as a dependent for LVM package.

BRS,
KCH

On Wed, 26 Aug 2020 at 12:34, Bastian Blank <bblank@thinkmo.de> wrote:

> On Mon, Aug 24, 2020 at 02:56:33PM +0530, KrishnaMurali Chennuboina wrote:
> > While updating the LVM2 package to lvm2-2_02_180, configure is failing
> with
> > biling out error.
> > Error Message Observed:
> > checking for langinfo.h... yes
> > checking libaio.h usability... no
> > checking libaio.h presence... no
> > checking for libaio.h... no
>
> I would call that pretty obvious.  You need libaio.h, which according to
> https://packages.debian.org/file:libaio.h is in package libaio-dev and
> comes from https://pagure.io/libaio.
>
> You can disable the usage of libaio, but please read the configure
> help yourself for that.
>
> Regards,
> Bastian
>
> --
> Violence in reality is quite different from theory.
>                 -- Spock, "The Cloud Minders", stardate 5818.4
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--0000000000006ef75205adc3751f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Bastian.<div><br></div><div>I will check further by=
 making libaio as a dependent for LVM package.</div><div><br></div><div>BRS=
,</div><div>KCH</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 26 Aug 2020 at 12:34, Bastian Blank &lt;<a hre=
f=3D"mailto:bblank@thinkmo.de">bblank@thinkmo.de</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug 24, 2020 at 02:=
56:33PM +0530, KrishnaMurali Chennuboina wrote:<br>
&gt; While updating the LVM2 package to lvm2-2_02_180, configure is failing=
 with<br>
&gt; biling out error.<br>
&gt; Error Message Observed:<br>
&gt; checking for langinfo.h... yes<br>
&gt; checking libaio.h usability... no<br>
&gt; checking libaio.h presence... no<br>
&gt; checking for libaio.h... no<br>
<br>
I would call that pretty obvious.=C2=A0 You need libaio.h, which according =
to<br>
<a href=3D"https://packages.debian.org/file:libaio.h" rel=3D"noreferrer" ta=
rget=3D"_blank">https://packages.debian.org/file:libaio.h</a> is in package=
 libaio-dev and<br>
comes from <a href=3D"https://pagure.io/libaio" rel=3D"noreferrer" target=
=3D"_blank">https://pagure.io/libaio</a>.<br>
<br>
You can disable the usage of libaio, but please read the configure<br>
help yourself for that.<br>
<br>
Regards,<br>
Bastian<br>
<br>
-- <br>
Violence in reality is quite different from theory.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- Spock, &quot;The=
 Cloud Minders&quot;, stardate 5818.4<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</blockquote></div>

--0000000000006ef75205adc3751f--
