From: "Matt" <lightning@aci.net>
Message-ID: <002001c25fa7$482b2740$ccc67140@ownage>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0021_01C25F6C.9BCC4F40"
Subject: [linux-lvm] Removing an old disk, and some vgexport/import love..
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
Date: Thu Sep 19 01:39:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0021_01C25F6C.9BCC4F40
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Helu,

 

I am in dire need of some help.I recently removed an old disk from my PV
and added a new one  

 in place of the old one.

e.g.

            

pvmove garage /dev/hdj1 /dev/hde1 (hde1 being the new drive)

 

The physical extents moved over to the new drive and everything was
looking good until

I made a pretty big mistake, I figured I'd need to export the group
'garage' and import it.

Wrong! Now when I go and try to import my group it freaks stating:

            

            # vgimport garage /dev/hde1 /dev/hdg1 /dev/hdf1

vgimport -- ERROR: wrong number of physical volumes to import volume
group "garage"

 

I can't do a vgcfgrestore either, because it is currently exported and I
am not sure if that would
fix anything anyways. Here is some more information:

 

            # pvscan

pvscan -- reading all physical volumes (this may take a while...)

pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "garage" [74.55 GB
/ 0 free]

pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "garage" [76.33 GB
/ 0 free]

pvscan -- inactive PV "/dev/hdf1"  is in EXPORTED VG "garage" [74.52 GB
/ 60.21 GB free]

pvscan -- total: 3 [225.42 GB] / in use: 3 [225.42 GB] / in no VG: 0 [0]

 

            vgscan -d output can be found at:
http://www.planetgarage.net/vgscan.txt (long)

 

root@deify:~ # vgdisplay -Dv

vgdisplay -- WARNING: volume group "garagePV_EXP" is exported

--- Volume group ---

VG Name               garagePV_EXP

VG Access             read/write

VG Status             NOT available/exported/resizable

VG #                  0

MAX LV                256

Cur LV                1

Open LV               0

MAX LV Size           255.99 GB

Max PV                256

Cur PV                3

Act PV                3

VG Size               225.41 GB

PE Size               4 MB

Total PE              57705

Alloc PE / Size       42290 / 165.20 GB

Free  PE / Size       15415 / 60.21 GB

VG UUID               fs8lXY-bca9-tFHT-yv8g-HP7U-Ssh7-v13m9h

 

--- Logical volume ---

LV Name                /dev/garage/LLAMA

VG Name                garage

LV Write Access        read/write

LV Status              NOT available

LV #                   1

# open                 0

LV Size                165.20 GB

Current LE             42290

Allocated LE           42290

Allocation             next free

Read ahead sectors     120

Block device           58:0

 

 

--- Physical volumes ---

PV Name (#)           /dev/hde1 (1)

PV Status             available / allocatable

Total PE / Free PE    19541 / 0

 

PV Name (#)           /dev/hdg1 (3)

PV Status             available / allocatable

Total PE / Free PE    19086 / 0

 

PV Name (#)           /dev/hdf1 (4)

PV Status             available / allocatable

Total PE / Free PE    19078 / 15415

 

 


------=_NextPart_000_0021_01C25F6C.9BCC4F40
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE>@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.25in 1.0in =
1.25in; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.EmailStyle17 {
	COLOR: windowtext; FONT-FAMILY: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DEN-US vLink=3Dpurple link=3Dblue>
<DIV class=3DSection1>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Helu,</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">I am in=20
dire need of some help.</SPAN><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">I recently removed an old =
disk from=20
my PV and added a new one&nbsp;<SPAN class=3D256253606-19092002><FONT=20
color=3D#0000ff>&nbsp;</FONT></SPAN></SPAN></P>
<P class=3DMsoNormal><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><SPAN=20
class=3D256253606-19092002>&nbsp;</SPAN>in place of the old =
one.</SPAN></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">e.g.</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvmove garage /dev/hdj1 =
/dev/hde1=20
(hde1 being the new drive)</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">The physical extents moved =
over to=20
the new drive and everything was looking good until</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">I made a pretty big =
mistake, I=20
figured I&#8217;d need to export the group &#8216;garage&#8217; and =
import it.</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Wrong! Now when I go and =
try to=20
import my group it freaks stating:</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
# vgimport garage /dev/hde1 /dev/hdg1 /dev/hdf1</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">vgimport -- ERROR: wrong =
number of=20
physical volumes to import volume group "garage"</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">I can&#8217;t do=20
a vgcfgrestore either, because it is currently exported and I am not =
sure if=20
that would<BR>fix anything anyways&#8230;&nbsp;Here is some more=20
information:</SPAN></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
# pvscan</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvscan -- reading all =
physical=20
volumes (this may take a while...)</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvscan -- inactive PV=20
"/dev/hdg1"&nbsp; is in EXPORTED VG "garage" [74.55 GB / 0=20
free]</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvscan -- inactive PV=20
"/dev/hde1"&nbsp; is in EXPORTED VG "garage" [76.33 GB / 0=20
free]</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvscan -- inactive PV=20
"/dev/hdf1"&nbsp; is in EXPORTED VG "garage" [74.52 GB / 60.21 GB=20
free]</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvscan -- total: 3 [225.42 =
GB] / in=20
use: 3 [225.42 GB] / in no VG: 0 [0]</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
vgscan &#8211;d output can be found at: <A=20
href=3D"http://www.planetgarage.net/vgscan.txt">http://www.planetgarage.n=
et/vgscan.txt</A>=20
(long)</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">root@deify:~ # vgdisplay=20
-Dv</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">vgdisplay -- WARNING: =
volume group=20
"garagePV_EXP" is exported</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">--- Volume group=20
---</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
garagePV_EXP</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
NOT available/exported/resizable</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">MAX </SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">LV</SPAN></FONT><FONT=20
face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;=20
256</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Cur </SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">LV</SPAN></FONT><FONT=20
face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;=20
1</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Open </SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">LV</SPAN></FONT><FONT=20
face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;=20
0</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"TEXT-INDENT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">MAX </SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">LV</SPAN></FONT><FONT=20
face=3DArial size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.99=20
GB</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
225.41 GB</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
57705</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Alloc</SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"> =
</SPAN></FONT><FONT=20
face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PE</SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"> /=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 42290 / 165.20 =
GB</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Free&nbsp; PE /=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15415 / 60.21 =
GB</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
fs8lXY-bca9-tFHT-yv8g-HP7U-Ssh7-v13m9h</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">--- Logical volume=20
---</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/garage/LLAMA</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
garage</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">LV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
NOT available</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">LV</SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">#=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">LV</SPAN></FONT><FONT =
face=3DArial=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
&nbsp;&nbsp;165.20 GB</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
42290</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Allocated=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
42290</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
next free</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Read ahead=20
sectors&nbsp;&nbsp;&nbsp;&nbsp; 120</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
58:0</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">--- Physical volumes=20
---</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PV Name=20
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/dev/hde1=20
(1)</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Total PE / Free =
PE&nbsp;&nbsp;&nbsp;=20
19541 / 0</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PV Name=20
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/dev/hdg1=20
(3)</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Total PE / Free =
PE&nbsp;&nbsp;&nbsp;=20
19086 / 0</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PV Name=20
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/dev/hdf1=20
(4)</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available / allocatable</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Total PE / Free =
PE&nbsp;&nbsp;&nbsp;=20
19078 / 15415</SPAN></FONT></P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"></SPAN></FONT>&nbsp;</P></DIV></BODY></HTML>

------=_NextPart_000_0021_01C25F6C.9BCC4F40--
