content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C37C45.E08D4619"
Message-ID: <E1C82FD242FD6243B93A98A1F6BE6B100AA03F@SBCOR23A.es.gasnatural.com>
From: "Bernat Covacho, Jose Maria" <jmbernat@gasnatural.com>
Subject: [linux-lvm] I:LVM Raw Oracle 9i RAC
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
Date: Tue Sep 16 08:18:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C37C45.E08D4619
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello, we have a RedHat Avanced Server 2.1 with kernel version 2.4.9-e.12=
smp and we use lvm version 1.0.3 (yes I know that the latest "one" versio=
n is 1.0.7). I think that the version 2 is too much advanced for us. 
 
=
We have a very strange problem with lvm, oracle and raw devices. If we ta=
ke a logical volume manager and test it with a simple dd we get:
 
----=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
----------------
time dd if=3D/dev/MKTP/strip32 of=3D/dev/null bs=3D512k=
 count=3D2048 
2048+0 registros le=EDdos
2048+0 registros escritos
 
=
real    0m13.394s
user    0m0.000s
sys     0m6.090s
------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
--
 
Ok, It works fine, we have 1Gbyte in 13 seconds.
 
Now we bind t=
his logical volume to a raw device
 
----------------------------------=
-------------------------------------------------------------------------=
-----------------------------------------------------------
raw /dev/MKT=
P/strip32 /dev/raw/raw15
-----------------------------------------------=
-------------------------------------------------------------------------=
----------------------------------------------
 
and we try with this:
=
 
----------------------------------------------------------------------=
-------------------------------------------------------------------------=
-----------------------
time dd if=3D/dev/raw/raw15  of=3D/dev/null bs=3D=
512k count=3D2048 
2048+0 registros le=EDdos
2048+0 registros escritos
=
 
real    0m14.828s
user    0m0.020s
sys     0m6.180s
---------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-----
 
The same time, more or less, all it's ok. 
 
Now we want use =
this raw (raw15) with oracle. We create a oracle tablespace put data into=
. We can access it through oracle.
 
We stop oracle. Now we repeat the =
same dd:
 
------------------------------------------------------------=
-------------------------------------------------------------------------=
---------------------------------
time dd if=3D/dev/raw/raw15 of=3D/dev/=
null bs=3D512k count=3D2048
2048+0 registros le=EDdos
2048+0 registros =
escritos
 
real    0m48.971s
user    0m0.010s
sys     0m11.590s
----=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
----------------
 
Now we have 48 seconds, why?, The only one differenc=
e is the tablespace creation.
 
We try the same process without lvm and=
 we have the same good time in three cases.
 
There are some problem wi=
th lvm, raw and oracle?
How can I avoid this?
 
Thanks in advanced
 
=
 
 
 
 
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Esta informa=
ci=F3n es privada y confidencial y est=E1 dirigida =FAnicamente a su dest=
inatario. Si usted no es el destinatario original de este mensaje y por e=
ste medio pudo acceder a dicha informaci=F3n por favor elimine el mensaje=
 y notifique el env=EDo err=F3neo al remitente. La distribuci=F3n o copia=
 de este mensaje est=E1 estrictamente prohibida. Esta comunicaci=F3n es s=
=F3lo para prop=F3sitos de informaci=F3n y no deber=EDa ser considerada c=
omo una declaraci=F3n oficial del Grupo gasNatural. La transmisi=F3n de e=
-mails no garantiza que el correo electr=F3nico sea seguro. Por consiguie=
nte, no manifestamos que esta informaci=F3n sea completa o precisa. Toda =
informaci=F3n est=E1 sujeta a alterarse sin previo aviso. Este Correo Ele=
ctr=F3nico ha sido procesado por nuestro sistema de Antivirus corporativo=
 

 This information is private and confidential and intended for the r=
ecipient only. If you are not the intended recipient of this message you =
are hereby notified that any review it and notify the sender immediately,=
 dissemination, distribution or copying of this message is strictly prohi=
bited.  This communication is for information purposes only and should no=
t be regarded as an official statement from gasNatural Group. Email trans=
mission cannot be guaranteed to be secure.  Therefore, we do not represen=
t that this information is complete or accurate and it should not be reli=
ed upon as such.All information is subject to change without notice. This=
 email has been scanned by our Antivirus system


