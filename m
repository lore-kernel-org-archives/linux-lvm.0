Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9PJqdGU029372
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 15:52:39 -0400
Received: from mail-yw0-f46.google.com (mail-yw0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9PJqT4d003523
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 15:52:29 -0400
Received: by ywk9 with SMTP id 9so2564992ywk.33
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 12:52:29 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <20101025181108.GA1019@us.ibm.com>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
	<20101025181108.GA1019@us.ibm.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Mon, 25 Oct 2010 21:21:59 +0200
Message-ID: <AANLkTinWs=_Z7bzKdq4SNKKBd_BhWGQ_2D7ni00PKyxB@mail.gmail.com>
Content-Type: multipart/alternative; boundary=90e6ba6e84de29c7f6049375e92d
Subject: Re: [linux-lvm] Determine boot disk device name...
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

--90e6ba6e84de29c7f6049375e92d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I also wanted to suggest this, but=E2=80=A6

benutzer@horst:~$ cat /proc/cmdline
root=3D/dev/xvda1 ro

At most, you can find the root device there. But not the
device from which you booted.

Since I didn't know a good answer, I didn't write anything. But
it would be interesting to find the answer!

Best regards,
Alexander

2010/10/25 Malahal Naineni <malahal@us.ibm.com>

> Jon Price [jonelwoodprice@gmail.com] wrote:
> >    Hi,
> >    For starters, how can I determine the physical device name of
> >    current/active boot disk in Linux?
> >    Tx,
> >    Jon
>
> cat /proc/cmdline and go from there!
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--=20
Alexander
--=20
=E2=86=AF    Lifestream (Twitter, Blog, =E2=80=A6) =E2=86=A3 http://alexs77=
.soup.io/     =E2=86=AF
=E2=86=AF Chat (Jabber/Google Talk) =E2=86=A3 a.skwar@gmail.com , AIM: alex=
ws77  =E2=86=AF

--90e6ba6e84de29c7f6049375e92d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font face=3D"trebuchet ms,sans-serif">I also wanted to suggest this, but=
=E2=80=A6<br><br>benutzer@horst:~$ cat /proc/cmdline<br>root=3D/dev/xvda1 r=
o<br><br>At most, you can find the root device there. But not the<br>device=
 from which you booted.<br>

<br>Since I didn&#39;t know a good answer, I didn&#39;t write anything. But=
<br>it would be interesting to find the answer!<br><br>Best regards,<br>Ale=
xander<br></font><br><div class=3D"gmail_quote">2010/10/25 Malahal Naineni =
<span dir=3D"ltr">&lt;<a href=3D"mailto:malahal@us.ibm.com">malahal@us.ibm.=
com</a>&gt;</span><br>

<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div><div></div><=
div class=3D"h5">Jon Price [<a href=3D"mailto:jonelwoodprice@gmail.com">jon=
elwoodprice@gmail.com</a>] wrote:<br>


&gt; =C2=A0 =C2=A0Hi,<br>
&gt; =C2=A0 =C2=A0For starters, how can I determine the physical device nam=
e of<br>
&gt; =C2=A0 =C2=A0current/active boot disk in Linux?<br>
&gt; =C2=A0 =C2=A0Tx,<br>
&gt; =C2=A0 =C2=A0Jon<br>
<br>
</div></div>cat /proc/cmdline and go from there!<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Alexander<br>-- <br>=E2=
=86=AF=C2=A0=C2=A0=C2=A0 Lifestream (Twitter, Blog, =E2=80=A6) =E2=86=A3=C2=
=A0<a href=3D"http://alexs77.soup.io/" target=3D"_blank">http://alexs77.sou=
p.io/</a>=C2=A0 =C2=A0=C2=A0 =E2=86=AF<br>=E2=86=AF Chat (Jabber/Google Tal=
k) =E2=86=A3 <a href=3D"mailto:a.skwar@gmail.com" target=3D"_blank">a.skwar=
@gmail.com</a> , AIM: alexws77=C2=A0 =E2=86=AF<br>

<br>

--90e6ba6e84de29c7f6049375e92d--
