Message-ID: <1052321795.1100.7.camel@NB110239>
From: Joerg.Redlich@pass-consulting.com
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C314AE.5DF97380"
Subject: [linux-lvm] lvextend
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
Date: Sat May 10 08:38:12 2003
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@Sistina.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C314AE.5DF97380
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hallo,

bin mittlerweile ratlos und hoffe auf Ihre Hilfe !

Ich versuche ein lv zu erweitern, dies scheint auf den ersten Blick =
auch
zu funktionieren !

[root@NB110239 sbin]# df
Dateisystem          1K-Bl=C3=B6cke   Benutzt Verf=C3=BCgbar Ben% =
Eingeh=C3=A4ngt auf
/dev/hda3              1991577    351263   1537505  19% /
none                     95336         0     95336   0% /dev/shm
/dev/Volume00/LogVol00
                       1511856   1315876    119180  92% /usr
/dev/hda1              3479256   2060212   1419044  60% /win_sys


[root@NB110239 sbin]# lvscan
lvscan -- ACTIVE            "/dev/Volume00/LogVol00" [1.46 GB]
lvscan -- 1 logical volumes with 1.46 GB total in 1 volume group
lvscan -- 1 active logical volumes

[root@NB110239 sbin]# lvextend -L +200 /dev/Volume00/LogVol00 /dev/hda6
lvextend -- extending logical volume "/dev/Volume00/LogVol00" to 1.66 =
GB
lvextend -- doing automatic backup of volume group "Volume00"
lvextend -- logical volume "/dev/Volume00/LogVol00" successfully
extended

[root@NB110239 sbin]# lvscan
lvscan -- ACTIVE            "/dev/Volume00/LogVol00" [1.66 GB]
lvscan -- 1 logical volumes with 1.66 GB total in 1 volume group
lvscan -- 1 active logical volumes


[root@NB110239 sbin]# df
Dateisystem          1K-Bl=C3=B6cke   Benutzt Verf=C3=BCgbar Ben% =
Eingeh=C3=A4ngt auf
/dev/hda3              1991577    351418   1537350  19% /
none                     95336         0     95336   0% /dev/shm
/dev/Volume00/LogVol00
                       1511856   1315876    119180  92% /usr
/dev/hda1              3479256   2060212   1419044  60% /win_sys

Warum wird mir der hinzugef=C3=BCgte Platz nicht angezeigt bzw. zur =
Verf=C3=BCgung
gestellt ?


mit freundlichen Gr=C3=BC=C3=9Fen

j.redlich




Diese E-Mail enth=C3=A4lt vertrauliche und/oder rechtlich =
gesch=C3=BCtzte
Informationen. Wenn Sie nicht der richtige Adressat sind oder diese =
E-Mail
irrt=C3=BCmlich erhalten haben, informieren Sie bitte sofort den =
Absender und
vernichten Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte
Weitergabe dieser Mail ist nicht gestattet.

This e-mail may contain confidential and/or privileged information. If =
you
are not the intended recipient (or have received this e-mail in error)
please notify the sender immediately and destroy this e-mail. Any
unauthorized copying, disclosure or distribution of the material in =
this
e-mail is strictly forbidden.



------_=_NextPart_001_01C314AE.5DF97380
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dutf-8">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>lvextend</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Hallo,</FONT>
</P>

<P><FONT SIZE=3D2>bin mittlerweile ratlos und hoffe auf Ihre Hilfe =
!</FONT>
</P>

<P><FONT SIZE=3D2>Ich versuche ein lv zu erweitern, dies scheint auf =
den ersten Blick auch</FONT>
<BR><FONT SIZE=3D2>zu funktionieren !</FONT>
</P>

