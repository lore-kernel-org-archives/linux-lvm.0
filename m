Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LGaop00432
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:36:50 -0400
Received: from northshorelij.com (451be50f.cst.lightpath.net [69.27.229.15])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3LGanFe026436
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:36:49 -0400
Message-ID: <DD0BAC5EF106D7118E6D0002557B6A8C711DB2@nt40wb972xch03.nshs.edu>
From: "Yang, Fred" <FYang@nshs.edu>
Subject: RE: [linux-lvm] LVM and multiple HBA ports
Date: Wed, 21 Apr 2004 12:35:55 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C427BE.B7B891D4"
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
To: "'csc@cadence.com'" <csc@cadence.com>, 'LVM general discussion and development' <linux-lvm@redhat.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C427BE.B7B891D4
Content-Type: text/plain

What storage you are using? Most storage vendor has their own multi path
software, e.g. EMC's powerpath, IBM's SDD. We are using IBM ESS, and we just
use the vpath device to create PV, the SDD actually do the load
balancing&failover between multiple path.

-Fred

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Chris Croswhite
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
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------_=_NextPart_001_01C427BE.B7B891D4
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2657.73">
<TITLE>RE: [linux-lvm] LVM and multiple HBA ports</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>What storage you are using? Most storage vendor has =
their own multi path software, e.g. EMC's powerpath, IBM's SDD. We are =
using IBM ESS, and we just use the vpath device to create PV, the SDD =
actually do the load balancing&amp;failover between multiple =
path.</FONT></P>

<P><FONT SIZE=3D2>-Fred</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: linux-lvm-bounces@redhat.com [<A =
HREF=3D"mailto:linux-lvm-bounces@redhat.com">mailto:linux-lvm-bounces@re=
dhat.com</A>] On Behalf Of Chris Croswhite</FONT>
<BR><FONT SIZE=3D2>Sent: Wednesday, April 21, 2004 12:17 PM</FONT>
<BR><FONT SIZE=3D2>To: LVM general discussion and development</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [linux-lvm] LVM and multiple HBA =
ports</FONT>
</P>

<P><FONT SIZE=3D2>Is this a multipathed device?&nbsp; I first create an =
MD device of a particular lun like this:</FONT>
<BR><FONT SIZE=3D2>mdadm -C -f -l mp -n 1 -x 1 /dev/md0 =
/dev/sd&lt;x&gt; /dev/sd&lt;y&gt;</FONT>
</P>

<P><FONT SIZE=3D2>where x is channel A of the device and y is channel =
B.</FONT>
</P>

<P><FONT SIZE=3D2>You can then verify it by:</FONT>
<BR><FONT SIZE=3D2>mdadm --detail /dev/md0</FONT>
</P>

<P><FONT SIZE=3D2>Does this help?</FONT>
</P>

<P><FONT SIZE=3D2>On Wed, 2004-04-21 at 09:04, Dan Bar Dov =
wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; I have a problem using two (or more) ports =
connected to the same storage.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Linux does not identify that the two LUNs it =
discovers is actually the same.</FONT>
<BR><FONT SIZE=3D2>&gt; When I create a PV all is well. </FONT>
<BR><FONT SIZE=3D2>&gt; The PV gets created and is ACTIVE. However, =
through the other port, </FONT>
<BR><FONT SIZE=3D2>&gt; the PV is also discovered, but is marked =
INACTIVE in the LVM database.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; When I try to create a VG using the active =
path, LVM scans all PVs in order.</FONT>
<BR><FONT SIZE=3D2>&gt; If it finds the INACTIVE instance first, the VG =
creation fails.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I'm using LVM 1.0.3, please let mw know if such =
a situation </FONT>
<BR><FONT SIZE=3D2>&gt; (connecting storage through multiple ports) is =
handled better in </FONT>
<BR><FONT SIZE=3D2>&gt; another version, or suggest how to overcome the =
problem.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Thanks,</FONT>
<BR><FONT SIZE=3D2>&gt; Dan</FONT>
<BR><FONT SIZE=3D2>&gt; =
_______________________________________________</FONT>
<BR><FONT SIZE=3D2>&gt; linux-lvm mailing list</FONT>
<BR><FONT SIZE=3D2>&gt; linux-lvm@redhat.com</FONT>
<BR><FONT SIZE=3D2>&gt; <A =
HREF=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" =
TARGET=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</A><=
/FONT>
<BR><FONT SIZE=3D2>&gt; read the LVM HOW-TO at <A =
HREF=3D"http://tldp.org/HOWTO/LVM-HOWTO/" =
TARGET=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT>
</P>

<P><FONT =
SIZE=3D2>_______________________________________________</FONT>
<BR><FONT SIZE=3D2>linux-lvm mailing list</FONT>
<BR><FONT SIZE=3D2>linux-lvm@redhat.com</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" =
TARGET=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</A><=
/FONT>
<BR><FONT SIZE=3D2>read the LVM HOW-TO at <A =
HREF=3D"http://tldp.org/HOWTO/LVM-HOWTO/" =
TARGET=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C427BE.B7B891D4--
