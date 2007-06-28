Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5SGgNVh025991
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 12:42:23 -0400
Received: from drakesmith.net (drakesmith.net [64.62.223.80])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l5SGgJ5d009276
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 12:42:19 -0400
Received: from PaulXP ([71.164.137.136]) by drakesmith.net for
	<linux-lvm@redhat.com>; Thu, 28 Jun 2007 09:42:15 -0700
From: "WarlockD" <warlockd@drakesmith.net>
Date: Thu, 28 Jun 2007 11:42:25 -0500
Message-ID: <001201c7b9a3$4f0da2d0$ed28e870$@net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C7B979.66379AD0"
Content-Language: en-us
Subject: [linux-lvm] Serious problem and I don't know where to turn.
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
To: linux-lvm@redhat.com

This is a multipart message in MIME format.

------=_NextPart_000_0013_01C7B979.66379AD0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I screwed up, big time.  If it was just one or two mistakes than I think I
could of solved it, but now I am not sure how to fix this.

 

Some back ground:  I recently picked up a DSN-3200 cheap off ebay.  Its
basically an Iscsi SAN system that holds 15 drives.  VERY simplistic but
hey, does RAID5.  I added 5 drives and set up a simple LVM2 group off the
first partition of the array.  (/dev/sdb1)  Followed the directions and made
a logical drive, formatted to ext3 and everything was great.

 

A few months latter Fry's was having a 500gb drive sale, so I picked up 5
more drives and expanded the array (The DSN only tapes on extra drives to
the existing one, rather than expanding the array a drive at a time.  Think
JOBD with RAID5 arrays)  I now had an extra, or exact 1.7tb of space.  I
create another LVM2 partition (/dev/sdb2), expand both the VG and LV.

 

This would have been all fine, except I ran into an issue with e2fsck.  To
expand the ext3, it wanted me to run e2fsck -f on the volume.  The problem
was that eveytime I run the command, it would seem to lock up the iscsi
driver.  I tried looking for any kind of hints on why this was with no
avail.  After hours of working on it, I threw up my hands.  I figured if I
can never e2fsck the volume, it might be bad for me to extend it in the
first place.  At the time, I didn't have a way to back up the array, so I
did something stupid.

 

I deleted the /dev/sdb2 partition.  Mind you, this was after a few days and
the line of thinking was that I would delete it, create an ext3 partition,
and copy the data over.  Of course it gave a lot of errors in LVM2
afterwards.  I could still mount the volume so I thought I was ok.  

 

A day or two passes and I wake up to find the server has locked up.  I do a
hard reboot to find the little 160gig IDE drive in it has failed.  Doesn't
spin up on power.  There goes my backup metadata.

 

Sigh.  I would have been better off with an ext3 partition to begin with,
but I liked the flexibility that LVM2 offered.  To be honest I don't
remember a lot of the commands I have used either.  Any help would be
appreciated.  It even looks like I lost the logical drive.  But I know the
data is still there, is there any kind of utility I can just "get" the ext3
partition out of there?

 

 

[root@server archive]# vgscan

  Reading all physical volumes.  This may take a while...

  Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1 not
/dev/sda1

  Found volume group "VolGroup00" using metadata type lvm2

  Found volume group "ANIME" using metadata type lvm2

[root@server archive]# ls

VolGroup00_00000.vg

[root@server archive]# vgchange -a y

  Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1 not
/dev/sda1

  2 logical volume(s) in volume group "VolGroup00" now active

  0 logical volume(s) in volume group "ANIME" now active

[root@server archive]# pvscan

  Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1 not
/dev/sda1

  PV /dev/hda2   VG VolGroup00   lvm2 [148.94 GB / 0    free]

  PV /dev/sdb1   VG ANIME        lvm2 [1.82 TB / 1.82 TB free]

  PV /dev/sda2                   lvm2 [1.82 TB]

  Total: 3 [3.78 TB] / in use: 2 [1.96 TB] / in no VG: 1 [1.82 TB]

[root@server archive]# lvscan

  Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1 not
/dev/sda1

  ACTIVE            '/dev/VolGroup00/LogVol00' [147.00 GB] inherit

  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit

[root@server archive]#

 

 


