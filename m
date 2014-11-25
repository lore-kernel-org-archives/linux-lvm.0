MIME-Version: 1.0
In-Reply-To: <54743766.7020502@redhat.com>
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
	<54743766.7020502@redhat.com>
Date: Tue, 25 Nov 2014 15:19:24 +0100
Message-ID: <CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Content-Type: multipart/alternative; boundary=089e016352801bb9280508af9923
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--089e016352801bb9280508af9923
Content-Type: text/plain; charset=UTF-8

2014-11-25 9:01 GMT+01:00 Peter Rajnoha <prajnoha@redhat.com>:

> What's the exact lvm2 version used (lvm --version)?
>

root@vmhost:~# lvm version
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.02.77 (2012-10-15)
  Driver version:  4.27.0



> Is lvmetad enabled in your setup? (global/use_lvmetad=1 setting
> in lvm.conf and lvmetad daemon running?)
>

    use_lvmetad = 0

No such daemon is running.



> Does it activate when you run vgchange -aay vmdata-vg vmhost-vg
> directly on the busybox cmd line?
>

The exact command I used to use in the BusyBox prompt is
lvm vgchange -ay vmhost-vg

Or, if I remember correctly, it activates simply by
lvm vgchange -ay
as well.

Then I exit the BusyBox prompt, and the boot process continues correctly.

My root FS is in vmhost-vg, and I have no idea why it doesn't come up
automatically.

--089e016352801bb9280508af9923
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2014=
-11-25 9:01 GMT+01:00 Peter Rajnoha <span dir=3D"ltr">&lt;<a href=3D"mailto=
:prajnoha@redhat.com" target=3D"_blank">prajnoha@redhat.com</a>&gt;</span>:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">What&#39;s the exact =
lvm2 version used (lvm --version)?<br></blockquote><div><br>root@vmhost:~# =
lvm version<br>=C2=A0 LVM version:=C2=A0=C2=A0=C2=A0=C2=A0 2.02.98(2) (2012=
-10-15)<br>=C2=A0 Library version: 1.02.77 (2012-10-15)<br>=C2=A0 Driver ve=
rsion:=C2=A0 4.27.0<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">

Is lvmetad enabled in your setup? (global/use_lvmetad=3D1 setting<br>
in lvm.conf and lvmetad daemon running?)<br></blockquote><div><br>=C2=A0=C2=
=A0=C2=A0 use_lvmetad =3D 0<br><br></div><div>No such daemon is running.<br=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">

Does it activate when you run vgchange -aay vmdata-vg vmhost-vg<br>
directly on the busybox cmd line?<br></blockquote><div><br></div><div>The e=
xact command I used to use in the BusyBox prompt is<br></div><div>lvm vgcha=
nge -ay vmhost-vg<br><br></div><div>Or, if I remember correctly, it activat=
es simply by<br></div><div>lvm vgchange -ay<br></div><div>as well.<br><br><=
/div><div>Then I exit the BusyBox prompt, and the boot process continues co=
rrectly.<br><br></div><div>My root FS is in vmhost-vg, and I have no idea w=
hy it doesn&#39;t come up automatically.<br></div></div></div></div>

--089e016352801bb9280508af9923--
