Message-ID: <3D31C52B.6050000@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RAID extension and lvm
References: <Pine.LNX.4.44.0207142010160.29796-100000@poseidon.ihs.uni-stuttgart.de>
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
Date: Sun Jul 14 13:45:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Did you partition the disk, or did you put LVM on the raw disk 
unpartitioned?

If the disk is partitioned, run fdisk/cfdisk/disk druid to add that 
partition on the end (I've never done this, so take it with a grain of 
salt).  I don't believe that the partition table has the complete size 
of the disk, I believe it just has the sizes of the current partitions. 
  So it should be safe (the key work being: should).

Run pvcreate on the newly created partition.

Now follow the HOWTO on adding another pv to a vg.  I believe all you do 
is run vgextend then lvextend or lvcreate.

If you didn't set it up using partitions, and it is a raw block device 
you have issues.  I've got no idea how to help.  Sorry...  Report back 
if what works :-)

	Thanks,
		Kirby


Ralf Eisinger wrote:
> Sorry, I think there is/was something confusing. We want to have the
> following scenario:
> 
> - we had an hardware raid5 with three disks (so we get the size from two
>   of them)
> - from the view of the kernel there is one big SCSI disk
> - on that disk I install lvm (for snapshots) and ext3
> - ...
> - we are working (heavily ;-) on that disks
> - ...
> - Because we are running out of disk space, I plug in a new disk
>   and add them to the existing raid5. So it will have now four disks.
>   This adding is done by the hardware.
> - Now the disk size of the "one big disk" is changed to the new
>   "netto" size of the raid5.
> 
> Is it possible to handle that with lvm and when the answer is "yes", in
> which way? One point was a command named "pvresize" but I didn't find it
> in my distribution (SuSE 8.0) and I find nothing about that in the HOWTO.
> 
> 
