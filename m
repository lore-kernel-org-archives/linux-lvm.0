Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Wed, 3 Jan 2001 09:33:27 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Sanity check: newbie wants strange LVM configuration
Message-ID: <20010103093327.A619@66bassett.freeserve.co.uk>
References: <3A52B71A.6944E0C5@symbionsys.com>
Mime-Version: 1.0
In-Reply-To: <3A52B71A.6944E0C5@symbionsys.com>; from cworley@symbionsys.com on Tue, Jan 02, 2001 at 10:22:34PM -0700
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

Chris,

First of all wait and see what other people say in response to this
message, I haven't had as much practical experience with LVM as others
and they may think of simpler ways of doing it.  Also I've just
realised I haven't addressed the fact that your root filesystem is on
the 12G drive, the FAQ for this is at
http://www.the-infinite.org/archive/docs/lvm/howto-boot-off-root-lv.txt,
again I'm sure other people can help.

I would use LVM to do the striping, you don't need MD unless you want
redundancy (raid-0 will not give you redundancy).

Check the relative speeds/throughput of the drives, I bought a 30 IBM
drive recently and it was *so* much faster than the old 6G drive, I
think things would slow down if I striped.

I don't think you need to partition the 40G drive at all (except for
the small /boot partition):

1) Turn the whole of 40G into a PV.
2) create a volume group.
3) create a logical volume big enough for your 12G drive
4) copy filesystem across from 12 to new logical volume
5) check you copied it OK
6) turn the 12G drive into a PV
7) extend the volume group with the new PV
8) create a striped logical volume big enough to hold the 12G
9) copy the linear logical volume into the striped volume
10) check you copied it OK
11) remove the linear logical volume

OK so you should now have (40 - 6)G free on the big disk, and (12 -6)G 
free on the smallest disk.

12) create a linear logical volume for the 16G drive
13) copy data from 16G
14) check you copied
15) turn 16G drive into a PV
17) extend VG with new PV
16) create a 16G striped LV
17) copy from the linear 16G into the striped 16G
18) check copy
19) remove linear 16G

You now have a striped LV 12G, a striped LV 16G + lots of left over
extents that can be added when needed.

- Joe

On Tue, Jan 02, 2001 at 10:22:34PM -0700, Chris Worley wrote:
> I've got two disk drives, 12 & 16 GB IDE.  I'm adding a third 40GB
> drive.  Time to start using LVM...
> 
> I want to get better performance, so, I'll put the 40GB drive on one
> IDE controller, the other two drives on the second controller.  I'll
> make two partitions on the 40GB drive that match the disk sizes of the
> existing drives, and stripe each with it's match on the 40GB drive,
> creating two raid0 arrays (one 12+12, and the other 16+16).  By
> placing the dual-partitioned 40GB drive stand-alone on one IDE
> controller, each striped with a partition/drive on the other
> controller, any given file will only be striped across one partition
> on each controller, so I should see the performance benefit of
> striping (on IDE).
> 
> Should I use LVM or MD to do the striping (they both can do it, I was
> just wondering which would be a better choice)?
> 
> Even if I use MD to stripe, I'd use LVM to append the two drives
> together.
> 
> Before appending the drives, I'd make a temporary partition on the
> 40GB drive, and copy the current contents of the 16GB (/home) drive to
> the temporary partition.  Then, I'd make the 16+16 raid0 a logical
> volume, create a reiserfs on it, and copy the information back from
> the temporary partition, to the new reiserfs.
> 
> Since the 12GB drive is the current root partition, it's a bit
> trickier to copy.  I'd copy it's contents to a temporary partition on
> the 40GB drive, boot from that temporary partition, then create the
> second 12+12 raid0, and add it to the first logical volume, then
> expand the reiserfs to cover both, copy the root file system from the
> temporary partition to the new logical volume, and setup a reiserfs
> root and boot.
> 
> Is this the correct approach for upgrading?
> 
> Finally, I'll have ~10GB unallocated on the 40GB drive.  I was
> thinking of adding this to the end of the current logical volume (and,
> again, expand the reiserfs to cover the additional space).
> 
> Since any file system looses performance when more than 90% full, this
> final non-striped partition would be in a position where performance
> would degrade anyway, and keep the raid0's in a position for full
> performance.
> 
> Is that correct?
> 
> Sort of off-topic (not LVM related)...
> 
> I've got an IDE CDROM drive that I want to put on the same controller
> as the 40GB drive.  I've been told that new UDMA drives do not have
> the PIO performance hit associated with CDROM drives, so I should be
> able to get full performance from my 40GB drive, even with a CDROM on
> the same IDE controller.
> 
> Is that correct (or should I junk the IDE CDROM)?
> 
> Thanks,
> 
> Chris
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
