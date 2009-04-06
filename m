Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n36MkIo2022393
	for <linux-lvm@redhat.com>; Mon, 6 Apr 2009 18:46:18 -0400
Received: from n8.bullet.re3.yahoo.com (n8.bullet.re3.yahoo.com
	[68.142.237.93])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n36MjtR1018316
	for <linux-lvm@redhat.com>; Mon, 6 Apr 2009 18:45:55 -0400
From: "Theophanis Kontogiannis" <theophanis_kontogiannis@yahoo.gr>
Date: Tue, 7 Apr 2009 01:45:48 +0300
Message-ID: <004b01c9b709$6f1b7970$4d526c50$@gr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004C_01C9B722.9468B170"
Content-Language: el
Subject: [linux-lvm] Why the problem with LVcreate with a specific name?
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

This is a multipart message in MIME format.

------=_NextPart_000_004C_01C9B722.9468B170
Content-Type: text/plain;
	charset="iso-8859-7"
Content-Transfer-Encoding: 7bit

Hello all,

 

I have CentOS 5.3 with:

 

lvm2-2.02.40-6.el5

system-config-lvm-1.1.5-1.0.el5

lvm2-cluster-2.02.40-7.el5

 

I try to create a new full disk clustered LV

 

When I do [root@tweety-1 /]# lvcreate -v -L 931.48G -n data2 vg1

    Setting logging type to disk

    Finding volume group "vg1"

  Rounding up size to full physical extent 931.48 GB

    Archiving volume group "vg1" metadata (seqno 21).

    Creating logical volume data2

    Creating volume group backup "/etc/lvm/backup/vg1" (seqno 22).

    Clearing start of logical volume "data2"

    Creating volume group backup "/etc/lvm/backup/vg1" (seqno 22).

  Logical volume "data2" created

[root@tweety-1 /]# lvdisplay

  --- Logical volume ---

  LV Name                /dev/vg1/data2

  VG Name                vg1

  LV UUID                xA0oky-7VaD-P8a3-8aAC-2jGy-R9Ij-1L3bvR

  LV Write Access        read/write

  LV Status              available

  # open                 0

  LV Size                931.48 GB

  Current LE             238459

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto

  - currently set to     256

  Block device           253:2

 

It gets created succefully.

 

When I run the same command but with data1 instead of data2, I get the
following error:

 

[root@tweety-1 /]# lvcreate -v -L 931.48G -n data1 vg1

    Setting logging type to disk

    Finding volume group "vg1"

  Rounding up size to full physical extent 931.48 GB

    Archiving volume group "vg1" metadata (seqno 23).

    Creating logical volume data1

    Creating volume group backup "/etc/lvm/backup/vg1" (seqno 24).

  Error locking on node tweety1: device-mapper: create ioctl failed: Device
or resource busy

  Aborting. Failed to activate new LV to wipe the start of it.

    Creating volume group backup "/etc/lvm/backup/vg1" (seqno 25).

 

Could you help me find out what is blocking data1 as a valid name?

 

I am lost and I do not know where to start from.

 

Thank you all for your time.

 

Theophanis Kontogiannis.

 


------=_NextPart_000_004C_01C9B722.9468B170
Content-Type: text/html;
	charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:p=3D"urn:schemas-microsoft-com:office:powerpoint" =
xmlns:a=3D"urn:schemas-microsoft-com:office:access" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
xmlns:s=3D"uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" =
xmlns:rs=3D"urn:schemas-microsoft-com:rowset" xmlns:z=3D"#RowsetSchema" =
xmlns:b=3D"urn:schemas-microsoft-com:office:publisher" =
xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadsheet" =
xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" =
xmlns:odc=3D"urn:schemas-microsoft-com:office:odc" =
xmlns:oa=3D"urn:schemas-microsoft-com:office:activation" =
xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:D=3D"DAV:" =
xmlns:mt=3D"http://schemas.microsoft.com/sharepoint/soap/meetings/" =
xmlns:x2=3D"http://schemas.microsoft.com/office/excel/2003/xml" =
xmlns:ois=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" =
xmlns:dir=3D"http://schemas.microsoft.com/sharepoint/soap/directory/" =
xmlns:ds=3D"http://www.w3.org/2000/09/xmldsig#" =
xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint/dsp" =
xmlns:udc=3D"http://schemas.microsoft.com/data/udc" =
xmlns:xsd=3D"http://www.w3.org/2001/XMLSchema" =
xmlns:sub=3D"http://schemas.microsoft.com/sharepoint/soap/2002/1/alerts/"=
 xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#" =
xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" =
xmlns:sps=3D"http://schemas.microsoft.com/sharepoint/soap/" =
xmlns:xsi=3D"http://www.w3.org/2001/XMLSchema-instance" =
xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/soap" =
xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" =
xmlns:udcp2p=3D"http://schemas.microsoft.com/data/udc/parttopart" =
xmlns:wf=3D"http://schemas.microsoft.com/sharepoint/soap/workflow/" =
xmlns:dsss=3D"http://schemas.microsoft.com/office/2006/digsig-setup" =
xmlns:dssi=3D"http://schemas.microsoft.com/office/2006/digsig" =
xmlns:mdssi=3D"http://schemas.openxmlformats.org/package/2006/digital-sig=
nature" =
xmlns:mver=3D"http://schemas.openxmlformats.org/markup-compatibility/2006=
" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns:mrels=3D"http://schemas.openxmlformats.org/package/2006/relationshi=
ps" xmlns:spwp=3D"http://microsoft.com/sharepoint/webpartpages" =
xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/2006/types"=
 =
xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/2006/messag=
es" =
xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/SlideLibrary/=
" =
xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortalServer/Pub=
lishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" =
xmlns:st=3D"&#1;" xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-7">


<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
..MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DEL link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><span lang=3DEN-US>Hello all,<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I have CentOS 5.3 =
with:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>lvm2-2.02.40-6.el5<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>system-config-lvm-1.1.5-1.0.el5<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>lvm2-cluster-2.02.40-7.el5<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I try to create a new full disk =
clustered LV<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>When I do [root@tweety-1 /]# =
lvcreate -v -L
931.48G -n data2 vg1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Setting logging type =
to disk<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Finding volume group =
&quot;vg1&quot;<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Rounding up size to full =
physical extent
931.48 GB<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Archiving volume group =
&quot;vg1&quot;
metadata (seqno 21).<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Creating logical =
volume data2<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Creating volume group =
backup
&quot;/etc/lvm/backup/vg1&quot; (seqno 22).<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Clearing start of =
logical volume
&quot;data2&quot;<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Creating volume group =
backup
&quot;/etc/lvm/backup/vg1&quot; (seqno 22).<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Logical volume =
&quot;data2&quot; created<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>[root@tweety-1 /]# =
lvdisplay<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 --- Logical volume =
---<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 LV =
Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/dev/vg1/data2<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 VG =
Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
vg1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 LV =
UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
xA0oky-7VaD-P8a3-8aAC-2jGy-R9Ij-1L3bvR<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 LV Write =
Access=A0=A0=A0=A0=A0=A0=A0 read/write<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 LV =
Status=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
available<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 # =
open=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 LV =
Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 931.48 =
GB<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Current =
LE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 238459<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 =
Segments=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 =
Allocation=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
inherit<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Read ahead =
sectors=A0=A0=A0=A0 auto<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0- currently set =
to=A0=A0=A0=A0 256<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Block =
device=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 253:2<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>It gets created =
succefully.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>When I run the same command but =
with data1
instead of data2, I get the following error:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>[root@tweety-1 /]# lvcreate -v =
-L 931.48G
-n data1 vg1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Setting logging type =
to disk<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Finding volume group =
&quot;vg1&quot;<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Rounding up size to full =
physical extent
931.48 GB<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Archiving volume group =
&quot;vg1&quot;
metadata (seqno 23).<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Creating logical =
volume data1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Creating volume group =
backup
&quot;/etc/lvm/backup/vg1&quot; (seqno 24).<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Error locking on node =
tweety1:
device-mapper: create ioctl failed: Device or resource =
busy<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0 Aborting. Failed to activate =
new LV to
wipe the start of it.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>=A0=A0=A0 Creating volume group =
backup
&quot;/etc/lvm/backup/vg1&quot; (seqno 25).<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Could you help me find out what =
is blocking
data1 as a valid name?<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I am lost and I do not know =
where to start
from.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Thank you all for your =
time.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Theophanis =
Kontogiannis.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

</body>

</html>

------=_NextPart_000_004C_01C9B722.9468B170--
