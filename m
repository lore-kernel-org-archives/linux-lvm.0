Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k421RHXq013767
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 21:27:17 -0400
Received: from rwcrmhc12.comcast.net (rwcrmhc12.comcast.net [216.148.227.152])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k421R9MN002722
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 21:27:09 -0400
From: "Greg Hartzog" <glhartzog@comcast.net>
Subject: RE: [linux-lvm] Cloning Logical Volumes
Date: Mon, 1 May 2006 21:26:22 -0400
Message-ID: <002101c66d87$6c554d20$640a0a0a@laptopoptimus>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0022_01C66D65.E543AD20"
In-Reply-To: <7.0.1.0.0.20060501165213.07a4ce50@nersc.gov>
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

------=_NextPart_000_0022_01C66D65.E543AD20
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I appreciate the suggestion about using MD driver.

=20

However, I have already built MD devices which are hosting the volume =
groups
and logical volumes.

=20

I am not aware of being able to using the MD driver with MD devices as
opposed to non MD devices (mirroring a mirror rather then mirroring =
straight
disk partitions).

=20

Does any know if this is possible?

=20

Thanks!

=20

  _____ =20

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
On
Behalf Of Jed Donnelley
Sent: Monday, May 01, 2006 8:05 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Cloning Logical Volumes

=20

At 03:21 PM 4/27/2006, Jonathan E Brassow wrote:



dd is probably the best way right now.=20

in the future, the clone would probably take the form:=20
prompt> lvconvert -m1 vg/lv; (wait for sync); lvsplit vg/lv=20

The syntax isn't worked out yet and lvsplit is not there yet... but we =
have
talked about doing something like that.=20

brassow=20


One possibility that occurs to me is to use RAID-1 under LVM and then =
clone
your LVM file system(s)
by splitting a software RAID-1 clone (e.g. MD driver).  Even if you =
don't
want to pay the price of redundant
disks in your final system configuration, you can leave it with a single =
1/2
RAID set with no loss of reliability
(over no RAID).  You can even do the RAID-1ing on a single disk if that =
has
any potential value, but it's a bit
more difficult for me to see how you would separate the clone out that =
way.

Just a thought.  I use such RAID-1 cloning quite often and find it very
convenient.  It seems to me it
would work fine in this case.  About the only thing I find I have to be
careful of is to be sure that if
I'm cloning the /boot (or /root if it includes /boot) file system that I
make sure the boot record is in
place (in my case running grub and writing the appropriate record on the
appropriate disk before
splitting the RAID system for cloning).

I still don't trust LVM for recovering munged file systems (no effective
mechanism for fsck if you
can't get to the LVM file system, init problems for RAID-10, etc. as
mentioned previously on
this list) so I'm not using LVM at this time and haven't tested the =
above
mechanism.  You're
mileage may vary.




On Apr 26, 2006, at 5:55 PM, Greg Hartzog wrote:=20




Hello there folks.  I have a question.=20
 =20
I am looking for a better way of cloning logical volumes then creating a =
new
logical volume, identical to a source logical volume, and using =13dd=14 =
to copy
data between the two logical volumes.=20
 =20
I would love to use dm-mirror to do this, but I do not think any =
interface
has been provided to do this yet.=20
 =20
All suggestions and ideas appreciated.=20
 =20
I am running lvm2-2.02.04-r1 & 2.6.15 kernel.=20
 =20
Thanks!=20

--Jed http://www.nersc.gov/~jed/


