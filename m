Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1CEuXUG018916
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 09:56:33 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o1CEuHru026604
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 09:56:17 -0500
From: "Harald Heigl" <Harald_Heigl@gmx.at>
Date: Fri, 12 Feb 2010 15:56:11 +0100
Message-ID: <001501caabf3$85080b60$8f182220$@at>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0016_01CAABFB.E6CC7360"
Content-Language: de-at
Subject: [linux-lvm] What happens with full snapshots
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

Dies ist eine mehrteilige Nachricht im MIME-Format.

------=_NextPart_000_0016_01CAABFB.E6CC7360
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I'm relatively new to lvm, I'm using Fedora for almost 3 years, but up to
now I just set up lvm on install, formatted my ext3/ext4 and it just works.

Now I want to go somehow deeper playing around with snapshots.

 

I know you should size your snapshot volume to a size that can hold all the
changes. As I see a snap lv only contains the "original" datachunks and the
original lv is in a normal state as if there were no snapshot. 

 

My questions:

1.       What happens if the snap gets full (e.g. someone copies large data
from one lv to a snapshotted lv or something other you didn't expect), some
sites say it original and snapshot gets deactivated, some sites say the snap
lv gets invalidated. What does this mean? Is my original volume just crap
afterwards or can I work on as usual (with the difference that nothing is
written on the snap anymore), or just need to remove the snap ..

2.       What happens if there is a problem with a snap? I've heard on
reboot the snapshots are lost. What if there is a power shortage, so the
snap is lost, you boot and the original lv just seeks for the snap? Are
there implications on this. Can you just mount such a original lv or do you
have to remove the (non existent) snap lv before (How can you remove a
snapshot that doesn't exist anymore)

 

That would be nice to know before I use snaps.

Thanks in advance,

Harald (Harry) Heigl

 


------=_NextPart_000_0016_01CAABFB.E6CC7360
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 @list l0
	{mso-list-id:146284432;
	mso-list-type:hybrid;
	mso-list-template-ids:1136702374 201785359 201785369 201785371 =
201785359 201785369 201785371 201785359 201785369 201785371;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DDE-AT link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><span lang=3DEN-US>Hello,<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I&#8217;m relatively new to lvm, =
I&#8217;m using
Fedora for almost 3 years, but up to now I just set up lvm on install,
formatted my ext3/ext4 and it just works.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Now I want to go somehow deeper =
playing
around with snapshots.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>I know you should size your =
snapshot volume
to a size that can hold all the changes. As I see a snap lv only =
contains the &#8220;original&#8221;
datachunks and the original lv is in a normal state as if there were no
snapshot. <o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>My =
questions:<o:p></o:p></span></p>

<p class=3DMsoListParagraph style=3D'text-indent:-18.0pt;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
lang=3DEN-US><span style=3D'mso-list:Ignore'>1.<span style=3D'font:7.0pt =
"Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3DEN-US>What happens if the =
snap gets
full (e.g. someone copies large data from one lv to a snapshotted lv or
something other you didn&#8217;t expect), some sites say it original and
snapshot gets deactivated, some sites say the snap lv gets invalidated. =
What
does this mean? Is my original volume just crap afterwards or can I work =
on as usual
(with the difference that nothing is written on the snap anymore), or =
just need
to remove the snap &#8230;.<o:p></o:p></span></p>

<p class=3DMsoListParagraph style=3D'text-indent:-18.0pt;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
lang=3DEN-US><span style=3D'mso-list:Ignore'>2.<span style=3D'font:7.0pt =
"Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3DEN-US>What happens if there =
is a
problem with a snap? I&#8217;ve heard on reboot the snapshots are lost. =
What if
there is a power shortage, so the snap is lost, you boot and the =
original lv
just seeks for the snap? Are there implications on this. Can you just =
mount
such a original lv or do you have to remove the (non existent) snap lv =
before
(How can you remove a snapshot that doesn&#8217;t exist =
anymore)<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>That would be nice to know =
before I use
snaps.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Thanks in =
advance,<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Harald (Harry) =
Heigl<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

</body>

</html>

------=_NextPart_000_0016_01CAABFB.E6CC7360--
