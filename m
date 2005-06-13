Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5D2qwu15804
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2005 22:53:00 -0400
Received: from mail.lnnu.edu.cn (mail.lnnu.edu.cn [218.25.162.219])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j5D2qdVZ029650
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2005 22:52:43 -0400
Message-Id: <200506130252.j5D2qdVZ029650@mx3.redhat.com>
From: "cwinl" <cwinl-linux-lvm@lnnu.edu.cn>
Date: Mon, 13 Jun 2005 10:51:58 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000A_01C57005.EBFDBFB0"
Subject: [linux-lvm] how to move data from one PV to other PV automaticly?
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

------=_NextPart_000_000A_01C57005.EBFDBFB0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit

hi,all:
    i have a VG with 3 PV.
here is 'pvdisplay' information:
 
------------------------------------------------
 
ftp:~# pvdisplay -v
    Scanning for physical volume names
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               nicvg
  PV Size               838.09 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              26819
  Free PE               0
  Allocated PE          26819
  PV UUID               IyahCr-NwPt-dUsC-UuVa-ki1y-5X4X-NRReLA
   
  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               nicvg
  PV Size               558.72 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              17879
  Free PE               0
  Allocated PE          17879
  PV UUID               NG6cMz-I12Q-6X8T-58gn-Fvov-gYs9-HCvYyw
   
  --- Physical volume ---
  PV Name               /dev/sdd1
  VG Name               nicvg
  PV Size               558.72 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              17879
  Free PE               0
  Allocated PE          17879
  PV UUID               qqm9Ua-5owd-ZhVM-nU5D-wZeL-klu1-t0Ij68
 
-----------------------------------------------------------------------
 
i want to move all data from /dev/sdb1 to another two PV (/dev/sdc1 and
/dev/sdd1) automaticly.
so i can remove the unstable PV /dev/sdb1 and repair it.
then i will restore a new /dev/sdb1 device.
 
the disk space is all right.
here is 'df' information:
 
---------------------------------
 
ftp:~# df
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda5             1.9G  545M  1.4G  29% /
tmpfs                1014M  4.0K 1014M   1% /dev/shm
/dev/sda1              95M   39M   56M  42% /boot
/dev/sda6              14G  444M   14G   4% /var
/dev/mapper/nicvg-niclv
                      2.0T  774G  1.2T  40% /ftproot
 
---------------------------------
 
the volumn '/dev/mapper/nicvg-niclv' is on the VG above.
 
how can finish it?
 
any suggestion is regarded!

------=_NextPart_000_000A_01C57005.EBFDBFB0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312">
<META content=3D"MSHTML 6.00.2900.2627" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT size=3D2>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2>hi,all:</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005>&nbsp;&nbsp;&nbsp; <FONT =
size=3D2>i have a VG=20
with 3 PV.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>here is 'pvdisplay' =

information:</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT=20
size=3D2>------------------------------------------------</FONT></SPAN></=
DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>ftp:~# pvdisplay=20
-v<BR>&nbsp;&nbsp;&nbsp; Scanning for physical volume names<BR>&nbsp; =
---=20
Physical volume ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/sdb1<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
nicvg<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
838.09 GB / not usable 0&nbsp;&nbsp; <BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
yes (but=20
full)<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
32768<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
26819<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
26819<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
IyahCr-NwPt-dUsC-UuVa-ki1y-5X4X-NRReLA<BR>&nbsp;&nbsp; <BR>&nbsp; --- =
Physical=20
volume ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/sdc1<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
nicvg<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
558.72 GB / not usable 0&nbsp;&nbsp; <BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
yes (but=20
full)<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
32768<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
17879<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
17879<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
NG6cMz-I12Q-6X8T-58gn-Fvov-gYs9-HCvYyw<BR>&nbsp;&nbsp; <BR>&nbsp; --- =
Physical=20
volume ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/sdd1<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
nicvg<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
558.72 GB / not usable 0&nbsp;&nbsp; <BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
yes (but=20
full)<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
32768<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
17879<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
17879<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
qqm9Ua-5owd-ZhVM-nU5D-wZeL-klu1-t0Ij68</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT=20
size=3D2>----------------------------------------------------------------=
-------</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>i want to move all =
data from=20
/dev/sdb1 to another two PV (/dev/sdc1 and /dev/sdd1)=20
automaticly.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>so i can remove the =
unstable=20
PV&nbsp;/dev/sdb1 and repair it.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>then i will restore =
a new=20
/dev/sdb1 device.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>the disk space is =
all=20
right.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>here is 'df'=20
information:</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT=20
size=3D2>---------------------------------</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>ftp:~#=20
df<BR>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
Size&nbsp; Used Avail Use% Mounted=20
on<BR>/dev/sda5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
1.9G&nbsp; 545M&nbsp; 1.4G&nbsp; 29%=20
/<BR>tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1014M&nbsp; 4.0K 1014M&nbsp;&nbsp; 1%=20
/dev/shm<BR>/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;=20
95M&nbsp;&nbsp; 39M&nbsp;&nbsp; 56M&nbsp; 42%=20
/boot<BR>/dev/sda6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
14G&nbsp; 444M&nbsp;&nbsp; 14G&nbsp;&nbsp; 4%=20
/var<BR>/dev/mapper/nicvg-niclv<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
2.0T&nbsp; 774G&nbsp; 1.2T&nbsp; 40% /ftproot</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT=20
size=3D2>---------------------------------</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>the volumn=20
'/dev/mapper/nicvg-niclv' is on the VG above.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>how can finish=20
it?</FONT></SPAN></DIV>
<DIV><SPAN class=3D395053902-13062005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D395053902-13062005><FONT size=3D2>any suggestion is=20
regarded!</FONT></SPAN></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_000A_01C57005.EBFDBFB0--
