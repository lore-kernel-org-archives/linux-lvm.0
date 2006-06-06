Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k569sCws028750
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 05:54:12 -0400
Received: from mailbe4.getronics.com (mailbe4.getronics.com [158.67.12.26])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k569s0fG005652
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 05:54:00 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6894F.1F032CFF"
Date: Tue, 6 Jun 2006 11:53:53 +0200
Message-ID: <6238E6ECEFB99A43BF93EC1E2BD34C4901768051@excbebr205.europe.unity>
From: "Vreugd, Metin de" <Metin.deVreugd@Getronics.com>
Subject: [linux-lvm] Restore Problem.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6894F.1F032CFF
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm having problems with restoring an LVM1 volume group. It gives me the
following error code:

root@sysresccd /etc/lvmconf % vgcfgrestore -M1 -f /etc/lvmconf/vg00.conf
vg00
  Parse error at line 1: unexpected token
  Couldn't read volume group metadata.
  Restore failed.
root@sysresccd /etc/lvmconf %

The physical volume has already been created (metadata 1) but even
without creation it keeps giving me this error.

Is there something I've missed??

Regards,

Metin de Vreugd
Data Centers & Hosting Services
Getronics PinkRoccade
Paalbergweg 1-3
1105AG Amsterdam
The Netherlands
M +31 (0)6 2952 5419
e-mailadres metin.devreugd@getronics.com
www.getronicspinkroccade.nl=20
The information transmitted is intended only for use by the addressee
and may contain confidential and/or privileged material. Any review,
re-transmission, dissemination or other use of it, or the taking of any
action in reliance upon this information by persons and/or entities
other than the intended recipient is prohibited. If you received this in
error, please inform the sender and/or addressee immediately and delete
the material. Thank you.


------_=_NextPart_001_01C6894F.1F032CFF
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7650.5">
<TITLE>Restore Problem.</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I'm having problems with restoring an =
LVM1 volume group. It gives me the following error code:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">root@sysresccd /etc/lvmconf % =
vgcfgrestore -M1 -f /etc/lvmconf/vg00.conf vg00</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Parse error at line 1: =
unexpected token</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Couldn't read volume group =
metadata.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Restore failed.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">root@sysresccd /etc/lvmconf %</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">The physical volume has already been =
created (metadata 1) but even without creation it keeps giving me this =
error.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Is there something I've missed??</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Regards,<BR>
</FONT>

<BR><SPAN LANG=3D"nl"><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial">Metin de Vreugd</FONT></SPAN>

<BR><SPAN LANG=3D"nl"><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial">Data Centers &amp; Hosting Services<BR>
<B>Getronics PinkRoccade<BR>
</B>Paalbergweg 1-3<BR>
1105AG Amsterdam<BR>
</FONT><FONT SIZE=3D2 FACE=3D"Arial">The Netherlands<BR>
</FONT><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial">M +31 (0)6 2952 =
5419<BR>
e-mailadres</FONT><FONT SIZE=3D2 FACE=3D"Arial"> =
metin.devreugd@getronics.com<BR>
<U></U></FONT></SPAN><A =
HREF=3D"http://www.getronicspinkroccade.nl"><SPAN =
LANG=3D"nl"><U></U><U><FONT COLOR=3D"#0000FF" SIZE=3D2 =
FACE=3D"Arial">www.getronicspinkroccade.nl</FONT></U><U></U></SPAN></A><S=
PAN LANG=3D"nl"><U></U><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial"></FONT> </SPAN>

<BR><SPAN LANG=3D"nl"><I><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial">The information transmitted is intended only for use by =
the addressee and may contain confidential and/or privileged material. =
Any review, re-transmission, dissemination or other use of it, or the =
taking of any action in reliance upon this information by persons and/or =
entities other than the intended recipient is prohibited. If you =
received this in error, please inform the sender and/or addressee =
immediately and delete the material. Thank you.</FONT></I></SPAN></P>

</BODY>
</HTML>
------_=_NextPart_001_01C6894F.1F032CFF--
