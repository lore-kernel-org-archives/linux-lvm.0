Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3T72Mv07409
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2004 03:02:22 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3T72L99000583
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2004 03:02:21 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C719775@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Subject: RE: [linux-lvm] LVM and multiple HBA ports
Date: Thu, 29 Apr 2004 10:02:14 +0300
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

The MD multipath solution works only sometimes. Unplugging the active path
during data transfer hanged the system. 
Unplugging between data transfers works fine, but this is hardly real world.

Seems like there's some work on the multipath issue in 2.6, but 2.4 really
lacks a working solution.

Does anyone have experience with qlogic driver multipath support? Any idea
how to activate it programatically (not using their JAVA GUI).

Dan

> -----Original Message-----
> From: Franc Carter [mailto:franc@mml.usyd.edu.au]
> Sent: Monday, April 26, 2004 4:15 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] LVM and multiple HBA ports
> 
> 
> 
> 
> They way I have handled this is to use an md multipath device 
> to combine the
> two luns that are seen in to one md device, and then put lvm on top of
> that.
> 
> Seems to work well - however testing 'real' failures rather 
> than capable
> pulling is somewhat more difficult/risky
> 
> On Wed, Apr 21, 2004 at 07:04:13PM +0300, Dan Bar Dov wrote:
> > I have a problem using two (or more) ports connected to the 
> same storage.
> > 
> > Linux does not identify that the two LUNs it discovers is 
> actually the same.
> > When I create a PV all is well. 
> > The PV gets created and is ACTIVE. However, through the 
> other port, the PV
> > is also discovered, but is marked INACTIVE in the LVM database.
> > 
> > When I try to create a VG using the active path, LVM scans 
> all PVs in order.
> > If it finds the INACTIVE instance first, the VG creation fails.
> > 
> > I'm using LVM 1.0.3, please let mw know if such a situation 
> (connecting
> > storage through multiple ports) is handled better in 
> another version, or
> > suggest how to overcome the problem.
> > 
> > Thanks,
> > Dan
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> -- 
> Franc Carter     Ph:61-2-8374-5071      Fax: 61-2-8374-5070
> Systems Manager, SIRCA Ltd              http://www.sirca.org.au/
> 
> DISCLAIMER: The contents of this email, inclusive of attachments, may
> be legally privileged and confidential. Any unauthorised use of the
> contents is expressly prohibited. If you have received this message in
> error or are not the intended recipient, you should destroy the email
> message along with any attachment(s).  Unintended recipients of this
> email are prohibited from retaining, disclosing, distributing or using
> any information contained herein.  This email is also subject to
> copyright. No part of it should be reproduced, adapted or transmitted
> without the written consent of the copyright owner.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
