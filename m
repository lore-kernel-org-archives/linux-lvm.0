Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1985614C8
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2017 13:13:14 +0000 (UTC)
Received: from mail1b.csob.cz (mail1b.csob.cz [193.245.32.150])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A516780481
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2017 13:13:10 +0000 (UTC)
From: =?iso-8859-2?Q?VESEL=CDK_Jan?= <jveselik@csob.cz>
Date: Tue, 12 Dec 2017 13:13:06 +0000
Message-ID: <VI1PR05MB15032E32F70BEB2B14AABE56D1340@VI1PR05MB1503.eurprd05.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR05MB15032E32F70BEB2B14AABE56D1340VI1PR05MB1503eurp_"
MIME-Version: 1.0
Subject: [linux-lvm] LVM2 - pvresize alert
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

--_000_VI1PR05MB15032E32F70BEB2B14AABE56D1340VI1PR05MB1503eurp_
Content-Type: text/plain; charset="iso-8859-2"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to suggest small tweak in command pvresize. If you use paramet=
er -setphysicalvolumesize, you will get only pasive wargning with this pote=
ntially dangerous action. In comparrison to lvresize with parameter -L -, m=
eaning making logical volume smaller, you receive warning and prompt to con=
tinue.

Is it possible to implement this kind of prompt to enter yes or no before e=
very lvm action that could pottentially lead to data loss.

Thank you for consideration and have a great day.


Best regards


Jan Veselik
Administr=E1tor
=C8eskoslovensk=E1 obchodn=ED banka, a. s.
Linux Servery
Radlick=E1 714/113a
158 00 Praha 5

e-mail: jveselik@csob.cz<mailto:jveselik@csob.cz>
http://www.csob.cz/
Je nutn=E9 tento e-mail tisknout? Myslete na =BEivotn=ED prost=F8ed=ED.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
::::::::::::::

Pravni informace: Tento e-mail a vsechny pripojene soubory (i) jsou duverne=
 a mohou byt chraneny zakonem a (ii) nejsou navrhem na uzavreni smlouvy, le=
daze jsou jako navrh na uzavreni smlouvy vyslovne oznaceny. Tento e-mail je=
 urcen pouze uvedenemu prijemci a dalsim osobam, ktere  jsou jmenovite uved=
eny jako prijemci. Jestlize nejste opravneny prijemce, pak jakakoliv forma =
zverejneni, reprodukce, kopirovani, distribuce nebo sireni je prisne zakaza=
na. Pokud jste obdrzel tento e-mail omylem, oznamte to, prosim, neprodlene =
jeho odesilateli a pak jej vymazte. CSOB neruci za bezchybny a uplny prenos=
 zasilanych informaci, ani za zpozdeni nebo preruseni prenosu a ani za skod=
y zpusobene pouzitim nebo duverou v tyto informace.

Legal Disclaimer: This e-mail and any attached files (i) are confidential a=
nd may be legally privileged and (ii) do not constitute any proposal for co=
nclusion of an agreement, unless they are expressly designated as such. If =
you are not the addressee, any disclosure, reproduction, copying, distribut=
ion, or other dissemination or use of this communication is strictly prohib=
ited. If you have received this transmission in error please notify CSOB im=
mediately and then delete this e-mail. CSOB does not accept liability for t=
he correct and complete transmission of the information, nor for any delay =
or interruption of the transmission, nor for damages arising from the use o=
f or reliance on the information. All e-mail messages addressed to, receive=
d or sent by CSOB or CSOB employees are deemed to be professional in nature=
. Accordingly, the sender or recipient of these messages agrees that they m=
ay be read by other CSOB employees than the official recipient or sender in=
 order to ensure the continuity of work-related activities and allow superv=
ision thereof.

--_000_VI1PR05MB15032E32F70BEB2B14AABE56D1340VI1PR05MB1503eurp_
Content-Type: text/html; charset="iso-8859-2"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Consolas;
	color:#002142;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"CS" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142">Hello,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142">I would like to suggest small tweak in command pvresize. If=
 you use parameter &#8211;setphysicalvolumesize, you will get only pasive w=
