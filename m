Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BJQtDc024535
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 15:26:55 -0400
Received: from sccrmhc15.comcast.net (sccrmhc15.comcast.net [63.240.77.85])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BJQtZn003073
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 15:26:55 -0400
From: "Greg Hartzog" <glhartzog@comcast.net>
Subject: RE: [linux-lvm] LVM2 on hardware RAID
Date: Fri, 11 Aug 2006 15:26:44 -0400
Message-ID: <000e01c6bd7c$14ef4fa0$640a0a0a@laptopoptimus>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000F_01C6BD5A.8DDDAFA0"
In-Reply-To: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7C@exchange2k.lims.com>
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

This is a multi-part message in MIME format.

------=_NextPart_000_000F_01C6BD5A.8DDDAFA0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I believe you will do the following:

 

"pvresive /dev/sdb"

 

That will make the volume group now be 600GB.

 

Then use "lvextend" to enlarge the logical volumes, and whatever the proper
tool is to extend the EXT3 filesystem.

 

Best to have the logical volumes & volume group offline ("vgchange -a n")
before starting resizing.

 

Just my $0.02.

 

  _____  

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Musil, William
Sent: Friday, August 11, 2006 12:49 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM2 on hardware RAID

 

Hello all. 

I have an issue, that I am not sure how to address. 

How can I resize the physical volume if I change the geometry of the disk
(non-destructive resize of RAID volume at the hardware level) 

I can see that the OS has picked up the new size of the disk and I would
like to resize the existing pv. I don't know how.

I started with a hardware raid 5 (400GB), linux automatically recognizes
disk as /dev/sdb 

a simplistic representation of the setup is as follows 

pvcreate /dev/sdb 
vgcreate VolGroup10 /dev/sdb 
lvcreate -n LogVol10 VolGroup10 
mkfs.ext3 /dev/mapper/VolGroup10-LogVol10 

I have added a disk and expand the array to 600GB I can still see every
thing but I don't know how to extend the PV. 

filesystems OK 
logical volumes OK 
volume groups OK 

linux sees /dev/sdb as 600GB 
pvs shows pv /dev/sdb is 400GB. I wish to, non-destructively, reinitialize
/dev/sdb so that pvs shows 600GB. how? 

 

William T. Musil 
Manager, Technical Services 

LabVantage Solutions, Inc. 
1160 US Highway 22 East, Bridgewater, NJ 08807 
p| 908.333.0111 
f | 908.707.1179 
e| wmusil@labvantage.com 
i | www.labvantage.com 

The information in this e-mail is confidential and may contain legally
privileged information. It is intended solely for the person or entity to
which it is addressed. Access to this e-mail by anyone else is unauthorized.
If you are not the intended recipient, any disclosure, copying,
distribution, action taken, or action omitted to be taken in reliance on it,
is prohibited and may be unlawful. If you received this e-mail in error,
please contact the sender and delete the material from any computer.

<<Musil, William.vcf>> 


------=_NextPart_000_000F_01C6BD5A.8DDDAFA0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<title>LVM2 on hardware RAID</title>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PostalCode"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"State"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"Street"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"address"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PersonName"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'>I believe you will do the =
following:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'>&#8220;pvresive =
/dev/sdb&#8221;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'>That will make the volume group now =
be
600GB.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'>Then use &#8220;lvextend&#8221; to =
enlarge
the logical volumes, and whatever the proper tool is to extend the EXT3
filesystem.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'>Best to have the logical volumes =
&amp;
volume group offline (&#8220;vgchange &#8211;a n&#8221;) before starting
resizing.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'>Just my =
$0.02.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<b><span
style=3D'font-weight:bold'>On Behalf Of </span></b>Musil, William<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Friday, August 11, =
2006
12:49 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> <st1:PersonName =
w:st=3D"on">linux-lvm@redhat.com</st1:PersonName><br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> [linux-lvm] LVM2 =
on
hardware RAID</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Hello
all.</span></font> <o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I
have an issue, that I am not sure how to address.</span></font> =
<o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>How
can I resize the physical volume if I change the geometry of the disk
(non-destructive resize of RAID volume at the hardware level) =
</span></font><o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I
can see that the OS has picked up the new size of the disk and I would =
like to
resize the existing pv. I don't know how.</span></font><o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I
started with a hardware raid 5 (400GB), linux automatically recognizes =
disk as
/dev/sdb</span></font> <o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>a
simplistic representation of the setup is as follows</span></font> =
<o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvcreate
/dev/sdb</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>vgcreate
VolGroup10 /dev/sdb</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>lvcreate
-n LogVol10 VolGroup10</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>mkfs.ext3
/dev/mapper/VolGroup10-LogVol10</span></font> <o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I
have added a disk and expand the array to 600GB I can still see every =
thing but
I don't know how to extend the PV.</span></font> <o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>filesystems
OK</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>logical
volumes OK</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>volume
groups OK</span></font> <o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>linux
sees /dev/sdb as 600GB</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvs
shows pv /dev/sdb is 400GB. I wish to, non-destructively, reinitialize =
/dev/sdb
so that pvs shows 600GB. how?</span></font> <o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p><b><font size=3D3 color=3Dblack face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial;color:black;font-weight:bold'>William T. =
Musil</span></font></b>
<br>
<font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;font-family:
Arial;color:black'>Manager, Technical Services</span></font> =
<o:p></o:p></p>

<p><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black'>LabVantage Solutions, Inc.</span></font> =
<br>
<st1:Street w:st=3D"on"><st1:address w:st=3D"on"><font size=3D2 =
color=3Dblack
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>1160
  US Highway</span></font></st1:address></st1:Street><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'> 22
East, <st1:place w:st=3D"on"><st1:City =
w:st=3D"on">Bridgewater</st1:City>, <st1:State
 w:st=3D"on">NJ</st1:State> <st1:PostalCode =
w:st=3D"on">08807</st1:PostalCode></st1:place></span></font>
<br>
<b><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black;font-weight:bold'>p|</span></font></b><font=

size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:black'> 908.333.0111</span></font> <br>
<b><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black;font-weight:bold'>f =
|</span></font></b><font
size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:black'> 908.707.1179 </span></font><br>
<b><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black;font-weight:bold'>e|</span></font></b><u> =
</u><u><font
size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:blue'>wmusil@labvantage.com</span></font></u> <br>
<b><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black;font-weight:bold'>i =
|</span></font></b><font
size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:black'> www.labvantage.com</span></font> <o:p></o:p></p>

<p><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:7.5pt;font-family:
Arial;color:black'>The information in this e-mail is confidential and =
may
contain legally privileged information. It is intended solely for the =
person or
entity to which it is addressed. Access to this e-mail by anyone else is
unauthorized. If you are not the intended recipient, any disclosure, =
copying,
distribution, action taken, or action omitted to be taken in reliance on =
it, is
prohibited and may be unlawful. If you received this e-mail in error, =
please
contact the sender and delete the material from any =
computer.</span></font><o:p></o:p></p>

<p><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black'>&lt;&lt;Musil, William.vcf&gt;&gt; =
</span></font><o:p></o:p></p>

</div>

</body>

</html>

------=_NextPart_000_000F_01C6BD5A.8DDDAFA0--