<P><FONT SIZE=3D2>[root@NB110239 sbin]# df</FONT>
<BR><FONT =
SIZE=3D2>Dateisystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 1K-Bl=C3=B6cke&nbsp;&nbsp; Benutzt Verf=C3=BCgbar Ben% =
Eingeh=C3=A4ngt auf</FONT>
<BR><FONT =
SIZE=3D2>/dev/hda3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 1991577&nbsp;&nbsp;&nbsp; 351263&nbsp;&nbsp; =
1537505&nbsp; 19% /</FONT>
<BR><FONT =
SIZE=3D2>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
95336&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 95336&nbsp;&nbsp; 0% /dev/shm</FONT>
<BR><FONT SIZE=3D2>/dev/Volume00/LogVol00</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1511856&nbsp;&nbsp; 1315876&nbsp;&nbsp;&nbsp; 119180&nbsp; 92% =
/usr</FONT>
<BR><FONT =
SIZE=3D2>/dev/hda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 3479256&nbsp;&nbsp; 2060212&nbsp;&nbsp; =
1419044&nbsp; 60% /win_sys</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>[root@NB110239 sbin]# lvscan</FONT>
<BR><FONT SIZE=3D2>lvscan -- =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;/dev/Volume00/LogVol00&quot; [1.46 GB]</FONT>
<BR><FONT SIZE=3D2>lvscan -- 1 logical volumes with 1.46 GB total in 1 =
volume group</FONT>
<BR><FONT SIZE=3D2>lvscan -- 1 active logical volumes</FONT>
</P>

<P><FONT SIZE=3D2>[root@NB110239 sbin]# lvextend -L +200 =
/dev/Volume00/LogVol00 /dev/hda6</FONT>
<BR><FONT SIZE=3D2>lvextend -- extending logical volume =
&quot;/dev/Volume00/LogVol00&quot; to 1.66 GB</FONT>
<BR><FONT SIZE=3D2>lvextend -- doing automatic backup of volume group =
&quot;Volume00&quot;</FONT>
<BR><FONT SIZE=3D2>lvextend -- logical volume =
&quot;/dev/Volume00/LogVol00&quot; successfully</FONT>
<BR><FONT SIZE=3D2>extended</FONT>
</P>

<P><FONT SIZE=3D2>[root@NB110239 sbin]# lvscan</FONT>
<BR><FONT SIZE=3D2>lvscan -- =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;/dev/Volume00/LogVol00&quot; [1.66 GB]</FONT>
<BR><FONT SIZE=3D2>lvscan -- 1 logical volumes with 1.66 GB total in 1 =
volume group</FONT>
<BR><FONT SIZE=3D2>lvscan -- 1 active logical volumes</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>[root@NB110239 sbin]# df</FONT>
<BR><FONT =
SIZE=3D2>Dateisystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 1K-Bl=C3=B6cke&nbsp;&nbsp; Benutzt Verf=C3=BCgbar Ben% =
Eingeh=C3=A4ngt auf</FONT>
<BR><FONT =
SIZE=3D2>/dev/hda3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 1991577&nbsp;&nbsp;&nbsp; 351418&nbsp;&nbsp; =
1537350&nbsp; 19% /</FONT>
<BR><FONT =
SIZE=3D2>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
95336&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 95336&nbsp;&nbsp; 0% /dev/shm</FONT>
<BR><FONT SIZE=3D2>/dev/Volume00/LogVol00</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1511856&nbsp;&nbsp; 1315876&nbsp;&nbsp;&nbsp; 119180&nbsp; 92% =
/usr</FONT>
<BR><FONT =
SIZE=3D2>/dev/hda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 3479256&nbsp;&nbsp; 2060212&nbsp;&nbsp; =
1419044&nbsp; 60% /win_sys</FONT>
</P>

<P><FONT SIZE=3D2>Warum wird mir der hinzugef=C3=BCgte Platz nicht =
angezeigt bzw. zur Verf=C3=BCgung</FONT>
<BR><FONT SIZE=3D2>gestellt ?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>mit freundlichen Gr=C3=BC=C3=9Fen</FONT>
</P>

<P><FONT SIZE=3D2>j.redlich</FONT>
</P>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>Diese E-Mail enth=C3=A4lt vertrauliche und/oder =
rechtlich gesch=C3=BCtzte Informationen. Wenn Sie nicht der richtige =
Adressat sind oder diese E-Mail irrt=C3=BCmlich erhalten haben, =
informieren Sie bitte sofort den Absender und vernichten Sie diese =
Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe dieser =
Mail ist nicht gestattet.</FONT></P>

<P><FONT SIZE=3D2>This e-mail may contain confidential and/or =
privileged information. If you are not the intended recipient (or have =
received this e-mail in error) please notify the sender immediately and =
destroy this e-mail. Any unauthorized copying, disclosure or =
distribution of the material in this e-mail is strictly =
forbidden.</FONT></P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C314AE.5DF97380--
