Message-ID: <39BD22BA.5243D566@gnu.org>
Date: Tue, 12 Sep 2000 05:21:46 +1100
From: Andrew Clausen <clausen@gnu.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM, partitions, RAID, and the Grand Scheme of ThingsTM
References: <200009112113.e8BLDSj27926@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: parted@gnu.org, Linux LVM mailing list <linux-lvm@msede.com>

Andreas Dilger wrote:
> When using LVM its not important to be able to move the beginning of
> the filesystem, since you can always change the physical LE locations
> without changing the filesystem itself.

True.

> What _is_ interesting, if you live in an LVM-centric world, is being
> able to move the start of the filesystem a small amount into the
> partition (after shrinking the end) so that you can turn the partition
> into an PV/LV.  After such a conversion, you could do any normal LVM
> handling of the LV/filesystem (e.g. shrink, grow, migrate).

Yep :-)

> It may just be easy enough to write a generic tool to shift the partition
> contents X blocks via copying (after using an fs-specific tool to shrink
> the end of the fs), and then handle the creation of the PV header,
> and adding an LV of the appropriate size that covers the whole partition.
> This is only really useful if you don't have enough space to duplicate
> the whole partition.  Otherwise, you are just as well off creating a new
> LV of the appropriate size, doing a raw copy of the filesystem to the new
> LV, and deleting the old partition and/or turning it into a PV.

This is VERY slow (need to read & write the entire file system), and is
dangerous (requires journaling to prevent corruption on power failure,
or other interruptions).  Also: you may copy, at most, X bytes at a
time,
where X is the distance you move the start - unless you use an
intermediate copy area.  Either way (journaling, or intermediate
copying),
you're doing LOTS of seeks (if you're working with one disk) - which is
where IO gets really expensive.

We can do much better :-) 

I'll hopefully implement move-the-start for ext2 when I go to Brazil
(late Nov to late Feb)

> > So, having /sbin/resize.* isn't as elegant as it looks.  Were
> > you suggesting have resize.* deal with partition table stuff?
> 
> Not at all.  The resize.* programs are filesystem specific, and only
> resize from the end of the partition.  I suppose that they could be
> generalized to accept an additional parameter (at the end) to give
> the new start of the partition, e.g. "resize.ext2 /dev/hda1 [size] [start]"

"/dev/hda1" is not as simple as it seems.  It provides a linear address
space from the start of the old partition, to the end of the old
partition.  Where partition is defined by the kernel, BTW.  So, a
resizer
can use that linear address space the kernel provides.  If that is a bad
idea (which it is for move-the-start, and is somewhat dubious for
growth)
- then it must create it's own address space.  i.e. it must understand
partition tables. 

Andrew Clausen
