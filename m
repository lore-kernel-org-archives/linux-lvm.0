Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o74FcXK2008456
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2010 11:38:33 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o74FcLOl019133
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2010 11:38:21 -0400
From: "Riches Jr, RobertX M" <robertx.m.riches.jr@intel.com>
Date: Wed, 4 Aug 2010 08:38:19 -0700
Message-ID: <4BD43A85686FC34D819098DB1C3999D9A6BB7E8E@orsmsx502.amr.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4BD43A85686FC34D819098DB1C3999D9A6BB7E8Eorsmsx502amrcor_"
MIME-Version: 1.0
Subject: [linux-lvm] build for i386, no rule to make target libdevmapper.
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
To: "Linux-Lvm, mailing list send-to address (linux-lvm@redhat.com)" <linux-lvm@redhat.com>

--_000_4BD43A85686FC34D819098DB1C3999D9A6BB7E8Eorsmsx502amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

(New list member...first posting.  I Googled for an answer but did not find=
 anything that appeared relevant.)

I'm running into a problem while trying to build an i386 version of LVM2 ve=
rsion 2.02.72:

        No rule to make target `../libdm/libdevmapper.', needed by `dmsetup=
'.

I'm running on a 64-bit SuSE machine.  Building without any options works f=
ine.  However, I need to force LVM2 to build for i386 for an embedded envir=
onment.  When I add the -build=3Di386 option to the ./configure command, al=
ong with the -with-cluster=3Dinternal option that becomes required, I get t=
he above error message.  A check for libdm/libdevmapper. and friends shows =
a bunch of broken symlinks.

Any suggestions?

Thank you,

Robert Riches
Azad Consultant at Intel



--_000_4BD43A85686FC34D819098DB1C3999D9A6BB7E8Eorsmsx502amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>(New list member&#8230;first posting.&nbsp; I Googled fo=
r an
answer but did not find anything that appeared relevant.)<o:p></o:p></span>=
</font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>I&#8217;m running into a problem while trying to build a=
n
i386 version of LVM2 version 2.02.72:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No rule to ma=
ke
target `../libdm/libdevmapper.&#8217;, needed by `dmsetup&#8217;.<o:p></o:p=
></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>I&#8217;m running on a 64-bit SuSE machine.&nbsp; Buildi=
ng
without any options works fine.&nbsp; However, I need to force LVM2 to buil=
d
for i386 for an embedded environment.&nbsp; When I add the &#8211;build=3Di=
386
option to the ./configure command, along with the &#8211;with-cluster=3Dint=
ernal
option that becomes required, I get the above error message.&nbsp; A check =
for
libdm/libdevmapper. and friends shows a bunch of broken symlinks.<o:p></o:p=
></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>Any suggestions?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>Thank you,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>Robert Riches</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>Azad Consultant at Intel</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span style=3D=
'font-size:
12.0pt'>&nbsp;</span><o:p></o:p></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span style=3D=
'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

--_000_4BD43A85686FC34D819098DB1C3999D9A6BB7E8Eorsmsx502amrcor_--
