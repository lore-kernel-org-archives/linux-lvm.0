Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0HEbZ7x009414
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 09:37:35 -0500
Received: from ciomail2.sc.gov (cioe500.state.sc.us [167.7.36.2])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0HEbXaT020203
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 09:37:34 -0500
From: "Males, Jess" <jmales@cio.sc.gov>
Date: Tue, 17 Jan 2012 09:36:48 -0500
Message-ID: <0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBF@SCMBXC01.bcbad.state.sc.us>
References: <CALe_PVkxi2oTuvqkSQz6KHi-G0Nxk7mXMOA8o3XFf3cwo7eG1Q@mail.gmail.com>
In-Reply-To: <CALe_PVkxi2oTuvqkSQz6KHi-G0Nxk7mXMOA8o3XFf3cwo7eG1Q@mail.gmail.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBFSCMBXC01bcbad_"
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing a logical volume which is mounted (at
 /home)
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

--_000_0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBFSCMBXC01bcbad_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Log in as root:
-              either once the system is completely booted, log in as root =
with the graphical prompt
-              boot into single user mode. i.e. stop grub in its countdown,=
 edit the boot configuration by appending single to the list of kernel para=
meters

Or, boot with a live CD/USB environment.

I would recommend this last option.  Depending on the live environment, you=
 might have to manually detect the volume group, but you're outside the ins=
talled system so you can change any logical volume without worry or conflic=
t.

I would suggest the real lesson from all of this is: unless space constrain=
ed, never commit 100% of your vg.  The whole point of abstracting your disk=
 into lvm is for flexibility, and how can you have flexibility without a li=
ttle spare disk to apportion later?  I say this because you sound ready to =
slice X GB off lvhome and immediately commit it all to other logical volume=
s; keep some as spare.


-- Jess Males

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of Kiran Rao
Sent: Monday, January 16, 2012 8:07 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Resizing a logical volume which is mounted (at /home)

To start off, here's an overview of my configuration. I'm dual-booting Wind=
ows XP and Fedora Core 16. When I installed FC 16, here's how I created the=
 partitions:

1) Volume Group (vg_me) - ~73 GB

Out of this, the following are the logical volumes:
a) lvhome (mount point - /home) - ~48GB
b) lvroot (mount point - /) ~10GB
c) lvvar (mount point - /var) ~15GB

So, there's no free space left on the volume group.

Now, I feel the 48GB is not really necessary for the /home. I want to redis=
tribute the space among the 3 logical volumes within this VG, or create a n=
ew one (/tech).  In either case, I want to take the additional space (aroun=
d 20GB) from lvhome and give it to either / or to /tech.

Now, I tried the GUI (system-config-lvm) tool to do this. I can click on lv=
home and try to resize it. However, the problem is that since I am logged i=
n as a non-root user, the /home is mounted. Resizing requires one to unmoun=
t it, but the unmount operation fails since I am mounted.

How do I work around this?

--_000_0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBFSCMBXC01bcbad_
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
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=3D'f=
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>Log in as=
 root:<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:1=
1.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; either once th=
e system is completely booted, log in as root with the graphical prompt<o:p=
></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font=
-family:"Calibri","sans-serif";color:#1F497D'>-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot into single user mo=
de. i.e. stop grub in its countdown, edit the boot configuration by appendi=
ng single to the list of kernel parameters<o:p></o:p></span></p><p class=3D=
MsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif=
";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span sty=
le=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>Or=
, boot with a live CD/USB environment.<o:p></o:p></span></p><p class=3DMsoN=
ormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";co=
lor:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=
=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>I wo=
uld recommend this last option.&nbsp; Depending on the live environment, yo=
u might have to manually detect the volume group, but you&#8217;re outside =
the installed system so you can change any logical volume without worry or =
conflict.<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-siz=
e:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p=
></span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-famil=
y:"Calibri","sans-serif";color:#1F497D'>I would suggest the real lesson fro=
m all of this is: unless space constrained, never commit 100% of your vg.&n=
bsp; The whole point of abstracting your disk into lvm is for flexibility, =
and how can you have flexibility without a little spare disk to apportion l=
ater?&nbsp; I say this because you sound ready to slice X GB off lvhome and=
 immediately commit it all to other logical volumes; keep some as spare.&nb=
sp; <o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:11.=
0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></sp=
an></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Ca=
libri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DM=
soNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif"=
;color:#1F497D'>-- Jess Males<o:p></o:p></span></p><p class=3DMsoNormal><sp=
an style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F49=
7D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><b><span style=3D'font=
-size:10.0pt;font-family:"Tahoma","sans-serif"'>From:</span></b><span style=
=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'> linux-lvm-bounces@=
redhat.com [mailto:linux-lvm-bounces@redhat.com] <b>On Behalf Of </b>Kiran =
Rao<br><b>Sent:</b> Monday, January 16, 2012 8:07 AM<br><b>To:</b> linux-lv=
m@redhat.com<br><b>Subject:</b> [linux-lvm] Resizing a logical volume which=
 is mounted (at /home)<o:p></o:p></span></p><p class=3DMsoNormal><o:p>&nbsp=
;</o:p></p><p class=3DMsoNormal>To start off, here's an overview of my conf=
iguration. I'm dual-booting Windows XP and Fedora Core 16. When I installed=
 FC 16, here's how I created the partitions:<br><br>1) Volume Group (vg_me)=
 - ~73 GB<br><br>Out of this, the following are the logical volumes:<br>a) =
lvhome (mount point - /home) - ~48GB<br>b) lvroot (mount point - /) ~10GB<b=
r>c) lvvar (mount point - /var) ~15GB<br><br>So, there's no free space left=
 on the volume group.<br><br>Now, I feel the 48GB is not really necessary f=
or the /home. I want to redistribute the space among the 3 logical volumes =
within this VG, or create a new one (/tech).&nbsp; In either case, I want t=
o take the additional space (around 20GB) from lvhome and give it to either=
 / or to /tech.<br><br>Now, I tried the GUI (system-config-lvm) tool to do =
this. I can click on lvhome and try to resize it. However, the problem is t=
hat since I am logged in as a non-root user, the /home is mounted. Resizing=
 requires one to unmount it, but the unmount operation fails since I am mou=
nted.<br><br>How do I work around this?<o:p></o:p></p></div></body></html>=

--_000_0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBFSCMBXC01bcbad_--
