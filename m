Return-Path: <paulo_fessel@optiglobe.com.br>
Message-ID: <1D15D20781EB404E9EA6129359E02439097851@sp1email.optiglobe.com.br>
From: Paulo Fessel <paulo_fessel@optiglobe.com.br>
Subject: RE: [linux-lvm] Need help with LVM on RedHat 7.1
Date: Tue, 24 Apr 2001 17:37:27 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C0CCFE.602A2C70"
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
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C0CCFE.602A2C70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Opposed to RAID-0 or Linear, the LVM allows you to grow both your =
physical
and logical storage dynamically. Without (very) alpha patches, md =
drivers
won't permit you to do this. Also, Mandrake 8.0 permits you to create =
PV's
and LV's at installation time (no / in rootvg yet, though; also, no
ext2resize installed per default nor 2.4.3-20mdk supports ext2online).
=20
Also, I work on an IDC, and here we have EMC equipment. I've found that =
md
(at least that of kernel 2.2.18-linus) refuses to work with direct
attachment (Emulex LP8000 FCAL board), and thus it's impossible to join
multiple 50 GB volumes in one (for database storage, for example). So, =
I am
researching LVM to do this noble task.
=20
(I know, I know, I could use QLogic that has built-in kernels and the =
like,
but people here hate QLogic for a number of reasons. And here in =
Brazil,
FCAL boards have tag prices of multiple thousand dollars.)
=20
HugZ,
Paulo

Paulo Afonso Graner Fessel=20
Suporte de Sistemas=20
OptiGlobe Telecom, Ltda. - The Internet Lives Here=20
R.Bento Branco de Andrade Filho, 621=20
S=E3o Paulo, SP, 04757-000=20
Brasil=20
http://www.optiglobe.com.br <http://www.optiglobe.com.br/> =20

Tel.:+55 11 3365-4478=20
Fax:+55 11 3365-4445=20
Cel.:+55 11 9198-9985=20
E-mail: paulo_fessel@optiglobe.com.br=20

-----Original Message-----
From: Medi Montaseri [mailto:medi@sc.prepass.com]
Sent: Tuesday, April 24, 2001 9:09 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Need help with LVM on RedHat 7.1


I appreciate your support on this...=20

What is your opinion on RAID-0 or Linear vs LVM.=20
In my application, I was simply trying to concatnate four 75Gig disks =
to
create=20
one large disk for a backup server. I decided on RAID-0.=20


Carlo Marcelo Arenas Belon wrote:=20


> Thanks, but I usually don't use Beta on a production box and=20
> also RedHat 7.1 comes with a rather old version of lvm, I think =
0.8final.=20

sorry, i think i didn't make myself clear.=20


RedHat 7.1 DOESN'T come with lvm enabled, because the lvm that is =
inside=20
the kernel (not RedHat's but the one from Linus) and that they ship=20
(2.4.2-2) is a broken one (0.9.1beta2)=20


they didn't package the lvm userland utilities neither, i guess because =
of=20
that.=20


BUT, you can make it work easily if you download the kernel module and=20
userland utilities and patch your kernel as explained on sistina's=20
documentation.=20


i just happened to make it work this way on a Red Hat 7.1 beta system=20
using the 0.9.1beta6 tar from sistina, so i think this should work on a =

Red Hat 7.1 final system.=20


> But the compile errors I'm getting are two basics to have passed QA =
of=20
> any distributor...I just recompiled again with only LVM enabled and =
not
RAID=20
> and MD=20
> and was getting syntactical errors (compile errors) leaving to belive =
that

> some .h=20
> file is missing.=20


i guess just because noone even QA this kind of configuration ;)=20


> I will try the 'make mrproprer', maybe that'll fix it...=20


i hope so, as the kernel should compile, after all, RedHat need to =
compile=20
it in order to package.=20


but as i explained before, having an lvm module on your kernel is just =
one=20
step on having an lvm working system, you are going to need the lvm=20
userland utilities, and the ones that match your kernel module.=20


