Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6KECTfm005875
	for <linux-lvm@redhat.com>; Wed, 20 Jul 2011 10:12:29 -0400
Received: from ciomail2.sc.gov (cioe500.state.sc.us [167.7.36.2])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p6KECKpK030869
	for <linux-lvm@redhat.com>; Wed, 20 Jul 2011 10:12:20 -0400
From: "Males, Jess" <jmales@cio.sc.gov>
Date: Wed, 20 Jul 2011 10:12:06 -0400
Message-ID: <0A03EDA0F33C5C428BFFF019C40D609E9D3F2DB494@SCMBXC01.bcbad.state.sc.us>
References: <SNT129-W1D3D317C0A80D476EE747944D0@phx.gbl>
In-Reply-To: <SNT129-W1D3D317C0A80D476EE747944D0@phx.gbl>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0A03EDA0F33C5C428BFFF019C40D609E9D3F2DB494SCMBXC01bcbad_"
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help me understand LVM as it may be implemented in
 cryptsetup and (not?) Gparted
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--_000_0A03EDA0F33C5C428BFFF019C40D609E9D3F2DB494SCMBXC01bcbad_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The F15 installer allows of encrypting the VG at boot time.  You seem to un=
derstand the concept of what you want to do, you just don't realize you can=
 do it.  During the OS install, select 'Create Custom Layout' and on the 'L=
VM Physical Volume' make sure 'encrypt' is checked.  The installer will ask=
 for the password and take care of all the setup.

-- Jess Males

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of neon_ bikini
Sent: Tuesday, July 19, 2011 12:02 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Help me understand LVM as it may be implemented in cry=
ptsetup and (not?) Gparted

I'm pushing my way up to this list as my question has languished in other f=
orums...
----------
Upgrading F11 to F15 I've decided to take advantage of disk encryption for =
my laptop. My experience with Anaconda finds limited support for custom dis=
k partitions (mine is dual boot). The result of my second install attempt w=
as a PV boot and LVM Volume Group with home, root, and swap. The problem is=
 these three Logical Volumes were made each with their own encryption! Fedo=
ra documentation only gives instructions for setting encrypting during Anac=
onda as whole disk install or [after the system is installed](http://docs.f=
edoraproject.org/en-US/Fedora/15/html/Installation_Guide/apcs04.html).
----------
From research and discussions I uncovered an [alternative](http://forums.fe=
doraforum.org/showpost.php?p=3D1496052&postcount=3D14) where the [VG is the=
 only encrypted part](http://www.fedoraforum.org/forum/showpost.php?p=3D138=
3201&postcount=3D2) of the partition scheme. Then I can continue installing=
 Fedora using a disk which includes the Anaconda installer. This would make=
 an encrypted Fedora system with a single unencrypt passphrase.

What I am not clear on is the step to create the LVs. Reading cryptsetup do=
cs and the above examples I conclude LuksOpen and LuksClose commands "booke=
nd" the LVM linux commands pvcreate, vgcreate, and lvcreate. Then I won't u=
se gparted at all?

Since I will be deleting the existing partitions, being careful not to disr=
upt the current Win partition (first), I need do all of this from a liveCD.=
 And this disk needs to have the LVM commands pvcreate, vgcreate, lvcreate,=
 and cryptsetup-luks, and dm-crypt packages?
Once the VG is encrypted and the LVs are added then I can launch the Fedora=
 spin or Full i386 DVD with Anaconda and complete the install?

Does this sound correct? Am I missing anything? Is there an easier way to d=
o this? (^_^)

