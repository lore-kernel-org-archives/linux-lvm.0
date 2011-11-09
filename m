Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA906a3p011739
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 19:06:36 -0500
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA906Zh6017500
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 19:06:35 -0500
From: "Riches Jr, Robert M" <robert.m.riches.jr@intel.com>
Date: Wed, 9 Nov 2011 00:06:32 +0000
Message-ID: <3D44B3DCE57399449CC1391C2AD6EC4C16EA8D76@ORSMSX101.amr.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3D44B3DCE57399449CC1391C2AD6EC4C16EA8D76ORSMSX101amrcor_"
MIME-Version: 1.0
Subject: [linux-lvm] cLVM commands often taking a long time to execute
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_3D44B3DCE57399449CC1391C2AD6EC4C16EA8D76ORSMSX101amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm running into some odd behavior from clustered LVM commands on a 3-node =
pacemaker-based cluster.  When other processes on the nodes are doing somew=
hat heavy sequential I/O traffic, LVM commands such as lvs, pvs, vgs, lvdis=
play, pvdisplay, and vgdisplay have widely variable, often very long execut=
ion times.  The same LVM command done repetitively will have execution time=
s varying from less than a second to 10-15 seconds, more rarely up to aroun=
d 60 seconds.  Other read-heavy commands such as find, wc, and sum have muc=
h less variability and much shorter tails in the distribution of their exec=
ution times.

Is it known what causes the cLVM commands to be so slow at times?

Perchance, are there known ways to get cLVM commands to be less slow?

Or, is this just par for the course for clustered LVM?

Thanks,

Robert Riches


--_000_3D44B3DCE57399449CC1391C2AD6EC4C16EA8D76ORSMSX101amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I&#8217;m running into some odd behavior from cluste=
red LVM commands on a 3-node pacemaker-based cluster.&nbsp; When other proc=
esses on the nodes are doing somewhat heavy sequential I/O traffic, LVM com=
mands such as lvs, pvs, vgs, lvdisplay, pvdisplay,
 and vgdisplay have widely variable, often very long execution times.&nbsp;=
 The same LVM command done repetitively will have execution times varying f=
rom less than a second to 10-15 seconds, more rarely up to around 60 second=
s.&nbsp; Other read-heavy commands such as
 find, wc, and sum have much less variability and much shorter tails in the=
 distribution of their execution times.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it known what causes the cLVM commands to be so s=
low at times?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Perchance, are there known ways to get cLVM commands=
 to be less slow?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Or, is this just par for the course for clustered LV=
M?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Robert Riches<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3D44B3DCE57399449CC1391C2AD6EC4C16EA8D76ORSMSX101amrcor_--
