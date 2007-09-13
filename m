Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8DDJ0vT022263
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 09:19:00 -0400
Received: from nbb.be (webmaip4.nbb.be [193.53.58.184])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8DDIuZD026213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 13 Sep 2007 09:18:57 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 13 Sep 2007 15:18:25 +0200
Message-ID: <96DBEA7143ECD048905FAAA27D86E0D205BDA981@VSRBEX10.LANPRD.NBB>
From: "Dony Pierre" <Pierre.Dony@nbb.be>
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C7F608.912482BA"
Subject: [linux-lvm] LVM locking type 1 error
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


------_=_NextPart_001_01C7F608.912482BA
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
se the --ignorelockingfailure, I receive : =0D=0APartial mode=2E Incomplete=
 volume groups will be activated read-only=2E=0D=0ACouldn't find device wit=
h uuid 'HWrd2X-ZeJO-dKoL=2E=2E=2E=2E=2E=2E=2E'=0D=0A=0D=0A   =0D=0ACan you =
tell me how I can solve this problem ?=0D=0AWhy is the volume group activat=
ed in read-only ?=0D=0AWhy Linux does not continue his boot with only one i=
mage of the mirror ?=0D=0A =0D=0AThanks a lot for your help=2E=0D=0ARegards=
=2E=0D=0APierre=2E=0D=0A=0D=0A=0D=0A=0D=0A---------------------------------=
--------=0D=0AVisit our website! http://www=2Enbb=2Ebe=0D=0A=0D=0A"DISCLAIM=
ER: The content of this e-mail message should not be=0Aconstrued as binding=
 on the part of the National Bank of Belgium=0A(NBB) unless otherwise and p=
reviously stated=2E The opinions=0Aexpressed in this message are solely tho=
se of the author and do not=0Anecessarily reflect NBB viewpoints, particula=
rly when the content=0Aof this message, or part thereof, is private by natu=
re or does not=0Afall within the professional scope of its author=2E"
------_=_NextPart_001_01C7F608.912482BA
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3=2E2//EN">=0D=0A<HTML>=0D=0A<HEAD>=
=0D=0A<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dus-=
ascii">=0D=0A<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version=
 6=2E5=2E7233=2E69">=0D=0A<TITLE>LVM locking type 1 error</TITLE>=0D=0A</HE=
AD>=0D=0A<BODY>=0D=0A<!-- Converted from text/rtf format -->=0D=0A=0D=0A<P =
DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial=
">HI all,</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN L=
ANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">I'm testing LVM on a redhat EL =
5 with the following configuration : </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=
=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&=
nbsp; * one FSC Primergy server with one dual port Qlogic HBA 2462 </FONT><=
/SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FO=
NT SIZE=3D2 FACE=3D"Arial">&nbsp; * each Qlogic port is connected to a SAN =
(dual fabric)&nbsp; </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUST=
IFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; * use of devi=
ce mapper</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN L=
ANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; * use of LVM to define a=
 mirror disk on two IBM ESS&nbsp; 2105 disks </FONT></SPAN></P>=0D=0A=0D=0A=
<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Ar=
ial">Everything was fine and worked=2E I have created the lvm with :</FONT>=
</SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en-gb"></SPAN><SPAN LANG=
=3D"nl"></SPAN><SPAN LANG=3D"en-gb"></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SP=
AN LANG=3D"nl"></SPAN><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Courier New"=
>root@linprd11 by-id]# lvcreate -L 10G -m1 -n mirror1vg1&nbsp; </FONT></SPA=
N></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Cou=
rier New">vg1 /dev/mapper/1IBM_2105_41630194 /dev/mapper/1IBM_2105_41630317=
 </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en"><FONT SIZE=3D=
