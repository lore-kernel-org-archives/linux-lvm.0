Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k81CJ5Gb023844
	for <linux-lvm@redhat.com>; Fri, 1 Sep 2006 08:19:05 -0400
Received: from CS1.csfarm.tbc.co.uk (pc100.tbc.co.uk [83.244.138.100])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k81CIkki004048
	for <linux-lvm@redhat.com>; Fri, 1 Sep 2006 08:18:47 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6CDC0.AA61FCF0"
Date: Fri, 1 Sep 2006 13:17:59 +0100
Message-ID: <072F438B739FD04ABAAF668C117EAB64D46313@ziff.int.tbc.co.uk>
From: <brett.dellegrazie@uk.logicalis.com>
Subject: [linux-lvm] RHEL4, LVM and Locking type 3 (cluster)
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

------_=_NextPart_001_01C6CDC0.AA61FCF0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
 
Sorry if this is on the FAQ but I can't seem to find it.
Has anyone had any experience with using LVM and Locking Type 3
(internal cluster locking).
 
I have attempted to use this primarily to put LVM on a SAN.
However, when I try to create the physical volume initially I get:
 
[root@somehost ~]# pvcreate --verbose /dev/sdb
  connect() failed on local socket: Connection refused
  Locking type 3 initialisation failed.

Effectively stopping this technique.  Is RHEL4's version of LVM not
compiled --with-cluster=3Dinternal option?
 
Any help / hints are greatly appreciated.

Thanks,
 
Best Regards,

Brett
 

Brett Delle Grazie

Senior Developer

Logicalis Network Solutions Limited 

Technology House, Laud Street,

Croydon, Surrey, CRO 1SX

T:     +44 20 8680 8080

DDI: +44 20 8633 8406

Mob: +44 777 926 4419

F:     +44 20 8633 8645

www.uk.logicalis.com

 

This email communication does not create or vary any contractual
relationship between Logicalis and you. Internet communications are not
secure and accordingly Logicalis does not accept any legal liability for
the contents of this message. The contents of this email are
confidential to the intended recipient at the email address to which it
has been addressed. It may not be disclosed to or used by anyone other
than this addressee, nor may it be copied in any way. If received in
error, please contact Logicalis on the above switchboard number quoting
the name of the sender and the addressee and then delete it from your
system. Please note that neither Logicalis nor the sender accepts any
responsibility for viruses and it is your responsibility to scan the
email and attachments (if any).

 

------_=_NextPart_001_01C6CDC0.AA61FCF0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Typ! content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2963" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2>Hi,</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial size=3D2>Sorry =
if this is on 
the FAQ but I can't seem to find it.</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial size=3D2>Has =
anyone had any 
experience with using LVM and Locking Type 3 (internal cluster 
locking).</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial size=3D2>I have =
attempted to 
use this primarily to put LVM on a SAN.</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial =
size=3D2>However, when I try 
to create the physical volume initially I get:</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial =
size=3D2>[root@somehost ~]# 
pvcreate --verbose&nbsp;/dev/sdb<BR>&nbsp; connect() failed on local =
socket: 
Connection refused<BR>&nbsp; Locking type 3 initialisation 
failed.<BR></DIV></FONT></SPAN>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial =
size=3D2>Effectively stopping 
this technique.&nbsp; Is RHEL4's version of LVM not compiled 
--with-cluster=3Dinternal option?</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial size=3D2>Any =
help / hints are 
greatly appreciated.</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2><BR>Thanks,</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial size=3D2>Best 
Regards,</FONT></SPAN></DIV>
<DIV><SPAN class=3D718581312-01092006><FONT face=3DArial 
size=3D2><BR>Brett</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV class=3DSection1>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; mso-bidi-font-size: 12.0pt; mso-ansi-language: =
EN-US">Brett 
Delle Grazie<?xml:namespace prefix =3D o ns =3D 
"urn:schemas-microsoft-com:office:office" /><o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; mso-bidi-font-size: 12.0pt; mso-ansi-language: =
EN-US">Senior 
Developer<o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: red; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">Logicalis 
Network Solutions Limited</SPAN><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; mso-bidi-font-size: 12.0pt; mso-ansi-language: =
EN-US"> 
<o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">Technology 
House, Laud Street,<o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">Croydon, 
Surrey, CRO 1SX<o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">T:<SPAN 
style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>+44 20 8680 
8080<o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">DDI: 
+44 20 8633 8406</SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">Mob: 
+44 777 926 4419</SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">F:<SPAN 
style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>+44 20 8633 
8645<o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><U><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">www.uk.logicalis.com</SPAN></U><SPAN 
lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US"><o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 10pt; COLOR: gray; mso-bidi-font-size: 12.0pt; =
mso-ansi-language: EN-US">&nbsp;<o:p></o:p></SPAN></P>
<P style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-US 
style=3D"FONT-SIZE: 8pt; mso-bidi-font-size: 12.0pt; mso-ansi-language: =
EN-US">This 
email communication does not create or vary any contractual relationship =
between 
Logicalis and you. Internet communications are not secure and =
accordingly 
Logicalis does not accept any legal liability for the contents of this =
message. 
The contents of this email are confidential to the intended recipient at =
the 
email address to which it has been addressed. It may not be disclosed to =
or used 
by anyone other than this addressee, nor may it be copied in any way. If =

received in error, please contact Logicalis on the above switchboard =
number 
quoting the name of the sender and the addressee and then delete it from =
your 
system. Please note that neither Logicalis nor the sender accepts any 
responsibility for viruses and it is your responsibility to scan the =
email and 
attachments (if any).<o:p></o:p></SPAN></P></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C6CDC0.AA61FCF0--
