Date: Mon, 30 Oct 2000 18:37:01 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM Partition Dependency
Message-ID: <20001030183701.B25707@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <OF8DC01629.AB96EF23-ON86256988.00577766@imation.com>
Mime-Version: 1.0
In-Reply-To: <OF8DC01629.AB96EF23-ON86256988.00577766@imation.com>; from pbmonday@imation.com on Mon, Oct 30, 2000 at 10:01:09AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pbmonday@imation.com
Cc: linux-lvm@msede.com


Hi Paul.

On Mon, Oct 30, 2000 at 10:01:09AM -0600, pbmonday@imation.com wrote:
> 
> I'm trying to construct an LVM solution with block devices that are not
> located in the partition table (becuase they are not a local fixed physical
> disk). 

Sounds like NBD or friends.

> I'm curious how deep the dependency on being in the partition goes
> with the LVM.

Actually not very deep.

> 
> For example, I know the /proc/partitions file is checked during
> pvcreate...

Yes.
It is done in tools/lib/lvm_dir_cache.c
You need to extend the devdir array.

> if I rewrote pvcreate to get around this check would I encounter
> other dependencies on actually being a drive partition located on the local
> machine later?

It is less a question of beeing local to the machine because there's NBD
support build in anyway. It's more a question of checking for supported
devices in tools/lib/lvm_check_dev.c based on device majors.

> 
> Or, if I added my block device to the partitions table, would that be
> enough to fulfill all requirements of being a local partition that are
> required by the LVM?

That and addiing a new device major to lvm_check_dev.c should do it.

> 
> Would the problems be only with the user space tools, or would there also
> be problems in the kernel module?

The driver only remaps devices and sectors based on tables the userspace
supplies. The only thing it needs to care about that it is a block device ;-)

> 
> Just curious on how far I would have to go to "trick" or "modify" the LVM
> to accept something other than a local hard drive partition.

As i mentioned above: NBD should work.

> 
> Thank you,
> Paul Monday
> pbmonday@imation.com
> 

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