------_=_NextPart_001_01C37C45.E08D4619
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:=
schemas-microsoft-com:office:word" xmlns=3D"http://www.w3.org/TR/REC-html=
40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; cha=
rset=3Diso-8859-1">
<meta name=3DProgId content=3DWord.Document>
<meta =
name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator =
content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelis=
t.xml@01C37C58.32366DE0">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSe=
ttings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![en=
dif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Cl=
ean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:Doc=
umentKind>DocumentEmail</w:DocumentKind>
  <w:HyphenationZone>21</w:Hyph=
enationZone>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrapped=
Tables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseA=
sianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftIntern=
etExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<st=
yle>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.Mso=
Normal
	{mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	m=
so-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:Arial;
	ms=
o-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times Ne=
w Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:un=
derline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
=
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
s=
pan.EstiloCorreo17
	{mso-style-type:personal-compose;
	mso-style-noshow=
:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-fa=
mily:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;=

	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-s=
tyle-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-g=
ram-e:yes;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 3.0=
cm 70.85pt 3.0cm;
	mso-header-margin:35.4pt;
	mso-footer-margin:35.4pt;=

	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
=
<!--[if gte mso 10]>
<style>
 /* Style Definitions */ 
 table.MsoNorma=
lTable
	{mso-style-name:"Tabla normal";
	mso-tstyle-rowband-size:0;
	m=
so-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
=
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-m=
argin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
=
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<bod=
y lang=3DES link=3Dblue vlink=3Dpurple style=3D'tab-interval:35.4pt'>

=
<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DAria=
l><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-family:Ari=
al;mso-ansi-language:EN-GB'>Hello, we have a
RedHat Avanced Server 2.1 w=
ith kernel version 2.4.9-e.12smp and we use lvm
version 1.0.3 (yes I kno=
w that the latest &quot;one&quot; version is 1.0.7). I
think that the ve=
rsion 2 is too much advanced for us. </span></font><font
face=3D"Times N=
ew Roman"><span lang=3DEN-GB style=3D'font-family:"Times New Roman";
mso=
-ansi-language:EN-GB'><o:p></o:p></span></font></p>

<p class=3DMsoNorm=
al><font size=3D3 face=3D"Times New Roman"><span lang=3DEN-GB
style=3D'f=
ont-size:12.0pt;font-family:"Times New Roman";mso-ansi-language:EN-GB'>&n=
bsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 =
face=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font=
-family:Arial;mso-ansi-language:EN-GB'>We have a very strange
problem wi=
th lvm, oracle and raw devices. If we take a logical volume manager
and =
test it with a simple dd we get:</span></font><font face=3D"Times New Rom=
an"><span
lang=3DEN-GB style=3D'font-family:"Times New Roman";mso-ansi-l=
anguage:EN-GB'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><fon=
t size=3D3 face=3D"Times New Roman"><span lang=3DEN-GB
style=3D'font-siz=
e:12.0pt;font-family:"Times New Roman";mso-ansi-language:EN-GB'>&nbsp;<o:=
p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D=
Arial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-family=
:Arial;mso-ansi-language:EN-GB'>-----------------------------------------=
-------------------------------------------------------------------------=
----------------------------------------------------</span></font><font
=
face=3D"Times New Roman"><span lang=3DEN-GB style=3D'font-family:"Times N=
ew Roman";
mso-ansi-language:EN-GB'><o:p></o:p></span></font></p>

<p =
class=3DMsoNormal><span class=3DGramE><font size=3D2 face=3DArial><span l=
ang=3DEN-GB
style=3D'font-size:10.0pt;mso-bidi-font-family:Arial;mso-ans=
i-language:EN-GB'>time</span></font></span><font
size=3D2><span lang=3DE=
N-GB style=3D'font-size:10.0pt;mso-bidi-font-family:Arial;
mso-ansi-lang=
uage:EN-GB'> dd if=3D/dev/MKTP/strip32 of=3D/dev/null bs=3D512k
count=3D=
2048 <br>
2048+0 registros le=EDdos<br>
2048+0 registros escritos</span=
></font><font face=3D"Times New Roman"><span
lang=3DEN-GB style=3D'font-=
family:"Times New Roman";mso-ansi-language:EN-GB'><o:p></o:p></span></fon=
t></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><s=
pan lang=3DEN-GB
style=3D'font-size:12.0pt;font-family:"Times New Roman"=
;mso-ansi-language:EN-GB'>&nbsp;<o:p></o:p></span></font></p>

<p class=
=3DMsoNormal><span class=3DGramE><font size=3D2 face=3DArial><span lang=3D=
EN-GB
style=3D'font-size:10.0pt;mso-bidi-font-family:Arial;mso-ansi-lang=
uage:EN-GB'>real</span></font></span><font
size=3D2><span lang=3DEN-GB s=
tyle=3D'font-size:10.0pt;mso-bidi-font-family:Arial;
mso-ansi-language:E=
N-GB'>&nbsp;&nbsp;&nbsp; 0m13.394s<br>
<span class=3DGramE>user</span>&n=
bsp;&nbsp;&nbsp; 0m0.000s<br>
<span class=3DGramE>sys</span>&nbsp;&nbsp;=
&nbsp;&nbsp; 0m6.090s</span></font><font
face=3D"Times New Roman"><span =
lang=3DEN-GB style=3D'font-family:"Times New Roman";
mso-ansi-language:E=
N-GB'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D=
2 face=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-fo=
nt-family:Arial;mso-ansi-language:EN-GB'>--------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------</span></fon=
t><font
face=3D"Times New Roman"><span lang=3DEN-GB style=3D'font-family=
:"Times New Roman";
mso-ansi-language:EN-GB'><o:p></o:p></span></font></=
p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-GB
style=3D'font-size:12.0pt;font-family:"Times New Roman";mso=
-ansi-language:EN-GB'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DM=
soNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-siz=
e:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>Ok, <span
=
class=3DGramE>It</span> works&nbsp;fine, we have 1Gbyte in 13 seconds.</s=
pan></font><font
face=3D"Times New Roman"><span lang=3DEN-GB style=3D'fo=
nt-family:"Times New Roman";
mso-ansi-language:EN-GB'><o:p></o:p></span>=
</font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roma=
n"><span lang=3DEN-GB
style=3D'font-size:12.0pt;font-family:"Times New R=
oman";mso-ansi-language:EN-GB'>&nbsp;<o:p></o:p></span></font></p>

<p =
class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=3D=
'font-size:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>N=
ow we bind this
logical volume to a raw device</span></font><font face=3D=
"Times New Roman"><span
lang=3DEN-GB style=3D'font-family:"Times New Rom=
an";mso-ansi-language:EN-GB'><o:p></o:p></span></font></p>

<p class=3D=
MsoNormal><font size=3D3 face=3D"Times New Roman"><span lang=3DEN-GB
sty=
le=3D'font-size:12.0pt;font-family:"Times New Roman";mso-ansi-language:EN=
-GB'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font si=
ze=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bi=
di-font-family:Arial;mso-ansi-language:EN-GB'>---------------------------=
-------------------------------------------------------------------------=
------------------------------------------------------------------</span>=
</font><font
face=3D"Times New Roman"><span lang=3DEN-GB style=3D'font-f=
amily:"Times New Roman";
mso-ansi-language:EN-GB'><o:p></o:p></span></fo=
nt></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 face=3D=
Arial><span lang=3DEN-GB
style=3D'font-size:10.0pt;mso-bidi-font-family:=
Arial;mso-ansi-language:EN-GB'>raw</span></font></span><font
size=3D2><s=
pan lang=3DEN-GB style=3D'font-size:10.0pt;mso-bidi-font-family:Arial;
m=
so-ansi-language:EN-GB'> /dev/MKTP/strip32 /dev/raw/raw15</span></font><f=
ont
face=3D"Times New Roman"><span lang=3DEN-GB style=3D'font-family:"Ti=
mes New Roman";
mso-ansi-language:EN-GB'><o:p></o:p></span></font></p>
=

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB sty=
le=3D'font-size:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-=
GB'>---------------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------</span></font><font
face=3D"Times New Roman"><sp=
an lang=3DEN-GB style=3D'font-family:"Times New Roman";
mso-ansi-languag=
e:EN-GB'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=
=3D3 face=3D"Times New Roman"><span lang=3DEN-GB
style=3D'font-size:12.0=
pt;font-family:"Times New Roman";mso-ansi-language:EN-GB'>&nbsp;<o:p></o:=
p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font si=
ze=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;mso-bid=
i-font-family:Arial;mso-ansi-language:EN-GB'>and</span></font></span><fon=
t
size=3D2><span lang=3DEN-GB style=3D'font-size:10.0pt;mso-bidi-font-fa=
mily:Arial;
mso-ansi-language:EN-GB'> we try with this:</span></font><fo=
nt
face=3D"Times New Roman"><span lang=3DEN-GB style=3D'font-family:"Tim=
es New Roman";
mso-ansi-language:EN-GB'><o:p></o:p></span></font></p>

=
<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span lang=3D=
EN-GB
style=3D'font-size:12.0pt;font-family:"Times New Roman";mso-ansi-l=
anguage:EN-GB'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNorma=
l><font size=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-size:
10.=
0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>-----------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGr=
amE><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10=
.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>time</span></fon=
t></span><font
size=3D2><span lang=3DEN-GB style=3D'font-size:10.0pt;mso=
-bidi-font-family:Arial;
mso-ansi-language:EN-GB'> dd if=3D/dev/raw/raw1=
5&nbsp; of=3D/dev/null bs=3D512k
count=3D2048 <br>
2048+0 registros le=ED=
dos<br>
2048+0 registros escritos</span></font><font face=3D"Times New R=
oman"><span
lang=3DEN-GB style=3D'font-family:"Times New Roman";mso-ansi=
-language:EN-GB'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><f=
ont size=3D3 face=3D"Times New Roman"><span lang=3DEN-GB
style=3D'font-s=
ize:12.0pt;font-family:"Times New Roman";mso-ansi-language:EN-GB'>&nbsp;<=
o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE>=
<font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt=
;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>real</span></font></=
span><font
size=3D2><span lang=3DEN-GB style=3D'font-size:10.0pt;mso-bid=
i-font-family:Arial;
mso-ansi-language:EN-GB'>&nbsp;&nbsp;&nbsp; 0m14.82=
8s<br>
<span class=3DGramE>user</span>&nbsp;&nbsp;&nbsp; 0m0.020s<br>
<=
span class=3DGramE>sys</span>&nbsp;&nbsp;&nbsp;&nbsp; 0m6.180s</span></fo=
nt><font
face=3D"Times New Roman"><span lang=3DEN-GB style=3D'font-famil=
y:"Times New Roman";
mso-ansi-language:EN-GB'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-G=
B style=3D'font-size:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-languag=
e:EN-GB'>----------------------------------------------------------------=
-------------------------------------------------------------------------=
-----------------------------<o:p></o:p></span></font></p>

<p class=3D=
MsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-si=
ze:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>&nbsp;<o:=
p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D=
Arial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-family=
:Arial;mso-ansi-language:EN-GB'>The same time, more
or less, all <span c=
lass=3DGramE>it's</span> ok. <o:p></o:p></span></font></p>

<p class=3D=
MsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-si=
ze:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>&nbsp;<o:=
p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D=
Arial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-family=
:Arial;mso-ansi-language:EN-GB'>Now we want use this
raw (raw15) with or=
acle. We create <span class=3DGramE>a</span> oracle tablespace
put data =
into. </span></font><span class=3DSpellE><font size=3D2><span
style=3D'f=
ont-size:10.0pt;mso-bidi-font-family:Arial'>We</span></font></span><font
=
size=3D2><span style=3D'font-size:10.0pt;mso-bidi-font-family:Arial'> can=
 <span
class=3DSpellE>access</span> <span class=3DSpellE>it</span> <span=
 class=3DSpellE>through</span>
<span class=3DSpellE>oracle</span>.<o:p><=
/o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DAri=
al><span style=3D'font-size:10.0pt;
mso-bidi-font-family:Arial'>&nbsp;<o=
:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D=
Arial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-family=
:Arial;mso-ansi-language:EN-GB'>We stop oracle. Now
we repeat the same d=
d:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 fa=
ce=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-f=
amily:Arial;mso-ansi-language:EN-GB'>&nbsp;<o:p></o:p></span></font></p>
=

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB sty=
le=3D'font-size:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-=
GB'>---------------------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------<o:p></o:p></span></font></p>

<p class=3DMsoNo=
rmal><span class=3DGramE><font size=3D2 face=3DArial><span lang=3DEN-GB
=
style=3D'font-size:10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN=
-GB'>time</span></font></span><font
size=3D2><span lang=3DEN-GB style=3D=
'font-size:10.0pt;mso-bidi-font-family:Arial;
mso-ansi-language:EN-GB'> =
dd if=3D/dev/raw/raw15 of=3D/dev/null bs=3D512k count=3D2048<br>
2048+0 =
registros le=EDdos<br>
2048+0 registros escritos<o:p></o:p></span></font=
></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN=
-GB style=3D'font-size:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-langu=
age:EN-GB'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><s=
pan class=3DGramE><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D=
'font-size:10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>rea=
l</span></font></span><font
size=3D2><span lang=3DEN-GB style=3D'font-si=
ze:10.0pt;mso-bidi-font-family:Arial;
mso-ansi-language:EN-GB'>&nbsp;&nb=
sp;&nbsp; 0m48.971s<br>
<span class=3DGramE>user</span>&nbsp;&nbsp;&nbsp=
; 0m0.010s<br>
<span class=3DGramE>sys</span>&nbsp;&nbsp;&nbsp;&nbsp; 0m=
11.590s<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D=
2 face=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-fo=
nt-family:Arial;mso-ansi-language:EN-GB'>--------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------<o:p></o:p><=
/span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><sp=
an lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-family:Arial;ms=
o-ansi-language:EN-GB'>&nbsp;<o:p></o:p></span></font></p>

<p class=3D=
MsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-si=
ze:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>Now we ha=
ve 48
seconds, why<span class=3DGramE>?,</span> The only one difference =
is the
tablespace creation.<o:p></o:p></span></font></p>

<p class=3DM=
soNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-siz=
e:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>&nbsp;<o:p=
></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DA=
rial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-family:=
Arial;mso-ansi-language:EN-GB'>We try the same
process without lvm and w=
e have the same good time in three cases.<o:p></o:p></span></font></p>

=
<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;mso-bidi-font-family:Arial;mso-ansi-language:EN-GB=
'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D=
2 face=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-fo=
nt-family:Arial;mso-ansi-language:EN-GB'>There are some
problem with lvm=
, raw and oracle?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><f=
ont size=3D2 face=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;=
mso-bidi-font-family:Arial;mso-ansi-language:EN-GB'>How can I avoid
this=
?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 fac=
e=3DArial><span lang=3DEN-GB style=3D'font-size:
10.0pt;mso-bidi-font-fa=
mily:Arial;mso-ansi-language:EN-GB'>&nbsp;<o:p></o:p></span></font></p>
=

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 face=3DArial><=
span
style=3D'font-size:10.0pt;mso-bidi-font-family:Arial'>Thanks</span>=
</font></span><font
size=3D2><span style=3D'font-size:10.0pt;mso-bidi-fo=
nt-family:Arial'> in <span
class=3DSpellE>advanced</span><o:p></o:p></sp=
an></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-family:Arial'>&nbsp;<o:p></o:p>=
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><s=
pan style=3D'font-size:10.0pt;
mso-bidi-font-family:Arial'>&nbsp;<o:p></=
o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DAria=
l><span style=3D'font-size:10.0pt;
mso-bidi-font-family:Arial'>&nbsp;<o:=
p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D=
Arial><span style=3D'font-size:10.0pt;
mso-bidi-font-family:Arial'>&nbsp=
;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 fac=
e=3DArial><span style=3D'font-size:10.0pt;
mso-bidi-font-family:Arial'><=
o:p>&nbsp;</o:p></span></font></p>

</div>

=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br><br>Esta informaci=F3n es privada y confidencial y =
est=E1 dirigida =FAnicamente a su destinatario. Si usted no es el destina=
tario original de este mensaje y por este medio pudo acceder a dicha info=
rmaci=F3n por favor elimine el mensaje y notifique el env=EDo err=F3neo a=
l remitente. La distribuci=F3n o copia de este mensaje est=E1 estrictamen=
te prohibida. Esta comunicaci=F3n es s=F3lo para prop=F3sitos de informac=
i=F3n y no deber=EDa ser considerada como una declaraci=F3n oficial del G=
rupo gasNatural. La transmisi=F3n de e-mails no garantiza que el correo e=
lectr=F3nico sea seguro. Por consiguiente, no manifestamos que esta infor=
maci=F3n sea completa o precisa. Toda informaci=F3n est=E1 sujeta a alter=
arse sin previo aviso. Este Correo Electr=F3nico ha sido procesado por nu=
estro sistema de Antivirus corporativo <br><br> This information is priva=
te and confidential and intended for the recipient only. If you are not t=
he intended recipient of this message you are hereby notified that any re=
view it and notify the sender immediately, dissemination, distribution or=
 copying of this message is strictly prohibited. This communication is fo=
r information purposes only and should not be regarded as an official sta=
tement from gasNatural Group. Email transmission cannot be guaranteed to =
be secure. Therefore, we do not represent that this information is comple=
te or accurate and it should not be relied upon as such.All information i=
s subject to change without notice. This email has been scanned by our An=
tivirus system<br></body>

</html>
=00
------_=_NextPart_001_01C37C45.E08D4619--