2 FACE=3D"Courier New">/dev/mapper/1IBM_2105_41F30194</FONT></SPAN></P>=0D=
=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Courier New"=
>&nbsp;Logical volume &quot;mirror1vg1&quot; created</FONT></SPAN></P>=0D=
=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"nl"></SPAN><SPAN LANG=
=3D"en-gb"></SPAN><SPAN LANG=3D"en"></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALI=
GN=3DJUSTIFY><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial">Sync between t=
he two mirrors was ok : </FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR><SPAN LA=
NG=3D"en-gb"></SPAN><SPAN LANG=3D"nl"></SPAN><SPAN LANG=3D"en"><FONT SIZE=
=3D2 FACE=3D"Courier New">[root@linprd11 by-id]# lvs</FONT></SPAN></P>=0D=
=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Courier New"=
>&nbsp;LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp; At=
tr&nbsp;&nbsp; LSize&nbsp; Origin Snap%&nbsp; Move Log&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Copy%</FONT></SPAN></P>=
=0D=0A=0D=0A<P DIR=3DLTR><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Courier N=
ew">&nbsp;mirror1vg1 vg1&nbsp; mwi-a- 10=2E00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mirror1vg1_mlog 100=2E00</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DL=
TR ALIGN=3DJUSTIFY><SPAN LANG=3D"nl"></SPAN><SPAN LANG=3D"en-gb"></SPAN><SP=
AN LANG=3D"en"></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LA=
NG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial">Then, I suppress access to one imag=
e of the mirror and reboot the Linux server=2E The boot failed and give the=
 following error message :</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=
=3DJUSTIFY><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbs=
p; * An error occurred during the file system check=2E Dropping you to a sh=
ell - Give root password for maintenance : </FONT></SPAN></P>=0D=0A=0D=0A<P=
 DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Aria=
l">When I try the command lvm -a -o +devices -P , I receive Locking type 1 =
initialisation failed=2E If I use the</FONT></SPAN><SPAN LANG=3D"en-gb"><B>=
</B></SPAN><B><SPAN LANG=3D"en"> <FONT SIZE=3D2 FACE=3D"Arial">--ignorelock=
ingfailure, I receive : </FONT></SPAN></B></P>=0D=0A=0D=0A<P DIR=3DLTR ALIG=
N=3DJUSTIFY><B><SPAN LANG=3D"en"><FONT SIZE=3D2 FACE=3D"Arial">Partial mode=
=2E Incomplete volume groups will be activated read-only=2E</FONT></SPAN></=
B></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><B><SPAN LANG=3D"en"><FONT S=
IZE=3D2 FACE=3D"Arial">Couldn't find device with uuid 'HWrd2X-ZeJO-dKoL=2E=
=2E=2E=2E=2E=2E=2E'</FONT></SPAN></B></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJ=
USTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; </FO=
NT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"=
><FONT SIZE=3D2 FACE=3D"Arial">Can you tell me how I can solve this problem=
 ?</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"=
en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Why is the volume group activated in r=
ead-only ?</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Why Linux does not continue hi=
s boot with only one image of the mirror ?</FONT></SPAN></P>=0D=0A=0D=0A<P =
DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial=
">&nbsp;</FONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LA=
NG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Thanks a lot for your help=2E</F=
ONT></SPAN></P>=0D=0A=0D=0A<P DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb=
"><FONT SIZE=3D2 FACE=3D"Arial">Regards=2E</FONT></SPAN></P>=0D=0A=0D=0A<P =
DIR=3DLTR ALIGN=3DJUSTIFY><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial=
">Pierre=2E</FONT></SPAN></P>=0D=0A=0D=0A</BODY>=0D=0A</HTML>=0D=0A<HTML><B=
ODY><P><hr size=3D1></P>=0D=0A<P><STRONG>=0D=0AVisit our website! http://ww=
w=2Enbb=2Ebe=0D=0A=0D=0A"DISCLAIMER: The content of this e-mail message sho=
uld not be construed as binding on the part of the National Bank of Belgium=
 (NBB) unless otherwise and previously stated=2E The opinions expressed in =
this message are solely those of the author and do not necessarily reflect =
NBB viewpoints, particularly when the content of this message, or part ther=
eof, is private by nature or does not fall within the professional scope of=
 its author=2E"=0D=0A</STRONG></P></BODY></HTML>
------_=_NextPart_001_01C7F608.912482BA--
