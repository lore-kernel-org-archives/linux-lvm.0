Return-Path: <cworley@liberate.com>
Message-ID: <3A522AE9.8070500@liberate.com>
Date: Tue, 02 Jan 2001 12:24:25 -0700
From: Chris Worley <cworley@liberate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Sanity check: newbie wants strange LVM configuration
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I've got two disk drives, 12 & 16 GB IDE.  I'm adding a third 40GB 
drive.  Time to start using LVM...

I want to get better performance, so, I'll put the 40GB drive on one 
IDE controller, the other two drives on the second controller.  I'll 
make two partitions on the 40GB drive that match the disk sizes of the 
existing drives, and stripe each with it's match on the 40GB drive, 
creating two raid0 arrays (one 12+12, and the other 16+16).  By 
placing the dual-partitioned 40GB drive stand-alone on one IDE 
controller, each striped with a partition/drive on the other 
controller, any given file will only be striped across one partition 
on each controller, so I should see the performance benefit of 
striping (on IDE).

Should I use LVM or MD to do the striping (they both can do it, I was 
just wondering which would be a better choice)?

Even if I use MD to stripe, I'd use LVM to append the two drives together.

Before appending the drives, I'd make a temporary partition on the 
40GB drive, and copy the current contents of the 16GB (/home) drive to 
the temporary partition.  Then, I'd make the 16+16 raid0 a logical 
volume, create a reiserfs on it, and copy the information back from 
the temporary partition, to the new reiserfs.

Since the 12GB drive is the current root partition, it's a bit 
trickier to copy.  I'd copy it's contents to a temporary partition on 
the 40GB drive, boot from that temporary partition, then create the 
second 12+12 raid0, and add it to the first logical volume, then 
expand the reiserfs to cover both, copy the root file system from the 
temporary partition to the new logical volume, and setup a reiserfs 
root and boot.

Is this the correct approach for upgrading?

Finally, I'll have ~10GB unallocated on the 40GB drive.  I was 
thinking of adding this to the end of the current logical volume (and, 
again, expand the reiserfs to cover the additional space).

Since any file system looses performance when more than 90% full, this 
final non-striped partition would be in a position where performance 
would degrade anyway, and keep the raid0's in a position for full 
performance.

Is that correct?

Sort of off-topic (not LVM related)...

I've got an IDE CDROM drive that I want to put on the same controller 
as the 40GB drive.  I've been told that new UDMA drives do not have 
the PIO performance hit associated with CDROM drives, so I should be 
able to get full performance from my 40GB drive, even with a CDROM on 
the same IDE controller.

Is that correct (or should I junk the IDE CDROM)?

Thanks,

Chris
