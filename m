Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4V5aXBA025407
	for <linux-lvm@redhat.com>; Thu, 31 May 2012 01:36:33 -0400
Received: from Exchange2010.corit.local (mail.base3.com.au [27.106.198.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4V5aULe024210
	for <linux-lvm@redhat.com>; Thu, 31 May 2012 01:36:31 -0400
From: Matthew Anderson <matthewa@base3.com.au>
Date: Thu, 31 May 2012 05:36:26 +0000
Message-ID: <FB833AE6C7173C449F93C243719A4C8F96FF7B2E@Exchange2010.corit.local>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_FB833AE6C7173C449F93C243719A4C8F96FF7B2EExchange2010cor_"
MIME-Version: 1.0
Subject: [linux-lvm] Thin provisioning on a cluster
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

--_000_FB833AE6C7173C449F93C243719A4C8F96FF7B2EExchange2010cor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I sifted through the mailing list and wasn't able to find if thin provision=
ing can be used with clustering, is anyone able to confirm?

I found a reference in the RHEL 6.3 beta docs saying thinp snapshots can't =
be used when clustered so I'm not sure if this affects making thinly provis=
ioned logical volumes. I was hoping to use lvm2 over my KVM cluster (one LV=
 per VM, no shared volumes at all, PV's using SRP) so I'm able to overcommi=
t storage and keep it as close to bare metal as possible. Snapshots aren't =
important at this stage.

Thanks for your time
-Matt

--_000_FB833AE6C7173C449F93C243719A4C8F96FF7B2EExchange2010cor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-AU" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I sifted through the mailing list and wasn&#8217;t a=
ble to find if thin provisioning can be used with clustering, is anyone abl=
e to confirm?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I found a reference in the RHEL 6.3 beta docs saying=
 thinp snapshots can&#8217;t be used when clustered so I&#8217;m not sure i=
f this affects making thinly provisioned logical volumes. I was hoping to u=
se lvm2 over my KVM cluster (one LV per VM, no
 shared volumes at all, PV&#8217;s using SRP) so I&#8217;m able to overcomm=
it storage and keep it as close to bare metal as possible. Snapshots aren&#=
8217;t important at this stage.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your time<o:p></o:p></p>
<p class=3D"MsoNormal">-Matt<o:p></o:p></p>
</div>
</body>
</html>

--_000_FB833AE6C7173C449F93C243719A4C8F96FF7B2EExchange2010cor_--
