Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C31A06.ACD9E856"
Message-ID: <37885B2630DF0C4CA95EFB47B30985FB020EBD2E@exchange-1.umflint.edu>
From: "Lauro, John" <jlauro@umflint.edu>
Subject: [linux-lvm] snapshot with bigmem broken
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
Date: Thu May 15 07:33:17 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C31A06.ACD9E856
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

=20

I did more testing, and it appears that snapshots in LVM will not work
with either 4GB or or 64GB support enabled in the kernel under 2.4.20.
This includes both LVM 1.0.7 or the latest LVM2. =20

=20

Is there anyone using LVM snapshots with 64GB RAM support (or even 4GB
RAM support, as snapshots would be good for at least our medium size
servers if not our large ones)?  Is so, let me know the kernel version
and LVM version you are using so that I can try it.

=20

PS: As mentioned previously, everything else in LVM seems to be ok
with larger kernel memory models.  It's mainly just snapshots that
appear to be broken using the latest LVMs and kernel.

=20


------_=_NextPart_001_01C31A06.ACD9E856
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

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
	{font-family:Arial;
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I did more testing, and it appears that snapshots in =
LVM
will not work with either 4GB or or 64GB support enabled in the kernel =
under
2.4.20.&nbsp; This includes both LVM 1.0.7 or the latest LVM2.&nbsp; =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Is there anyone using LVM snapshots with 64GB RAM =
support
(or even 4GB RAM support, as snapshots would be good for at least our =
medium
size servers if not our large ones)?&nbsp; Is so, let me know the kernel
version and LVM version you are using so that I can try =
it.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PS: As mentioned previously, everything else in LVM =
seems to
be ok with larger kernel memory models.&nbsp; It&#8217;s mainly just =
snapshots
that appear to be broken using the latest LVMs and =
kernel.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C31A06.ACD9E856--
