Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LGs0p07126
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:54:00 -0400
Received: from mailgate.Cadence.COM (mailgate.Cadence.COM [158.140.2.1])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LGrxMc014581
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:53:59 -0400
Subject: RE: [linux-lvm] LVM and multiple HBA ports
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <DD0BAC5EF106D7118E6D0002557B6A8C711DB2@nt40wb972xch03.nshs.edu>
References: <DD0BAC5EF106D7118E6D0002557B6A8C711DB2@nt40wb972xch03.nshs.edu>
Message-Id: <1082566865.5804.554.camel@d158140025182.Cadence.COM>
Mime-Version: 1.0
Date: Wed, 21 Apr 2004 10:01:05 -0700
Content-Transfer-Encoding: 7bit
Reply-To: csc@cadence.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: "Yang, Fred" <FYang@nshs.edu>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>

If you are using SDD with ESS, according to the manual, SDD does not
work with any volume manager (pg 186).  I have tried w/EVMS and sure
enough and SDD 1.5.0.3-9, the device fails with any kind of lun
failure.  This is why I had to use the kernel multipathing.  The
unfortunate part, I can not figure out how to reclaim a failed path to
allow it work again once it has been failed.



  On Wed, 2004-04-21 at 09:35, Yang, Fred wrote:
> What storage you are using? Most storage vendor has their own multi
> path software, e.g. EMC's powerpath, IBM's SDD. We are using IBM ESS,
> and we just use the vpath device to create PV, the SDD actually do the
> load balancing&failover between multiple path.
> 
> -Fred
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Chris Croswhite
> Sent: Wednesday, April 21, 2004 12:17 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] LVM and multiple HBA ports
> 
> Is this a multipathed device?  I first create an MD device of a
> particular lun like this:
> mdadm -C -f -l mp -n 1 -x 1 /dev/md0 /dev/sd<x> /dev/sd<y>
> 
> where x is channel A of the device and y is channel B.
> 
> You can then verify it by:
> mdadm --detail /dev/md0
> 
> Does this help?
> 
> On Wed, 2004-04-21 at 09:04, Dan Bar Dov wrote:
> > I have a problem using two (or more) ports connected to the same
> storage.
> > 
> > Linux does not identify that the two LUNs it discovers is actually
> the same.
> > When I create a PV all is well. 
> > The PV gets created and is ACTIVE. However, through the other port, 
> > the PV is also discovered, but is marked INACTIVE in the LVM
> database.
> > 
> > When I try to create a VG using the active path, LVM scans all PVs
> in order.
> > If it finds the INACTIVE instance first, the VG creation fails.
> > 
> > I'm using LVM 1.0.3, please let mw know if such a situation 
> > (connecting storage through multiple ports) is handled better in 
> > another version, or suggest how to overcome the problem.
> > 
> > Thanks,
> > Dan
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