------=_NextPart_000_0022_01C66D65.E543AD20
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
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
	{color:blue;
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
	color:blue;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'>I appreciate the suggestion about =
using MD
driver.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'>However, I have already built MD =
devices
which are hosting the volume groups and logical =
volumes.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'>I am not aware of being able to =
using the
MD driver with MD devices as opposed to non MD devices (mirroring a =
mirror
rather then mirroring straight disk =
partitions).<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'>Does any know if this is =
possible?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'>Thanks!<o:p></o:p></span></font></p>=


<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:blue'><o:p>&nbsp;</o:p></span></font></p>

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
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'> =
linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com] <b><span =
style=3D'font-weight:bold'>On
Behalf Of </span></b>Jed Donnelley<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Monday, May 01, =
2006 8:05 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> LVM general =
discussion and
development<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: [linux-lvm] =
Cloning
Logical Volumes</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>At 03:21 PM 4/27/2006, Jonathan E Brassow wrote:<br>
<br>
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>dd is probably the best way right now. <br>
<br>
in the future, the clone would probably take the form: <br>
prompt&gt; lvconvert -m1 vg/lv; (wait for sync); lvsplit vg/lv <br>
<br>
The syntax isn't worked out yet and lvsplit is not there yet... but we =
have
talked about doing something like that. <br>
<br>
brassow <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><br>
One possibility that occurs to me is to use RAID-1 under LVM and then =
clone
your LVM file system(s)<br>
by splitting a software RAID-1 clone (e.g. MD driver).&nbsp; Even if you =
don't
want to pay the price of redundant<br>
disks in your final system configuration, you can leave it with a single =
1/2
RAID set with no loss of reliability<br>
(over no RAID).&nbsp; You can even do the RAID-1ing on a single disk if =
that
has any potential value, but it's a bit<br>
more difficult for me to see how you would separate the clone out that =
way.<br>
<br>
Just a thought.&nbsp; I use such RAID-1 cloning quite often and find it =
very convenient.&nbsp;
It seems to me it<br>
would work fine in this case.&nbsp; About the only thing I find I have =
to be
careful of is to be sure that if<br>
I'm cloning the /boot (or /root if it includes /boot) file system that I =
make
sure the boot record is in<br>
place (in my case running grub and writing the appropriate record on the
appropriate disk before<br>
splitting the RAID system for cloning).<br>
<br>
I still don't trust LVM for recovering munged file systems (no effective
mechanism for fsck if you<br>
can't get to the LVM file system, init problems for RAID-10, etc. as =
mentioned
previously on<br>
this list) so I'm not using LVM at this time and haven't tested the =
above
mechanism.&nbsp; You're<br>
mileage may vary.<br>
<br>
<br>
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>On Apr 26, 2006, at 5:55 PM, Greg Hartzog wrote: <br>
<br>
<br>
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D5 face=3D"Times New Roman"><span =
style=3D'font-size:
18.0pt'>Hello there folks.&nbsp; I have a question.</span></font> <br>
<font size=3D5><span style=3D'font-size:18.0pt'>&nbsp;</span></font> =
<br>
<font size=3D5><span style=3D'font-size:18.0pt'>I am looking for a =
better way of
cloning logical volumes then creating a new logical volume, identical to =
a
source logical volume, and using &#19;dd&#20; to copy data between the =
two
logical volumes.</span></font> <br>
<font size=3D5><span style=3D'font-size:18.0pt'>&nbsp;</span></font> =
<br>
<font size=3D5><span style=3D'font-size:18.0pt'>I would love to use =
dm-mirror to do
this, but I do not think any interface has been provided to do this =
yet.</span></font>
<br>
<font size=3D5><span style=3D'font-size:18.0pt'>&nbsp;</span></font> =
<br>
<font size=3D5><span style=3D'font-size:18.0pt'>All suggestions and =
ideas
appreciated.</span></font> <br>
<font size=3D5><span style=3D'font-size:18.0pt'>&nbsp;</span></font> =
<br>
<font size=3D5><span style=3D'font-size:18.0pt'>I am running =
lvm2-2.02.04-r1 &amp;
2.6.15 kernel.</span></font> <br>
<font size=3D5><span style=3D'font-size:18.0pt'>&nbsp;</span></font> =
<br>
<font size=3D5><span style=3D'font-size:18.0pt'>Thanks!</span></font> =
<o:p></o:p></p>

<p></x-sigsep><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'><x-sigsep>--Jed
<a href=3D"http://www.nersc.gov/~jed/" =
eudora=3Dautourl>http://www.nersc.gov/~jed/</a><o:p></o:p></span></font><=
/p>

</div>

</body>

</html>

------=_NextPart_000_0022_01C66D65.E543AD20--