--_000_0A03EDA0F33C5C428BFFF019C40D609E9D3F2DB494SCMBXC01bcbad_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 14 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=3D'f=
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>The F15 i=
nstaller allows of encrypting the VG at boot time.&nbsp; You seem to unders=
tand the concept of what you want to do, you just don&#8217;t realize you c=
an do it.&nbsp; During the OS install, select &#8216;Create Custom Layout&#=
8217; and on the &#8216;LVM Physical Volume&#8217; make sure &#8216;encrypt=
&#8217; is checked.&nbsp; The installer will ask for the password and take =
care of all the setup.<o:p></o:p></span></p><p class=3DMsoNormal><span styl=
e=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:=
p>&nbsp;</o:p></span></p><div><p class=3DMsoNormal><span style=3D'font-size=
:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>-- Jess Males<o:p=
></o:p></span></p></div><p class=3DMsoNormal><span style=3D'font-size:11.0p=
t;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span=
></p><div><div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padding:=
3.0pt 0in 0in 0in'><p class=3DMsoNormal><b><span style=3D'font-size:10.0pt;=
font-family:"Tahoma","sans-serif"'>From:</span></b><span style=3D'font-size=
:10.0pt;font-family:"Tahoma","sans-serif"'> linux-lvm-bounces@redhat.com [m=
ailto:linux-lvm-bounces@redhat.com] <b>On Behalf Of </b>neon_ bikini<br><b>=
Sent:</b> Tuesday, July 19, 2011 12:02 PM<br><b>To:</b> linux-lvm@redhat.co=
m<br><b>Subject:</b> [linux-lvm] Help me understand LVM as it may be implem=
ented in cryptsetup and (not?) Gparted<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal><span=
 style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>I'm pushing m=
y way up to this list as my question has languished in other forums...<o:p>=
</o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:1=
0.0pt;font-family:"Tahoma","sans-serif"'>----------<o:p></o:p></span></p></=
div><div><p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"=
Tahoma","sans-serif"'>Upgrading F11 to F15 I've decided to take advantage o=
f disk&nbsp;encryption for my laptop. My experience with Anaconda finds lim=
ited support for custom disk partitions (mine is dual boot). The result of =
my second install attempt was a PV boot and LVM Volume Group with home, roo=
t, and swap. The problem is these three Logical Volumes were made each&nbsp=
;with their own encryption! Fedora documentation only gives instructions fo=
r setting encrypting during Anaconda as whole disk install or [after&nbsp;t=
he system is installed](<a href=3D"http://docs.fedoraproject.org/en-US/Fedo=
ra/15/html/Installation_Guide/apcs04.html">http://docs.fedoraproject.org/en=
-US/Fedora/15/html/Installation_Guide/apcs04.html</a>).<br>----------<br>Fr=
om research and discussions I uncovered an [alternative](<a href=3D"http://=
forums.fedoraforum.org/showpost.php?p=3D1496052&amp;postcount=3D14">http://=
forums.fedoraforum.org/showpost.php?p=3D1496052&amp;postcount=3D14</a>) whe=
re the [VG is the only encrypted part](<a href=3D"http://www.fedoraforum.or=
g/forum/showpost.php?p=3D1383201&amp;postcount=3D2">http://www.fedoraforum.=
org/forum/showpost.php?p=3D1383201&amp;postcount=3D2</a>) of the partition =
scheme. Then I can continue installing Fedora using a disk which includes t=
he Anaconda installer. This would make an encrypted Fedora system with a si=
ngle unencrypt passphrase. <o:p></o:p></span></p></div><div><p class=3DMsoN=
ormal><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>&n=
bsp;<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'fo=
nt-size:10.0pt;font-family:"Tahoma","sans-serif"'>What I am not clear on is=
 the step to create the LVs. Reading cryptsetup docs and the above examples=
 I conclude LuksOpen and LuksClose commands &quot;bookend&quot; the LVM lin=
ux commands pvcreate, vgcreate, and lvcreate. Then I won't use gparted at a=
ll?<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'fon=
t-size:10.0pt;font-family:"Tahoma","sans-serif"'><br>Since I will be deleti=
ng the existing partitions, being careful not to disrupt the current Win pa=
rtition (first), I need do all of this from a liveCD. And this disk needs t=
o have the LVM commands pvcreate, vgcreate, lvcreate, and cryptsetup-luks, =
and dm-crypt packages? <br>Once the VG is encrypted and the LVs are added t=
hen I can launch the Fedora spin or Full i386 DVD with Anaconda&nbsp;and co=
mplete the install?<o:p></o:p></span></p></div><div><p class=3DMsoNormal><s=
pan style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'><br>Does t=
his sound correct? Am I missing anything? Is there an easier way to do this=
? (^_^)<o:p></o:p></span></p></div></div></div></body></html>=

--_000_0A03EDA0F33C5C428BFFF019C40D609E9D3F2DB494SCMBXC01bcbad_--
