Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3M832p00717
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 04:03:02 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3M830Mc016898
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 04:03:01 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C719758@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Subject: RE: [linux-lvm] LVM and multiple HBA ports
Date: Thu, 22 Apr 2004 11:02:44 +0300
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


1. What is the kernel multipathing you refer to? 

2. using MD to aggregate multiple paths to a virtual path is a very
interesting idea which I will check. Correct me if I'm wrong but it does not
support path failover ?

Thanks,
Dan


> -----Original Message-----
> From: Chris Croswhite [mailto:csc@cadence.com]
> Sent: Wednesday, April 21, 2004 8:01 PM
> To: Yang, Fred
> Cc: 'LVM general discussion and development'
> Subject: RE: [linux-lvm] LVM and multiple HBA ports
> 
> 
> If you are using SDD with ESS, according to the manual, SDD does not
> work with any volume manager (pg 186).  I have tried w/EVMS and sure
> enough and SDD 1.5.0.3-9, the device fails with any kind of lun
> failure.  This is why I had to use the kernel multipathing.  The
> unfortunate part, I can not figure out how to reclaim a failed path to
> allow it work again once it has been failed.
> 
> 
> 
>   On Wed, 2004-04-21 at 09:35, Yang, Fred wrote:
> > What storage you are using? Most storage vendor has their own multi
> > path software, e.g. EMC's powerpath, IBM's SDD. We are 
> using IBM ESS,
> > and we just use the vpath device to create PV, the SDD 
> actually do the
> > load balancing&failover between multiple path.
> > 
> > -Fred
> > 
> > -----Original Message-----
> > From: linux-lvm-bounces@redhat.com
> > [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Chris Croswhite
> > Sent: Wednesday, April 21, 2004 12:17 PM
> > To: LVM general discussion and development
> > Subject: Re: [linux-lvm] LVM and multiple HBA ports
> > 
> > Is this a multipathed device?  I first create an MD device of a
> > particular lun like this:
> > mdadm -C -f -l mp -n 1 -x 1 /dev/md0 /dev/sd<x> /dev/sd<y>
> > 
> > where x is channel A of the device and y is channel B.
> > 
> > You can then verify it by:
> > mdadm --detail /dev/md0
> > 
> > Does this help?
> > 
> > On Wed, 2004-04-21 at 09:04, Dan Bar Dov wrote:
> > > I have a problem using two (or more) ports connected to the same
> > storage.
> > > 
> > > Linux does not identify that the two LUNs it discovers is actually
> > the same.
> > > When I create a PV all is well. 
> > > The PV gets created and is ACTIVE. However, through the 
> other port, 
> > > the PV is also discovered, but is marked INACTIVE in the LVM
> > database.
> > > 
> > > When I try to create a VG using the active path, LVM scans all PVs
> > in order.
> > > If it finds the INACTIVE instance first, the VG creation fails.
> > > 
> > > I'm using LVM 1.0.3, please let mw know if such a situation 
> > > (connecting storage through multiple ports) is handled better in 
> > > another version, or suggest how to overcome the problem.
> > > 
> > > Thanks,
> > > Dan
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@redhat.com
> > > https://www.redhat.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
