Message-ID: <003a01c31aae$2f5cabe0$e0bba5cc@patni.com>
From: "Sameer Halgatti" <sameer.halgatti@patni.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0035_01C31ADC.37269AB0"
Subject: [linux-lvm] Problem while creating a Logical Volume on a Multipath Lun
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
Date: Thu May 15 07:33:22 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0035_01C31ADC.37269AB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am facing problem while creating a Logical Volume on a Multipath Lun.
There are 4 paths to a LUN. The corresponding scsi devices are /dev/sdg, =
/dev/sdu, /dev/sdba, /dev/sdbj.

1. Initially there were no PVs, VGs and LVs.
[root@PC-P31211 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): read" reading physical volumes
=20
[root@PC-P31211 root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group
=20
[root@PC-P31211 root]# lvscan
lvscan -- no volume groups found

2. Then I created a PV on /dev/sdg1. (I had already created partitions =
of sdg)
[root@PC-P31211 root]# pvcreate /dev/sdg1
pvcreate -- physical volume "/dev/sdg1" successfully created
The o/p of pvscan is as follows,
[root@PC-P31211 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdg1"  is in no VG  [402.61 MB]
pvscan -- inactive PV "/dev/sdu1"  is in no VG  [402.61 MB]
pvscan -- inactive PV "/dev/sdba1" is in no VG  [402.61 MB]
pvscan -- inactive PV "/dev/sdbj1" is in no VG  [402.61 MB]
pvscan -- total: 4 [1.57 GB] / in use: 0 [0] / in no VG: 4 [1.57 GB]
Here u can notice that even though I have created PV on sdg, pvscan =
shows all the scsi devices which are pointing to the same LUN.

3. Then I created a VG on PV /dev/sdg1
[root@PC-P31211 root]# vgcreate test_vg /dev/sdg1
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "test_vg"
vgcreate -- volume group "test_vg" successfully created and activated
The o/p of vgscan & pvscan is as follows,
[root@PC-P31211 root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "test_vg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group
[root@PC-P31211 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdg1"  of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- inactive PV "/dev/sdu1"  of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- inactive PV "/dev/sdba1" of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- inactive PV "/dev/sdbj1" of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- total: 4 [1.57 GB] / in use: 4 [1.57 GB] / in no VG: 0 [0]

4. Then I tried to create LV on "test_vg". But that gave me error.
[root@PC-P31211 root]# lvcreate -L 50 -n test_lv test_vg
lvcreate -- rounding size up to physical extent boundary
lvcreate -- ERROR "No such device or address" creating VGDA for =
"/dev/test_vg/te
st_lv" in kernel

Also see the results of lvscan & lvdisplay which are contradictory.
[root@PC-P31211 root]# lvscan
lvscan -- ACTIVE            "/dev/test_vg/test_lv" [52 MB]
lvscan -- 1 logical volumes with 52 MB total in 1 volume group
lvscan -- 1 active logical volumes

[root@PC-P31211 root]# lvdisplay /dev/test_vg/test_lv
lvdisplay -- logical volume "/dev/test_vg/test_lv" doesn't exist

Can any body help me to solve this problem???

Somebody suggested me a solution...
a. Deactivate VG
b. Run vgscan
c. Activate VG
d. Create LV.
I followed these step. The o/p is given below.
[root@PC-P31211 root]# vgchange -an
vgchange -- volume group "test_vg" successfully deactivated
=20
[root@PC-P31211 root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "test_vg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group
=20
[root@PC-P31211 root]# vgchange -ay
vgchange -- volume group "test_vg" successfully activated
=20
[root@PC-P31211 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdg1"  of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- inactive PV "/dev/sdu1"  of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- inactive PV "/dev/sdba1" of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- ACTIVE   PV "/dev/sdbj1" of VG "test_vg" [396 MB / 396 MB =
free]
pvscan -- total: 4 [1.57 GB] / in use: 4 [1.57 GB] / in no VG: 0 [0]
=20
[root@PC-P31211 root]# lvcreate -L 50 -n test_lv test_vg
lvcreate -- rounding size up to physical extent boundary
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/test_lv" successfully created
=20
[root@PC-P31211 root]# lvscan
lvscan -- ACTIVE            "/dev/test_vg/test_lv" [52 MB]
lvscan -- 1 logical volumes with 52 MB total in 1 volume group
lvscan -- 1 active logical volumes
=20
[root@PC-P31211 root]# lvdisplay /dev/test_vg/test_lv
--- Logical volume ---
LV Name                /dev/test_vg/test_lv
VG Name                test_vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                52 MB
Current LE             13
Allocated LE           13
Allocation             next free
Read ahead sectors     120
Block device           58:0

This apporach helped me to create the Logical Volume. But it does not =
fulfill my requirement. Here initially I had created VG on sdg1, but =
after doing (vgchange -an, vgscan, vgchage -ay) that VG got shifted on =
sdbj. And hence LV will also be created on this LV. But I want LV to be =
created on sdj only. Is there any solution to my problem???

Regards,
Sameer Halgatti


------=_NextPart_000_0035_01C31ADC.37269AB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I am facing problem while creating a =
Logical Volume=20
on a Multipath Lun.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>There are 4 paths to a LUN. The =
corresponding scsi=20
devices are /dev/sdg, /dev/sdu, /dev/sdba, /dev/sdbj.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1. Initially there were no PVs, VGs and =

LVs.</FONT></DIV>
<DIV><EM><FONT face=3DArial size=3D2>[root@PC-P31211 root]# =
pvscan<BR>pvscan --=20
reading all physical volumes (this may take a while...)<BR>pvscan -- =
ERROR=20
"pv_read(): read" reading physical volumes<BR>&nbsp;<BR>[root@PC-P31211 =
root]#=20
vgscan<BR>vgscan -- reading all physical volumes (this may take a=20
while...)<BR>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully=20
created<BR>vgscan -- WARNING: This program does not do a VGDA backup of =
your=20
volume group<BR>&nbsp;<BR>[root@PC-P31211 root]# lvscan<BR>lvscan -- no =
volume=20
groups found<BR></FONT></EM></DIV>
<DIV><FONT face=3DArial size=3D2>2. Then I created a PV on /dev/sdg1. (I =
had already=20
created partitions of sdg)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><EM>[root@PC-P31211 root]# pvcreate=20
/dev/sdg1<BR>pvcreate -- physical volume "/dev/sdg1" successfully=20
created</EM></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The o/p of pvscan is as =
follows,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@PC-P31211 root]# =
pvscan<BR><EM>pvscan --=20
reading all physical volumes (this may take a while...)<BR>pvscan -- =
inactive PV=20
"/dev/sdg1"&nbsp; is in no VG&nbsp; [402.61 MB]<BR>pvscan -- inactive PV =

"/dev/sdu1"&nbsp; is in no VG&nbsp; [402.61 MB]<BR>pvscan -- inactive PV =

"/dev/sdba1" is in no VG&nbsp; [402.61 MB]<BR>pvscan -- inactive PV =
"/dev/sdbj1"=20
is in no VG&nbsp; [402.61 MB]<BR>pvscan -- total: 4 [1.57 GB] / in use: =
0 [0] /=20
in no VG: 4 [1.57 GB]</EM></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Here u can notice that even though I =
have created=20
PV on sdg, pvscan shows all the scsi devices which are pointing to the =
same=20
LUN.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>3. Then I created a VG on PV =
/dev/sdg1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><EM>[root@PC-P31211 root]# vgcreate =
test_vg=20
/dev/sdg1<BR>vgcreate -- INFO: using default physical extent size 4=20
MB<BR>vgcreate -- INFO: maximum logical volume size is 255.99=20
Gigabyte<BR>vgcreate -- doing automatic backup of volume group=20
"test_vg"<BR>vgcreate -- volume group "test_vg" successfully created and =

activated<BR></EM>The o/p of vgscan &amp; pvscan is as =
follows,</FONT></DIV>
<DIV><EM><FONT face=3DArial size=3D2>[root@PC-P31211 root]# =
vgscan<BR>vgscan --=20
reading all physical volumes (this may take a while...)<BR>vgscan -- =
found=20
active volume group "test_vg"<BR>vgscan -- "/etc/lvmtab" and =
"/etc/lvmtab.d"=20
successfully created<BR>vgscan -- WARNING: This program does not do a =
VGDA=20
backup of your volume group<BR>[root@PC-P31211 root]# pvscan<BR>pvscan =
--=20
reading all physical volumes (this may take a while...)<BR>pvscan --=20
ACTIVE&nbsp;&nbsp; PV "/dev/sdg1"&nbsp; of VG "test_vg" [396 MB / 396 MB =

free]<BR>pvscan -- inactive PV "/dev/sdu1"&nbsp; of VG "test_vg" [396 MB =
/ 396=20
MB free]<BR>pvscan -- inactive PV "/dev/sdba1" of VG "test_vg" [396 MB / =
396 MB=20
free]<BR>pvscan -- inactive PV "/dev/sdbj1" of VG "test_vg" [396 MB / =
396 MB=20
free]<BR>pvscan -- total: 4 [1.57 GB] / in use: 4 [1.57 GB] / in no VG: =
0=20
[0]<BR></FONT></EM></DIV>
<DIV><FONT face=3DArial size=3D2>4. Then I tried to create LV on =
"test_vg". But that=20
gave me error.</FONT></DIV>
<DIV><EM><FONT face=3DArial size=3D2>[root@PC-P31211 root]# lvcreate -L =
50 -n=20
test_lv test_vg<BR>lvcreate -- rounding size up to physical extent=20
boundary<BR>lvcreate -- ERROR "No such device or address" creating VGDA =
for=20
"/dev/test_vg/te<BR>st_lv" in kernel<BR></FONT></EM></DIV>
<DIV><FONT face=3DArial size=3D2>Also see the results of lvscan &amp; =
lvdisplay=20
which are contradictory.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><EM>[root@PC-P31211 root]# =
lvscan<BR>lvscan --=20
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

"/dev/test_vg/test_lv" [52 MB]<BR>lvscan -- 1 logical volumes with 52 MB =
total=20
in 1 volume group<BR>lvscan -- 1 active logical =
volumes</EM></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><EM><BR>[root@PC-P31211 root]# =
lvdisplay=20
/dev/test_vg/test_lv<BR>lvdisplay -- logical volume =
"/dev/test_vg/test_lv"=20
doesn't exist</EM></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><STRONG>Can any body help me =
to&nbsp;solve this=20
problem???</STRONG></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Somebody suggested me a =
solution...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>a. Deactivate VG</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>b. Run vgscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>c. Activate VG</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>d. Create LV.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I followed these step. The o/p is given =

below.</FONT></DIV>
<DIV><EM><FONT face=3DArial size=3D2>[root@PC-P31211 root]# vgchange =
-an<BR>vgchange=20
-- volume group "test_vg" successfully =
deactivated<BR>&nbsp;<BR>[root@PC-P31211=20
root]# vgscan<BR>vgscan -- reading all physical volumes (this may take a =

while...)<BR>vgscan -- found inactive volume group "test_vg"<BR>vgscan =
--=20
"/etc/lvmtab" and "/etc/lvmtab.d" successfully created<BR>vgscan -- =
WARNING:=20
This program does not do a VGDA backup of your volume=20
group<BR>&nbsp;<BR>[root@PC-P31211 root]# vgchange -ay<BR>vgchange -- =
volume=20
group "test_vg" successfully activated<BR>&nbsp;<BR>[root@PC-P31211 =
root]#=20
pvscan<BR>pvscan -- reading all physical volumes (this may take a=20
while...)<BR>pvscan -- inactive PV "/dev/sdg1"&nbsp; of VG "test_vg" =
[396 MB /=20
396 MB free]<BR>pvscan -- inactive PV "/dev/sdu1"&nbsp; of VG "test_vg" =
[396 MB=20
/ 396 MB free]<BR>pvscan -- inactive PV "/dev/sdba1" of VG "test_vg" =
[396 MB /=20
396 MB free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/sdbj1" of VG =
"test_vg"=20
[396 MB / 396 MB free]<BR>pvscan -- total: 4 [1.57 GB] / in use: 4 [1.57 =
GB] /=20
in no VG: 0 [0]<BR>&nbsp;<BR>[root@PC-P31211 root]# lvcreate -L 50 -n =
test_lv=20
test_vg<BR>lvcreate -- rounding size up to physical extent =
boundary<BR>lvcreate=20
-- doing automatic backup of "test_vg"<BR>lvcreate -- logical volume=20
"/dev/test_vg/test_lv" successfully created<BR>&nbsp;<BR>[root@PC-P31211 =
root]#=20
lvscan<BR>lvscan --=20
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

"/dev/test_vg/test_lv" [52 MB]<BR>lvscan -- 1 logical volumes with 52 MB =
total=20
in 1 volume group<BR>lvscan -- 1 active logical=20
volumes<BR>&nbsp;<BR>[root@PC-P31211 root]# lvdisplay=20
/dev/test_vg/test_lv<BR>--- Logical volume ---<BR>LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/test_vg/test_lv<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
test_vg<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
read/write<BR>LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>LV=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
52 MB<BR>Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
13<BR>Allocated =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
13<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:0<BR></FONT></EM></DIV>
<DIV><FONT face=3DArial size=3D2>This apporach helped me to create the =
Logical=20
Volume. But it does not&nbsp;fulfill my requirement. Here initially I =
had=20
created VG on sdg1, but after doing (vgchange -an, vgscan, vgchage -ay) =
that VG=20
got shifted on sdbj. And hence LV will also be created on this LV. But I =
want LV=20
to be created on sdj only. Is there any solution to my =
problem???</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>Regards,<BR>Sameer=20
Halgatti<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0035_01C31ADC.37269AB0--
