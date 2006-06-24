Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5OIC1oZ023456
	for <linux-lvm@redhat.com>; Sat, 24 Jun 2006 14:12:01 -0400
Received: from radio.skycom.se (mailut.nordiq.net [212.217.248.11])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5OIBsOP018371
	for <linux-lvm@redhat.com>; Sat, 24 Jun 2006 14:11:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by radio.skycom.se (Postfix) with ESMTP id 0C40D6036184
	for <linux-lvm@redhat.com>; Sat, 24 Jun 2006 20:11:48 +0200 (CEST)
Received: from radio.skycom.se ([127.0.0.1])
	by localhost (radio [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 31537-02 for <linux-lvm@redhat.com>;
	Sat, 24 Jun 2006 20:11:47 +0200 (CEST)
Received: from antec (53dbd911.umea.cust.skycom.se [83.219.217.17])
	by radio.skycom.se (Postfix) with SMTP id 21445603617B
	for <linux-lvm@redhat.com>; Sat, 24 Jun 2006 20:11:43 +0200 (CEST)
Message-ID: <000a01c697b9$aa6ef460$11d9db53@antec>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
Date: Sat, 24 Jun 2006 20:11:47 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C697CA.6BB6AE00"
Subject: [linux-lvm] cant find lvm volumes at boot
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

------=_NextPart_000_0007_01C697CA.6BB6AE00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi all,

I've been running LVM2 for a while and never had any problems with it, =
so my knowledge is a bit limited because i've never had to fiddle with =
it.
It started with me wanting to change my hda drive cuz the old one was =
making alot of noice.
It's partitioning sheme is as follows

  /dev/hda1  [      101.94 MB]    /boot
  /dev/hda2  [        1.87 GB]    /
  /dev/hda3  [       23.00 GB]    LVM physical volume
  /dev/hda4  [      533.90 MB]    SWAP

  --- Physical volume ---
  PV Name               /dev/hda3
  VG Name               vgsys
  PV Size               23.00 GB / not usable 0  =20
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              5888
  Free PE               0
  Allocated PE          5888
  PV UUID               SegkSC-Thbb-DqRg-LSoA-tN0F-WmFp-K7CPCO

  --- Logical volume ---
  LV Name                /dev/vgsys/usr
  VG Name                vgsys
  LV UUID                cYrDRH-neMm-PwCZ-2Dlo-njJm-mBHs-NPZlu4
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                7.00 GB
  Current LE             1792
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0
  =20
  --- Logical volume ---
  LV Name                /dev/vgsys/home
  VG Name                vgsys
  LV UUID                OX1Pkm-p6Vc-q6SB-9nxm-PRMl-TM1z-h5bcIc
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.00 GB
  Current LE             1024
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:1
  =20
  --- Logical volume ---
  LV Name                /dev/vgsys/opt
  VG Name                vgsys
  LV UUID                GlQ5wV-ZzUu-51LW-okn6-82UV-9SFX-weiScV
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:2
  =20
  --- Logical volume ---
  LV Name                /dev/vgsys/var
  VG Name                vgsys
  LV UUID                1VvzOf-DLz1-GMp5-Xj24-r9Mp-yaOy-0t2yLw
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:3
  =20
  --- Logical volume ---
  LV Name                /dev/vgsys/tmp
  VG Name                vgsys
  LV UUID                BAIl2N-5gVg-RzUZ-3IqL-L0D5-JiAk-bO2smA
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:4

Then i added a new 80GB drive at hdc and run

dd if=3D/dev/hda of=3D/dev/hdc

then halt -h

changed disks and booted with the new 80GB disk as hda...
now the strange thing...it cant find the logical volumes at boot, so i =
end up with a very crippled system. if i list the lvm volumes i see that =
they are there, but inactive at boot. i can reactivate them and mount =
them manually...but then at reboot the same thing again.
what have happened?
I even tried to change back to the old drive, and i was certain it would =
boot right up...but the exact same thing occured. GAAAH! How can the =
source drive be altered? I don't get it.
Any ideas?

thanks!

/Fredrik


------=_NextPart_000_0007_01C697CA.6BB6AE00
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2912" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DCourier size=3D2>hi all,</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>I've been running LVM2 for a while =
and never had=20
any problems with it, so my knowledge is a bit limited because i've =
never had to=20
fiddle with it.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>It started with me wanting to change =
my hda drive=20
cuz the old one was making alot of noice.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>It's partitioning sheme is as=20
follows</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp; /dev/hda1&nbsp;=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 101.94=20
MB]&nbsp;&nbsp;&nbsp;&nbsp;/boot<BR>&nbsp; /dev/hda2&nbsp;=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.87 GB]&nbsp;&nbsp;&nbsp;=20
/<BR>&nbsp; /dev/hda3&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23.00=20
GB]&nbsp;&nbsp;&nbsp;&nbsp;LVM physical volume</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp; /dev/hda4&nbsp;=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 533.90 MB]&nbsp;&nbsp;&nbsp; =
SWAP</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp; --- Physical volume =
---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hda3<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vgsys<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
23.00 GB / not usable 0&nbsp;&nbsp; <BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
yes (but=20
full)<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4096<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
5888<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
5888<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
SegkSC-Thbb-DqRg-LSoA-tN0F-WmFp-K7CPCO</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp; --- Logical volume =
---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/vgsys/usr<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
vgsys<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
cYrDRH-neMm-PwCZ-2Dlo-njJm-mBHs-NPZlu4<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
7.00 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1792<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; =
Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
254:0<BR>&nbsp;&nbsp; <BR>&nbsp; --- Logical volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/vgsys/home<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
vgsys<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
OX1Pkm-p6Vc-q6SB-9nxm-PRMl-TM1z-h5bcIc<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
4.00 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1024<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; =
Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
254:1<BR>&nbsp;&nbsp; <BR>&nbsp; --- Logical volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/vgsys/opt<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
vgsys<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
GlQ5wV-ZzUu-51LW-okn6-82UV-9SFX-weiScV<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
5.00 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1280<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; =
Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
254:2<BR>&nbsp;&nbsp; <BR>&nbsp; --- Logical volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/vgsys/var<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
vgsys<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
1VvzOf-DLz1-GMp5-Xj24-r9Mp-yaOy-0t2yLw<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
5.00 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1280<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; =
Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
254:3<BR>&nbsp;&nbsp; <BR>&nbsp; --- Logical volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/vgsys/tmp<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
vgsys<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
BAIl2N-5gVg-RzUZ-3IqL-L0D5-JiAk-bO2smA<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
2.00 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
512<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; =
Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
254:4</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>Then i added a new 80GB drive at hdc =
and=20
run</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier>dd if=3D/dev/hda of=3D/dev/hdc</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>then halt -h</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>changed disks and booted with the new =
80GB disk=20
as hda...</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>now the strange thing...it cant find =
the logical=20
volumes at boot, so i end up with a very crippled system. if i list the =
lvm=20
volumes i see that they are there, but inactive at boot. i can =
reactivate them=20
and mount them manually...but then at reboot the same thing =
again.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>what have happened?</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>I even tried to change back to the =
old drive, and=20
i was certain it would boot right up...but the exact same thing occured. =
GAAAH!=20
How can the source drive be altered? I don't get it.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>Any ideas?</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>thanks!</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>/Fredrik</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0007_01C697CA.6BB6AE00--
