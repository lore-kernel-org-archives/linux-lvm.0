Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAPFL0Og030582
	for <linux-lvm@redhat.com>; Tue, 25 Nov 2014 10:21:00 -0500
Received: from BAY004-OMC3S20.hotmail.com (bay004-omc3s20.hotmail.com
	[65.54.190.158])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAPFKvjb008690
	(version=TLSv1/SSLv3 cipher=AES256-SHA256 bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 25 Nov 2014 10:20:58 -0500
Message-ID: <BAY402-EAS41E59E06CD5302CDEC74E8BD730@phx.gbl>
From: N Cuka <ncuka@hotmail.com>
Date: Tue, 25 Nov 2014 10:20:55 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0031_01D00899.7F56D540"
Content-Language: en-us
Subject: [linux-lvm] Unable to create snapshot due to failed merge of prior
	snapshot
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

------=_NextPart_000_0031_01D00899.7F56D540
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Everyone,

I inadvertently created a situation where I deleted an LVM snapshot that was
pending a merge (yes - bonehead move). Now I can neither finish the merge
nor create a new snapshot on the original logical volume. When I try to
create a snapshot I get the following:

 

root@ubuntu:~# lvcreate -s -n snap -L 15g /dev/sysvg/syslv
   Snapshots of an origin that has a merging snapshot is not supported

 

and in dmesg I see the following logs:

 
Nov 21 20:32:47 ubuntu kernel: [  721.210733] device-mapper: snapshots:
Snapshot is marked invalid.
Nov 21 20:32:47 ubuntu kernel: [  721.211641] device-mapper: snapshots:
Snapshot is invalid: can't merge
Nov 21 20:32:47 ubuntu kernel: [  721.233283] Buffer I/O error on device
dm-4, logical block 16
Nov 21 20:32:47 ubuntu kernel: [  721.233289] Buffer I/O error on device
dm-4, logical block 16


This is not surprising as I did an lvremove of the snapshot (oops). If I do
an lvscan I get the following output:

 
root@ubuntu:~# lvscan
  ACTIVE            '/dev/uservg/userlv' [931.50 GiB] inherit
  inactive Original '/dev/sysvg/syslv' [152.77 GiB] inherit

 

And lvdisplay shows

 
root@ubuntu:/# lvdisplay /dev/sysvg/syslv 
  --- Logical volume ---
  LV Path                /dev/sysvg/syslv
  LV Name                syslv
  VG Name                sysvg
  LV UUID                stuff here
  LV Write Access        read/write
  LV Creation host, time hades, 2014-07-09 14:56:49 +0000
  LV snapshot status     source of
                         pre-x [INACTIVE]
  LV Status              available
  # open                 0
  LV Size                152.77 GiB
  Current LE             39108
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:3

 

So the snapshot status is INACTIVE and is trying to merge but I have no idea
how to make LVM try to stop attempting the merge. I can mount and use the
logical volume without apparent problem, but I really would like to be able
to take a snapshot (which is why I wanted to use LVM in the first place!)

I think that I need to us a lower level tool like dmsetup to accomplish this
but I am not sure how to use this tool and would prefer not to blow away
root if possible (not the end of the world, but would prefer not too). With
dmsetup I have the following info:

root@ubuntu:/# dmsetup status /dev/sysvg/syslv 
0 320372736 snapshot-merge Invalid


And

 
root@ubuntu:/# dmsetup info /dev/sysvg/syslv 
Name:              sysvg-syslv
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      252, 3
Number of targets: 1
UUID: stuff here


I have looked extensively on the intertubes and either my google kung-fu is
slipping or I have reached toxic levels of caffeine (or both) and can't find
much. Does anyone have any advice about how to restore LVM snapshoting for
me? 
System:

root@hades:~$ uname -a
Linux hades 3.13.0-39-generic #66-Ubuntu SMP Tue Oct 28 13:30:27 UTC 2014
x86_64 x86_64 x86_64 GNU/Linux


LVM info:

root@ubuntu:/# lvm version
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.02.77 (2012-10-15)
  Driver version:  4.27.0

 

TIA

- chook











 


------=_NextPart_000_0031_01D00899.7F56D540
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'>Hi =
Everyone,<o:p></o:p></p><p class=3DMsoNormal>I inadvertently created a =
situation where I deleted an LVM snapshot that was pending a merge (yes =
- bonehead move). Now I can neither finish the merge nor create a new =
snapshot on the original logical volume. When I try to create a snapshot =
I get the following:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><pre>root@ubuntu:~# lvcreate -s =
-n snap -L 15g /dev/sysvg/syslv<o:p></o:p></pre><pre>&nbsp;&nbsp; =
Snapshots of an origin that has a merging snapshot is not =
supported<o:p></o:p></pre><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>and in dmesg I see the following =
logs:<o:p></o:p></p><pre><o:p>&nbsp;</o:p></pre><pre>Nov 21 20:32:47 =
ubuntu kernel: [&nbsp; 721.210733] device-mapper: snapshots: Snapshot is =
marked invalid.<o:p></o:p></pre><pre>Nov 21 20:32:47 ubuntu kernel: =
[&nbsp; 721.211641] device-mapper: snapshots: Snapshot is invalid: can't =
merge<o:p></o:p></pre><pre>Nov 21 20:32:47 ubuntu kernel: [&nbsp; =
721.233283] Buffer I/O error on device dm-4, logical block =
16<o:p></o:p></pre><pre>Nov 21 20:32:47 ubuntu kernel: [&nbsp; =
721.233289] Buffer I/O error on device dm-4, logical block =
16<o:p></o:p></pre><p class=3DMsoNormal><br>This is not surprising as I =
did an <code><span style=3D'font-size:10.0pt'>lvremove</span></code> of =
the snapshot (oops). If I do an <code><span =
style=3D'font-size:10.0pt'>lvscan</span></code> I get the following =
output:<o:p></o:p></p><pre><o:p>&nbsp;</o:p></pre><pre>root@ubuntu:~# =
lvscan<o:p></o:p></pre><pre>&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/dev/uservg/userlv' [931.50 GiB] =
inherit<o:p></o:p></pre><pre>&nbsp; inactive Original '/dev/sysvg/syslv' =
[152.77 GiB] inherit<o:p></o:p></pre><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>And =
<code><span style=3D'font-size:10.0pt'>lvdisplay</span></code> =
shows<o:p></o:p></p><pre><o:p>&nbsp;</o:p></pre><pre>root@ubuntu:/# =
lvdisplay /dev/sysvg/syslv <o:p></o:p></pre><pre>&nbsp;&nbsp;--- Logical =
volume ---<o:p></o:p></pre><pre>&nbsp; LV =
Path&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /dev/sysvg/syslv<o:p></o:p></pre><pre>&nbsp; LV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;syslv<o:p></o=
:p></pre><pre>&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; sysvg<o:p></o:p></pre><pre>&nbsp; LV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; stuff here<o:p></o:p></pre><pre>&nbsp; LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<o:p></o:p></pre><pre>&nbsp; LV Creation host, time hades, =
2014-07-09 14:56:49 +0000<o:p></o:p></pre><pre>&nbsp; LV snapshot =
status&nbsp;&nbsp;&nbsp;&nbsp; source =
of<o:p></o:p></pre><pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; pre-x [INACTIVE]<o:p></o:p></pre><pre>&nbsp; LV =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; available<o:p></o:p></pre><pre>&nbsp; # =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></pre><pre>&nbsp; LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 152.77 GiB<o:p></o:p></pre><pre>&nbsp; Current =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 39108<o:p></o:p></pre><pre>&nbsp; =
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></pre><pre>&nbsp; =
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; inherit<o:p></o:p></pre><pre>&nbsp; Read ahead =
sectors&nbsp;&nbsp;&nbsp;&nbsp; auto<o:p></o:p></pre><pre>&nbsp; - =
currently set to&nbsp;&nbsp;&nbsp;&nbsp; 256<o:p></o:p></pre><pre>&nbsp; =
Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
252:3<o:p></o:p></pre><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p>So =
the snapshot status is INACTIVE and is trying to merge but I have no =
idea how to make LVM try to stop attempting the merge. I can mount and =
use the logical volume without apparent problem, but I really would like =
to be able to take a snapshot (which is why I wanted to use LVM in the =
first place!)<o:p></o:p></p><p>I think that I need to us a lower level =
tool like dmsetup to accomplish this but I am not sure how to use this =
tool and would prefer not to blow away root if possible (not the end of =
the world, but would prefer not too). With dmsetup I have the following =
info:<o:p></o:p></p><pre>root@ubuntu:/# dmsetup status /dev/sysvg/syslv =
<o:p></o:p></pre><pre>0 320372736 snapshot-merge =
Invalid<o:p></o:p></pre><p =
class=3DMsoNormal><br>And<o:p></o:p></p><pre><o:p>&nbsp;</o:p></pre><pre>=
root@ubuntu:/# dmsetup info /dev/sysvg/syslv =
<o:p></o:p></pre><pre>Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
sysvg-syslv<o:p></o:p></pre><pre>State:&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ACTIVE<o:p></=
o:p></pre><pre>Read Ahead:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
256<o:p></o:p></pre><pre>Tables present:&nbsp;&nbsp;&nbsp; =
LIVE<o:p></o:p></pre><pre>Open =
count:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<o:p></o:p></pre><pre>Event number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<o:p></o:p></pre><pre>Major, minor:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 252, =
3<o:p></o:p></pre><pre>Number of targets: 1<o:p></o:p></pre><pre>UUID: =
stuff here<o:p></o:p></pre><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><br>I have looked extensively on the =
intertubes and either my google kung-fu is slipping or I have reached =
toxic levels of caffeine (or both) and can't find much. Does anyone have =
any advice about how to restore LVM snapshoting for me? =
<br>System:<o:p></o:p></p><pre>root@hades:~$ uname =
-a<o:p></o:p></pre><pre>Linux hades 3.13.0-39-generic #66-Ubuntu SMP Tue =
Oct 28 13:30:27 UTC 2014 x86_64 x86_64 x86_64 =
GNU/Linux<o:p></o:p></pre><p class=3DMsoNormal><br>LVM =
info:<o:p></o:p></p><pre>root@ubuntu:/# lvm =
version<o:p></o:p></pre><pre>&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; =
2.02.98(2) (2012-10-15)<o:p></o:p></pre><pre>&nbsp; Library version: =
1.02.77 (2012-10-15)<o:p></o:p></pre><pre>&nbsp; Driver version:&nbsp; =
4.27.0<o:p></o:p></pre><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'>TIA<o:p></o:p></p><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'>- =
chook<br><br><o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><br><br><br><br><br><br><o:p></o:p></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'><o:p>&nbsp;</=
o:p></span></p></div></body></html>
------=_NextPart_000_0031_01D00899.7F56D540--
