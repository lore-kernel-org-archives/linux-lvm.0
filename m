Return-Path: <bluca@comedia.it>
Date: Wed, 13 Jun 2001 15:20:32 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] expanding physical disks
Message-ID: <20010613152032.A18554@colombina.comedia.it>
References: <20010612212804.P1658@pc.ilinx> <200106130710.f5D7AhaX005430@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200106130710.f5D7AhaX005430@webber.adilger.int>; from adilger@turbolinux.com on Wed, Jun 13, 2001 at 01:10:42AM -0600
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

On Wed, Jun 13, 2001 at 01:10:42AM -0600, Andreas Dilger wrote:
> Brian Murrell writes:
> > How does LVM deal with physical disks that can get bigger or smaller,
> > such as a hardware RAID device?  What happens to a PV on a hardware
> > RAID-5 device that is presented to the system as a single (say scsci)
> > target when you put a few more disks in it and tell the hardware raid
> > device to add them to the given (scsi) target that a PV was created
> > on?  (what a mouthful).
> 
> Doesn't work at this time.  LVM will only see what was originally there
> at the time pvcreate was run (or possibly vgcreate/vgextend).
At the moment your only chance is to create partitions on it and use those
partitions as PVs

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