that is why i sugested to better download a new kernel module/userland =
and=20
patch your kernel before even compiling.=20


also don't forget to change your /etc/init.d/halt script as explained =
on=20
the sistina's documentation.=20


and as for running "betas" on production, don't forget that the =
0.9.1lvm=20
is still on beta.=20


best regards,=20


Carlo=20


_______________________________________________=20
linux-lvm mailing list=20
linux-lvm@sistina.com=20
http://lists.sistina.com/mailman/listinfo/linux-lvm
<http://lists.sistina.com/mailman/listinfo/linux-lvm>=20

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Medi Montaseri, medi@prepass.com, 408-450-7114

Prepass Inc, IT/Operations, Software Eng.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20


------_=_NextPart_001_01C0CCFE.602A2C70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 5.50.4522.1800" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D090145919-24042001><FONT face=3DArial =
color=3D#0000ff=20
size=3D2>Opposed to RAID-0 or Linear, the LVM allows you to grow both =
your=20
physical and logical storage dynamically. Without (very) alpha patches, =
md=20
drivers won't permit you to do this. Also, Mandrake 8.0 permits you to =
create=20
PV's and LV's at installation time (no / in rootvg yet, though; also, =
no=20
ext2resize installed per default nor 2.4.3-20mdk supports=20
ext2online).</FONT></SPAN></DIV>
<DIV><SPAN class=3D090145919-24042001><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D090145919-24042001><FONT face=3DArial =
color=3D#0000ff size=3D2>Also,=20
I work on an IDC, and here we have EMC equipment. I've found that md =
(at least=20
that of kernel 2.2.18-linus) refuses to work with direct attachment =
(Emulex=20
LP8000 FCAL board), and thus it's impossible to join multiple 50 GB =
volumes in=20
one (for database storage, for example). So, I am researching LVM to do =
this=20
noble task.</FONT></SPAN></DIV>
<DIV><SPAN class=3D090145919-24042001><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D090145919-24042001><FONT face=3DArial =
color=3D#0000ff size=3D2>(I=20
know, I know,&nbsp;I could use QLogic that has built-in kernels and the =
like,=20
but people here hate QLogic for a number of reasons. And here in =
Brazil, FCAL=20
boards have tag prices of multiple thousand =
dollars.)</FONT></SPAN></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D090145919-24042001><FONT face=3DArial =
color=3D#0000ff=20
size=3D2>HugZ,</FONT></SPAN></DIV>
<DIV><SPAN class=3D090145919-24042001><FONT face=3DArial =
color=3D#0000ff=20
size=3D2>Paulo</FONT></SPAN></DIV>
<P><B><FONT face=3DArial size=3D1>Paulo Afonso Graner Fessel</FONT></B> =
<BR><FONT=20
face=3DArial size=3D1>Suporte de Sistemas</FONT> <BR><FONT face=3DArial =

size=3D1>OptiGlobe Telecom, Ltda. - </FONT><FONT face=3DArial =
color=3D#008000=20
size=3D1>The Internet Lives Here</FONT> <BR><FONT face=3DArial =
size=3D1>R.Bento Branco=20
de Andrade Filho, 621</FONT> <BR><FONT face=3DArial size=3D1>S=E3o =
Paulo, SP,=20
04757-000</FONT> <BR><FONT face=3DArial size=3D1>Brasil</FONT> =
<BR><FONT face=3DArial=20
size=3D1><A target=3D_blank=20
href=3D"http://www.optiglobe.com.br/">http://www.optiglobe.com.br</A></F=
ONT> </P>
<P><FONT face=3DArial size=3D1>Tel.:+55 11 3365-4478</FONT> <BR><FONT =
face=3DArial=20
size=3D1>Fax:+55 11 3365-4445</FONT> <BR><FONT face=3DArial =
size=3D1>Cel.:+55 11=20
9198-9985</FONT> <BR><FONT face=3DArial size=3D1>E-mail:<U> =
</U></FONT><U><FONT=20
face=3DArial color=3D#0000ff =
size=3D1>paulo_fessel@optiglobe.com.br</FONT></U> </P>
<BLOCKQUOTE=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Medi Montaseri=20
  [mailto:medi@sc.prepass.com]<BR><B>Sent:</B> Tuesday, April 24, 2001 =
