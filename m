Return-Path: <lembark@wrkhors.com>
Message-ID: <3AFC4056.D013D2B6@wrkhors.com>
Date: Fri, 11 May 2001 14:41:10 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] What happens when a disk dies?
References: <85256A49.0053DE83.00@janus.eci.esys.com>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> I am very interested in starting to use LVM.  We have large amounts of data
> that is fairly dynamic.  Since it is dynamic, we don't need to incur the
> cost expensive SCSI RAID solutions for data integrity.  We currently use
> four 80 Gig Maxtor Hard Drives to store our data at test events. Of course
> this means with a /drive1 /drive2 /drive3 and a /drive4 directory.  So the
> user has to search the drives to find the file of interest.  We kind of
> hide this by creating links but the links need to be periodically updated
> as files are added or deleted.  LVM solves this problem.  But before I move
> to LVM, I curious on what happens if a drive dies.
> 
>  If drive2 goes down and I replace it with another drive, do I just lose
> the data on drive2 or do I lose all of the data in the Logical Volume?
> 
> If I don't lose the data on the other drives, can LVM also be reconfigured
> to remove the dead drive and then continue working with just the other
> three drives (only losing the data on the dead drive)?
> 
> I read the FAQs and one of them shows how to recover from a dead drive.  It
> is says you lose the data in the Logical Volume but I'm hoping just the
> data on the physical disk that died and not the entire volume.


LVM will not replace mirroring or RAID solutions.  for lots of
dynamic data the best solution will probably be hardware RAID
for the physical layer with LVM using RAID volumes as PV's.

e.g., if you can 4 disks into a RAID5 set then take the whole
RAID volume and use the entire space as a single PV.  you can
then group multiple PV's together into a single VG.  this VG
then gets divied up for the users into various LV's which get
mounted wherever the folks are supposed to use them.  you can
expand an LV within the VG (example:  you just bought 4 more
disks and need to expand existing space into them).  

nice thing about this arrangement is that you can have huge amounts
of total space without needing to expose all of it at once or
drop and rebiuld the filesystems to grow them.  when someone
really does run out of space (or someone new needs it) just expand
or create a LV and go along with life.


-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
