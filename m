Message-ID: <01ef01c24ac6$86fc58e0$162ea8c0@pike>
From: "Davide Di Luzio" <davide@connettendo.it>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01EC_01C24AD7.4A4057B0"
Subject: [linux-lvm] pvmove failed
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Aug 23 12:00:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_01EC_01C24AD7.4A4057B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

we've a server (web, ftp, cgi applications) with this hardware:

Motherborad SuperMIcro P4DP6

Onboard ATI Technologies Inc Rage XL (rev 27) (prog-if 00 [VGA])
 ATI Technologies Inc Rage XL

dual P4 Xeon 2.2 Ghz
4 Gbyte RAM

one controller: American Megatrends Inc. MegaRAID (rev 02)
American Megatrends Inc. MegaRAID 475 Express 500 RAID Controller bios =
ver. 5.2

one controller: SCSI storage controller: Adaptec AHA-3960D / AIC-7899A =
U160/m (rev 01)
 Adaptec AHA-3960D U160/m

onboard controller:=20
SCSI storage controller: Adaptec AIC-7899P U160/m (rev 01)

Intel Ethernet Pro 100

We've LVM utility software vers. 1.0.5 installed on 2.4.18-10 Readhat =
Kernel (ver. 7.3, official kernel patched with LVM 1.0.5).=20

The Volume group hosting is so configured:

--- Volume group ---
VG Name               hosting
VG Access             read/write
VG Status             available/resizable
VG #                  2
MAX LV                255
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               34.24 GB
PE Size               4 MB
Total PE              17510
Alloc PE / Size       8744 / 34.16 GB
Free  PE / Size       0 / 0 GB
VG UUID               zsW0nX-g4jP-z1uw-dAEk-TZDP-dxVC-j1Llec

--- Logical volume ---
LV Name                /dev/home/lv
VG Name                home
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                12 GB
Current LE             3072
Allocated LE           3072
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:5

--- Logical volume ---
LV Name                /dev/hosting/lv
VG Name                hosting
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                7.16 GB
Current LE             1832
Allocated LE           1832
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:8

--- Logical volume ---
LV Name                /dev/hosting/lv0
VG Name                hosting
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                7 GB
Current LE             1792
Allocated LE           1792
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:9

--- Logical volume ---
LV Name                /dev/hosting/lv1
VG Name                hosting
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                20 GB
Current LE             5120
Allocated LE           5120
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:10

--- Physical volumes ---

