Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6THZsiu000310
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2011 13:35:54 -0400
Received: from cmiomail.amdocs.com (cmiomail.amdocs.com [68.77.114.71])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6THZpIF019952
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2011 13:35:51 -0400
Received: from USCMIMAILFE1.corp.amdocs.com (unknown [10.120.38.110])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by cmiomail.amdocs.com (Postfix) with ESMTPS id AC51FD813C
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2011 12:35:42 -0500 (CDT)
From: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>
Date: Fri, 29 Jul 2011 12:35:41 -0500
Message-ID: <883D98939E388E429EE8D771168A6560027ED144AF@USCMIMAIL1.corp.amdocs.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_883D98939E388E429EE8D771168A6560027ED144AFUSCMIMAIL1cor_"
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question, what is the first 384 cyclinder in the PV?
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


--_000_883D98939E388E429EE8D771168A6560027ED144AFUSCMIMAIL1cor_
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm sorry, I mean the first 384 sector.

I am using RHEL5.6 kernel 2.6.18-238.12.1.el5 and have  lvm2-2.02.74-5.el=
5. Here is my lvm.conf.
Can an application data exist here? Like oracle data..
For instance, if I dd out from a PV with bs=3D512 and count=3D384 and I s=
aw oracle data on it, is this ok?


Thanks,
Jewsco




From: Jewsco Pius Jacquez
Sent: Friday, July 29, 2011 11:13 AM
To: 'linux-lvm@redhat.com'
Subject: Question, what is the first 384 cyclinder in the PV?

Hello,

Any idea what is the first 512bytes 384 cylinder of a PV is designed or u=
sed for?
Can an ordinary application use it?

Thanks,
jewsco

This message and the information contained herein is proprietary and conf=
idential and subject to the Amdocs policy statement,
you may review at http://www.amdocs.com/email_disclaimer.asp

--_000_883D98939E388E429EE8D771168A6560027ED144AFUSCMIMAIL1cor_
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type c=
ontent=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=
=3D"Microsoft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:Tahoma;
=09panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
span.EmailStyle18
=09{mso-style-type:personal-reply;
=09font-family:"Calibri","sans-serif";
=09color:#1F497D;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:10.0pt;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue v=
link=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=
=3D'color:#1F497D'>I&#8217;m sorry, I mean the first 384 sector.<o:p></o:=
p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&nbs=
p;</o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'>I a=
m using RHEL5.6 kernel 2.6.18-238.12.1.el5 and have &nbsp;lvm2-2.02.74-5.=
el5. Here is my lvm.conf.<o:p></o:p></span></p><p class=3DMsoNormal><span=
 style=3D'color:#1F497D'>Can an application data exist here? Like oracle =
data..<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F=
497D'>For instance, if I dd out from a PV with bs=3D512 and count=3D384 a=
nd I saw oracle data on it, is this ok?<o:p></o:p></span></p><p class=3DM=
soNormal><span style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p cla=
ss=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p>=
<p class=3DMsoNormal><span style=3D'color:#1F497D'>Thanks,<br>Jewsco<o:p>=
</o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'><o:p>=
&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'=
><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1=
F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'co=
lor:#1F497D'><o:p>&nbsp;</o:p></span></p><div><div style=3D'border:none;b=
order-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNo=
rmal><b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"=
'>From:</span></b><span style=3D'font-size:10.0pt;font-family:"Tahoma","s=
ans-serif"'> Jewsco Pius Jacquez <br><b>Sent:</b> Friday, July 29, 2011 1=
1:13 AM<br><b>To:</b> 'linux-lvm@redhat.com'<br><b>Subject:</b> Question,=
 what is the first 384 cyclinder in the PV?<o:p></o:p></span></p></div></=
div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hello,=
<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNo=
rmal>Any idea what is the first 512bytes 384 cylinder of a PV is designed=
 or used for? <o:p></o:p></p><p class=3DMsoNormal>Can an ordinary applica=
tion use it?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p c=
lass=3DMsoNormal>Thanks,<br>jewsco<o:p></o:p></p></div></body></html>
<table><tr><td bgcolor=3D#ffffff><font color=3D#000000><pre>This message =
and the information contained herein is proprietary and confidential and =
subject to the Amdocs policy statement,
you may review at http://www.amdocs.com/email_disclaimer.asp</pre></font>=
</td></tr></table>

--_000_883D98939E388E429EE8D771168A6560027ED144AFUSCMIMAIL1cor_--