argning with this potentially dangerous action.
 In comparrison to lvresize with parameter &#8211;L -, meaning making logic=
al volume smaller, you receive warning and prompt to continue.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142">Is it possible to implement this kind of prompt to enter ye=
s or no before every lvm action that could pottentially lead to data loss.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142">Thank you for consideration and have a great day.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142">Best regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#002142"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:3.75pt;margin-right:0cm;=
margin-bottom:3.75pt;margin-left:0cm;line-height:12.0pt">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:#003366;mso-f=
areast-language:CS">Jan Veselik<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:3.75pt;margin-right:0cm;=
margin-bottom:3.75pt;margin-left:0cm;line-height:12.0pt">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#003366;mso-fare=
ast-language:CS">Administr=E1tor<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:3.75pt;margin-right:0cm;=
margin-bottom:3.75pt;margin-left:0cm;line-height:12.0pt">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#003366;mso-fare=
ast-language:CS">=C8eskoslovensk=E1 obchodn=ED banka, a. s.<br>
Linux Servery<br>
Radlick=E1 714/113a<br>
158 00 Praha 5 <o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:3.75pt;margin-right:0cm;=
margin-bottom:3.75pt;margin-left:0cm;line-height:12.0pt">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#003366;mso-fare=
ast-language:CS"><br>
e-mail: <a href=3D"mailto:jveselik@csob.cz"><span style=3D"color:#0563C1">j=
veselik@csob.cz</span></a><br>
<a href=3D"http://www.csob.cz/"><span style=3D"color:#0563C1">http://www.cs=
ob.cz/</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:11.25pt"><span style=3D"font-siz=
e:10.0pt;font-family:Consolas;color:#339933;mso-fareast-language:CS">Je nut=
n=E9 tento e-mail tisknout? Myslete na =BEivotn=ED prost=F8ed=ED.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
::::::::::::::<br><br><div>Pravni informace: Tento e-mail a vsechny pripoje=
ne soubory (i) jsou duverne a mohou byt chraneny zakonem a (ii) nejsou navr=
hem na uzavreni smlouvy ani jeho prijetim, ledaze jsou tak vyslovne oznacen=
y. Tento e-mail je urcen pouze uvedenemu prijemci a dalsim osobam, ktere &n=
bsp;jsou jmenovite uvedeny jako prijemci. Jestlize nejste opravneny prijemc=
e, pak jakakoliv forma zverejneni, reprodukce, kopirovani, distribuce nebo =
sireni je prisne zakazana. Pokud jste obdrzel tento e-mail omylem, oznamte =
to, prosim, neprodlene jeho odesilateli a pak jej vymazte. CSOB neruci za b=
ezchybny a uplny prenos zasilanych informaci, ani za zpozdeni nebo prerusen=
i prenosu a ani za skody zpusobene pouzitim nebo duverou v tyto informace.<=
br><div>Legal Disclaimer: This e-mail and any attached files (i) are confid=
ential and may be legally privileged and (ii) do not constitute any proposa=
l for conclusion of an agreement or its acceptance, unless they are express=
ly designated as such. If you are not the addressee, any disclosure, reprod=
uction, copying, distribution, or other dissemination or use of this commun=
ication is strictly prohibited. If you have received this transmission in e=
rror please notify CSOB immediately and then delete this e-mail. CSOB does =
not accept liability for the correct and complete transmission of the infor=
mation, nor for any delay or interruption of the transmission, nor for dama=
ges arising from the use of or reliance on the information. All e-mail mess=
ages addressed to, received or sent by CSOB or CSOB employees are deemed to=
 be professional in nature. Accordingly, the sender or recipient of these m=
essages agrees that they may be read by other CSOB employees than the offic=
ial recipient or sender in order to ensur &nbsp;e the continuity of work-re=
lated activities and allow supervision thereof.</body>
</html>

--_000_VI1PR05MB15032E32F70BEB2B14AABE56D1340VI1PR05MB1503eurp_--
