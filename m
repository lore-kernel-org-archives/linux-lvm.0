Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4K8xx6I019738
	for <linux-lvm@redhat.com>; Sun, 20 May 2012 04:59:59 -0400
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4K8xvKq009730
	for <linux-lvm@redhat.com>; Sun, 20 May 2012 04:59:58 -0400
Received: by wibhm6 with SMTP id hm6so1959091wib.3
	for <linux-lvm@redhat.com>; Sun, 20 May 2012 01:59:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120519231404.GF3867@bitfolk.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
	<4FB623AC.9060900@redhat.com>
	<CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
	<20120519231404.GF3867@bitfolk.com>
Date: Sun, 20 May 2012 14:29:56 +0530
Message-ID: <CAGQjrKaWT_LnjxbEE57-Mxhn+n+KSvHEGUwC7wapQ7S9Dcb-aA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=f46d044283b67cb93404c0740248
Subject: Re: [linux-lvm] lvreduce nightmare
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

--f46d044283b67cb93404c0740248
Content-Type: text/plain; charset=ISO-8859-1

Hi Andy,

Thanks for the mail.

I am not sure if reducing by lvreduce alone is safe and will actually
reduce the underneath file system also, look at this sequence ..

lvcreate -n test -L10G vg0

df -h /test/
Filesystem                 Size  Used   Avail Use% Mounted on
/dev/mapper/vg0-test  9.9G  151M  9.2G   2% /test

created some pseudo 2GB files with dd and /test now is

df -h
Filesystem                Size  Used   *Avail* Use% Mounted on
/dev/mapper/vg0-test  9.9G  2.2G  *7.2G*  24% /test

lvreduce -L -1G -n /dev/vg0/test
lvs
LV   VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
test vg0  -wi-a- 9.00G

mount /dev/vg0/test /test/
df -h
Filesystem                 Size  Used  *Avail* Use% Mounted on
/dev/mapper/vg0-test  9.9G  2.2G  *7.2G*  24% /test

you see after lvreduce 1G and mount /test again , it still shows */test as
7.2G* while as it should be *6.2G*

Tariq

On Sun, May 20, 2012 at 4:44 AM, Andy Smith <andy@strugglers.net> wrote:

> Hi tariq,
>
> On Fri, May 18, 2012 at 07:43:40PM +0530, tariq wali wrote:
> > so to i guess to do this right i should have
> >
> > resize2fs /dev/vg0/data 1.6T or (1600G)
> >
> > and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the lvm by
> 100
> > )
>
> I believe that will also reduce the LV *to* 100G. You want:
>
> # lvreduce -n data -L-100G
>
> if you want to reduce it *by* 100G.
>
> Nothing like FS/LV shrinking to keep you on your toes..
>
> Cheers,
> Andy
>
> --
> http://bitfolk.com/ -- No-nonsense VPS hosting
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEYEAREDAAYFAk+4KTsACgkQIJm2TL8VSQvadgCdFfn/WdMLPkSsEdiF/+4Py8Ds
> hCcAoIVocvHCvD/4lft601QFLqjPHFPC
> =pgU1
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
*Tariq Wali.*

--f46d044283b67cb93404c0740248
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andy,<div><br></div><div>Thanks for the mail.</div><div=
><br></div><div>I am not sure if reducing by lvreduce alone is safe and wil=
l actually reduce the underneath file system also, look at this sequence ..=
</div>
<div><br></div><div><div>lvcreate -n test -L10G vg0</div><div><br></div><di=
v>df -h /test/</div><div>Filesystem =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Size =
=A0Used =A0 Avail Use% Mounted on</div><div>/dev/mapper/vg0-test =A09.9G =
=A0151M =A09.2G =A0 2% /test</div>
<div><br></div><div>created some pseudo 2GB files with dd and /test now is=
=A0</div><div><br></div><div>df -h</div><div>Filesystem =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0Size =A0Used =A0 <b>Avail</b> Use% Mounted on</div><div>/dev/ma=
pper/vg0-test =A09.9G =A02.2G =A0<b>7.2G</b> =A024% /test</div>
<div><br></div><div>lvreduce -L -1G -n /dev/vg0/test</div><div>lvs</div><di=
v>LV =A0 VG =A0 Attr =A0 LSize Origin Snap% =A0Move Log Copy% =A0Convert</d=
iv><div>test vg0 =A0-wi-a- 9.00G =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
</div><div><br></div><div>mount /dev/vg0/test /test/</div>
<div>df -h</div><div>Filesystem =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Size =A0Use=
d =A0<b>Avail</b> Use% Mounted on</div><div>/dev/mapper/vg0-test =A09.9G =
=A02.2G =A0<b>7.2G</b> =A024% /test</div></div><div><br></div><div>you see =
after lvreduce 1G and mount /test again , it still shows <b>/test as 7.2G</=
b> while as it should be <b>6.2G</b></div>
<div><br></div><div>Tariq<br><br><div class=3D"gmail_quote">On Sun, May 20,=
 2012 at 4:44 AM, Andy Smith <span dir=3D"ltr">&lt;<a href=3D"mailto:andy@s=
trugglers.net" target=3D"_blank">andy@strugglers.net</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
Hi tariq,<br>
<div class=3D"im"><br>
On Fri, May 18, 2012 at 07:43:40PM +0530, tariq wali wrote:<br>
&gt; so to i guess to do this right i should have<br>
&gt;<br>
&gt; resize2fs /dev/vg0/data 1.6T or (1600G)<br>
&gt;<br>
&gt; and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the lvm by=
 100<br>
&gt; )<br>
<br>
</div>I believe that will also reduce the LV *to* 100G. You want:<br>
<br>
# lvreduce -n data -L-100G<br>
<br>
if you want to reduce it *by* 100G.<br>
<br>
Nothing like FS/LV shrinking to keep you on your toes..<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
Andy<br>
<br>
--<br>
<a href=3D"http://bitfolk.com/" target=3D"_blank">http://bitfolk.com/</a> -=
- No-nonsense VPS hosting<br>
</div></div><br>-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.4.10 (GNU/Linux)<br>
<br>
iEYEAREDAAYFAk+4KTsACgkQIJm2TL8VSQvadgCdFfn/WdMLPkSsEdiF/+4Py8Ds<br>
hCcAoIVocvHCvD/4lft601QFLqjPHFPC<br>
=3DpgU1<br>
-----END PGP SIGNATURE-----<br>
<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"><i style=3D"backgr=
ound-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wali.</i><span><span styl=
e=3D"background-color:rgb(255,255,153)"></span></span><br>
</div><br>
</div></div>

--f46d044283b67cb93404c0740248--
