From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009070359.VAA05615@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM and I2O
Date: Wed, 6 Sep 2000 21:59:26 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>
Cc: j.strohbehn@artstor.de

Jan Strohbehn writes:
> I'm trying to get the newest lvm working on I2O-devices, but it seems
> that the LVM-tools aren't able to recognize them. Has anyone a hint
> are an idea why this problem appears ???

That's because LVM was coded to do all of the device/partition searching
itself.  This is a holdover from 2.0 days when /proc/partitions did not
exist.

> Are there any workarounds ???

What you need to do is go into the LVM user tools (tools/lib/lvm_dir_cache.c)
and add /dev/i2o (or whatever the base of the device name is) to the list of
"valid" LVM devices.  You also need to add the block major(s) to at least
lvm_check_dev.c, lvm_check_partitioned_dev.c.

The issue of LVM handling partitions/devices/etc itself has caused problems
in the past, and will probably cause problems in the future.  The solution
is to have LVM allow anything in /proc/partitions, and only fall back on
its internal checks if /proc/partitions doesn't exist.

Cheers, Andreas
