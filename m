Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8DDCJ92018412
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 09:12:19 -0400
Received: from nbb.be (webmaip4.nbb.be [193.53.58.184])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8DDCFH5021707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 09:12:16 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 13 Sep 2007 15:11:47 +0200
Message-ID: <96DBEA7143ECD048905FAAA27D86E0D205BDA980@VSRBEX10.LANPRD.NBB>
From: "Dony Pierre" <Pierre.Dony@nbb.be>
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C7F607.A3B22348"
Subject: [linux-lvm] (no subject)
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


------_=_NextPart_001_01C7F607.A3B22348
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI all,=0D=0A=0D=0AI'm testing LVM on a redhat EL 5 with the following conf=
iguration : =0D=0A  * one FSC Primergy server with one dual port Qlogic HBA=
 2462 =0D=0A  * each Qlogic port is connected to a SAN (dual fabric)  =0D=
=0A  * use of device mapper=0D=0A  * use of LVM to define a mirror disk on =
two IBM ESS  2105 disks =0D=0A=0D=0AEverything was fine and worked=2E I hav=
e created the lvm with :=0D=0A=0D=0Aroot@linprd11 by-id]# lvcreate -L 10G -=
m1 -n mirror1vg1  =0D=0Avg1 /dev/mapper/1IBM_2105_41630194 /dev/mapper/1IBM=
_2105_41630317 =0D=0A/dev/mapper/1IBM_2105_41F30194=0D=0A Logical volume "m=
irror1vg1" created=0D=0A=0D=0ASync between the two mirrors was ok : =0D=0A=
=0D=0A[root@linprd11 by-id]# lvs=0D=0A LV         VG   Attr   LSize  Origin=
 Snap%  Move Log             Copy%=0D=0A mirror1vg1 vg1  mwi-a- 10=2E00G   =
                 mirror1vg1_mlog 100=2E00=0D=0A=0D=0A=0D=0AThen, I suppress=
 access to one image of the mirror and reboot the Linux=0D=0Aserver=2E The =
boot failed and give the following error message :=0D=0A    * An error occu=
rred during the file system check=2E Dropping you to a=0D=0Ashell - Give ro=
ot password for maintenance : =0D=0A=0D=0AWhen I try the command lvm -a -o =
+devices -P , I receive Locking type 1=0D=0Ainitialisation failed=2E If I u=
se the --ignorelockingfailure, I receive : =0D=0A=0D=0A=0D=0A    =0D=0ACan =
you tell me how I can solve this problem ?=0D=0A =0D=0AThanks a lot for you=
r help=2E=0D=0ARegards=2E=0D=0APierre=2E=0D=0A=0D=0A=0D=0A=0D=0A=0D=0A-----=
------------------------------------=0D=0AVisit our website! http://www=2En=
bb=2Ebe=0D=0A=0D=0A"DISCLAIMER: The content of this e-mail message should n=
ot be=0Aconstrued as binding on the part of the National Bank of Belgium=0A=
(NBB) unless otherwise and previously stated=2E The opinions=0Aexpressed in=
 this message are solely those of the author and do not=0Anecessarily refle=
ct NBB viewpoints, particularly when the content=0Aof this message, or part=
 thereof, is private by nature or does not=0Afall within the professional s=
cope of its author=2E"
------_=_NextPart_001_01C7F607.A3B22348
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3=2E2//EN">=0D=0A<HTML>=0D=0A<HEAD>=
=0D=0A<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dus-=
ascii">=0D=0A<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version=
 6=2E5=2E7233=2E69">=0D=0A<TITLE></TITLE>=0D=0A</HEAD>=0D=0A<BODY>=0D=0A<!-=
- Converted from text/rtf format -->=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIF=
Y><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">HI all,</FONT></SPAN><=
/P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=
=3D2 FACE=3D"Arial">I'm testing LVM on a redhat EL 5 with the following con=
figuration : </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SP=
AN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; * one FSC Primergy s=
erver with one dual port Qlogic HBA</FONT></SPAN><SPAN LANG=3D"en-gb"> <FON=
T SIZE=3D2 FACE=3D"Arial">2462 </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR A=
LIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; * =
each Qlogic port is connected to a SA</FONT></SPAN><SPAN LANG=3D"en-gb"><FO=
NT SIZE=3D2 FACE=3D"Arial">N</FONT></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=
=3D2 FACE=3D"Arial">(dual fabric)&nbsp; </FONT></SPAN></P>=0D=0A=0D=0A<P DI=
R=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">=
&nbsp; * use of device mapper</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALI=
GN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; * us=
e of LVM to define a mirror disk on two IBM ESS&nbsp; 2105 disks</FONT></SP=
AN><SPAN LANG=3D"en-gb"> </SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIF=
Y><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Everything was fine an=
</FONT></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">d</FONT></=
SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> worked</FONT></SPA=
N><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">=2E I have created the=
 lvm with</FONT></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 FACE=3D"Arial">=
