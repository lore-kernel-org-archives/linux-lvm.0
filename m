Message-Id: <002401c1ea10$873d91a0$6b01a8c0@PC07>
From: "Ralf Zerres" <rzerres@networkx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
    boundary="----=_NextPart_000_0020_01C1EA21.4ABA2CA0"
Subject: [linux-lvm] Desater Recovery <urgent>
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
Date: Mon Apr 22 10:14:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0020_01C1EA21.4ABA2CA0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0021_01C1EA21.4ABBB340"


------=_NextPart_001_0021_01C1EA21.4ABBB340
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hello everybody,

on a production system we do have a serious data destruction problem.=20
Any help leading us to restore the filesystem will be honored. We can =
dicuss financial details later.
First I'd like to describe the situation giving you a picture wether it =
is possible to restore the data.

Please answer as soon as possible to give me a hint wether I should wait =
for a detailed analysis,
if it make sense to dig deeper or if it is more likely that people have =
to reinsert the data from printed=20
information.

0. PROBLEM:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Destructed Filesystem after resizing LVG running a Postgres Database.=20

###
# There is no actual backup, which is the mad point!!!!=20
###=20

24 days of DATA updates are lost right now!

I. Environment
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

System:    Dual Prozessor PIII (2 CPU's 1Mhz)
OS:    Linux 2.4.9=20

Harddisk:    SCSI-3 (as Raid-5)
Controller:    GDT=20
LVM version:     1.0.1-rc2(30/08/2001)

Kernel sees one harddrive (/dev/scsi/host2/bus0/target0)

Root is on standard ext3 fs (partition 5)

LVM has a Physical Volumegroup (KI) on partition 7
The system runs a PostgreSQL Database (version 7.1.3). The =
Data-Structures live on a Logical-Volume-Group
which was mounted as /var/lib/postgres as a ext3 filesystem.
Everything was working until 4 hours ago, before LVG was resized.

II. Changes

The LVG /dev/ki/postgres was reduced from 8 GB to 800MB. Before we did =
that a df has shown a used size
of 366 MB data.
Postgres was shut down. No other process was writing to =
/dev/ki/postgres.

     # e2fsadm --size - 4,5G=20

Worked out, but remounting has shown incorrect structure.

A new LVG was created=20

    # lvcreate    --size 2,5G --name opt /dev/ki/opt

Here the dump-information from the actual Volume-Group after resizing =
was successful.

----------------------------------------------schnipp / schnapp =
------------------------------------------------


#vgdisplay -v /dev/ki
--- Volume group ---
VG Name               ki
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                7
Open LV               6
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               48.77 GB
PE Size               4 MB
Total PE              12484
Alloc PE / Size       11968 / 46.75 GB
Free  PE / Size       516 / 2.02 GB
VG UUID               P6LodN-bQUg-u5WF-03Cu-A22a-UUhE-NsKhvZ

--- Logical volume ---
LV Name                /dev/ki/export
VG Name                ki
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                6 GB
Current LE             1536
Allocated LE           1536
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/ki/var
VG Name                ki
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                1 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/ki/tmp
VG Name                ki
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                1 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     120
Block device           58:2

--- Logical volume ---
LV Name                /dev/ki/home
VG Name                ki
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 1
LV Size                30 GB
Current LE             7680
Allocated LE           7680
Allocation             next free
Read ahead sectors     120
Block device           58:3

--- Logical volume ---
LV Name                /dev/ki/postgres
VG Name                ki
LV Write Access        read/write
LV Status              available
LV #                   5
# open                 0
LV Size                3.78 GB
Current LE             968
Allocated LE           968
Allocation             next free
Read ahead sectors     120
Block device           58:4

--- Logical volume ---
LV Name                /dev/ki/www
VG Name                ki
LV Write Access        read/write
LV Status              available
LV #                   6
# open                 1
LV Size                2.44 GB
Current LE             625
Allocated LE           625
Allocation             next free
Read ahead sectors     120
Block device           58:5

--- Logical volume ---
LV Name                /dev/ki/opt
VG Name                ki
LV Write Access        read/write
LV Status              available
LV #                   7
# open                 1
LV Size                2.53 GB
Current LE             647
Allocated LE           647
Allocation             next free
Read ahead sectors     120
Block device           58:6


--- Physical volumes ---
PV Name (#)           /dev/scsi/host2/bus0/target0/lun0/part7 (1)
PV Status             available / allocatable
Total PE / Free PE    12484 / 516

Volume-Group: KI

----------------------------------------------schnipp / schnapp =
------------------------------------------------


The sysadmin was running a vgscan an lvscan. Afterwards he runs=20

    # e2fsck -y -f /dev/ki/postgres

now the mount on /var/lib/postgres was successful, but all date were =
gone!
I found a long list of dir-entries in the lost+found subdir. No =
file-entries.

What can we do?

Ralf


------=_NextPart_001_0021_01C1EA21.4ABBB340
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hello everybody,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>on a production system we do have a =
serious data=20
destruction problem. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Any help leading us to restore the =
filesystem will=20
be honored. We can dicuss financial details later.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>First I'd like to describe the =
situation giving you=20
a picture wether it is possible to restore the data.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Please answer as soon as possible to =
give me a hint=20
wether I should wait for a detailed analysis,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>if it make sense to dig deeper or if it =
is more=20
likely that people have to reinsert the data from printed </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>information.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>0. PROBLEM:</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Destructed Filesystem after resizing =
LVG running a=20
Postgres Database. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>###</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># There is no actual backup, which is =
the mad=20
point!!!! </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>### </FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>24 days of DATA updates are lost right=20
now!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I. Environment</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>System:&nbsp;&nbsp;&nbsp; Dual =
Prozessor PIII (2=20
CPU's 1Mhz)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>OS:&nbsp;&nbsp;&nbsp; Linux 2.4.9 =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Harddisk:&nbsp;&nbsp;&nbsp; SCSI-3 (as=20
Raid-5)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Controller:&nbsp;&nbsp;&nbsp; GDT =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>LVM version:&nbsp;&nbsp;&nbsp; =20
1.0.1-rc2(30/08/2001)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Kernel sees one harddrive=20
(/dev/scsi/host2/bus0/target0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Root is on standard ext3 fs (partition=20
5)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>LVM has a Physical Volumegroup (KI)=20
on&nbsp;partition 7</FONT></DIV>The system runs a PostgreSQL Database =
(version=20
7.1.3). The Data-Structures live on a Logical-Volume-Group</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>which&nbsp;was mounted as =
/var/lib/postgres as a=20
ext3 filesystem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Everything was working&nbsp;until 4 =
hours ago,=20
before LVG was resized.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>II. Changes</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The LVG /dev/ki/postgres was reduced =
from 8 GB to=20
800MB. Before we did that a df has shown a used size</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>of 366 MB data.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Postgres was shut down. No other =
process was=20
writing to /dev/ki/postgres.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; # e2fsadm =
--size - 4,5G=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Worked out, but remounting has shown =
incorrect=20
structure.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>A new LVG was created </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # =
lvcreate&nbsp;&nbsp;&nbsp;=20
--size 2,5G --name opt /dev/ki/opt</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here the dump-information from the =
actual=20
Volume-Group after resizing was successful.</FONT></DIV><FONT =
face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------schnipp / schnapp =

------------------------------------------------</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>#vgdisplay -v /dev/ki<BR></FONT><FONT face=3DArial size=3D2>--- =
Volume group=20
---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
ki<BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
7<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
6<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
48.77 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
12484<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11968 / =
46.75=20
GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 516 / =
2.02=20
GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
P6LodN-bQUg-u5WF-03Cu-A22a-UUhE-NsKhvZ</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/ki/export<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
ki<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
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
6 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1536<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1536<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/ki/var<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
ki<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
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
1 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
256<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
256<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/ki/tmp<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
ki<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
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
1 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
256<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
256<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/ki/home<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
ki<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
30 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
7680<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
7680<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/ki/postgres<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
ki<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
5<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
3.78 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
968<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
968<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:4</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/ki/www<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
ki<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
6<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
2.44 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
625<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
625<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:5</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/ki/opt<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
ki<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
7<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
2.53 GB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
647<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
647<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:6</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><BR>--- Physical volumes ---<BR>PV Name =

(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/scsi/host2/bus0/target0/lun0/part7 (1)<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 12484 /=20
516<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Volume-Group: KI</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------schnipp / schnapp =

------------------------------------------------</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>The sysadmin was running a vgscan an lvscan. Afterwards he runs =
</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; # e2fsck -y -f /dev/ki/postgres</DIV>
<DIV>&nbsp;</DIV>
<DIV>now the mount on /var/lib/postgres was successful, but all date =
were=20
gone!</DIV>
<DIV>I found a long list of dir-entries in the lost+found subdir. No=20
file-entries.</DIV>
<DIV>&nbsp;</DIV>
<DIV>What can we do?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Ralf</DIV>
<DIV>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_001_0021_01C1EA21.4ABBB340--

------=_NextPart_000_0020_01C1EA21.4ABA2CA0
Content-Type: text/x-vcard;
	name="Ralf, Zerres.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Ralf, Zerres.vcf"

BEGIN:VCARD
VERSION:2.1
N:Ralf;Zerres
FN:Ralf, Zerres
ORG:Networkx GmbH
TEL;WORK;VOICE:+49 221 937725 - 0
TEL;WORK;FAX:+49 221 937725 - 18
ADR;WORK:;;Marktstr. 8;K=F6ln;;50968
LABEL;WORK;ENCODING=3DQUOTED-PRINTABLE:Marktstr. 8=3D0D=3D0AK=3DF6ln =
50968
EMAIL;PREF;INTERNET:rzerres@networkx.de
REV:20020422T151525Z
END:VCARD

------=_NextPart_000_0020_01C1EA21.4ABA2CA0--
