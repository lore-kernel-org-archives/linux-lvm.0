Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5T2cDRG012468
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 22:38:14 -0400
Received: from drakesmith.net (drakesmith.net [64.62.223.80])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l5T2cCo2020675
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 22:38:12 -0400
Received: from PaulXP ([71.164.137.136]) by drakesmith.net for
	<linux-lvm@redhat.com>; Thu, 28 Jun 2007 19:38:11 -0700
From: "WarlockD" <warlockd@drakesmith.net>
References: <001201c7b9a3$4f0da2d0$ed28e870$@net> <46842D81.8090501@vdberg.org>
In-Reply-To: <46842D81.8090501@vdberg.org>
Subject: RE: [linux-lvm] Serious problem and I don't know where to turn.
Date: Thu, 28 Jun 2007 21:38:22 -0500
Message-ID: <001601c7b9f6$8ff21990$afd64cb0$@net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01C7B9CC.A71C1190"
Content-Language: en-us
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a multipart message in MIME format.

------=_NextPart_000_0017_01C7B9CC.A71C1190
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

AH, well for the first issue it was because I had the iScsi portal's
incorrect.  So it was doing two separate connections under my two Ethernet
cards instead of a single bonded connection, that issue is fixed.

 

The two ACTIVE lvm's are the boot drive.  This is a default Centros install
so it sets the drive up like that.  Here is a better out

 

 

[root@server ~]# lvscan -a

  ACTIVE            '/dev/VolGroup00/LogVol00' [147.00 GB] inherit

  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit

[root@server ~]# vgscan

  Reading all physical volumes.  This may take a while...

  Found volume group "VolGroup00" using metadata type lvm2

  Found volume group "ANIME" using metadata type lvm2

 

Basicly, I have a volume called "ANIME-logical" I am trying to restore, but
I don't have the metadata.  Is there a way I can get to it?

 

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Richard van den Berg
Sent: Thursday, June 28, 2007 4:52 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Serious problem and I don't know where to turn.

 

WarlockD wrote: 

[root@server archive]# vgscan 

  Reading all physical volumes.  This may take a while...

  Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1 not
/dev/sda1


How did this happen? Why is the PV magic number on /dev/sdb1 exactly the
same as on /dev/sda1?




[root@server archive]# lvscan

  Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1 not
/dev/sda1

  ACTIVE            '/dev/VolGroup00/LogVol00' [147.00 GB] inherit

  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit

[root@server archive]#


I looks like your lvs are up. Can't you just mount them?

Sincerely,



Richard van den Berg

------=_NextPart_000_0017_01C7B9CC.A71C1190
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
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

<body bgcolor=3Dwhite lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>AH, well for the =
first issue it
was because I had the iScsi portal&#8217;s incorrect.&nbsp; So it was =
doing two
separate connections under my two Ethernet cards instead of a single =
bonded
connection, that issue is fixed.<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>The two ACTIVE =
lvm&#8217;s are
the boot drive.&nbsp; This is a default Centros install so it sets the =
drive up
like that.&nbsp; Here is a better out<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>[root@server ~]# =
lvscan -a<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol00' [147.00 GB] inherit<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol01' [1.94 GB] inherit<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>[root@server ~]# =
vgscan<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>&nbsp; Reading all =
physical
volumes.&nbsp; This may take a while...<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>&nbsp; Found volume =
group
&quot;VolGroup00&quot; using metadata type lvm2<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>&nbsp; Found volume =
group
&quot;ANIME&quot; using metadata type lvm2<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>Basicly, I have a =
volume called &#8220;ANIME-logical&#8221;
I am trying to restore, but I don&#8217;t have the metadata.&nbsp; Is =
there a
way I can get to it?<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<div>

<div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt =
0in 0in 0in'>

<p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif";
color:windowtext'>From:</span></b><span =
style=3D'font-size:10.0pt;font-family:
"Tahoma","sans-serif";color:windowtext'> linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com] <b>On Behalf Of </b>Richard van =
den Berg<br>
<b>Sent:</b> Thursday, June 28, 2007 4:52 PM<br>
<b>To:</b> LVM general discussion and development<br>
<b>Subject:</b> Re: [linux-lvm] Serious problem and I don't know where =
to turn.<o:p></o:p></span></p>

</div>

</div>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>WarlockD wrote: <o:p></o:p></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'>[root@server
archive]# vgscan <o:p></o:p></span></p>

<p class=3DMsoNormal>&nbsp; Reading all physical volumes.&nbsp; This may =
take a while...<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Found duplicate PV =
5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb:
using /dev/sdb1 not /dev/sda1<o:p></o:p></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'><br>
How did this happen? Why is the PV magic number on /dev/sdb1 exactly the =
same
as on /dev/sda1?<br>
<br>
<br>
<o:p></o:p></span></p>

<p class=3DMsoNormal>[root@server archive]# lvscan<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Found duplicate PV =
5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb:
using /dev/sdb1 not /dev/sda1<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol00' [147.00 GB] inherit<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol01' [1.94 GB] inherit<o:p></o:p></p>

<p class=3DMsoNormal>[root@server archive]#<o:p></o:p></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'><br>
I looks like your lvs are up. Can't you just mount them?<br>
<br>
Sincerely,<br>
<br>
<o:p></o:p></span></p>

<pre>Richard van den Berg<o:p></o:p></pre></div>

</body>

</html>

------=_NextPart_000_0017_01C7B9CC.A71C1190--
