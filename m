Message-ID: <5F2C72E5CC01D511BE3D0008C75B9AD8039A2D91@RDGEXH03>
From: Jon Lacey <Jon.Lacey@exprogroup.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2CC2B.DBA26BF0"
Subject: [linux-lvm] Help configuring LVM
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
Date: Wed Feb  5 12:05:01 2003
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2CC2B.DBA26BF0
Content-Type: text/plain

Hi, I have looked at the HOWTO's and FAQ's and cannot seem to solve my
problem, maybe it's me.

 

I do not seem, while installing Slackware 8, to be able to build LVM into
the install, so I was hoping to be able to do a minimal install and then add
a logical volume and move me data.

 

I have installed Slackware (a very basic setup) as:

/dev/hda1 100 MB mounted as /boot

/dev/hda2 200 MB as Swap

/dev/hda3 800MB mounted as /

 

I have three more drives, all 1 GIG drives. /dev/hdb1 /dev/hdc1 /dev/hdd1 

What I would like to do is to amalgamate them all into one large volume,
include /dev/hda3 as part of the volume and have it all mounted as /

 

So I hope to end up with a volume group, say vg1, consisting of a single
volume, say vol1, copy data over from /dev/hda3 and then mount vol1 as /

 

Is there anywhere I can go to see an example of doing this/ or can someone
help.

 

 

Thanks

Jon L.


----------------------------------------------------------------------
Important Notice: 
The information in this email is confidential and may be legally-privileged.  
If you have reason to believe you are not the intended recipient, any disclosure, 
copying, distribution or any action taken or omitted to be taken in reliance on 
it is prohibited and may be unlawful and you are requested to contact the sender 
urgently and dispose of this email 
-----------------------------------------------------------exp.

------_=_NextPart_001_01C2CC2B.DBA26BF0
Content-Type: text/html

<html>

<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">


<meta name=Generator content="Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:Tahoma;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{font-family:Tahoma;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 42.55pt 72.0pt 42.55pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=EN-US link=blue vlink=purple>

<div class=Section1>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>Hi, I have looked at the HOWTO's and FAQ's and cannot seem
to solve my problem, maybe it's me.</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>I do not seem, while installing Slackware 8, to be able to build LVM
into the install, so I was hoping to be able to do a minimal install and then
add a logical volume and move me data.</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>I have installed Slackware (a very basic setup) as:</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>/dev/hda1 100 MB mounted as /boot</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>/dev/hda2 200 MB as Swap</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>/dev/hda3 800MB mounted as /</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>I have three more drives, all 1 GIG drives. /dev/hdb1 /dev/hdc1
/dev/hdd1 </span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>What I would like to do is to amalgamate them all into one large volume,
include /dev/hda3 as part of the volume and have it all mounted as /</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>So I hope to end up with a volume group, say vg1, consisting of a single
volume, say vol1, copy data over from /dev/hda3 and then mount vol1 as /</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>Is there anywhere I can go to see an example of doing this/ or can
someone help.</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>Thanks</span></font></p>

<p class=MsoNormal><font size=2 face=Tahoma><span lang=EN-GB style='font-size:
10.0pt'>Jon L.</span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C2CC2B.DBA26BF0--

 
