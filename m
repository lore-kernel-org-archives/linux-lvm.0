Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3M8mqp10847
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 04:48:52 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3M8moFe017529
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 04:48:51 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C71975A@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Subject: RE: [linux-lvm] LVM and multiple HBA ports
Date: Thu, 22 Apr 2004 11:48:40 +0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C42846.9C619880"
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>, "'csc@cadence.com'" <csc@cadence.com.redhat.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C42846.9C619880
Content-Type: text/plain;
	charset="iso-8859-1"

I wouldn't call them 'most storage vendors'  rather the 'large vendors'.
 
I'm using an Infortrend (taiwanese vendor) storage controller. They and all
the other small vendors, do not support any multiple path failover drivers
for Linux. Qlogic HBA has some support in their driver, but only if you user
their user mode management software, which I cannot use since they support
only Intel and I'm on PPC. They won't supply any documentatin etc regarding
how to use it programatically.
 
People who use Linux because its not expensive, also use inexpensive
storage. It does not mean they don't want to use advanced features.
 
Dan

-----Original Message-----
From: Yang, Fred [mailto:FYang@nshs.edu]
Sent: Wednesday, April 21, 2004 7:36 PM
To: 'csc@cadence.com'; 'LVM general discussion and development'
Subject: RE: [linux-lvm] LVM and multiple HBA ports



What storage you are using? Most storage vendor has their own multi path
software, e.g. EMC's powerpath, IBM's SDD. We are using IBM ESS, and we just
use the vpath device to create PV, the SDD actually do the load
balancing&failover between multiple path.

-Fred 

-----Original Message----- 
From: linux-lvm-bounces@redhat.com [ mailto:linux-lvm-bounces@redhat.com
<mailto:linux-lvm-bounces@redhat.com> ] On Behalf Of Chris Croswhite 
Sent: Wednesday, April 21, 2004 12:17 PM 
To: LVM general discussion and development 
Subject: Re: [linux-lvm] LVM and multiple HBA ports 

Is this a multipathed device?  I first create an MD device of a particular
lun like this: 
mdadm -C -f -l mp -n 1 -x 1 /dev/md0 /dev/sd<x> /dev/sd<y> 

where x is channel A of the device and y is channel B. 

You can then verify it by: 
mdadm --detail /dev/md0 

Does this help? 

On Wed, 2004-04-21 at 09:04, Dan Bar Dov wrote: 
> I have a problem using two (or more) ports connected to the same storage. 
> 
> Linux does not identify that the two LUNs it discovers is actually the
same. 
> When I create a PV all is well. 
> The PV gets created and is ACTIVE. However, through the other port, 
> the PV is also discovered, but is marked INACTIVE in the LVM database. 
> 
> When I try to create a VG using the active path, LVM scans all PVs in
order. 
> If it finds the INACTIVE instance first, the VG creation fails. 
> 
> I'm using LVM 1.0.3, please let mw know if such a situation 
> (connecting storage through multiple ports) is handled better in 
> another version, or suggest how to overcome the problem. 
> 
> Thanks, 
> Dan 
> _______________________________________________ 
> linux-lvm mailing list 
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm
<https://www.redhat.com/mailman/listinfo/linux-lvm>  
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
<http://tldp.org/HOWTO/LVM-HOWTO/>  

_______________________________________________ 
linux-lvm mailing list 
linux-lvm@redhat.com 
https://www.redhat.com/mailman/listinfo/linux-lvm
<https://www.redhat.com/mailman/listinfo/linux-lvm>  
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
<http://tldp.org/HOWTO/LVM-HOWTO/>  


------_=_NextPart_001_01C42846.9C619880
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<TITLE>RE: [linux-lvm] LVM and multiple HBA ports</TITLE>

