Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAT8bir25464
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 03:37:44 -0500
Message-ID: <5EA812BF44E06D4B818A8EEEDDE12B7F0448BFA4@EX2BEL86MBX02>
From: Johan.SEGERS@cec.eu.int
Date: Mon, 29 Nov 2004 09:36:55 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4D5EE.051ABC6C"
Subject: [linux-lvm] Installation of LVM on AS 2.1 - kernel 2.4.9-e.3
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@Sistina.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C4D5EE.051ABC6C
Content-Type: text/plain;
	charset="utf-8"

Hi,

I try to install LVM on my Red Hat AS2.1 server and have the following
problem :

After the installation of the lvm package 1.0.3 and of the kernel source
package of 2.4.9-e.3, i have to run

Configure
Make
Make install.

During the configure part, i always get a message that it did not find  a
Makefile in the /usr/src/linux directory.
My source directory of the redhat is /usr/src/linux/SOURCES and there is no
Makefile there. The Makefile for the 
Lvm package is in the direvctory from where i try to install LVM nl
/tmp/lvm/LVM/1.0.3. 

Any idea what is missing here ?

Thanks in advance

Johan Segers

------_=_NextPart_001_01C4D5EE.051ABC6C
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dutf-8">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2658.2">
<TITLE>Installation of LVM on AS 2.1 - kernel 2.4.9-e.3</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I try to install LVM on my Red Hat =
AS2.1 server and have the following problem :</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">After the installation of the lvm =
package 1.0.3 and of the kernel source package of 2.4.9-e.3, i have to =
run</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Configure</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Make</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Make install.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">During the configure part, i always =
get a message that it did not find&nbsp; a Makefile in the =
/usr/src/linux directory.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">My source directory of the redhat is =
/usr/src/linux/SOURCES and there is no Makefile there. The Makefile for =
the </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Lvm package is in the direvctory from =
where i try to install LVM nl /tmp/lvm/LVM/1.0.3. </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Any idea what is missing here ?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks in advance</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Johan Segers</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C4D5EE.051ABC6C--
