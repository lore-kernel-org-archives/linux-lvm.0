Return-Path: <holger_zecha@hp.com>
Message-ID: <615A249B783CD41192F400D0B747AC8601F06B9B@hesse.bbn.hp.com>
From: "ZECHA,HOLGER (HP-Germany,ex1)" <holger_zecha@hp.com>
Date: Mon, 26 Feb 2001 10:28:16 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C09FD6.72E9DA40"
Subject: [linux-lvm] vgchange during shutdown on vg00
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
To: linux-lvm@sistina.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C09FD6.72E9DA40
Content-Type: text/plain;
	charset="iso-8859-1"

Hello,
 
I installed LVM on RedHat 6.1 with Reiuserfs.
Everything works fine, all filesystem except /boot are located on LVM. The
vgchange -a y vg00 during startup with initrd works but what about vgchange
-a n vg00 during the shutdown ?
Is there a possibility to do this vgchange, because / is still mounted or is
there no need to to this ?
 
Regards
 
Holger Zecha
 

------_=_NextPart_001_01C09FD6.72E9DA40
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 5.50.4522.1800" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" 
size=2>Hello,</FONT></SPAN></DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" size=2>I installed 
LVM on RedHat 6.1 with Reiuserfs.</FONT></SPAN></DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" size=2>Everything 
works fine, all filesystem except /boot are located on LVM. The vgchange -a y 
vg00 during startup with initrd works but what about vgchange -a n vg00 during 
the shutdown ?</FONT></SPAN></DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" size=2>Is there a 
possibility to do this vgchange, because / is still mounted or is there no need 
to to this ?</FONT></SPAN></DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" 
size=2>Regards</FONT></SPAN></DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=980192509-26022001><FONT face="Courier New" size=2>Holger 
Zecha</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C09FD6.72E9DA40--
