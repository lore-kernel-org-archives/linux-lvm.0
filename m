Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5TLdxdj026777
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 17:39:59 -0400
Received: from drakesmith.net (drakesmith.net [64.62.223.80])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l5TLduej030101
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 17:39:56 -0400
Received: from PaulXP ([71.164.137.136]) by drakesmith.net for
	<linux-lvm@redhat.com>; Fri, 29 Jun 2007 14:39:54 -0700
From: "WarlockD" <warlockd@drakesmith.net>
References: <001201c7b9a3$4f0da2d0$ed28e870$@net>
	<46842D81.8090501@vdberg.org>	<001601c7b9f6$8ff21990$afd64cb0$@net>
	<4684A547.8080302@vdberg.org>
In-Reply-To: <4684A547.8080302@vdberg.org>
Subject: RE: [linux-lvm] Serious problem and I don't know where to turn.
Date: Fri, 29 Jun 2007 16:40:07 -0500
Message-ID: <004601c7ba96$10484160$30d8c420$@net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0047_01C7BA6C.27723960"
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

------=_NextPart_000_0047_01C7BA6C.27723960
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The good news is the logical drive came up.  I just recreated the =
logical drive exactly as it was and its even detected, with a missing =
superblock, as an ext3 partition. The bad news is that e2fsck still =
froze on me.  I can=E2=80=99t tell if it=E2=80=99s the iSCSI driver that =
is doing it (The logical drive comes up as =E2=80=9Cbusy=E2=80=9D when I =
try to access it after killing e2fsck) or something with lvm2 as =
doubtful as that is.

=20

I picked up some hard drives and put it in my old raid card for a RAID0, =
and doing a dd if=3D/dev/ANIME/testlv of=3D/dev/sdc1.  If this works, =
and e2fsck works, then I got my data back, yea!

=20

Now what to do with it:P

=20

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
On Behalf Of Richard van den Berg
Sent: Friday, June 29, 2007 1:23 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Serious problem and I don't know where to turn.

=20

WarlockD wrote:



[root@server ~]# lvscan -a

  ACTIVE            '/dev/VolGroup00/LogVol00' [147.00 GB] inherit

  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit

[root@server ~]# vgscan

  Reading all physical volumes.  This may take a while...

  Found volume group "VolGroup00" using metadata type lvm2

  Found volume group "ANIME" using metadata type lvm2


So the vg "ANIME" is found, but is not activated? That kind of makes =
sense because it is missing the pv on the deleted /dev/sdb2 partition. =
According to the vgreduce man pages you can:

vgreduce --removemissing ANIME

to remove all  missing physical volumes from the volume group and make =
the volume group consistent again. It's a good idea to run this option =
with --test  first to find out what it would remove before running it =
for real. There is also "--partial" option you can use to activate vgs =
and lvs even if they are missing data. Read the man pages and be very =
careful before you proceed.




Basicly, I have a volume called =E2=80=9CANIME-logical=E2=80=9D I am =
trying to restore, but I don=E2=80=99t have the metadata.  Is there a =
way I can get to it?


Without the metadata that's going to be tough. If the filesystem is all =
continuous on your RAID5 partition, technically you should be able to =
mount it if you can create a device pointing at the right start, and =
with the right size. Good luck figuring that out.

Another approach could be to recreate the /dev/sdb2 partition in exactly =
the same way you did before. The metadata might still be there, and the =
vg might come up.

Sincerely,

Richard van den Berg


------=_NextPart_000_0047_01C7BA6C.27723960
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8">
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
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle21
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

<p class=3DMsoNormal><span style=3D'color:#1F497D'>The good news is the =
logical
drive came up.=C2=A0 I just recreated the logical drive exactly as it =
was and its
even detected, with a missing superblock, as an ext3 partition. The bad =
news is
that e2fsck still froze on me.=C2=A0 I can=E2=80=99t tell if =
it=E2=80=99s the iSCSI driver that is
doing it (The logical drive comes up as =E2=80=9Cbusy=E2=80=9D when I =
try to access it after
killing e2fsck) or something with lvm2 as doubtful as that =
is.<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>I picked up some hard =
drives and
put it in my old raid card for a RAID0, and doing a dd =
if=3D/dev/ANIME/testlv
of=3D/dev/sdc1.=C2=A0 If this works, and e2fsck works, then I got my =
data back, yea!<o:p></o:p></span></p>

<p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>Now what to do with =
it:P<o:p></o:p></span></p>

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
<b>Sent:</b> Friday, June 29, 2007 1:23 AM<br>
<b>To:</b> LVM general discussion and development<br>
<b>Subject:</b> Re: [linux-lvm] Serious problem and I don't know where =
to turn.<o:p></o:p></span></p>

</div>

</div>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>WarlockD wrote:<br>
<br>
<o:p></o:p></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style=3D'color:#1F497D'>[root@server ~]# lvscan -a</span><o:p></o:p></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style=3D'color:#1F497D'>&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol00' [147.00 GB] inherit</span><o:p></o:p></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style=3D'color:#1F497D'>&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol01' [1.94 GB] inherit</span><o:p></o:p></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style=3D'color:#1F497D'>[root@server ~]# vgscan</span><o:p></o:p></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style=3D'color:#1F497D'>&nbsp; Reading all physical volumes.&nbsp; This =
may take
a while...</span><o:p></o:p></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style=3D'color:#1F497D'>&nbsp; Found volume group &quot;VolGroup00&quot; =
using
metadata type lvm2</span><o:p></o:p></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>&nbsp; Found volume =
group
&quot;ANIME&quot; using metadata type lvm2</span><o:p></o:p></p>

<p class=3DMsoNormal><br>
So the vg &quot;ANIME&quot; is found, but is not activated? That kind of =
makes
sense because it is missing the pv on the deleted /dev/sdb2 partition.
According to the vgreduce man pages you can:<br>
<br>
vgreduce --removemissing ANIME<br>
<br>
to remove all&nbsp; missing physical volumes from the volume group and =
make the
volume group consistent again. It's a good idea to run this option with
--test&nbsp; first to find out what it would remove before running it =
for real.
There is also &quot;--partial&quot; option you can use to activate vgs =
and lvs
even if they are missing data. Read the man pages and be very careful =
before
you proceed.<br>
<br>
<br>
<o:p></o:p></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>Basicly, I have a =
volume called
=E2=80=9CANIME-logical=E2=80=9D I am trying to restore, but I =
don=E2=80=99t have the metadata.&nbsp; Is
there a way I can get to it?</span><o:p></o:p></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'><br>
Without the metadata that's going to be tough. If the filesystem is all
continuous on your RAID5 partition, technically you should be able to =
mount it
if you can create a device pointing at the right start, and with the =
right
size. Good luck figuring that out.<br>
<br>
Another approach could be to recreate the /dev/sdb2 partition in exactly =
the
same way you did before. The metadata might still be there, and the vg =
might
come up.<br>
<br>
Sincerely,<br>
<br>
Richard van den Berg<o:p></o:p></span></p>

</div>

</body>

</html>

------=_NextPart_000_0047_01C7BA6C.27723960--
