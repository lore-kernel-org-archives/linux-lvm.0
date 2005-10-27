Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9RCOQV09682
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 08:24:26 -0400
Received: from mailhub.lss.emc.com (mailhub.lss.emc.com [168.159.2.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9RCOKgT029765
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 08:24:20 -0400
Received: from mxic2.corp.emc.com (mxic2.corp.emc.com [128.221.12.9])
	by mailhub.lss.emc.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	j9RCODl9008760
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 08:24:13 -0400 (EDT)
Message-ID: <4A8F680AC6EC43458BCAE06010D8E81B9F7A2F@CORPUSMX40A.corp.emc.com>
From: Kearnan_Keith@emc.com
Subject: RE: [linux-lvm] lvm.conf questions and EMC PowerPath
Date: Thu, 27 Oct 2005 08:24:03 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5DAF1.51E8FC73"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C5DAF1.51E8FC73
Content-Type: text/plain

Hi Jack,
 
1) What filter do I need in lvm.conf to allow sda and emcpower?, but reject
all the other sdb and up name. I have tried many different one, but can not
eliminate the sd? device names.
 
This is covered in the PowerPath 4.4 for Linux Release Notes.  There are
three different scenarios listed depending on what your configuration is.
 
2) Does the system have to be rebooted for the filter to work with the
various LVM commands, vgdisplay, vgscan? 
 
No, "vgscan -v" should be executed.
 
-Keith Kearnan
 
This is covered with examples in EMC's Knowledge Base, see solution
emc118561.
 


  _____  

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Allen, Jack
Sent: Wednesday, October 26, 2005 5:24 PM
To: 'linux-lvm@redhat.com'
Subject: [linux-lvm] lvm.conf questions and EMC PowerPath



        I am trying to setup a system using EMC PowerPath. The SAN has 5
LUNS assigned to this system. Since there are 2 FC ports on the system going
to 2 switches that have 2 links to the SAN the system sees 20 sd devices
starting with sdb. And PowerPath cerates 5 emcpower? name in /dev. The sda
device is local.

        One problem I have now is, at boot time the system complains about
duplicate PVs being found. A VG was created with the emcpower? names, but
after reboot when you do vgdisplay it shows the emcpower? names and lost of
the sd? names in the VG.

1) What filter do I need in lvm.conf to allow sda and emcpower?, but reject
all the other sdb and up name. I have tried many different one, but can not
eliminate the sd? device names.

2) Does the system have to be rebooted for the filter to work with the
various LVM commands, vgdisplay, vgscan? 

Thanks: 
        Jack Allen 


------_=_NextPart_001_01C5DAF1.51E8FC73
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<TITLE>lvm.conf questions and EMC PowerPath</TITLE>

<META content="MSHTML 6.00.2800.1522" name=GENERATOR></HEAD>
<BODY>
<DIV dir=ltr align=left><SPAN class=278121612-27102005><FONT face=Arial 
color=#0000ff size=2>Hi Jack,</FONT></SPAN></DIV>
<DIV dir=ltr align=left><SPAN class=278121612-27102005><FONT face=Arial 
color=#0000ff size=2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=ltr align=left><SPAN class=278121612-27102005><FONT face=Arial 
size=2><EM>1) What filter do I need in lvm.conf to allow sda and emcpower?, but 
reject all the other sdb and up name. I have tried many different one, but can 
not eliminate the sd? device names.</EM></FONT></SPAN></DIV>
<DIV dir=ltr align=left><SPAN class=278121612-27102005><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=ltr align=left><SPAN class=278121612-27102005><FONT face=Arial 
color=#0000ff size=2>This is covered in the PowerPath 4.4 for Linux Release 
Notes.&nbsp; There are three different scenarios listed depending on what your 
configuration is.</FONT></SPAN></DIV>
<DIV dir=ltr align=left><SPAN class=278121612-27102005><FONT face=Arial 
color=#0000ff size=2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=ltr align=left><SPAN class=278121612-27102005><FONT face=Arial 
size=2><EM>2) Does the system have to be rebooted for the filter to work with 
the various LVM commands, vgdisplay, vgscan?</EM><FONT face="Times New Roman" 
size=3> </FONT></FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=278121612-27102005></SPAN><FONT face=Arial><FONT 
color=#0000ff><FONT size=2>N<SPAN class=278121612-27102005>o, "vgscan -v" should 
be executed.</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT face=Arial><FONT color=#0000ff><FONT size=2><SPAN 
class=278121612-27102005></SPAN></FONT></FONT></FONT>&nbsp;</DIV>
<DIV><FONT><FONT face=Arial color=#0000ff size=2><SPAN 
class=278121612-27102005>-Keith Kearnan</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#0000ff size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#0000ff size=2><SPAN class=278121612-27102005>This 
is covered with examples in EMC's Knowledge Base, see solution 
emc118561.</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#0000ff size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial><BR><FONT color=#0000ff></FONT></FONT></DIV></FONT>
<DIV class=OutlookMessageHeader lang=en-us dir=ltr align=left>
<HR tabIndex=-1>
<FONT face=Tahoma size=2><B>From:</B> linux-lvm-bounces@redhat.com 
[mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Allen, 
Jack<BR><B>Sent:</B> Wednesday, October 26, 2005 5:24 PM<BR><B>To:</B> 
'linux-lvm@redhat.com'<BR><B>Subject:</B> [linux-lvm] lvm.conf questions and EMC 
PowerPath<BR></FONT><BR></DIV>
<DIV></DIV>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT face=Arial size=2>I am 
trying to setup a system using EMC PowerPath. The SAN has 5 LUNS assigned to 
this system. Since there are 2 FC ports on the system going to 2 switches that 
have 2 links to the SAN the system sees 20 sd devices starting with sdb. And 
PowerPath cerates 5 emcpower? name in /dev. The sda device is local.</FONT></P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT face=Arial size=2>One 
problem I have now is, at boot time the system complains about duplicate PVs 
being found. A VG was created with the emcpower? names, but after reboot when 
you do vgdisplay it shows the emcpower? names and lost of the sd? names in the 
VG.</FONT></P>
<P><FONT face=Arial size=2>1) What filter do I need in lvm.conf to allow sda and 
emcpower?, but reject all the other sdb and up name. I have tried many different 
one, but can not eliminate the sd? device names.</FONT></P>
<P><FONT face=Arial size=2>2) Does the system have to be rebooted for the filter 
to work with the various LVM commands, vgdisplay, vgscan?</FONT> </P>
<P><FONT face=Arial size=2>Thanks:</FONT> 
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT face=Arial size=2>Jack 
Allen</FONT> </P></BODY></HTML>

------_=_NextPart_001_01C5DAF1.51E8FC73--
