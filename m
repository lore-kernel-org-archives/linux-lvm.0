Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1M3TYK04666
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 22:29:34 -0500
Received: from mpls-qmqp-01.inet.qwest.net (mpls-qmqp-01.inet.qwest.net
	[63.231.195.112])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j1M3TRaq014415
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 22:29:27 -0500
Date: Mon, 21 Feb 2005 20:29:14 -0700
Message-ID: <002f01c5188e$af41e0c0$6401a8c0@zd7168cl>
From: "James Griffith" <jbg@qwest.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002C_01C51854.027EEFC0"
Subject: [linux-lvm] PV Name      unknown device 
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_002C_01C51854.027EEFC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a problem... my lvm is broken.. I ran pvscan and got this then =
ran pvdisplay /dev/gdc and got that and then ran pvdisplay /dev/hdd and =
got that. I was working then I broke it somehow..... Any help will be =
appreciated greatly...

James

     # pvscan
  /dev/hdb: open failed: No medium found
  Couldn't find device with uuid =
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.
  PV /dev/hdc         VG vg_ftp   lvm2 [232.75 GB / 768.00 MB free]
  PV unknown device   VG vg_ftp   lvm2 [232.75 GB / 10.75 GB free]
  Total: 2 [465.50 GB] / in use: 2 [465.50 GB] / in no VG: 0 [0   ]

     #  pvdisplay /dev/hdc
  Couldn't find device with uuid =
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.
  Couldn't find all physical volumes for volume group vg_ftp.
  format_text: _vg_read failed to read VG vg_ftp
  Couldn't find device with uuid =
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.
  Couldn't find all physical volumes for volume group vg_ftp.
  format_text: _vg_read failed to read VG vg_ftp
  --- NEW Physical volume ---
  PV Name               /dev/hdc
  VG Name
  PV Size               232.88 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               ty0TuP-Xj5v-MZh3-1wV0-OHDm-uvu2-Goay71

     # pvdisplay /dev/hdd
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               vg_ftp
  PV Size               232.75 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       262144
  Total PE              931
  Free PE               43
  Allocated PE          888
  PV UUID               1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU


------=_NextPart_000_002C_01C51854.027EEFC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2604" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have a problem... my lvm is broken.. =
I ran pvscan=20
and got this then ran pvdisplay /dev/gdc and got that and then ran =
pvdisplay=20
/dev/hdd and got that. I was working then I broke it somehow..... Any =
help will=20
be appreciated greatly...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>James</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; # =
pvscan<BR>&nbsp;=20
/dev/hdb: open failed: No medium found<BR>&nbsp; Couldn't find device =
with uuid=20
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.<BR>&nbsp; PV=20
/dev/hdc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
vg_ftp&nbsp;&nbsp;=20
lvm2 [232.75 GB / 768.00 MB free]<BR>&nbsp; PV unknown =
device&nbsp;&nbsp; VG=20
vg_ftp&nbsp;&nbsp; lvm2 [232.75 GB / 10.75 GB free]<BR>&nbsp; Total: 2 =
[465.50=20
GB] / in use: 2 [465.50 GB] / in no VG: 0 [0&nbsp;&nbsp; =
]<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; #&nbsp; =
pvdisplay=20
/dev/hdc<BR>&nbsp; Couldn't find device with uuid=20
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.<BR>&nbsp; Couldn't find all =
physical=20
volumes for volume group vg_ftp.<BR>&nbsp; format_text: _vg_read failed =
to read=20
VG vg_ftp<BR>&nbsp; Couldn't find device with uuid=20
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.<BR>&nbsp; Couldn't find all =
physical=20
volumes for volume group vg_ftp.<BR>&nbsp; format_text: _vg_read failed =
to read=20
VG vg_ftp<BR>&nbsp; --- NEW Physical volume ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hdc<BR>&nbsp; VG Name<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
232.88 GB<BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
NO<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<BR>&nbsp;=20
Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
0<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
ty0TuP-Xj5v-MZh3-1wV0-OHDm-uvu2-Goay71</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; # pvdisplay=20
/dev/hdd<BR>&nbsp; --- Physical volume ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hdd<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vg_ftp<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
232.75 GB / not usable 0<BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
yes<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
262144<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
931<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
43<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
888<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_002C_01C51854.027EEFC0--
