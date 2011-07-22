Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6MIgEpx026759
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 14:42:14 -0400
Received: from mail2.lvr.de (mail2.lvr.de [194.8.211.6])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6MIgDRe009761
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 14:42:13 -0400
From: "Matecki, Lukas" <Lukas.Matecki@lvr.de>
Date: Fri, 22 Jul 2011 20:42:10 +0200
Message-ID: <1B5D97CC-20B4-404A-84C8-CFCB719E62EC@lvr.de>
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_1B5D97CC20B4404A84C8CFCB719E62EClvrde_"
MIME-Version: 1.0
Subject: [linux-lvm] Antw.:  LVM Alignement
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

--_000_1B5D97CC20B4404A84C8CFCB719E62EClvrde_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Oh thx for the reply. I will check the offset with this command. If it is t=
he default offset it would mean that a lvm only disk is aligned by default.=
 Thx for help

Greetings

Lukas

Gesendet =FCber ein mobiles Ger=E4t

----- Reply message -----
Von: "Alexander Dalloz" <ad+lists@uni-x.org>
An: "LVM general discussion and development" <linux-lvm@redhat.com>
Betreff: [linux-lvm] LVM Alignement
Datum: Fr., Jul. 22, 2011 20:37



> Hey all,
>
> i have a question about Lun / Partition alignment.
> If I use LVM in a Linux guest OS on a VMFS Datastore i can align my
> Partitions with mbralign.
> But the tool failes if I will try to use it on a LVM only VDisk. For
> example the second Disk of this guest OS.
>
> Did I need to align the second disk or did LVM take care of alignment ? I
> just mean a single VDisk with a single LVM VG.
>
> Greetings
>
> Lukas Matecki

By default LVM uses an offset of 192k, see:

# vgs -o +pe_start
  VG         #PV #LV #SN Attr   VSize VFree 1st PE
  VolGroup00   1   1   0 wz--n- 8,78G    0  192,00K

Alexander


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--_000_1B5D97CC20B4404A84C8CFCB719E62EClvrde_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style></head>
<body>
<style>
<!--
.EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style><body>Oh thx for the reply. I will check the offset with this comma=
nd. If it is the default offset it would mean that a lvm only disk is align=
ed by default. Thx for help<br><br>Greetings <br><br>Lukas<br><br>Gesendet =
=FCber ein mobiles Ger=E4t<br><br><div id=3D"htc_header" style=3D"">----- R=
eply message -----<br>Von: &quot;Alexander Dalloz&quot; &lt;ad&#43;lists@un=
i-x.org&gt;<br>An: &quot;LVM general discussion and development&quot; &lt;l=
inux-lvm@redhat.com&gt;<br>Betreff: [linux-lvm] LVM Alignement<br>Datum: Fr=
., Jul. 22, 2011 20:37<br><br></div><br><br></body>
<font size=3D"2"><div class=3D"PlainText">&gt; Hey all,<br>
&gt;<br>
&gt; i have a question about Lun / Partition alignment.<br>
&gt; If I use LVM in a Linux guest OS on a VMFS Datastore i can align my<br=
>
&gt; Partitions with mbralign.<br>
&gt; But the tool failes if I will try to use it on a LVM only VDisk. For<b=
r>
&gt; example the second Disk of this guest OS.<br>
&gt;<br>
&gt; Did I need to align the second disk or did LVM take care of alignment =
? I<br>
&gt; just mean a single VDisk with a single LVM VG.<br>
&gt;<br>
&gt; Greetings<br>
&gt;<br>
&gt; Lukas Matecki<br>
<br>
By default LVM uses an offset of 192k, see:<br>
<br>
# vgs -o &#43;pe_start<br>
&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #PV #LV #SN Attr&=
nbsp;&nbsp; VSize VFree 1st PE<br>
&nbsp; VolGroup00&nbsp;&nbsp; 1&nbsp;&nbsp; 1&nbsp;&nbsp; 0 wz--n- 8,78G&nb=
sp;&nbsp;&nbsp; 0&nbsp; 192,00K<br>
<br>
Alexander<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://=
tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></font>
</body>
</html>

--_000_1B5D97CC20B4404A84C8CFCB719E62EClvrde_--
