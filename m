Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3QMEhv02450
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 18:14:43 -0400
Received: from gw.mml.usyd.edu.au (client-101.mml.usyd.edu.au [129.78.188.101])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3QMEfKG006709
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 18:14:42 -0400
Date: Tue, 27 Apr 2004 08:14:30 +1000
From: Franc Carter <franc@mml.usyd.edu.au>
Subject: Re: [linux-lvm] LVM and multiple HBA ports
Message-ID: <20040426221430.GA6989@prog.mml.usyd.edu.au>
References: <2F75AEE4E86FDE44BF97709D289BAA7C719752@vega.voltaire.com>
	<20040426011451.GA12705@prog.mml.usyd.edu.au>
	<1082994820.23573.12.camel@d158140025182.Cadence.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1082994820.23573.12.camel@d158140025182.Cadence.COM>
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
To: csc@cadence.com, LVM general discussion and development <linux-lvm@redhat.com>


Use mdadm to remove the 'failed' device and then add it back in
again (I don't have the mdadm manuals handy to look for the options
to do this, sorry)

On Mon, Apr 26, 2004 at 08:53:40AM -0700, Chris Croswhite wrote:
> How are you setting up the md device?  My issues is how to reclaim a
> failed path on the md device?  So I set mine up like this:
> 
> mdadm --create -f -l mp -n 1 x 1 /dev/md0 /dev/sdx /dev/sdy
> 
> (assuming x and y are the two paths into the one lun).
> 
> On testing fail over, it takes about 12s to fail over.  Checking the md
> device shows this, however, how does one re-enable the failed lun?
> 
> TIA
>  
> On Sun, 2004-04-25 at 18:14, Franc Carter wrote:
> > They way I have handled this is to use an md multipath device to combine the
> > two luns that are seen in to one md device, and then put lvm on top of
> > that.
> > 
> > Seems to work well - however testing 'real' failures rather than capable
> > pulling is somewhat more difficult/risky
> > 
> > On Wed, Apr 21, 2004 at 07:04:13PM +0300, Dan Bar Dov wrote:
> > > I have a problem using two (or more) ports connected to the same storage.
> > > 
> > > Linux does not identify that the two LUNs it discovers is actually the same.
> > > When I create a PV all is well. 
> > > The PV gets created and is ACTIVE. However, through the other port, the PV
> > > is also discovered, but is marked INACTIVE in the LVM database.
> > > 
> > > When I try to create a VG using the active path, LVM scans all PVs in order.
> > > If it finds the INACTIVE instance first, the VG creation fails.
> > > 
> > > I'm using LVM 1.0.3, please let mw know if such a situation (connecting
> > > storage through multiple ports) is handled better in another version, or
> > > suggest how to overcome the problem.
> > > 
> > > Thanks,
> > > Dan
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@redhat.com
> > > https://www.redhat.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Franc Carter     Ph:61-2-8374-5071      Fax: 61-2-8374-5070
Systems Manager, SIRCA Ltd              http://www.sirca.org.au/

DISCLAIMER: The contents of this email, inclusive of attachments, may
be legally privileged and confidential. Any unauthorised use of the
contents is expressly prohibited. If you have received this message in
error or are not the intended recipient, you should destroy the email
message along with any attachment(s).  Unintended recipients of this
email are prohibited from retaining, disclosing, distributing or using
any information contained herein.  This email is also subject to
copyright. No part of it should be reproduced, adapted or transmitted
without the written consent of the copyright owner.
