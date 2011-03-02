Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p22DxGHp015593
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 08:59:16 -0500
Received: from ausc60pc101.us.dell.com (ausc60pc101.us.dell.com
	[143.166.85.206])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p22Dx79s030687
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 08:59:07 -0500
From: <Sunil_Gupta2@Dell.com>
Date: Wed, 2 Mar 2011 19:29:00 +0530
Message-ID: <8EF1FE59C3C8694E94F558EB27E464B71D13077BDB@BLRX7MCDC201.AMER.DELL.COM>
References: <8EF1FE59C3C8694E94F558EB27E464B71D13077773@BLRX7MCDC201.AMER.DELL.COM>
	<AANLkTi=aRLyp-hRKeYtac+OqYM7DVkOU3n2pRPaK9cQG@mail.gmail.com>
	<1e3b5c1a.1bae7.12e566608d1.Coremail.ooolinux@163.com>
	<41002623.77.12e6d4e1616.Coremail.ooolinux@163.com>
	<1ac54c2.a2e3.12e72596b2e.Coremail.ooolinux@163.com>
In-Reply-To: <1ac54c2.a2e3.12e72596b2e.Coremail.ooolinux@163.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8EF1FE59C3C8694E94F558EB27E464B71D13077BDBBLRX7MCDC201A_"
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
To: linux-lvm@redhat.com
Cc: pollochicken@gmail.com

--_000_8EF1FE59C3C8694E94F558EB27E464B71D13077BDBBLRX7MCDC201A_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

This should help

http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html-single/Cl=
uster_Administration/index.html


>>2.gfs2 need /etc/cluster/cluster.conf,and express membership.
but clvm  seem do not have a cluster conf??
so what to make sure  nodes are clvm cluster number?

