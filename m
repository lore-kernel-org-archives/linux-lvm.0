Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9Q8UD0b017929
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 04:30:13 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9Q8U2Xa021258
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 04:30:02 -0400
Received: by iwn10 with SMTP id 10so1982968iwn.33
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 01:30:02 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <20101025212848.GA6297@us.ibm.com>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
	<20101025181108.GA1019@us.ibm.com>
	<AANLkTinWs=_Z7bzKdq4SNKKBd_BhWGQ_2D7ni00PKyxB@mail.gmail.com>
	<20101025212848.GA6297@us.ibm.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Tue, 26 Oct 2010 10:29:41 +0200
Message-ID: <AANLkTikp-8mrhoPSaZYT=m7CwCMfPrvBUK9tiQBeZFmB@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001636920d14409eb8049380ea1f
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

--001636920d14409eb8049380ea1f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi!

2010/10/25 Malahal Naineni <malahal@us.ibm.com>

> Alexander Skwar [alexanders.mailinglists+nospam@gmail.com<alexanders.mail=
inglists%2Bnospam@gmail.com>]
> wrote:
> >    I also wanted to suggest this, but=E2=80=A6
> >
> >    benutzer@horst:~$ cat /proc/cmdline
> >    root=3D/dev/xvda1 ro
>
> I got confused with boot and root! Thanks for correction. Usually boot
> disk is mounted at /boot. Your boot disk could be same as root disk (in
> this case there would not be anything mounted at /boot but just a
> directory).
>

Well, but even the location of the /boot directory/partition doesn't
necessarily tell, from where someone booted - suppose, you've got
a boot disk /dev/sda. On /dev/sda, there's grub. Grub's setup so,
that it boots a system/kernel, which is on /dev/sdb. The system
is "self contained" on /dev/sdb.

In such a case, the system would've been booted from /dev/sda,
but there's no way to tell that, once the "/dev/sdb system" has
been started - or is there?

Cheers,
Alexander
--=20
=E2=86=AF    Lifestream (Twitter, Blog, =E2=80=A6) =E2=86=A3 http://alexs77=
.soup.io/     =E2=86=AF
=E2=86=AF Chat (Jabber/Google Talk) =E2=86=A3 a.skwar@gmail.com , AIM: alex=
ws77  =E2=86=AF

--001636920d14409eb8049380ea1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font face=3D"trebuchet ms,sans-serif">Hi!<br></font><br><div class=3D"gmai=
l_quote">2010/10/25 Malahal Naineni <span dir=3D"ltr">&lt;<a href=3D"mailto=
:malahal@us.ibm.com">malahal@us.ibm.com</a>&gt;</span><br><blockquote class=
=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;">

<div class=3D"im">Alexander Skwar [<a href=3D"mailto:alexanders.mailinglist=
s%2Bnospam@gmail.com">alexanders.mailinglists+nospam@gmail.com</a>] wrote:<=
br>
&gt; =C2=A0 =C2=A0I also wanted to suggest this, but=E2=80=A6<br>
&gt;<br>
&gt; =C2=A0 =C2=A0benutzer@horst:~$ cat /proc/cmdline<br>
&gt; =C2=A0 =C2=A0root=3D/dev/xvda1 ro<br>
<br>
</div>I got confused with boot and root! Thanks for correction. Usually boo=
t<br>
disk is mounted at /boot. Your boot disk could be same as root disk (in<br>
this case there would not be anything mounted at /boot but just a<br>
directory).<br></blockquote><div><br>Well, but even the location of the /bo=
ot directory/partition doesn&#39;t<br>necessarily tell, from where someone =
booted - suppose, you&#39;ve got<br>a boot disk /dev/sda. On /dev/sda, ther=
e&#39;s grub. Grub&#39;s setup so,<br>

that it boots a system/kernel, which is on /dev/sdb. The system<br>is &quot=
;self contained&quot; on /dev/sdb.<br><br>In such a case, the system would&=
#39;ve been booted from /dev/sda,<br>but there&#39;s no way to tell that, o=
nce the &quot;/dev/sdb system&quot; has<br>

been started - or is there?<br>=C2=A0</div>Cheers,<br>Alexander<br></div>--=
 <br>=E2=86=AF=C2=A0=C2=A0=C2=A0 Lifestream (Twitter, Blog, =E2=80=A6) =E2=
=86=A3=C2=A0<a href=3D"http://alexs77.soup.io/" target=3D"_blank">http://al=
exs77.soup.io/</a>=C2=A0 =C2=A0=C2=A0 =E2=86=AF<br>=E2=86=AF Chat (Jabber/G=
oogle Talk) =E2=86=A3 <a href=3D"mailto:a.skwar@gmail.com" target=3D"_blank=
">a.skwar@gmail.com</a> , AIM: alexws77=C2=A0 =E2=86=AF<br>

<br>

--001636920d14409eb8049380ea1f--
