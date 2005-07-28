Subject: Re: [linux-lvm] how to access the partition on LV?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <20050728164523.GF4954@null.msp.redhat.com>
References: <1122563861.9888.1.camel@localhost.localdomain>
	<20050728164523.GF4954@null.msp.redhat.com>
Date: Thu, 28 Jul 2005 13:13:50 -0400
Message-Id: <1122570830.9888.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: AJ Lewis <alewis@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2005-07-28 at 11:45 -0500, AJ Lewis wrote:
> On Thu, Jul 28, 2005 at 11:17:41AM -0400, Ming Zhang wrote:
> > I think this is a very common question but i can not find the answer.
> > any idea on how to access the partition on these lv since no device
> > node?
> > 
> > 
> > [root@fc3-i386-2 ~]# fdisk /dev/vg1/v1 -l
> > 
> > Disk /dev/vg1/v1: 469 MB, 469762048 bytes
> > 255 heads, 63 sectors/track, 57 cylinders
> > Units = cylinders of 16065 * 512 = 8225280 bytes
> > 
> >        Device Boot      Start         End      Blocks   Id  System
> > /dev/vg1/v1p1               1          13      104391   83  Linux
> > /dev/vg1/v1p2              14          57      353430   83  Linux
> 

the problem is that we export a LV via iscsi to a remote box and become
a scsi disk. so it is partitioned and utilized. then it does have
partition on it. even it is exported to a linux box, u possibly will
use /dev/sdx1 instead of directly use /dev/sdx, rite?

> You don't.  Don't put partition tables on LVs.  The whole point of using LVM
> is you don't need to partition anymore, and your block devices can be dynamic.
> If you another block devices, you lvcreate it.  If you don't have enough space
> in your VG, you add a PV to it, then lvcreate the new block device.  Have you
> read through the HOWTO referenced below?

i can not see this HOWTO, where u referenced it?

thx!

ming

> 
