From: "John Cassidy" <Sean@JDCassidy.net>
Subject: RE: [linux-lvm] Kernel 2.6.1 and LVM2
Message-ID: <000c01c3e4b9$67f862c0$9722fea9@terence>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C3E4C1.C9BCCAC0"
In-Reply-To: <20040125213120.GA32013@redhat.com>
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
Date: Wed Jan 28 10:46:20 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_000D_01C3E4C1.C9BCCAC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Heinz,

=20

     the fedora development URL:=20

=20

ftp://download.fedora.redhat.com/pub/fedora/linux/core/development=20

=20

has the initscripts-7.43-2.i386.rpm, which has specific LVM2 code, I =
tried
this yesterday, and it seems to work. Grazie to Luca Barra for this tip.

=20

Danke,

=20

John

=20

=20

Regards/Cordialement/Gruss/Saludos=20

=20

John Cassidy Dipl.-Ing (Informatique)

=20

S390 & zSeries Systems Engineering

=20

Schleswigstr. 7

=20

D-51065 Cologne

=20

EU

=20

Tel: +49  (0) 221 61 60 777 . GSM: +49  (0) 177 799 58 56=20

=20

E-Mail: Sean@JDCassidy.net=20

=20

HTTP : www.jdcassidy.net=20

=20

 =20

=20

=20

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] =
On
Behalf Of Heinz Mauelshagen
Sent: 25 January 2004 22:31
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Kernel 2.6.1 and LVM2

=20

=20

Hi John,

=20

you can essentially reuse the /etc/rc.d/rc.sysinit startup

of Red Hat Linux for LVM1.

Maybe you can feed that back to Fedora development ?

=20

Regards,

Heinz    -- The LVM Guy --

=20

=20

en Sat, Jan 24, 2004 at 10:22:51AM +0100, John Cassidy wrote:

> Heinz,

>=20

> =20

>=20

>         on the above kernel, all of the necessary steps have been =
taken to

> get LVM2 to function.

>=20

> =20

>=20

> My problem is I want an appropriate startup script to initiate and =
halt

> LVM2 at startup and shutdown.

>=20

> =20

>=20

> Distribution is RH Fedora with kernel 2.6.1.

>=20

> =20

>=20

> Any ideas?

>=20

> =20

>=20

> Im voraus..   =20

>=20

> =20

>=20

> Regards/Cordialement/Gruss/Saludos=20

>=20

> John Cassidy Dipl.-Ing (Informatique)

>=20

> S390 & zSeries Systems Engineering

>=20

> Schleswigstr. 7

>=20

> D-51065 Cologne

>=20

> EU

>=20

> Tel: +49  (0) 221 61 60 777 . GSM: +49  (0) 177 799 58 56=20

>=20

> E-Mail: Sean@JDCassidy.net  <mailto:Sean@JDCassidy.net>=20

>=20

> HTTP :

>
<file:///H:\Documents%20and%20Settings\Horace\Application%20Data\Microsof=
t\S

> ignatures\www.jdcassidy.net> www.jdcassidy.net=20

>=20

>   =20

>=20

> =20

>=20

=20

*** Software bugs are stupid.

    Nevertheless it needs not so stupid people to solve them ***

=20

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-

=20

Heinz Mauelshagen                                 Red Hat, Inc.

Consulting Development Engineer                   Am Sonnenhang 11

                                                  56242 Marienrachdorf

                                                  Germany

Mauelshagen@RedHat.com                            +49 2626 141200

                                                       FAX 924446

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-

=20

_______________________________________________

linux-lvm mailing list

linux-lvm@sistina.com

http://lists.sistina.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


------=_NextPart_000_000D_01C3E4C1.C9BCCAC0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:#004080;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 77.95pt 72.0pt 77.95pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-GB link=3Dblue vlink=3D"#004080">

<div class=3DSection1>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Heinz,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;&nbsp;&nbsp;&nbsp; the fedora development URL: =
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><u><font size=3D2 color=3Dblue face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:blue'>ftp://download.fedora.redhat.com/pu=
b/fedora/linux/core/development
</span></font></u></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>has the <u>initscripts-7.43-2.i386.rpm</u>, which has specific =
LVM2
code, I tried this yesterday, and it seems to work. Grazie to Luca Barra =
for
this tip.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Danke,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>John</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>Regards/Cordialement/Gruss/Saludos =
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>John Cassidy Dipl.-Ing =
(Informatique)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>S390 &amp; zSeries Systems Engineering</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Schleswigstr. </span></font><span lang=3DFR>7</span></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>D-51065 Cologne</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>EU</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>Tel: +49&nbsp; (0) 221 61 60 777 &middot; =
GSM:
+49&nbsp; (0) 177 799 58 56 </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DFR
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>E-Mail: </span></font>Sean@JDCassidy.net </p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>HTTP : www.jdcassidy.net </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt'>-----Original Message-----<br>
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] =
On
Behalf Of Heinz Mauelshagen<br>
Sent: 25 January 2004 22:31<br>
To: linux-lvm@sistina.com<br>
Subject: Re: [linux-lvm] Kernel 2.6.1 and LVM2</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Hi John,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>you can essentially reuse the /etc/rc.d/rc.sysinit =
startup</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>of Red Hat Linux for LVM1.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Maybe you can feed that back to Fedora development =
?</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Regards,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Heinz&nbsp;&nbsp;&nbsp; -- The LVM Guy --</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>en Sat, Jan 24, 2004 at 10:22:51AM +0100, John Cassidy =
wrote:</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Heinz,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on the =
above
kernel, all of the necessary steps have been taken to</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; get LVM2 to function.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; My problem is I want an appropriate startup script to =
initiate and
halt</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; LVM2 at startup and shutdown.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Distribution is RH Fedora with kernel =
2.6.1.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Any ideas?</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Im voraus..&nbsp;&nbsp;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Regards/Cordialement/Gruss/Saludos </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; John Cassidy Dipl.-Ing (Informatique)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; S390 &amp; zSeries Systems Engineering</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Schleswigstr. 7</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; D-51065 Cologne</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; EU</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Tel: +49&nbsp; (0) 221 61 60 777 . GSM: +49&nbsp; (0) 177 =
799 58
56 </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; E-Mail: Sean@JDCassidy.net&nbsp; =
&lt;mailto:Sean@JDCassidy.net&gt;
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; HTTP :</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;
&lt;file:///H:\Documents%20and%20Settings\Horace\Application%20Data\Micro=
soft\S</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; ignatures\www.jdcassidy.net&gt; www.jdcassidy.net =
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>*** Software bugs are stupid.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;&nbsp;&nbsp; Nevertheless it needs not so stupid people to =
solve
them ***</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Heinz
Mauelshagen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Red Hat, Inc.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Consulting Development
Engineer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Am Sonnenhang 11</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
56242 Marienrachdorf</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
Germany</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Mauelshagen@RedHat.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
+49 2626 141200</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
FAX 924446</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>_______________________________________________</span></font></p>=


<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>linux-lvm mailing list</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>linux-lvm@sistina.com</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>http://lists.sistina.com/mailman/listinfo/linux-lvm</span></font>=
</p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_000D_01C3E4C1.C9BCCAC0--
