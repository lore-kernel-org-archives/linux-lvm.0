Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BIM4cZ013896
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 14:22:04 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BILnng027285
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 14:21:50 -0400
From: "Riches Jr, RobertX M" <robertx.m.riches.jr@intel.com>
Date: Mon, 11 Oct 2010 11:21:47 -0700
Message-ID: <4BD43A85686FC34D819098DB1C3999D9B0C5CE17@orsmsx502.amr.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4BD43A85686FC34D819098DB1C3999D9B0C5CE17orsmsx502amrcor_"
MIME-Version: 1.0
Subject: [linux-lvm] vgcreate fails with return value 5
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

--_000_4BD43A85686FC34D819098DB1C3999D9B0C5CE17orsmsx502amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm running into an odd problem in which vgcreate fails with a return value=
 or exit code of 5.  It is called from a script that calls pvcreate twice t=
o create two PVs, then immediately calls vgcreate to create the VG.

An exit code of 5 appears to indicate excessive numbers of VGs.  However, t=
here are no other VGs on the system prior to this call to vgcreate.  Search=
 engine results indicate the PV might be corrupt.  However, the PV was just=
 created a few milliseconds before calling vgcreate.

When calling vgcreate immediately after calling pvcreate, is there a need t=
o wait for some after-effects of the pvcreate to settle out?  Is there some=
 command to positively determine whether the PV is actually ready and open =
for business?

Any other suggestions?

Thank you,

Robert Riches
Azad Consultant at Intel



--_000_4BD43A85686FC34D819098DB1C3999D9B0C5CE17orsmsx502amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dus-ascii"=
>
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
font-family:Arial'>I&#8217;m running into an odd problem in which vgcreate
fails with a return value or exit code of 5.&nbsp; It is called from a scri=
pt that calls
pvcreate twice to create two PVs, then immediately calls vgcreate to create=
 the
VG.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>An exit code of 5 appears to indicate excessive numbers =
of
VGs.&nbsp; However, there are no other VGs on the system prior to this call=
 to
vgcreate.&nbsp; Search engine results indicate the PV might be corrupt.&nbs=
p; However,
the PV was just created a few milliseconds before calling vgcreate.<o:p></o=
:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>When calling vgcreate immediately after calling pvcreate=
, is
there a need to wait for some after-effects of the pvcreate to settle out?&=
nbsp; Is
there some command to positively determine whether the PV is actually ready=
 and
open for business?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size:1=
0.0pt;
font-family:Arial'>Any other suggestions?<o:p></o:p></span></font></p>

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

--_000_4BD43A85686FC34D819098DB1C3999D9B0C5CE17orsmsx502amrcor_--
