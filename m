Date: Thu, 7 Sep 2000 16:19:26 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM and I2O
Message-ID: <20000907161926.B21633@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <200009070359.VAA05615@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200009070359.VAA05615@lynx.turbolabs.com>; from adilger@turbolinux.com on Wed, Sep 06, 2000 at 09:59:26PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Wed, Sep 06, 2000 at 09:59:26PM -0600, Andreas Dilger wrote:
> Jan Strohbehn writes:
> > I'm trying to get the newest lvm working on I2O-devices, but it seems
> > that the LVM-tools aren't able to recognize them. Has anyone a hint
> > are an idea why this problem appears ???
> 
> That's because LVM was coded to do all of the device/partition searching
> itself.  This is a holdover from 2.0 days when /proc/partitions did not
> exist.
> 
> > Are there any workarounds ???
> 
> What you need to do is go into the LVM user tools (tools/lib/lvm_dir_cache.c)
> and add /dev/i2o (or whatever the base of the device name is) to the list of
> "valid" LVM devices.  You also need to add the block major(s) to at least
> lvm_check_dev.c, lvm_check_partitioned_dev.c.
> 
> The issue of LVM handling partitions/devices/etc itself has caused problems
> in the past, and will probably cause problems in the future.  The solution
> is to have LVM allow anything in /proc/partitions, and only fall back on
> its internal checks if /proc/partitions doesn't exist.

It does this since 0.8final.

_But_ in case a partiton is used to set up a Physical Volume it additionally
checks the partition type identifier to avoid accidents like overwriting
a native Linux partition.

If /proc/partitions would provide a Partition Type Identifier as well,
some of the problem causing LVM library code could be dropped.

> 
> Cheers, Andreas

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
