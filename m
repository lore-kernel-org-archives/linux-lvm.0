Message-ID: <02ee01c2dadc$7e7ff310$020010ac@romio>
From: "Roman Gavrilov" <romio@netvision.net.il>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_02EB_01C2DAED.41FC8E10"
Subject: [linux-lvm] lvm mirroring
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
Date: Sat Feb 22 10:41:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_02EB_01C2DAED.41FC8E10
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

Hello,

I have 2 physical discs.
I have 4 partitions on the first disk.=20
I created a volume group "lvmhd" from all of the partitions and later =
created logical volumes.

this is the result from the vgdisplay
--- Volume group ---
VG Name               lvmhd
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           2 TB
Max PV                256
Cur PV                4
Act PV                4
VG Size               35.59 GB
PE Size               32 MB
Total PE              1139
Alloc PE / Size       1131 / 35.34 GB
Free  PE / Size       8 / 256 MB
VG UUID               xqamqE-9gSs-Xy3O-2tVQ-wYzy-Cp3u-0Wivbd

and those are the logical volumes
/dev/lvmhd/lvm_usr    3.0G  980M  1.8G  35% /usr
/dev/lvmhd/lvm_var    4.9G   65M  4.6G   2% /var
/dev/lvmhd/lvm_home    27G   33M   25G   1% /home

later I mirrored the first disk to the second disk with dd if=3D/dev/hda =
of=3D/dev/hdb so if the first disk breaks I can remove it and replace it =
with the second disk and get the server up in minutes.

Now I want to be able to use the second disk while I am running from the =
first. But the volume groups are the same and I am afraid that if I will =
recreate the logical volumes I'll ruin some thing on the second disk.
Is there anything I can do about it so I could use the second disk for =
backups but still have the same architecture as the primary disk ?
is there any way to mount those logical volumes which are mirrors of the =
primary disk ?
for example I can do=20
pvdisplay /dev/hdb3 (this is the slave disk which is the mirror of the =
primary and its not mounted)
--- Physical volume ---
PV Name               /dev/hdb3
VG Name               lvmhd
PV Size               13.67 GB [28676025 secs] / NOT usable 32.19 MB =
[LVM: 129 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       32768
Total PE              436
Free PE               0
Allocated PE          436
PV UUID               5XenPH-2NLb-cmN0-qEBb-QGuJ-zWxv-otMr7i

thanks

------=_NextPart_000_02EB_01C2DAED.41FC8E10
Content-Type: text/html;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1255">
<META content=3D"MSHTML 6.00.2722.900" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have 2 physical discs.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have 4 partitions on the first disk.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I created a volume group "lvmhd" from =
all of the=20
partitions and later created logical volumes.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>this is the result from the =
vgdisplay</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--- Volume group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
lvmhd<BR>VG=20
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
3<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
3<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2=20
TB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
4<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
4<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
35.59 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
32 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1139<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1131 / 35.34 =

GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8 / 256 =
MB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
xqamqE-9gSs-Xy3O-2tVQ-wYzy-Cp3u-0Wivbd<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and those are the logical =
volumes</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/dev/lvmhd/lvm_usr&nbsp;&nbsp;&nbsp; =
3.0G&nbsp;=20
980M&nbsp; 1.8G&nbsp; 35% /usr<BR>/dev/lvmhd/lvm_var&nbsp;&nbsp;&nbsp;=20
4.9G&nbsp;&nbsp; 65M&nbsp; 4.6G&nbsp;&nbsp; 2%=20
/var<BR>/dev/lvmhd/lvm_home&nbsp;&nbsp;&nbsp; 27G&nbsp;&nbsp; =
33M&nbsp;&nbsp;=20
25G&nbsp;&nbsp; 1% /home<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>later I mirrored the first disk to the =
second disk=20
with dd if=3D/dev/hda of=3D/dev/hdb so if the first disk breaks I can =
remove it and=20
replace it with the second disk and get the server up in =
minutes.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now I want to be able to use the second =
disk while=20
I am running from the first. But the volume groups are the same and I am =
afraid=20
that if I will recreate the logical volumes I'll ruin some thing on the =
second=20
disk.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Is there anything I can do about it so =
I could use=20
the second disk for backups but still have the same architecture as the =
primary=20
disk ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>is there any way to mount those logical =
volumes=20
which are mirrors of the primary disk ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>for example I can do </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pvdisplay /dev/hdb3 (this is the slave =
disk which=20
is the mirror of the primary and its not mounted)<BR>--- Physical volume =

---<BR>PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hdb3<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
lvmhd<BR>PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
13.67 GB [28676025 secs] / NOT usable 32.19 MB [LVM: 129=20
KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
yes (but full)<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32768<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
436<BR>Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
436<BR>PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
5XenPH-2NLb-cmN0-qEBb-QGuJ-zWxv-otMr7i<BR></FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>thanks</DIV></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_02EB_01C2DAED.41FC8E10--
