Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9QLNFV29121
	for <linux-lvm@redhat.com>; Wed, 26 Oct 2005 17:23:15 -0400
Received: from mail3.mckesson.com (mail3.mckesson.com [143.112.129.38])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9QLNDSR000642
	for <linux-lvm@redhat.com>; Wed, 26 Oct 2005 17:23:14 -0400
From: "Allen, Jack" <Jack.Allen@McKesson.com>
Message-ID: <C28DB247D333BC47BBAAFDC914DE39010261F6EC@atlexc07ntms.mckesson.com>
Date: Wed, 26 Oct 2005 17:23:33 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5DA73.84CF8476"
Subject: [linux-lvm] lvm.conf questions and EMC PowerPath
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C5DA73.84CF8476
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

        I am trying to setup a system using EMC PowerPath. The SAN has 5
LUNS assigned to this system. Since there are 2 FC ports on the system
going to 2 switches that have 2 links to the SAN the system sees 20 sd
devices starting with sdb. And PowerPath cerates 5 emcpower? name in
/dev. The sda device is local.

        One problem I have now is, at boot time the system complains
about duplicate PVs being found. A VG was created with the emcpower?
names, but after reboot when you do vgdisplay it shows the emcpower?
names and lost of the sd? names in the VG.

1) What filter do I need in lvm.conf to allow sda and emcpower?, but
reject all the other sdb and up name. I have tried many different one,
but can not eliminate the sd? device names.

2) Does the system have to be rebooted for the filter to work with the
various LVM commands, vgdisplay, vgscan? 

Thanks: 
        Jack Allen 


------_=_NextPart_001_01C5DA73.84CF8476
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>

<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2658.2">
<TITLE>lvm.conf questions and EMC PowerPath</TITLE>
</HEAD>
<BODY>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">I am trying to setup a system using EMC PowerPath. The =
SAN has 5 LUNS assigned to this system. Since there are 2 FC ports on =
the system going to 2 switches that have 2 links to the SAN the system =
sees 20 sd devices starting with sdb. And PowerPath cerates 5 emcpower? =
name in /dev. The sda device is local.</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">One problem I have now is, at boot time the system =
complains about duplicate PVs being found. A VG was created with the =
emcpower? names, but after reboot when you do vgdisplay it shows the =
emcpower? names and lost of the sd? names in the VG.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">1) What filter do I need in lvm.conf =
to allow sda and emcpower?, but reject all the other sdb and up name. I =
have tried many different one, but can not eliminate the sd? device =
names.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">2) Does the system have to be rebooted =
for the filter to work with the various LVM commands, vgdisplay, =
vgscan?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks:</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Jack Allen</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C5DA73.84CF8476--
