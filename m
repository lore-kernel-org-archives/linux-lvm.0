Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9T9Xor17455
	for <linux-lvm@redhat.com>; Fri, 29 Oct 2004 05:33:50 -0400
Received: from it-ep1-exch.ocsdom.ko.local (it-ep1-exch.krollontrack.com
	[204.73.176.253])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9T9Xn1F015469
	for <linux-lvm@redhat.com>; Fri, 29 Oct 2004 05:33:49 -0400
Message-ID: <2E9DA7DCA1129B4DA2DCA703100F387D7C7CCF@deexch.ontrack.com>
From: hengelland@krollontrack.de
Date: Fri, 29 Oct 2004 04:32:57 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4BD9A.4632DEEE"
Subject: [linux-lvm] Datarecovery on LVM volumes
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
To: linux-lvm@redhat.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C4BD9A.4632DEEE
Content-Type: text/plain;
	charset="iso-8859-1"

We got a couple of drives with the partiton identifier "0x8E". They are all
part of an LVM with kind of EXT2 structures.
The EXT2 structures do not look like they usually do ... superblocks are way
different.
I would like to ask if somebody could provide me with some Offset
information how
physical volumes, volume groups and logical volumes work together on a
sector table basis ...
 
Many thanks
 
Holger Engelland
DataRecovery Supervisor
Kroll Ontrack Germany  

------_=_NextPart_001_01C4BD9A.4632DEEE
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2800.1476" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=718561809-29102004><FONT face=Arial size=2>We got a couple of 
drives with the partiton identifier "0x8E". They are all part of an LVM with 
kind of EXT2 structures.</FONT></SPAN></DIV>
<DIV><SPAN class=718561809-29102004><FONT face=Arial size=2>The EXT2 structures 
do not look like they usually do ... superblocks are way 
different.</FONT></SPAN></DIV>
<DIV><SPAN class=718561809-29102004><FONT face=Arial size=2>I would like to ask 
if somebody could provide me with some Offset information 
how</FONT></SPAN></DIV>
<DIV><SPAN class=718561809-29102004><FONT face=Arial size=2>physical volumes, 
volume groups and logical volumes work together on a sector table basis 
...</FONT></SPAN></DIV>
<DIV><SPAN class=718561809-29102004><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=718561809-29102004><FONT face=Arial size=2>Many 
thanks</FONT></SPAN></DIV>
<DIV><SPAN class=718561809-29102004><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><B><I><FONT face="Arial Black" color=#000080 size=2>Holger 
Engelland</FONT><BR></I><FONT face="Arial Narrow" color=#808080 
size=2>DataRecovery Supervisor</FONT></B><FONT face=Arial><BR></FONT><B><FONT 
face="Arial Narrow"><FONT size=2><FONT color=#808080>Kroll Ontrack&nbsp;<SPAN 
class=718561809-29102004><FONT color=#000000>Germany</FONT></SPAN></FONT><FONT 
color=#000080>&nbsp;</FONT></FONT></FONT><U> </U></B></DIV></BODY></HTML>

------_=_NextPart_001_01C4BD9A.4632DEEE--
