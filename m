Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o81GwWXH005310
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 12:58:32 -0400
Received: from ExchIPMX1.lsuhsc.edu (exchipmx1.lsuhsc.edu [155.58.210.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o81GwLug026398
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 12:58:22 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CB49F6.C35D9EFD"
Date: Wed, 1 Sep 2010 11:57:25 -0500
Message-ID: <2E9263050F8EE046972BE0510E7A71DA062D2F52@SH-EXCHBE2.master.lsuhsc.edu>
From: "Patterson, James" <JPatte@lsuhsc.edu>
Subject: [linux-lvm] HDD  failure - please help!
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01CB49F6.C35D9EFD
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings.

=20

I am more of a general user than a guru, so please be gentle...I'll do
my best to describe the issue here.

=20

I have a system running FC11 with five HDDs, ~2 TB of space, all in a
logical volume. It was my presumption that the LVM system functioned
sort of like a raid system (I know you can run striped, for instance).
Everything has been running fine, up until last Monday - I noticed that
I couldn't write to my samba drive (on the machine in question) - it was
read only.

=20

I thought: "Hmm". Whatever...I rebooted the system, but walked away
(busy) so didn't watch the reboot process. Came back and did use the
shared samba drive later - but later Tuesday, it went read-only again.=20

=20

OK, so I started looking around, and it appeared that I had a disk
failure from checking dmesg. Indeed, I could not access anything to
write - it was read only even for root  - because SElinux said
so...locked up. So...I rebooted again.

=20

One of the five drives refused to come up - and made a rather ominous
clicking noise - would not initialize. The system would not boot at all.
Would get thru BIOS, pass the ATA card, and then stop.=20

=20

I pulled the drive out that was bad, dl'd and burned a boot CD-ROM,
booted off of that, and tried to do a restore.

=20

I got an error message: "Error processing LVM.  There is inconsistent
LVM data on logical volume _____________.  You can reinitialize all
related PVs ___ which will erase the LVM metadata, or ignore which will
preserve the contents."

=20

I tried ignore first, and it then stated that there were no partitions
to mount (or something - I didn't write this one down).

I rebooted, mounted read-only this time ( I didn't want to erase any
metadata) and tried re-initialize - got the same error message again.

=20

I am at a loss as to what to do - I'm thinking that there must be a way
to recover the data on the remaining four drives. Surely this LVM system
is not going to cause me to lose the data on all five drives because one
of them failed?

=20

I would greatly appreciate any help you could give me - I've search
quite a bit and can't seem to fine much in relation to this. It seems
like it would be something that had been addressed...somewhere.

=20

Kind regards,

James

=20

=20

=20


------_=_NextPart_001_01CB49F6.C35D9EFD
Content-Type: text/html;
	charset="us-ascii"
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
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" =
xmlns:rtc=3D"http://microsoft.com/officenet/conferencing" =
xmlns:D=3D"DAV:" xmlns:Repl=3D"http://schemas.microsoft.com/repl/" =
xmlns:mt=3D"http://schemas.microsoft.com/sharepoint/soap/meetings/" =
xmlns:x2=3D"http://schemas.microsoft.com/office/excel/2003/xml" =
xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" =
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
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Book Antiqua";
	panose-1:2 4 6 2 5 3 5 3 3 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
	font-family:"Book Antiqua","serif";
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DWordSection1>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>Greetings.<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
am more of a general user than a guru, so please be =
gentle&#8230;I&#8217;ll do
my best to describe the issue here.<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
have a system running FC11 with five HDDs, ~2 TB of space, all in a =
logical
volume. It was my presumption that the LVM system functioned sort of =
like a
raid system (I know you can run striped, for instance). Everything has =
been running
fine, up until last Monday &#8211; I noticed that I couldn&#8217;t write =
to my
samba drive (on the machine in question) &#8211; it was read =
only.<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
thought: &#8220;Hmm&#8221;. Whatever&#8230;I rebooted the system, but =
walked
away (busy) so didn&#8217;t watch the reboot process. Came back and did =
use the
shared samba drive later &#8211; but later Tuesday, it went read-only =
again. <o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>OK,
so I started looking around, and it appeared that I had a disk failure =
from
checking dmesg. Indeed, I could not access anything to write &#8211; it =
was
read only even for root&nbsp; - because SElinux said so&#8230;locked up. =
So&#8230;I
rebooted again.<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>One
of the five drives refused to come up &#8211; and made a rather ominous
clicking noise &#8211; would not initialize. The system would not boot =
at all.
Would get thru BIOS, pass the ATA card, and then stop. =
<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
pulled the drive out that was bad, dl&#8217;d and burned a boot CD-ROM, =
booted
off of that, and tried to do a restore.<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
got an error message: &#8220;Error processing LVM.&nbsp; There is =
inconsistent
LVM data on logical volume _____________.&nbsp; You can reinitialize all
related PVs ___ which will erase the LVM metadata, or ignore which will
preserve the contents.&#8221;<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
tried ignore first, and it then stated that there were no partitions to =
mount
(or something &#8211; I didn&#8217;t write this one =
down).<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
rebooted, mounted read-only this time ( I didn&#8217;t want to erase any
metadata) and tried re-initialize &#8211; got the same error message =
again.<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
am at a loss as to what to do &#8211; I&#8217;m thinking that there must =
be a
way to recover the data on the remaining four drives. Surely this LVM =
system is
not going to cause me to lose the data on all five drives because one of =
them
failed?<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>I
would greatly appreciate any help you could give me &#8211; I&#8217;ve =
search
quite a bit and can&#8217;t seem to fine much in relation to this. It =
seems
like it would be something that had been =
addressed&#8230;somewhere.<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>Kind
regards,<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>James<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Book =
Antiqua","serif"'>&nbsp;<o:p></o:p></span></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>

------_=_NextPart_001_01CB49F6.C35D9EFD--
