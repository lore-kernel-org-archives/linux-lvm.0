Return-Path: <hal@hal.mailgate.net>
Date: Fri, 15 Jun 2001 16:11:51 +0200
From: Hugo Lombard <hal@mailgate.net>
Subject: Re: [linux-lvm] expanding physical disks
Message-ID: <20010615161151.B9980@hal.mailgate.net>
References: <20010612212804.P1658@pc.ilinx> <200106130710.f5D7AhaX005430@webber.adilger.int> <20010613152032.A18554@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010613152032.A18554@colombina.comedia.it>; from bluca@comedia.it on Wed, Jun 13, 2001 at 03:20:32PM +0200
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

On Wed, Jun 13, 2001 at 03:20:32PM +0200, Luca Berra wrote:
> On Wed, Jun 13, 2001 at 01:10:42AM -0600, Andreas Dilger wrote:
> > Brian Murrell writes:
> > > How does LVM deal with physical disks that can get bigger or smaller,
> > > such as a hardware RAID device?  What happens to a PV on a hardware
> > > RAID-5 device that is presented to the system as a single (say scsci)
> > > target when you put a few more disks in it and tell the hardware raid
> > > device to add them to the given (scsi) target that a PV was created
> > > on?  (what a mouthful).
> > 
> > Doesn't work at this time.  LVM will only see what was originally there
> > at the time pvcreate was run (or possibly vgcreate/vgextend).
> At the moment your only chance is to create partitions on it and use those
> partitions as PVs
> 

Just a thought, a bit off topic perhaps.

If you're using LVM primarily as a way to make it possible for you to
expand your storage space on-line (and on-mount-point) wouldn't it be
"easier" to _just_ use the RAID? i.e. expand the RAID volume on the
controller, so basically the "disk" is bigger now, and the just "grow"
your partition, extend your filesystem, and that's it?

It's a thought I've been toying with since seeing the IBM ServeRAID's
capability to grow volumes.  I've not attempted any testing though, so
this is pure speculation...

(PS: All this means nothing if you're using LVM for it's other
features, like striping, but then the RAID can do that too...)




-- 
"You show me an American who can keep his mouth shut and I'll eat him."
-- Newspaperman from Frank Capra's _Meet_John_Doe_
---------------------------------------------------------------------------
 Hugo Lombard                    Infoline (Pty) Ltd
 System Administrator
---------------------------------------------------------------------------