:</FONT></SPAN><SPAN LANG=3D"en-gb"></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SP=
AN LANG=3D"en-gb"></SPAN><SPAN LANG=3D"nl"></SPAN><SPAN LANG=3D"en-gb"></SP=
AN></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"nl"></SPAN><SPAN LANG=3D"en">=
<FONT SIZE=3D2 FACE=3D"Courier New">root@linprd11 by-id]# lvcreate -L 10G -=
m1 -n mirror1vg1&nbsp; </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LAN=
G=3D"en"><FONT SIZE=3D2 FACE=3D"Courier New">vg1 /dev/mapper/1IBM_2105_4163=
0194 /dev/mapper/1IBM_2105_41630317 </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3D=
LTR><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Courier New">/dev/mapper/1IBM_=
2105_41F30194</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en"><=
FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;Logical volume &quot;mirror1vg1&qu=
ot; created</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN=
 LANG=3D"nl"></SPAN><SPAN LANG=3D"en-gb"></SPAN><SPAN LANG=3D"en"></SPAN></=
P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"></SPAN><SPA=
N LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial">Sync between the two mirrors wa=
s ok :</FONT></SPAN><SPAN LANG=3D"en-gb"></SPAN><SPAN LANG=3D"en"> </SPAN><=
/P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"></SPAN><SP=
AN LANG=3D"en"></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en-gb"></S=
PAN><SPAN LANG=3D"nl"></SPAN><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Couri=
er New">[root@linprd11 by-id]# lvs</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLT=
R><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;LV&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp; Attr&nbsp;&nbsp; LSize=
&nbsp; Origin Snap%&nbsp; Move Log&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Copy%</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=
=3DLTR><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Courier New">&nbsp;mirror1v=
g1 vg1&nbsp; mwi-a- 10=2E00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mirror1=
vg1_mlog 100=2E00</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY=
><SPAN LANG=3D"nl"></SPAN><SPAN LANG=3D"en-gb"></SPAN><SPAN LANG=3D"en"></S=
PAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en"><FONT SI=
ZE=3D2 FACE=3D"Arial">Then, I suppress access</FONT></SPAN><SPAN LANG=3D"en=
-gb"></SPAN><SPAN LANG=3D"en"> <FONT SIZE=3D2 FACE=3D"Arial">to one image o=
f the mirror and reboot the Linux server=2E</FONT></SPAN><SPAN LANG=3D"en-g=
b"></SPAN><SPAN LANG=3D"en"> <FONT SIZE=3D2 FACE=3D"Arial">The boot</FONT><=
/SPAN><SPAN LANG=3D"en-gb"></SPAN><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"=
Arial"> failed</FONT></SPAN><SPAN LANG=3D"en-gb"></SPAN><SPAN LANG=3D"en"><=
FONT SIZE=3D2 FACE=3D"Arial"> and g</FONT></SPAN><SPAN LANG=3D"en-gb"></SPA=
N><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial">ive</FONT></SPAN><SPAN LA=
NG=3D"en-gb"></SPAN><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial"> the fo=
llowing</FONT></SPAN><SPAN LANG=3D"en-gb"></SPAN><SPAN LANG=3D"en"> <FONT S=
IZE=3D2 FACE=3D"Arial">error message</FONT></SPAN><SPAN LANG=3D"en-gb"></SP=
AN><SPAN LANG=3D"en"> <FONT SIZE=3D2 FACE=3D"Arial">:</FONT></SPAN></P>=0D=
=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=
=3D"Arial">&nbsp;&nbsp;&nbsp; * An error occurred during the file system ch=
eck=2E Dropping you to a shell - Give root password for maintenance : </FON=
T></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb">=
<FONT SIZE=3D2 FACE=3D"Arial">When I try the command lvm</FONT></SPAN><SPAN=
 LANG=3D"en-gb"> <FONT SIZE=3D2 FACE=3D"Arial">-a -o +devices -P , I receiv=
e Locking type 1 initialisation failed=2E</FONT></SPAN><SPAN LANG=3D"en-gb"=
> <FONT SIZE=3D2 FACE=3D"Arial">If I use the</FONT></SPAN><SPAN LANG=3D"en-=
gb"><B></B></SPAN><B><SPAN LANG=3D"en"> <FONT SIZE=3D2 FACE=3D"Arial">--ign=
orelockingfailure</FONT></SPAN></B><SPAN LANG=3D"en-gb"><B></B></SPAN><B><S=
PAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial">, I receive : </FONT></SPAN><=
/B></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"></SPAN=
></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SI=
ZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;</FONT></SPAN><SPAN LANG=3D"en-gb">=
 </SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><=
FONT SIZE=3D2 FACE=3D"Arial">Can you tell me how I can solve this problem ?=
</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en=
-gb"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;</FONT></SPAN></P>=0D=0A=0D=0A<P D=
IR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"=
>Thanks a lot for your help=2E</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR AL=
IGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Regards=2E=
</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en=
-gb"><FONT SIZE=3D2 FACE=3D"Arial">Pierre=2E</FONT></SPAN></P>=0D=0A=0D=0A<=
P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"></SPAN></P>=0D=0A=0D=0A</B=
ODY>=0D=0A</HTML>=0D=0A<HTML><BODY><P><hr size=3D1></P>=0D=0A<P><STRONG>=0D=
=0AVisit our website! http://www=2Enbb=2Ebe=0D=0A=0D=0A"DISCLAIMER: The con=
tent of this e-mail message should not be construed as binding on the part =
of the National Bank of Belgium (NBB) unless otherwise and previously state=
d=2E The opinions expressed in this message are solely those of the author =
and do not necessarily reflect NBB viewpoints, particularly when the conten=
t of this message, or part thereof, is private by nature or does not fall w=
ithin the professional scope of its author=2E"=0D=0A</STRONG></P></BODY></H=
TML>
------_=_NextPart_001_01C7F607.A3B22348--