PV Name (#)           /dev/sdv1 (1)
PV Status             available / allocatable
Total PE / Free PE    4372 / 0

PV Name (#)           /dev/sdw1 (2)
PV Status             available / allocatable
Total PE / Free PE    4372 / 0

The device /dev/sdw1 is an logical array (raid 1) on ami megaraid =
controller: this device is  in degraded  mode, so we have add two scsi =
disk with raid software (/dev/md12, one device on onboard controller
and the second on the external AIC 7899); i wolud move the striped =
device /dev/sdw1 to
new /dev/md12.
    I've add this device (/dev/md12) to volume group hosting with =
"vgextend" utility.
Note that /dev/sdv1 and /dev/sdw1 are logical striping of volume group =
hosting

In single mode, i've umounted all the logical volume and i've make:

/sbin/pvmove -iv /dev/sdw1 /dev/md12

The process skipped some PE (I/o errors) but after moved 91 PE from =
/dev/sdw1 the pvmove command=20
freezed; after a shutdown of a server i see on the vg hosting that =
/dev/md12 has 91 PE allocated and i've
mounted on the file system apparently about no errors
    I see also that the PE is on lv logical volume, so i make:

/sbin/pvmove -iv -n lv1 /dev/sdw1 /dev/md12

(I've tested several type of pvmove comand, but i can't specify a ranges =
of PE with a logical volume striped).

About moved 90 PE the pvmove freezed; reboot the server and /dev/md/12 =
ha allocated another  90 PE.

So go on, and after:

/sbin/pvmove -iv -n lv0 /dev/sdw1 /dev/md12 i've moved 89  PE and =
freezed again:
is this another bug of pvmove utility?

Now, the vgdisplay -v hosting is this:


--- Volume group ---
VG Name               hosting
VG Access             read/write
VG Status             available/resizable
VG #                  2
MAX LV                255
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               34.24 GB
PE Size               4 MB
Total PE              17510
Alloc PE / Size       8744 / 34.16 GB
Free  PE / Size       8766 / 34.24 GB
VG UUID               zsW0nX-g4jP-z1uw-dAEk-TZDP-dxVC-j1Llec
--- Logical volume ---
LV Name                /dev/home/lv
VG Name                home
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                12 GB
Current LE             3072
Allocated LE           3072
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:5

--- Logical volume ---
LV Name                /dev/hosting/lv
VG Name                hosting
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                7.16 GB
Current LE             1832
Allocated LE           1832
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:8

--- Logical volume ---
LV Name                /dev/hosting/lv0
VG Name                hosting
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                7 GB
Current LE             1792
Allocated LE           1792
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:9

--- Logical volume ---
LV Name                /dev/hosting/lv1
VG Name                hosting
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                20 GB
Current LE             5120
Allocated LE           5120
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:10


--- Physical volumes ---
PV Name (#)           /dev/md12 (3)
PV Status             available / allocatable
Total PE / Free PE    8766 / 8499

PV Name (#)           /dev/sdv1 (1)
PV Status             available / allocatable
Total PE / Free PE    4372 / 0

PV Name (#)           /dev/sdw1 (2)
PV Status             available / allocatable
Total PE / Free PE    4372 / 267

/sbin/pvdisplay -v /dev/md12

In this mail is attached the pvdispay output of /dev/md12.

Now the server is up and apparently the data is integrity but i=20
would safely move all the logical volume=20
on /dev/md12 or into another device; how can i do this ?

Thanks.=20

Best Regards.

Davide Di Luzio
System Administrator
-----------------
ALICOM Group     Tel: +39-085-4406901     Fax: +39-085-4406927





------=_NextPart_000_01EC_01C24AD7.4A4057B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>we've a server (web, ftp, cgi =
applications) with=20
this hardware:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Motherborad SuperMIcro =
P4DP6</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Onboard ATI Technologies Inc Rage XL =
(rev 27)=20
(prog-if 00 [VGA])<BR>&nbsp;ATI Technologies Inc Rage =
XL<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>dual P4 Xeon 2.2 Ghz</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>4 Gbyte RAM</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>one controller: American Megatrends =
Inc. MegaRAID=20
(rev 02)<BR>American Megatrends Inc. MegaRAID 475 Express 500 RAID =
Controller=20
bios ver. 5.2<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>one controller: SCSI storage =
controller: Adaptec=20
AHA-3960D / AIC-7899A U160/m (rev 01)<BR>&nbsp;Adaptec AHA-3960D=20
U160/m<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>onboard controller: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>SCSI storage controller: Adaptec =
AIC-7899P U160/m=20
(rev 01)<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>Intel Ethernet Pro 100</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We've LVM utility software vers. 1.0.5 =
installed on=20
2.4.18-10 Readhat Kernel (ver. 7.3, official kernel patched </FONT><FONT =

face=3DArial size=3D2>with LVM 1.0.5). </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The Volume group hosting is so=20
configured:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Volume group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
hosting<BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
3<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;34.24=20
GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
17510<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8744 / =
34.16=20
GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =
/&nbsp;0=20
GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
zsW0nX-g4jP-z1uw-dAEk-TZDP-dxVC-j1Llec<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/home/lv<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
home<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
12 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
3072<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3072<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:5</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/hosting/lv<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
hosting<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
7.16 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1832<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1832<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:8</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/hosting/lv0<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
hosting<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
7 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1792<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1792<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:9<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/hosting/lv1<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
hosting<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
20 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
5120<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
5120<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:10</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>
<DIV>--- Physical volumes ---<BR></DIV>
<DIV>PV Name =
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/sdv1 (1)<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 4372 / =
0</DIV>
<DIV>&nbsp;</DIV>
<DIV>PV Name =
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/sdw1 (2)<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 4372 /=20
0<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The device /dev/sdw1 is an logical =
array (raid 1)=20
on ami megaraid controller:&nbsp;this device is &nbsp;in degraded&nbsp; =
mode,=20
</FONT><FONT face=3DArial size=3D2>so we have add two scsi disk with =
raid software=20
(/dev/md12, one device on onboard controller</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and the second on the external AIC =
7899); i wolud=20
move the striped device /dev/sdw1 to</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>new /dev/md12.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I've add this device =
(/dev/md12)=20
to volume group hosting with "vgextend" utility.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Note that /dev/sdv1 and /dev/sdw1 are =
logical=20
striping of volume group hosting</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>In single mode, i've umounted all the =
logical=20
volume and i've make:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/pvmove -iv /dev/sdw1 =
/dev/md12</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The process skipped some PE (I/o =
errors) but after=20
moved 91 PE from /dev/sdw1 the pvmove command </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>freezed; after a shutdown of a server i =
see on the=20
vg hosting that /dev/md12 has 91 PE allocated and i've</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mounted on the file system apparently =
about&nbsp;no=20
errors</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I see also that the =
PE is on lv=20
logical volume, so i make:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/pvmove -iv -n lv1 /dev/sdw1=20
/dev/md12</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>(I've tested several type of pvmove =
comand, but i=20
can't specify a ranges of PE with a logical volume =
striped).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>About moved 90 PE the pvmove freezed; =
reboot the=20
server and /dev/md/12 ha allocated another&nbsp; 90 PE.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So go on, and after:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/pvmove -iv -n lv0 /dev/sdw1 =
/dev/md12 i've=20
moved 89&nbsp; PE and freezed again:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>is this another bug of pvmove =
utility?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now, the vgdisplay -v hosting is =
this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial size=3D2>--- Volume =
group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
hosting<BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
3<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;34.24=20
GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
17510<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8744 / =
34.16=20
GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8766 / =
34.24=20
GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
zsW0nX-g4jP-z1uw-dAEk-TZDP-dxVC-j1Llec<BR>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/home/lv<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
home<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
12 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
3072<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3072<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:5</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/hosting/lv<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
hosting<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
7.16 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1832<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1832<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:8</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/hosting/lv0<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
hosting<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
7 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1792<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1792<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:9<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/hosting/lv1<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
hosting<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
20 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
5120<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
5120<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:10</FONT></DIV>
<DIV>&nbsp;</DIV><FONT face=3DArial size=3D2>
<DIV><BR>--- Physical volumes ---<BR>PV Name=20
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/dev/md12=20
(3)<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 8766 /=20
8499</DIV>
<DIV>&nbsp;</DIV>
<DIV>PV Name =
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/sdv1 (1)<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 4372 / =
0</DIV>
<DIV>&nbsp;</DIV>
<DIV>PV Name =
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/sdw1 (2)<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 4372 /=20
267<BR></DIV>
<DIV>/sbin/pvdisplay -v /dev/md12</DIV>
<DIV>&nbsp;</DIV>
<DIV>In this mail is attached the pvdispay output of /dev/md12.</DIV>
<DIV><BR>Now the server is up and apparently the data is integrity but i =

<BR>would safely move all the logical volume <BR>on /dev/md12 or into =
another=20
device; how can i do this ?<BR></DIV>
<DIV>Thanks. <BR><BR>Best Regards.<BR></DIV>
<DIV>Davide Di Luzio</DIV>
<DIV>System Administrator</DIV>
<DIV>-----------------</DIV>
<DIV>ALICOM Group&nbsp;&nbsp;&nbsp;&nbsp; Tel:=20
+39-085-4406901&nbsp;&nbsp;&nbsp;&nbsp; Fax: +39-085-4406927</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></FONT></DIV></FONT></FONT></DIV></FONT></DIV></BODY></H=
TML>

------=_NextPart_000_01EC_01C24AD7.4A4057B0--
