Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i764LYa22342
	for <linux-lvm@redhat.com>; Fri, 6 Aug 2004 00:21:34 -0400
Received: from ripple.fruitbat.org (ip-66-80-62-153.dsl.sca.megapath.net
	[66.80.62.153])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i764LRXn015014
	for <linux-lvm@redhat.com>; Fri, 6 Aug 2004 00:21:27 -0400
Received: (from daemon@localhost)
	by ripple.fruitbat.org (8.10.2/8.8.8/PAC-1.3) id i764LAw01986
	for <linux-lvm@redhat.com>; Thu, 5 Aug 2004 21:21:10 -0700
Received: from ming.fruitbat.org (IDENT:202@ming.fruitbat.org [192.168.1.2])
	by ming.fruitbat.org (8.12.10/8.10.2/PAC-1.6) with ESMTP id
	i764KqV1002755
	for <linux-lvm@redhat.com>; Thu, 5 Aug 2004 21:20:52 -0700
Date: Thu, 5 Aug 2004 21:20:52 -0700 (PDT)
From: "Peter A. Castro" <doctor@fruitbat.org>
Subject: Re: [linux-lvm] ext3 on LVM2 on RAID 5
In-Reply-To: <1091198673.410a5ed155ab3@sms.ed.ac.uk>
Message-ID: <Pine.LNX.4.58.0408052051070.1836@ming.fruitbat.org>
References: <1091198673.410a5ed155ab3@sms.ed.ac.uk>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 30 Jul 2004, Rupert Hair wrote:

> I have read various posts on this topic and none have been answered so I
> thought I'd try again.
>
> I have spent an afternoon with google trying to find any information on
> using ext3 on a LVM2 LV on a RAID 5 PV.  I have found various reports of
> this working OK but no recommendations for PE size for the LV, the
> 'chunk-size' on the RAID and the mk2fs stride option.
>
> If anyone uses this configuration I would greatly appreciate any input on
> what values you used for the options above and any other good or bad
> experiences you had with this setup.

I run this kind of setup with 6 SCSI drives and 4 SATA drives and have
not had any problems.  The LVM and RAID how-to's are pretty complete as
to how this all hangs together.  Basically the stride is your chunk-size
divided by your filesystem block size.

Eg: I have a chunk-size of 128k, and a physical extent size of 16M.  I
use a 4k block size in mke2fs and thus the stride is 128k/4k = 32.  I'd
suggest you use mdadm instead of the raidtools as it's a heck of a lot
easier to use.

$ mdadm --create /dev/md0 --chunk=128 --level=5  --raid-devices=6 \
  /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/sdg1
$ vgscan    # assumes you've setup proper mask to look only at /dev/md?
$ pvcreate /dev/md0
$ vgcreate --autobackup y --physicalextentsize 16M vg0 /dev/md0
$ lvcreate --autobackup y --size 50G --name worklv vg0
$ mke2fs -b 4096 -f 4096 -j -O sparse_super -R stride=32 /dev/vg0/worklv

I see from below you are using both PATA and SATA.  You might want to
partition these drives into separate raid arrays (ie: all PATA in one,
all SATA in another).  The PATA will be slower than the SATA.  If you mix
the drives in the array your performance might suffer.  I'd suggest you
try mixing and matching and then run some disk performance tests on the
raw raid partitions before deciding on a final configuration.  Hint: you
don't need to create hugh arrays for these tests.  Use smaller disk
partitions for your tests to reduce the amount of time spent on building
the test arrays.  When you've come up with the best performing
combination, then you can re-create the partitions full size.

Good luck!

> Thanks in advance,
>
> Rupert
>
> Ps. Details of the machine in question (in case they are relevant):
>       9 x 250GB drives spread across various parallel and serial ATA
> controllers.
>       Debian testing with kernel 2.6.6
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

-- 
Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
	"Cats are just autistic Dogs" -- Dr. Tony Attwood
