Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4PH3wFT004231
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 13:03:58 -0400
Received: from ostel.org (host180.200-45-71.telecom.net.ar [200.45.71.180])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4PH3oHS021948
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 13:03:51 -0400
Received: from alelab7bd24fec (4-247-126-200.fibertel.com.ar [200.126.247.4])
	by ostel.org (8.12.10/8.12.5) with SMTP id l4PH3IE1023147
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 14:03:19 -0300
Message-ID: <006401c79eee$a79f79c0$6401a8c0@alelab7bd24fec>
From: "Alejandro Santillan" <lvm@alela.com>
Date: Fri, 25 May 2007 14:03:44 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0061_01C79ED5.817464E0"
Subject: [linux-lvm] want to remove a disk
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

------=_NextPart_000_0061_01C79ED5.817464E0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I installed a new fedora box with 2 hard disks. The system disk and a =
second one to be used to backup and get information out of the machine.
The problem was that inadvertely the disks mounted in a lvm =
configuration as follows:


[root@s2]# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                     150202484  56184212  86265364  40% /
/dev/sda1               101086     10442     85425  11% /boot
tmpfs                   250336         0    250336   0% /dev/shm

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
So now I cannot remove the 2nd disk without disrupting the system.=20
Can I use=20
lvremove or lvchange
doing lvdisplay shows:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[root@s2]# /usr/sbin/lvdisplay
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                AG2uKb-0VMO-5qn4-T2LK-cjM8-mZbh-jETkyx
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                147.88 GB
  Current LE             4732
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                8Q6XKF-bz8D-vcan-Izf9-Ntzn-XmYv-9WAi5g
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                992.00 MB
  Current LE             31
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
which command should I use to leave all information on the /dev/sda1 and =
be able to take out the other disk?

Thank you!

Alejandro
------=_NextPart_000_0061_01C79ED5.817464E0
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 6.00.2900.3086" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I installed a new fedora box with 2 =
hard disks. The=20
system disk and a second one to be used to backup and&nbsp;get=20
information&nbsp;out of&nbsp;the machine.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The problem was that inadvertely the =
disks mounted=20
in a lvm configuration as follows:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>
<DIV class=3DSection1><FONT face=3DArial=20
size=3D2>[root@s2]#&nbsp;df<BR>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1K-blocks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Used Available Use% Mounted=20
on<BR>/dev/mapper/VolGroup00-LogVol00<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
150202484&nbsp; 56184212&nbsp; 86265364&nbsp; 40%=20
/<BR>/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
101086&nbsp;&nbsp;&nbsp;&nbsp; 10442&nbsp;&nbsp;&nbsp;&nbsp; 85425&nbsp; =
11%=20
/boot<BR>tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
250336&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;=20
250336&nbsp;&nbsp; 0% /dev/shm<BR></FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial=20
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>So now I cannot remove =
the 2nd disk=20
without disrupting the system. </FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>Can I use =
</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>lvremove or =
lvchange</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>doing lvdisplay =
shows:</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial=20
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>[root@s2]#=20
/usr/sbin/lvdisplay<BR>&nbsp; --- Logical volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/VolGroup00/LogVol00<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
VolGroup00<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
AG2uKb-0VMO-5qn4-T2LK-cjM8-mZbh-jETkyx<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
147.88 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
4732<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; =
Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
253:0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>&nbsp; --- Logical =
volume=20
---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/VolGroup00/LogVol01<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
VolGroup00<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
8Q6XKF-bz8D-vcan-Izf9-Ntzn-XmYv-9WAi5g<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
992.00 MB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
31<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; =
Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
253:1<BR>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>which command should I =
use to leave=20
all information on the /dev/sda1 and be able to take out the other=20
disk?</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2>Thank =
you!</FONT></DIV>
<DIV class=3DSection1><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV class=3DSection1><FONT face=3DArial=20
size=3D2>Alejandro</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0061_01C79ED5.817464E0--
