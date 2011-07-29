Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6THe0Iv027865
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2011 13:40:00 -0400
Received: from cmiomail.amdocs.com (cmiomail.amdocs.com [68.77.114.71])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6THdvQO020847
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2011 13:39:57 -0400
Received: from USCMIMAILFE1.corp.amdocs.com (unknown [10.120.38.110])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by cmiomail.amdocs.com (Postfix) with ESMTPS id A6296D815A
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2011 12:38:52 -0500 (CDT)
From: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>
Date: Fri, 29 Jul 2011 12:38:50 -0500
Message-ID: <883D98939E388E429EE8D771168A6560027ED144B1@USCMIMAIL1.corp.amdocs.com>
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_"
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


--_004_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_
Content-Type: multipart/alternative;
	boundary="_000_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_"


--_000_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Forgot to attached. Here it is..

Thanks,
Jewsco

From: Jewsco Pius Jacquez
Sent: Friday, July 29, 2011 12:36 PM
To: 'linux-lvm@redhat.com'
Subject: RE: Question, what is the first 384 cyclinder in the PV?

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

--_000_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type"=
 CONTENT=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=
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
=09{mso-style-type:personal;
=09font-family:"Calibri","sans-serif";
=09color:#1F497D;}
span.EmailStyle19
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
=3D'color:#1F497D'>Forgot to attached. Here it is..<o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span style=3D'color:#1F497D'>Thanks,<br>Jewsc=
o<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'=
><o:p>&nbsp;</o:p></span></p><div><div style=3D'border:none;border-top:so=
lid #B5C4DF 1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNormal><b><spa=
n style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>From:</spa=
n></b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>=
 Jewsco Pius Jacquez <br><b>Sent:</b> Friday, July 29, 2011 12:36 PM<br><=
b>To:</b> 'linux-lvm@redhat.com'<br><b>Subject:</b> RE: Question, what is=
 the first 384 cyclinder in the PV?<o:p></o:p></span></p></div></div><p c=
lass=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span style=3D=
'color:#1F497D'>I&#8217;m sorry, I mean the first 384 sector.<o:p></o:p><=
/span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&nbsp;<=
/o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'>I am u=
sing RHEL5.6 kernel 2.6.18-238.12.1.el5 and have &nbsp;lvm2-2.02.74-5.el5=
. Here is my lvm.conf.<o:p></o:p></span></p><p class=3DMsoNormal><span st=
yle=3D'color:#1F497D'>Can an application data exist here? Like oracle dat=
a..<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497=
D'>For instance, if I dd out from a PV with bs=3D512 and count=3D384 and =
I saw oracle data on it, is this ok?<o:p></o:p></span></p><p class=3DMsoN=
ormal><span style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span style=3D'color:#1F497D'>Thanks,<br>Jewsco<o:p></=
o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F497D'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'color:#1F4=
97D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'colo=
r:#1F497D'><o:p>&nbsp;</o:p></span></p><div><div style=3D'border:none;bor=
der-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNorm=
al><b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>=
From:</span></b><span style=3D'font-size:10.0pt;font-family:"Tahoma","san=
s-serif"'> Jewsco Pius Jacquez <br><b>Sent:</b> Friday, July 29, 2011 11:=
13 AM<br><b>To:</b> 'linux-lvm@redhat.com'<br><b>Subject:</b> Question, w=
hat is the first 384 cyclinder in the PV?<o:p></o:p></span></p></div></di=
v><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hello,<o=
:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNorm=
al>Any idea what is the first 512bytes 384 cylinder of a PV is designed o=
r used for? <o:p></o:p></p><p class=3DMsoNormal>Can an ordinary applicati=
on use it?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p cla=
ss=3DMsoNormal>Thanks,<br>jewsco<o:p></o:p></p></div></body></html>
<table><tr><td bgcolor=3D#ffffff><font color=3D#000000><pre>This message =
and the information contained herein is proprietary and confidential and =
subject to the Amdocs policy statement,
you may review at http://www.amdocs.com/email_disclaimer.asp</pre></font>=
</td></tr></table>

--_000_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_--

--_004_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_
Content-Type: application/octet-stream; name="lvm.conf"
Content-Description: lvm.conf
Content-Disposition: attachment; filename="lvm.conf"; size=1292;
	creation-date="Fri, 29 Jul 2011 17:38:38 GMT";
	modification-date="Fri, 29 Jul 2011 17:12:12 GMT"
Content-Transfer-Encoding: base64

ZGV2aWNlcyB7CiAgICBkaXIgPSAiL2RldiIKICAgIHNjYW4gPSBbICIvZGV2IiBdCiAgICBwcmVm
ZXJyZWRfbmFtZXMgPSBbICJeL2Rldi9tYXBwZXIvIiBdCiAgICBmaWx0ZXIgPSBbICJhfC9kZXYv
bXBhdGgvLip8IiwgImF8L2Rldi9jY2lzcy9jMGQwKnwiLCAiYXwvZGV2L3NkYTIkfCIsICJyfC4q
fCIgXSAKICAgIGNhY2hlX2RpciA9ICIvZXRjL2x2bS9jYWNoZSIKICAgIGNhY2hlX2ZpbGVfcHJl
Zml4ID0gIiIKICAgIHdyaXRlX2NhY2hlX3N0YXRlID0gMQogICAgdHlwZXMgPSBbICJkZXZpY2Ut
bWFwcGVyIiwgMTYgXQogICAgc3lzZnNfc2NhbiA9IDEJCiAgICBtZF9jb21wb25lbnRfZGV0ZWN0
aW9uID0gMQogICAgaWdub3JlX3N1c3BlbmRlZF9kZXZpY2VzID0gMAp9CmxvZyB7CiAgICB2ZXJi
b3NlID0gMAogICAgc3lzbG9nID0gMQogICAgb3ZlcndyaXRlID0gMAogICAgbGV2ZWwgPSAwCiAg
ICAKICAgIGluZGVudCA9IDEKICAgIGNvbW1hbmRfbmFtZXMgPSAwCiAgICBwcmVmaXggPSAiICAi
Cn0KYmFja3VwIHsKICAgIGJhY2t1cCA9IDEKICAgIGJhY2t1cF9kaXIgPSAiL2V0Yy9sdm0vYmFj
a3VwIgogICAgYXJjaGl2ZSA9IDEKICAgIGFyY2hpdmVfZGlyID0gIi9ldGMvbHZtL2FyY2hpdmUi
CiAgICAKICAgIHJldGFpbl9taW4gPSAxMAogICAgcmV0YWluX2RheXMgPSAzMAp9CnNoZWxsIHsK
ICAgIGhpc3Rvcnlfc2l6ZSA9IDEwMAp9Cmdsb2JhbCB7CiAgICBsaWJyYXJ5X2RpciA9ICIvdXNy
L2xpYjY0IgogICAgCiAgICB1bWFzayA9IDA3NwogICAgdGVzdCA9IDAKICAgIHVuaXRzID0gImgi
CiAgICBhY3RpdmF0aW9uID0gMQogICAgcHJvYyA9ICIvcHJvYyIKICAgIGxvY2tpbmdfdHlwZSA9
IDEKICAgIGZhbGxiYWNrX3RvX2NsdXN0ZXJlZF9sb2NraW5nID0gMQogICAgZmFsbGJhY2tfdG9f
bG9jYWxfbG9ja2luZyA9IDEKICAgIGxvY2tpbmdfZGlyID0gIi92YXIvbG9jay9sdm0iCn0KYWN0
aXZhdGlvbiB7CiAgICBtaXNzaW5nX3N0cmlwZV9maWxsZXIgPSAiL2Rldi9pb2Vycm9yIgogICAg
cmVzZXJ2ZWRfc3RhY2sgPSAyNTYKICAgIHJlc2VydmVkX21lbW9yeSA9IDgxOTIKICAgIHByb2Nl
c3NfcHJpb3JpdHkgPSAtMTgKICAgIHZvbHVtZV9saXN0ID0gWyAidmcwMCIsICJ2Z19sb2NhbCIs
ICJ2Z19zd2FwIiwgIkBjbWlsNTYxaGIuYW1kb2NzLmNvbSIgXQogICAgbWlycm9yX3JlZ2lvbl9z
aXplID0gNTEyCiAgICBtaXJyb3JfbG9nX2ZhdWx0X3BvbGljeSA9ICJhbGxvY2F0ZSIKICAgIG1p
cnJvcl9kZXZpY2VfZmF1bHRfcG9saWN5ID0gInJlbW92ZSIKfQo=

--_004_883D98939E388E429EE8D771168A6560027ED144B1USCMIMAIL1cor_--