------=_NextPart_000_0013_01C7B979.66379AD0
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
	{mso-style-type:export-only;}
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

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal>I screwed up, big time.&nbsp; If it was just one or =
two
mistakes than I think I could of solved it, but now I am not sure how to =
fix
this.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Some back ground:&nbsp; I recently picked up a =
DSN-3200
cheap off ebay.&nbsp; Its basically an Iscsi SAN system that holds 15
drives.&nbsp; VERY simplistic but hey, does RAID5.&nbsp; I added 5 =
drives and
set up a simple LVM2 group off the first partition of the array.&nbsp; =
(/dev/sdb1)&nbsp;
Followed the directions and made a logical drive, formatted to ext3 and =
everything
was great.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>A few months latter Fry&#8217;s was having a 500gb =
drive
sale, so I picked up 5 more drives and expanded the array (The DSN only =
tapes
on extra drives to the existing one, rather than expanding the array a =
drive at
a time.&nbsp; Think JOBD with RAID5 arrays)&nbsp; I now had an extra, or =
exact
1.7tb of space.&nbsp; I create another LVM2 partition (/dev/sdb2), =
expand both
the VG and LV.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>This would have been all fine, except I ran into an =
issue
with e2fsck.&nbsp; To expand the ext3, it wanted me to run e2fsck =
&#8211;f on
the volume.&nbsp; The problem was that eveytime I run the command, it =
would
seem to lock up the iscsi driver.&nbsp; I tried looking for any kind of =
hints
on why this was with no avail.&nbsp; After hours of working on it, I =
threw up
my hands.&nbsp; I figured if I can never e2fsck the volume, it might be =
bad for
me to extend it in the first place.&nbsp; At the time, I didn&#8217;t =
have a
way to back up the array, so I did something stupid.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>I deleted the /dev/sdb2 partition.&nbsp; Mind you, =
this was
after a few days and the line of thinking was that I would delete it, =
create an
ext3 partition, and copy the data over.&nbsp; Of course it gave a lot of =
errors
in LVM2 afterwards.&nbsp; I could still mount the volume so I thought I =
was
ok.&nbsp; <o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>A day or two passes and I wake up to find the =
server has
locked up.&nbsp; I do a hard reboot to find the little 160gig IDE drive =
in it
has failed.&nbsp; Doesn&#8217;t spin up on power.&nbsp; There goes my =
backup
metadata.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Sigh.&nbsp; I would have been better off with an =
ext3
partition to begin with, but I liked the flexibility that LVM2 =
offered.&nbsp;
To be honest I don&#8217;t remember a lot of the commands I have used =
either. &nbsp;Any
help would be appreciated.&nbsp; It even looks like I lost the logical
drive.&nbsp; But I know the data is still there, is there any kind of =
utility I
can just &#8220;get&#8221; the ext3 partition out of =
there?<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>[root@server archive]# vgscan<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Reading all physical volumes.&nbsp; This may =
take a
while...<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Found duplicate PV =
5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb:
using /dev/sdb1 not /dev/sda1<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Found volume group &quot;VolGroup00&quot; =
using
metadata type lvm2<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Found volume group &quot;ANIME&quot; using =
metadata
type lvm2<o:p></o:p></p>

<p class=3DMsoNormal>[root@server archive]# ls<o:p></o:p></p>

<p class=3DMsoNormal>VolGroup00_00000.vg<o:p></o:p></p>

<p class=3DMsoNormal>[root@server archive]# vgchange -a y<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Found duplicate PV =
5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb:
using /dev/sdb1 not /dev/sda1<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; 2 logical volume(s) in volume group
&quot;VolGroup00&quot; now active<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; 0 logical volume(s) in volume group =
&quot;ANIME&quot;
now active<o:p></o:p></p>

<p class=3DMsoNormal>[root@server archive]# pvscan<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Found duplicate PV =
5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb:
using /dev/sdb1 not /dev/sda1<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV /dev/hda2&nbsp;&nbsp; VG =
VolGroup00&nbsp;&nbsp;
lvm2 [148.94 GB / 0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV /dev/sdb1&nbsp;&nbsp; VG
ANIME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [1.82 TB / 1.82 TB =
free]<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV
/dev/sda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
lvm2 [1.82 TB]<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Total: 3 [3.78 TB] / in use: 2 [1.96 TB] / =
in no VG:
1 [1.82 TB]<o:p></o:p></p>

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

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>

------=_NextPart_000_0013_01C7B979.66379AD0--
