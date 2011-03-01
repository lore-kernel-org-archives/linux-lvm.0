Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p214q0j7016080
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2011 23:52:01 -0500
Received: from ausc60pc101.us.dell.com (ausc60pc101.us.dell.com
	[143.166.85.206])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p214pqZk024055
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2011 23:51:52 -0500
From: <Sunil_Gupta2@Dell.com>
Date: Mon, 28 Feb 2011 20:51:48 -0800
Message-ID: <8EF1FE59C3C8694E94F558EB27E464B71D13077773@BLRX7MCDC201.AMER.DELL.COM>
References: <AANLkTi=aRLyp-hRKeYtac+OqYM7DVkOU3n2pRPaK9cQG@mail.gmail.com>
	<1e3b5c1a.1bae7.12e566608d1.Coremail.ooolinux@163.com>
	<41002623.77.12e6d4e1616.Coremail.ooolinux@163.com>
In-Reply-To: <41002623.77.12e6d4e1616.Coremail.ooolinux@163.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8EF1FE59C3C8694E94F558EB27E464B71D13077773BLRX7MCDC201A_"
MIME-Version: 1.0
Subject: Re: [linux-lvm] if clvm based on rhcs?
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
To: linux-lvm@redhat.com, pollochicken@gmail.com

--_000_8EF1FE59C3C8694E94F558EB27E464B71D13077773BLRX7MCDC201A_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

For gfs2 to be used it is good to use with the cluster but not necessarily =
check the release notes but if clvmd is used then cluster is necessary .

Cman is no more a kernel module but cman is the primary service which must =
be running to set up the cluster.

--Sunil

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of yue
Sent: Monday, February 28, 2011 10:56 PM
To: Alberto Rivera
Cc: LVM general discussion and development
Subject: Re: [linux-lvm] if clvm based on rhcs?

1.my storage base on fc-san.
i have to use a dfs with cluster-sense,i am testing gfs2.
in order to resize storage space, i want to use clvm + gfs2.
i want to know if it is required to install redhat cluser,cluster-storage ?=
 and create a cluster?

2.my kernel 2.6.32, fc12, cman-3.0.17
i find no cman.ko,if it do not need cman.ko anymore?

thanks.

At 2011-02-25 11:39:18=1B$B!$=1B(B"Alberto Rivera" <pollochicken@gmail.com<=
mailto:pollochicken@gmail.com>> wrote:


2011/2/24 yue <ooolinux@163.com<mailto:ooolinux@163.com>>
i use san ,  clvm based on san.
if i have to install rhcs ,if i want to use clvm?

thanks.



Hello,

Can you be a bit more specific with your request ?   Are asking how to you =
use clvm in RHCS ?    Whether you are using san, or any other method of ext=
ernal storage, you require to have the lvm2-cluster rpms in order to be abl=
e to use clvm with RHCS.


 _______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com<mailto:linux-lvm@redhat.com>
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--_000_8EF1FE59C3C8694E94F558EB27E464B71D13077773BLRX7MCDC201A_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Diso-2022-jp"><meta name=3DGenerator content=3D"Mic=
rosoft Word 14 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
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
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>For gfs2 =
to be used it is good to use with the cluster but not necessarily check the=
 release notes but if clvmd is used then cluster is necessary . <o:p></o:p>=
</span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family=
:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-se=
rif";color:#1F497D'>Cman is no more a kernel module but cman is the primary=
 service which must be running to set up the cluster.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri",=
"sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorma=
l><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:=
#1F497D'>--Sunil <o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'=
font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nb=
sp;</o:p></span></p><p class=3DMsoNormal><b><span style=3D'font-size:10.0pt=
;font-family:"Tahoma","sans-serif"'>From:</span></b><span style=3D'font-siz=
e:10.0pt;font-family:"Tahoma","sans-serif"'> linux-lvm-bounces@redhat.com [=
mailto:linux-lvm-bounces@redhat.com] <b>On Behalf Of </b>yue<br><b>Sent:</b=
> Monday, February 28, 2011 10:56 PM<br><b>To:</b> Alberto Rivera<br><b>Cc:=
</b> LVM general discussion and development<br><b>Subject:</b> Re: [linux-l=
vm] if clvm based on rhcs?<o:p></o:p></span></p><p class=3DMsoNormal><o:p>&=
nbsp;</o:p></p><div><p class=3DMsoNormal>1.my storage base on fc-san.<o:p><=
/o:p></p></div><div><p class=3DMsoNormal>i have to use a dfs with cluster-s=
ense,i am testing gfs2.<o:p></o:p></p></div><div><p class=3DMsoNormal>in or=
der to resize storage space, i want to use clvm + gfs2.<o:p></o:p></p></div=
><div><p class=3DMsoNormal>i want to know if it is required to install redh=
at cluser,cluster-storage ? and create a cluster?<o:p></o:p></p></div><div>=
<p class=3DMsoNormal>&nbsp;<o:p></o:p></p></div><div><p class=3DMsoNormal>2=
.my kernel 2.6.32, fc12, cman-3.0.17<o:p></o:p></p></div><div><p class=3DMs=
oNormal>i find no cman.ko,if&nbsp;it do not need&nbsp;cman.ko anymore? <o:p=
></o:p></p></div><div><p class=3DMsoNormal>&nbsp;<o:p></o:p></p></div><div>=
<p class=3DMsoNormal>thanks.<o:p></o:p></p></div><p class=3DMsoNormal><br>A=
t 2011-02-25 11:39:18<span lang=3DZH-CN>=1B$B!$=1B(B</span>&quot;Alberto&nb=
sp;Rivera&quot;&nbsp;&lt;<a href=3D"mailto:pollochicken@gmail.com">pollochi=
cken@gmail.com</a>&gt; wrote:<br><br><o:p></o:p></p><p class=3DMsoNormal st=
yle=3D'margin-bottom:12.0pt'><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal=
>2011/2/24 yue &lt;<a href=3D"mailto:ooolinux@163.com">ooolinux@163.com</a>=
&gt;<o:p></o:p></p><div><p class=3DMsoNormal>i use san ,&nbsp; clvm based o=
n san.<o:p></o:p></p></div><div><p class=3DMsoNormal>if i have to install r=
hcs ,if i want to use clvm?<o:p></o:p></p></div><div><p class=3DMsoNormal>&=
nbsp;<o:p></o:p></p></div><div><p class=3DMsoNormal>thanks.<o:p></o:p></p><=
/div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal><b=
r><br>Hello,<br><br>Can you be a bit more specific with your request ?&nbsp=
;&nbsp; Are asking how to you use clvm in RHCS ?&nbsp;&nbsp;&nbsp; Whether =
you are using san, or any other method of external storage, you require to =
have the lvm2-cluster rpms in order to be able to use clvm with RHCS.<br><b=
r><br>&nbsp;_______________________________________________<o:p></o:p></p><=
/div><blockquote style=3D'border:none;border-left:solid #CCCCCC 1.0pt;paddi=
ng:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in'><p class=3DMsoNorm=
al>linux-lvm mailing list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-=
lvm@redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/li=
nux-lvm" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lv=
m</a><br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/=
" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><o:p></o:p></p></bl=
ockquote></div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNorm=
al style=3D'margin-bottom:12.0pt'><o:p>&nbsp;</o:p></p></div></body></html>=

--_000_8EF1FE59C3C8694E94F558EB27E464B71D13077773BLRX7MCDC201A_--