If the cluster is setup and clvmd is running the VG created will be cluster=
ed VG that can be verified using vgs command and its options the attribute =
field will show =1B$B!F=1B(Bc=1B$B!G=1B(B which is for clustered VG=1B$B!D=
=1B(Bmore
Info is on vgs man page .

--Sunil

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of yue
Sent: Tuesday, March 01, 2011 10:26 PM
To: LVM general discussion and development
Cc: pollochicken@gmail.com
Subject: Re: [linux-lvm] if clvm based on rhcs?

1.there is few documents about cluster3,include http://sources.redhat.com/c=
luster/wiki/
do you know some where?
now i do not know what is redhat cluster?
2.gfs2 need /etc/cluster/cluster.conf,and express membership.
but clvm  seem do not have a cluster conf??
so what to make sure  nodes are clvm cluster number?
i guess  gfs2,clvm,need a cluster conf to conform membership?
3.if there can be  more than 1 cluster in cluster.conf? for example ,a clus=
ter for gfs2, another for clvm cluster?
4 if i am boring ,forgive me if so.

thanks.

At 2011-03-01 12:51:48=1B$B!$=1B(BSunil_Gupta2@dell.com wrote:

For gfs2 to be used it is good to use with the cluster but not necessarily =
check the release notes but if clvmd is used then cluster is necessary .

Cman is no more a kernel module but cman is the primary service which must =
be running to set up the cluster.

--Sunil

From: linux-lvm-bounces@redhat.com<mailto:linux-lvm-bounces@redhat.com> [ma=
ilto:linux-lvm-bounces@redhat.com<mailto:linux-lvm-bounces@redhat.com>] On =
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




--_000_8EF1FE59C3C8694E94F558EB27E464B71D13077BDBBLRX7MCDC201A_
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
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
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal>This should help=
 <o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNor=
mal><a href=3D"http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6=
/html-single/Cluster_Administration/index.html">http://docs.redhat.com/docs=
/en-US/Red_Hat_Enterprise_Linux/6/html-single/Cluster_Administration/index.=
html</a><o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=
=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-se=
rif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal>&gt;&g=
t;2.gfs2 need /etc/cluster/cluster.conf,and express membership.<o:p></o:p><=
/p><p class=3DMsoNormal>but clvm&nbsp; seem do not have a cluster conf??<o:=
p></o:p></p><p class=3DMsoNormal>so what to make sure&nbsp; nodes are clvm =
cluster number?<o:p></o:p></p><p class=3DMsoNormal><span style=3D'font-size=
:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p>=
</span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family=
:"Calibri","sans-serif";color:#1F497D'>If the cluster is setup and clvmd is=
 running the VG created will be clustered VG that can be verified using vgs=
 command and its options the attribute field will show =1B$B!F=1B(Bc=1B$B!G=
=1B(B which is for clustered VG=1B$B!D=1B(Bmore<o:p></o:p></span></p><p cla=
ss=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-=
serif";color:#1F497D'>Info is on vgs man page .<o:p></o:p></span></p><p cla=
ss=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-=
serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><spa=
n style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>--Sunil <o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-s=
ize:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o=
:p></span></p><p class=3DMsoNormal><b><span style=3D'font-size:10.0pt;font-=
family:"Tahoma","sans-serif"'>From:</span></b><span style=3D'font-size:10.0=
pt;font-family:"Tahoma","sans-serif"'> linux-lvm-bounces@redhat.com [mailto=
:linux-lvm-bounces@redhat.com] <b>On Behalf Of </b>yue<br><b>Sent:</b> Tues=
day, March 01, 2011 10:26 PM<br><b>To:</b> LVM general discussion and devel=
opment<br><b>Cc:</b> pollochicken@gmail.com<br><b>Subject:</b> Re: [linux-l=
vm] if clvm based on rhcs?<o:p></o:p></span></p><p class=3DMsoNormal><o:p>&=
nbsp;</o:p></p><div><p class=3DMsoNormal>1.there is few documents about clu=
ster3,include <a href=3D"http://sources.redhat.com/cluster/wiki/">http://so=
urces.redhat.com/cluster/wiki/</a><o:p></o:p></p></div><div><p class=3DMsoN=
ormal>do you know&nbsp;some where?<o:p></o:p></p></div><div><p class=3DMsoN=
ormal>now i do not know what is redhat cluster?<o:p></o:p></p></div><div><p=
 class=3DMsoNormal>2.gfs2 need /etc/cluster/cluster.conf,and express member=
ship.<o:p></o:p></p></div><div><p class=3DMsoNormal>but clvm&nbsp; seem do =
not have a cluster conf??<o:p></o:p></p></div><div><p class=3DMsoNormal>so =
what to make sure&nbsp; nodes are clvm cluster number?<o:p></o:p></p></div>=
<div><p class=3DMsoNormal>i guess&nbsp; gfs2,clvm,need a cluster conf to co=
nform membership?<o:p></o:p></p></div><div><p class=3DMsoNormal>3.if&nbsp;t=
here can be &nbsp;more than 1 cluster in&nbsp;cluster.conf? for example ,a =
cluster for gfs2, another for clvm cluster?<o:p></o:p></p></div><div><p cla=
ss=3DMsoNormal>4 if i am boring ,forgive me if so.<o:p></o:p></p></div><div=
><p class=3DMsoNormal>&nbsp;<o:p></o:p></p></div><div><p class=3DMsoNormal>=
thanks.<o:p></o:p></p></div><p class=3DMsoNormal><br>At 2011-03-01 12:51:48=
<span lang=3DZH-CN>=1B$B!$=1B(B</span>Sunil_Gupta2@dell.com wrote:<br><br><=
o:p></o:p></p><div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;ms=
o-margin-bottom-alt:auto'><span style=3D'font-size:11.0pt;font-family:"Cali=
bri","sans-serif";color:#1F497D'>For gfs2 to be used it is good to use with=
 the cluster but not necessarily check the release notes but if clvmd is us=
ed then cluster is necessary . </span><o:p></o:p></p><p class=3DMsoNormal s=
tyle=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span style=3D'=
font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>&nbsp;</=
span><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;m=
so-margin-bottom-alt:auto'><span style=3D'font-size:11.0pt;font-family:"Cal=
ibri","sans-serif";color:#1F497D'>Cman is no more a kernel module but cman =
is the primary service which must be running to set up the cluster.</span><=
o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-mar=
gin-bottom-alt:auto'><span style=3D'font-size:11.0pt;font-family:"Calibri",=
"sans-serif";color:#1F497D'>&nbsp;</span><o:p></o:p></p><p class=3DMsoNorma=
l style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span style=
=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>--Su=
nil </span><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:=
auto;mso-margin-bottom-alt:auto'><span style=3D'font-size:11.0pt;font-famil=
y:"Calibri","sans-serif";color:#1F497D'>&nbsp;</span><o:p></o:p></p><p clas=
s=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>=
<b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>From:=
</span></b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif=
"'> <a href=3D"mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces@redha=
t.com</a> [mailto:<a href=3D"mailto:linux-lvm-bounces@redhat.com">linux-lvm=
-bounces@redhat.com</a>] <b>On Behalf Of </b>yue<br><b>Sent:</b> Monday, Fe=
bruary 28, 2011 10:56 PM<br><b>To:</b> Alberto Rivera<br><b>Cc:</b> LVM gen=
eral discussion and development<br><b>Subject:</b> Re: [linux-lvm] if clvm =
based on rhcs?</span><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margi=
n-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></p><div><p cla=
ss=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'=
>1.my storage base on fc-san.<o:p></o:p></p></div><div><p class=3DMsoNormal=
 style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>i have to use=
 a dfs with cluster-sense,i am testing gfs2.<o:p></o:p></p></div><div><p cl=
ass=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto=
'>in order to resize storage space, i want to use clvm + gfs2.<o:p></o:p></=
p></div><div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-marg=
in-bottom-alt:auto'>i want to know if it is required to install redhat clus=
er,cluster-storage ? and create a cluster?<o:p></o:p></p></div><div><p clas=
s=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>=
&nbsp;<o:p></o:p></p></div><div><p class=3DMsoNormal style=3D'mso-margin-to=
p-alt:auto;mso-margin-bottom-alt:auto'>2.my kernel 2.6.32, fc12, cman-3.0.1=
7<o:p></o:p></p></div><div><p class=3DMsoNormal style=3D'mso-margin-top-alt=
:auto;mso-margin-bottom-alt:auto'>i find no cman.ko,if&nbsp;it do not need&=
nbsp;cman.ko anymore? <o:p></o:p></p></div><div><p class=3DMsoNormal style=
=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></=
p></div><div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-marg=
in-bottom-alt:auto'>thanks.<o:p></o:p></p></div><p class=3DMsoNormal style=
=3D'mso-margin-top-alt:auto;margin-bottom:12.0pt'><br>At 2011-02-25 11:39:1=
8<span lang=3DZH-CN>=1B$B!$=1B(B</span>&quot;Alberto&nbsp;Rivera&quot;&nbsp=
;&lt;<a href=3D"mailto:pollochicken@gmail.com">pollochicken@gmail.com</a>&g=
t; wrote:<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:au=
to;margin-bottom:12.0pt'>&nbsp;<o:p></o:p></p><div><p class=3DMsoNormal sty=
le=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>2011/2/24 yue &lt=
;<a href=3D"mailto:ooolinux@163.com">ooolinux@163.com</a>&gt;<o:p></o:p></p=
><div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bott=
om-alt:auto'>i use san ,&nbsp; clvm based on san.<o:p></o:p></p></div><div>=
<p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt=
:auto'>if i have to install rhcs ,if i want to use clvm?<o:p></o:p></p></di=
v><div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto'>&nbsp;<o:p></o:p></p></div><div><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>thanks.<o:p></o:p></p>=
</div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bott=
om-alt:auto'>&nbsp;<o:p></o:p></p><div><p class=3DMsoNormal style=3D'mso-ma=
rgin-top-alt:auto;mso-margin-bottom-alt:auto'><br><br>Hello,<br><br>Can you=
 be a bit more specific with your request ?&nbsp;&nbsp; Are asking how to y=
ou use clvm in RHCS ?&nbsp;&nbsp;&nbsp; Whether you are using san, or any o=
ther method of external storage, you require to have the lvm2-cluster rpms =
in order to be able to use clvm with RHCS.<br><br><br>&nbsp;_______________=
________________________________<o:p></o:p></p></div><blockquote style=3D'b=
order:none;border-left:solid #CCCCCC 1.0pt;padding:0in 0in 0in 6.0pt;margin=
-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt'><p class=
=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>l=
inux-lvm mailing list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@=
redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-=
lvm" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a=
><br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" ta=
rget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><o:p></o:p></p></blockq=
uote></div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin=
-bottom-alt:auto'>&nbsp;<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-ma=
rgin-top-alt:auto;margin-bottom:12.0pt'>&nbsp;<o:p></o:p></p></div><p class=
=3DMsoNormal style=3D'margin-bottom:12.0pt'><o:p>&nbsp;</o:p></p></div></bo=
dy></html>=

--_000_8EF1FE59C3C8694E94F558EB27E464B71D13077BDBBLRX7MCDC201A_--
