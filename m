Return-Path: <root@srv.sistina.com>
Date: Fri, 15 Jun 2001 16:51:35 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] expanding physical disks
Message-ID: <20010615165135.A4266@sistina.com>
References: <20010612212804.P1658@pc.ilinx> <200106130710.f5D7AhaX005430@webber.adilger.int> <20010613152032.A18554@colombina.comedia.it> <20010615161151.B9980@hal.mailgate.net>
Mime-Version: 1.0
In-Reply-To: <20010615161151.B9980@hal.mailgate.net>; from hal@mailgate.net on Fri, Jun 15, 2001 at 04:11:51PM +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 15, 2001 at 04:11:51PM +0200, Hugo Lombard wrote:
> On Wed, Jun 13, 2001 at 03:20:32PM +0200, Luca Berra wrote:
> > On Wed, Jun 13, 2001 at 01:10:42AM -0600, Andreas Dilger wrote:
> > > Brian Murrell writes:
> > > > How does LVM deal with physical disks that can get bigger or smaller,
> > > > such as a hardware RAID device?  What happens to a PV on a hardware
> > > > RAID-5 device that is presented to the system as a single (say scsci)
> > > > target when you put a few more disks in it and tell the hardware raid
> > > > device to add them to the given (scsi) target that a PV was created
> > > > on?  (what a mouthful).
> > > 
> > > Doesn't work at this time.  LVM will only see what was originally there
> > > at the time pvcreate was run (or possibly vgcreate/vgextend).
> > At the moment your only chance is to create partitions on it and use those
> > partitions as PVs
> > 
> 
> Just a thought, a bit off topic perhaps.

;-)

> 
> If you're using LVM primarily as a way to make it possible for you to
> expand your storage space on-line (and on-mount-point) wouldn't it be
> "easier" to _just_ use the RAID? i.e. expand the RAID volume on the
> controller, so basically the "disk" is bigger now, and the just "grow"
> your partition, extend your filesystem, and that's it?

I think you're right in case you can live with the restrictions involved.

If the amount of resizable volumes a single smart controller can support is
enough, you can surely go with that solution. When it comes to more storage
you need a logical volume manager to group multiple disk subsystems together
in order to support large storage configurations.

> 
> It's a thought I've been toying with since seeing the IBM ServeRAID's
> capability to grow volumes.  I've not attempted any testing though, so
> this is pure speculation...
> 
> (PS: All this means nothing if you're using LVM for it's other
> features, like striping, but then the RAID can do that too...)

Plus LVM's features to move data around online in order to relocate it to
faster/bigger/newer disk subsystems, to have more that just a couple of 
resizable devices, support for hardware block device reconfiguration without
any changes in the namespace of the logical volumes, snapshot support etc.

Regards,
Heinz    -- The LVM Guy --

> 
> 
> 
> 
> -- 
> "You show me an American who can keep his mouth shut and I'll eat him."
> -- Newspaperman from Frank Capra's _Meet_John_Doe_
> ---------------------------------------------------------------------------
>  Hugo Lombard                    Infoline (Pty) Ltd
>  System Administrator
> ---------------------------------------------------------------------------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
