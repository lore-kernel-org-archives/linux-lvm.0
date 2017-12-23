Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5867E6363D
	for <linux-lvm@redhat.com>; Sat, 23 Dec 2017 16:55:29 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28EDF6A7DD
	for <linux-lvm@redhat.com>; Sat, 23 Dec 2017 16:55:28 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id o2so30289172wro.5
	for <linux-lvm@redhat.com>; Sat, 23 Dec 2017 08:55:28 -0800 (PST)
Received: from ?IPv6:::ffff:192.168.178.27?
	(HSI-KBW-109-193-095-224.hsi7.kabel-badenwuerttemberg.de.
	[109.193.95.224]) by smtp.gmail.com with ESMTPSA id
	j77sm36092822wmf.36.2017.12.23.08.55.25 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Dec 2017 08:55:26 -0800 (PST)
Message-ID: <5a3e8a7e.50b91c0a.a2558.0428@mx.google.com>
MIME-Version: 1.0
From: Bernd Eckenfels <ecki@zusammenkunft.net>
Date: Sat, 23 Dec 2017 17:55:26 +0100
In-Reply-To: <CAN10=3rfw-J=ADiwnMJnGbjo00NT-nk7rgq-ThvgAqn0atypTg@mail.gmail.com>
References: <CAN10=3rfw-J=ADiwnMJnGbjo00NT-nk7rgq-ThvgAqn0atypTg@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="_85B2F079-3FDE-485A-BC21-1A88D485AAB6_"
Subject: Re: [linux-lvm] Migrate volumes to new laptop
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

--_85B2F079-3FDE-485A-BC21-1A88D485AAB6_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

If you plan to plug the only disk in your Laptop from the old to the new on=
e, then this is not related to LVM. You might Need to refresh the bootloade=
r, but besides that you should be good to go. If you have a different Scena=
rio please describe it in Details (however it should be no different than a=
 server deployment)

Gruss
Bernd
--=20
http://bernd.eckenfels.net

Von: Boyd Kelly
Gesendet: Samstag, 23. Dezember 2017 09:08
An: linux-lvm@redhat.com
Betreff: [linux-lvm] Migrate volumes to new laptop

Hi,
I've searched hi/low and not found a howto or general suggestions for migra=
ting volume groups from an old to new laptop.=C2=A0 I've found mostly serve=
r scenarios for replacing bad disks etc.=C2=A0 But shouldn't this be a rela=
tively straightforward process using an external usb drive?=C2=A0 I would a=
ssume booting from a rescue cd/usb to start the process?=C2=A0 =C2=A0Any su=
ggestions on general steps or link to some more info much appreciated.

Boyd
--=20
Sent from my dual sim Moto X Play with 128 G external memory, 21 MP camera,=
 1080x1920 IPS Display bought in Paris for 300 CAD.=C2=A0 LOL


--_85B2F079-3FDE-485A-BC21-1A88D485AAB6_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DDE link=3Dblue vlink=3D"#954F72"><div class=
=3DWordSection1><p class=3DMsoNormal>If you plan to plug the only disk in y=
our Laptop from the old to the new one, then this is not related to LVM. Yo=
u might Need to refresh the bootloader, but besides that you should be good=
 to go. If you have a different Scenario please describe it in Details (how=
ever it should be no different than a server deployment)</p><p class=3DMsoN=
ormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Gruss</p><p class=3DMsoNorm=
al>Bernd</p><p class=3DMsoNormal>-- <br>http://bernd.eckenfels.net</p><p cl=
ass=3DMsoNormal><o:p>&nbsp;</o:p></p><div style=3D'mso-element:para-border-=
div;border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm'><=
p class=3DMsoNormal style=3D'border:none;padding:0cm'><b>Von: </b><a href=
=3D"mailto:bkelly@coastsystems.net">Boyd Kelly</a><br><b>Gesendet: </b>Sams=
tag, 23. Dezember 2017 09:08<br><b>An: </b><a href=3D"mailto:linux-lvm@redh=
at.com">linux-lvm@redhat.com</a><br><b>Betreff: </b>[linux-lvm] Migrate vol=
umes to new laptop</p></div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div>=
<p class=3DMsoNormal>Hi,</p><div><p class=3DMsoNormal>I've searched hi/low =
and not found a howto or general suggestions for migrating volume groups fr=
om an old to new laptop.&nbsp; I've found mostly server scenarios for repla=
cing bad disks etc.&nbsp; But shouldn't this be a relatively straightforwar=
d process using an external usb drive?&nbsp; I would assume booting from a =
rescue cd/usb to start the process?&nbsp; &nbsp;Any suggestions on general =
steps or link to some more info much appreciated.</p></div><div><p class=3D=
MsoNormal><o:p>&nbsp;</o:p></p></div><div><p class=3DMsoNormal>Boyd</p></di=
v></div><div><p class=3DMsoNormal>-- </p></div><p>Sent from my dual sim Mot=
o X Play with 128 G external memory, 21 MP camera, 1080x1920 IPS Display bo=
ught in Paris for 300 CAD.&nbsp; LOL</p><p class=3DMsoNormal><o:p>&nbsp;</o=
:p></p></div></body></html>=

--_85B2F079-3FDE-485A-BC21-1A88D485AAB6_--