<META content="MSHTML 6.00.2800.1276" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=769324308-22042004><FONT face=Arial color=#0000ff size=2>I 
wouldn't call them 'most storage vendors'&nbsp; rather the 'large 
vendors'.</FONT></SPAN></DIV>
<DIV><SPAN class=769324308-22042004><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=769324308-22042004><FONT face=Arial color=#0000ff size=2>I'm 
using an Infortrend (taiwanese vendor) storage controller. They and all the 
other small vendors, do not support any multiple path failover drivers for 
Linux. Qlogic HBA has some support in their driver, but only if you user their 
user mode management software, which I cannot use since they support only Intel 
and I'm on PPC. They won't supply any documentatin etc regarding how to use it 
programatically.</FONT></SPAN></DIV>
<DIV><SPAN class=769324308-22042004><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=769324308-22042004><FONT face=Arial color=#0000ff size=2>People 
who use Linux because its not expensive, also use inexpensive storage. It does 
not mean they don't want to use advanced features.</FONT></SPAN></DIV>
<DIV><SPAN class=769324308-22042004><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=769324308-22042004><FONT face=Arial color=#0000ff 
size=2>Dan</FONT></SPAN></DIV>
<BLOCKQUOTE dir=ltr 
style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px solid; MARGIN-RIGHT: 0px">
  <DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
  size=2>-----Original Message-----<BR><B>From:</B> Yang, Fred 
  [mailto:FYang@nshs.edu]<BR><B>Sent:</B> Wednesday, April 21, 2004 7:36 
  PM<BR><B>To:</B> 'csc@cadence.com'; 'LVM general discussion and 
  development'<BR><B>Subject:</B> RE: [linux-lvm] LVM and multiple HBA 
  ports<BR><BR></FONT></DIV>
  <P><FONT size=2>What storage you are using? Most storage vendor has their own 
  multi path software, e.g. EMC's powerpath, IBM's SDD. We are using IBM ESS, 
  and we just use the vpath device to create PV, the SDD actually do the load 
  balancing&amp;failover between multiple path.</FONT></P>
  <P><FONT size=2>-Fred</FONT> </P>
  <P><FONT size=2>-----Original Message-----</FONT> <BR><FONT size=2>From: 
  linux-lvm-bounces@redhat.com [<A 
  href="mailto:linux-lvm-bounces@redhat.com">mailto:linux-lvm-bounces@redhat.com</A>] 
  On Behalf Of Chris Croswhite</FONT> <BR><FONT size=2>Sent: Wednesday, April 
  21, 2004 12:17 PM</FONT> <BR><FONT size=2>To: LVM general discussion and 
  development</FONT> <BR><FONT size=2>Subject: Re: [linux-lvm] LVM and multiple 
  HBA ports</FONT> </P>
  <P><FONT size=2>Is this a multipathed device?&nbsp; I first create an MD 
  device of a particular lun like this:</FONT> <BR><FONT size=2>mdadm -C -f -l 
  mp -n 1 -x 1 /dev/md0 /dev/sd&lt;x&gt; /dev/sd&lt;y&gt;</FONT> </P>
  <P><FONT size=2>where x is channel A of the device and y is channel B.</FONT> 
  </P>
  <P><FONT size=2>You can then verify it by:</FONT> <BR><FONT size=2>mdadm 
  --detail /dev/md0</FONT> </P>
  <P><FONT size=2>Does this help?</FONT> </P>
  <P><FONT size=2>On Wed, 2004-04-21 at 09:04, Dan Bar Dov wrote:</FONT> 
  <BR><FONT size=2>&gt; I have a problem using two (or more) ports connected to 
  the same storage.</FONT> <BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; 
  Linux does not identify that the two LUNs it discovers is actually the 
  same.</FONT> <BR><FONT size=2>&gt; When I create a PV all is well. 
  </FONT><BR><FONT size=2>&gt; The PV gets created and is ACTIVE. However, 
  through the other port, </FONT><BR><FONT size=2>&gt; the PV is also 
  discovered, but is marked INACTIVE in the LVM database.</FONT> <BR><FONT 
  size=2>&gt; </FONT><BR><FONT size=2>&gt; When I try to create a VG using the 
  active path, LVM scans all PVs in order.</FONT> <BR><FONT size=2>&gt; If it 
  finds the INACTIVE instance first, the VG creation fails.</FONT> <BR><FONT 
  size=2>&gt; </FONT><BR><FONT size=2>&gt; I'm using LVM 1.0.3, please let mw 
  know if such a situation </FONT><BR><FONT size=2>&gt; (connecting storage 
  through multiple ports) is handled better in </FONT><BR><FONT size=2>&gt; 
  another version, or suggest how to overcome the problem.</FONT> <BR><FONT 
  size=2>&gt; </FONT><BR><FONT size=2>&gt; Thanks,</FONT> <BR><FONT size=2>&gt; 
  Dan</FONT> <BR><FONT size=2>&gt; 
  _______________________________________________</FONT> <BR><FONT size=2>&gt; 
  linux-lvm mailing list</FONT> <BR><FONT size=2>&gt; 
  linux-lvm@redhat.com</FONT> <BR><FONT size=2>&gt; <A 
  href="https://www.redhat.com/mailman/listinfo/linux-lvm" 
  target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A></FONT> 
  <BR><FONT size=2>&gt; read the LVM HOW-TO at <A 
  href="http://tldp.org/HOWTO/LVM-HOWTO/" 
  target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT> </P>
  <P><FONT size=2>_______________________________________________</FONT> 
  <BR><FONT size=2>linux-lvm mailing list</FONT> <BR><FONT 
  size=2>linux-lvm@redhat.com</FONT> <BR><FONT size=2><A 
  href="https://www.redhat.com/mailman/listinfo/linux-lvm" 
  target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A></FONT> 
  <BR><FONT size=2>read the LVM HOW-TO at <A 
  href="http://tldp.org/HOWTO/LVM-HOWTO/" 
  target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT> 
</P></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C42846.9C619880--
