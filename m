Date: Tue, 6 Jun 2000 18:41:38 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000606184138.A8122@gruyere.muc.suse.de>
References: <H0000aed07d348ed@MHS>
Mime-Version: 1.0
In-Reply-To: <H0000aed07d348ed@MHS>; from holger_zecha@hp.com on Tue, Jun 06, 2000 at 05:44:21PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: holger_zecha@hp.com
Cc: linux-lvm@msede.com

On Tue, Jun 06, 2000 at 05:44:21PM +0200, holger_zecha@hp.com wrote:
> Hello,
> 
> unfortunately, LVM 0.8final (in the following only called LVM) is not
> usable in production environments.
> We're thinking about using Linux in SAP mixed environments. Now we use
> NT as plattform for applikationservers and HP-UX as database server. We
> are doing some tests with Linux as Applikation Server in the near
> future.
> Are you going to implement mirroring in Linux LVM ? Why is it such a big
> problem to have the root filesystem on a LVM volume ?
> There is no easy way to get mirrored disks with LVM, only without LVM,
> but there it's not possible to resize partitions.

Actually it is possible to run LVM on top of a raid1 MD device (or the 
other way round) 

> So we see these two points as big disadvantages:
> a) root Filesystem not on LVM

This is possible with some effort (generate a initrd that contains LVM
tools and initialise LVM before switching to real root). Only thing
you cannot put onto the LVM is the kernel itself; it needs to be 
on a separate partition. It is possible to make the kernel loading
redundant too over multiple partitions by using the appropiate lilo 
configurations and a watchdog.
[So in short it is possible, but not pretty]

On a real production system you probably should not use software RAID1
or RAID5 though. It is unreliable in the crash case though because
it does not support data logging. In this case a hardware RAID controller
is the better alternative. Of course you can run LVM on top of it.

> b) no mirroring.

Try next time some more research before getting to such conclusions ? 


-Andi
