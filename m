Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m65JUNbv022470
	for <linux-lvm@redhat.com>; Sat, 5 Jul 2008 15:30:23 -0400
Received: from n6.bullet.mud.yahoo.com (n6.bullet.mud.yahoo.com
	[216.252.100.57])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m65JU3k3023208
	for <linux-lvm@redhat.com>; Sat, 5 Jul 2008 15:30:03 -0400
From: "Theophanis Kontogiannis" <theophanis_kontogiannis@yahoo.gr>
Date: Sat, 5 Jul 2008 22:26:42 +0300
Message-ID: <01dc01c8ded5$102acd60$30806820$@gr>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_01DD_01C8DEEE.35780560"
Content-Language: el
Subject: [linux-lvm] Issue with clvmd - Is it really bug??
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

------=_NextPart_000_01DD_01C8DEEE.35780560
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_01DE_01C8DEEE.35780560"


------=_NextPart_001_01DE_01C8DEEE.35780560
Content-Type: text/plain;
	charset="iso-8859-7"
Content-Transfer-Encoding: 7bit

Hello all

 

I just found out about this LVM mailing list, so I am posting this also here
(already posted in linux-cluster).

 

Hello,

 

I have a 2 node cluster at home with CentOS 5 running on 64bit AMDx2 with
DRBD 

 

2.6.18-92.1.6.el5.centos.plus

drbd82-8.2.6-1.el5.centos

lvm2-2.02.32-4.el5

lvm2-cluster-2.02.32-4.el5

system-config-lvm-1.1.3-2.0.el5

 

I do not know if my problem is directly related to
http://kbase.redhat.com/faq/FAQ_51_10471.shtm and
https://bugzilla.redhat.com/show_bug.cgi?id=138396

 

I do:

 

pvcreate --metadatacopies 2 /dev/drbd0 /dev/drbd1

vgcreate -v vg0 -c y /dev/drbd0 /dev/drbd1

lvcreate -v -L 348G -n data0 vg0

 

Then I reboot.

The LV never becomes available.

 

If I try 

 

vgchange -a y

 

I get 

 

  Error locking on node tweety-1: Volume group for uuid not found:
7Z9ra5zee3ZK7pNpfsblvtMOWXhgkZVEiJrzRQshaaiN5JKtJtkPDkQWfFXYKVVa

  0 logical volume(s) in volume group "vg0" now active

 

If I do 

 

clvmd -R 

 

Then with 

 

vgchange -a y vg0.

 

the LV becomes available.

 

Is this really related to the above mentioned bug?

 

How can I make the LV become available during boot up without any
intervention?

 

Thank you all for your time,

 

Theophanis Kontogiannis

 

 

 

 

 


------=_NextPart_001_01DE_01C8DEEE.35780560
Content-Type: text/html;
	charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-7">


<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
..MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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

<p class=3DMsoNormal><span lang=3DEN-US style=3D'color:#1F497D'>Hello =
all<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US style=3D'color:#1F497D'>I just =
found out
about this LVM mailing list, so I am posting this also here (already =
posted in
linux-cluster).<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Hello,<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I have a 2 node cluster at home =
with CentOS
5 running on 64bit AMDx2 with DRBD <o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>2.6.18-92.1.6.el5.centos.plus<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>drbd82-8.2.6-1.el5.centos<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>lvm2-2.02.32-4.el5<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>lvm2-cluster-2.02.32-4.el5<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
lang=3DEN-US>system-config-lvm-1.1.3-2.0.el5<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I do not know if my problem is =
directly related
to <a =
href=3D"http://kbase.redhat.com/faq/FAQ_51_10471.shtm">http://kbase.redha=
t.com/faq/FAQ_51_10471.shtm</a>
and <a =
href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D138396">https://bug=
zilla.redhat.com/show_bug.cgi?id=3D138396</a><o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I do:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><span =
lang=3DEN-US>pvcreate
--metadatacopies 2 /dev/drbd0 /dev/drbd1<o:p></o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><span =
lang=3DEN-US>vgcreate -v vg0
-c y /dev/drbd0 /dev/drbd1<o:p></o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><span =
lang=3DEN-US>lvcreate -v -L
348G -n data0 vg0<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Then I =
reboot.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>The LV never becomes =
available.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>If I try <o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><span =
lang=3DEN-US>vgchange -a y<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I get <o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><span =
lang=3DEN-US>&nbsp; Error
locking on node tweety-1: Volume group for uuid not found:
7Z9ra5zee3ZK7pNpfsblvtMOWXhgkZVEiJrzRQshaaiN5JKtJtkPDkQWfFXYKVVa<o:p></o:=
p></span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><span =
lang=3DEN-US>&nbsp; 0 logical
volume(s) in volume group &quot;vg0&quot; now =
active<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>If I do <o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><span =
lang=3DEN-US>clvmd &#8211;R <o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Then with <o:p></o:p></span></p>

<p class=3DMsoNormal style=3D'text-indent:36.0pt'><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal style=3D'text-indent:36.0pt'><span =
lang=3DEN-US>vgchange
&#8211;a y vg0.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>the LV becomes =
available.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Is this really related to the =
above mentioned
bug?<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>How can I make the LV become =
available
during boot up without any intervention?<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Thank you all for your =
time,<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Theophanis =
Kontogiannis<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

</body>

</html>

------=_NextPart_001_01DE_01C8DEEE.35780560--

------=_NextPart_000_01DD_01C8DEEE.35780560
Content-Type: text/plain;
	name="ATT00468.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ATT00468.txt"

--
Linux-cluster mailing list
Linux-cluster@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cluster
------=_NextPart_000_01DD_01C8DEEE.35780560--