9:09=20
  AM<BR><B>To:</B> linux-lvm@sistina.com<BR><B>Subject:</B> Re: =
[linux-lvm] Need=20
  help with LVM on RedHat 7.1<BR><BR></FONT></DIV>I appreciate your =
support on=20
  this...=20
  <P>What is your opinion on RAID-0 or Linear vs LVM. <BR>In my =
application, I=20
  was simply trying to concatnate four 75Gig disks to create <BR>one =
large disk=20
  for a backup server. I decided on RAID-0.=20
  <P>Carlo Marcelo Arenas Belon wrote:=20
  <BLOCKQUOTE TYPE=3D"CITE">&gt; Thanks, but I usually don't use Beta =
on a=20
    production box and <BR>&gt; also RedHat 7.1 comes with a rather old =
version=20
    of lvm, I think 0.8final.=20
    <P>sorry, i think i didn't make myself clear.=20
    <P>RedHat 7.1 DOESN'T come with lvm enabled, because the lvm that =
is inside=20
    <BR>the kernel (not RedHat's but the one from Linus) and that they =
ship=20
    <BR>(2.4.2-2) is a broken one (0.9.1beta2)=20
    <P>they didn't package the lvm userland utilities neither, i guess =
because=20
    of <BR>that.=20
    <P>BUT, you can make it work easily if you download the kernel =
module and=20
    <BR>userland utilities and patch your kernel as explained on =
sistina's=20
    <BR>documentation.=20
    <P>i just happened to make it work this way on a Red Hat 7.1 beta =
system=20
    <BR>using the 0.9.1beta6 tar from sistina, so i think this should =
work on a=20
    <BR>Red Hat 7.1 final system.=20
    <P>&gt; But the compile errors I'm getting are two basics to have =
passed QA=20
    of <BR>&gt; any distributor...I just recompiled again with only LVM =
enabled=20
    and not RAID <BR>&gt; and MD <BR>&gt; and was getting syntactical =
errors=20
    (compile errors) leaving to belive that <BR>&gt; some .h <BR>&gt; =
file is=20
    missing.=20
    <P>i guess just because noone even QA this kind of configuration ;) =

    <P>&gt; I will try the 'make mrproprer', maybe that'll fix it...=20
    <P>i hope so, as the kernel should compile, after all, RedHat need =
to=20
    compile <BR>it in order to package.=20
    <P>but as i explained before, having an lvm module on your kernel =
is just=20
    one <BR>step on having an lvm working system, you are going to need =
the lvm=20
    <BR>userland utilities, and the ones that match your kernel module. =

    <P>that is why i sugested to better download a new kernel =
module/userland=20
    and <BR>patch your kernel before even compiling.=20
    <P>also don't forget to change your /etc/init.d/halt script as =
explained on=20
    <BR>the sistina's documentation.=20
    <P>and as for running "betas" on production, don't forget that the =
0.9.1lvm=20
    <BR>is still on beta.=20
    <P>best regards,=20
    <P>Carlo=20
    <P>_______________________________________________ <BR>linux-lvm =
mailing=20
    list <BR>linux-lvm@sistina.com <BR><A=20
    =
href=3D"http://lists.sistina.com/mailman/listinfo/linux-lvm">http://list=
s.sistina.com/mailman/listinfo/linux-lvm</A></P></BLOCKQUOTE><PRE>--&nbs=
p;
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Medi Montaseri, medi@prepass.com, 408-450-7114
Prepass Inc, IT/Operations, Software Eng.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</P=
RE>&nbsp;=20
</BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C0CCFE.602A2C70--
