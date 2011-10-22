Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9MAjJVi030010
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2011 06:45:19 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9MAjHhJ023974
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2011 06:45:18 -0400
Received: by eye27 with SMTP id 27so6326579eye.33
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2011 03:45:17 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 22 Oct 2011 16:15:16 +0530
Message-ID: <CANp7ydPHg_Otp+XMrhn6TJ5c+-kn3Bc+mPaGtuN8exRtokYk-g@mail.gmail.com>
From: sabari G <sabaris575@gmail.com>
Content-Type: multipart/alternative; boundary=001517448214a549fa04afe0e2c6
Subject: [linux-lvm] unable to create mirror in LVM using lvconvert
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
To: linux-lvm@redhat.com

--001517448214a549fa04afe0e2c6
Content-Type: text/plain; charset=ISO-8859-1

Dear Friends,


              when i try to create mirror for already existing logical
volume i am getting error as follow .please help me to resolve this problem
.

my current LVM setup as follow
pv----/dev/hda9=1GB
       /dev/hda10=!GB
vg--vgnew=2GB

lv-/dev/vgnew/lvol1,/dev/vgnew/lvol2,/dev/vgnew/lvol3,/dev/vgnew/lvol4,
each = 200MB

when i try to
lvconvert -m 1 vgnew/lvol4

"not enough free pv for creating parallel allocation.."

Regards,
Sabarinath G

--001517448214a549fa04afe0e2c6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear Friends,<div>=A0</div><div><br></div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
when i try to create mirror for already existing logical volume i am gettin=
g error as follow .please help me to resolve this problem .<br clear=3D"all=
"><div><br></div>
<div>my current LVM setup as follow</div><div>pv----/dev/hda9=3D1GB</div><d=
iv>=A0 =A0 =A0 =A0/dev/hda10=3D!GB</div><div>vg--vgnew=3D2GB</div><div><br>=
</div><div>lv-/dev/vgnew/lvol1,/dev/vgnew/lvol2,/dev/vgnew/lvol3,/dev/vgnew=
/lvol4,</div>
<div>each =3D 200MB</div><div><br></div><div>when i try to=A0</div><div>lvc=
onvert -m 1 vgnew/lvol4=A0</div><div><br></div><div>&quot;not enough free p=
v for creating parallel allocation..&quot;</div><br><div style=3D"text-alig=
n:left;margin-right:0px" dir=3D"ltr">
<font style=3D"background-color:rgb(255, 255, 255)" color=3D"#000000" size=
=3D"4" face=3D"courier new,monospace">Regards,</font></div><div style=3D"te=
xt-align:left;margin-right:0px" dir=3D"ltr"><font size=3D"4" face=3D"courie=
r new,monospace">Sabarinath G</font></div>

<div style=3D"text-align:left;margin-right:0px" dir=3D"ltr"><font style=3D"=
background-color:rgb(255, 255, 255)" color=3D"#000000" size=3D"4" face=3D"a=
rial,helvetica,sans-serif"></font>=A0</div><br>
</div>

--001517448214a549fa04afe0e2c6--
