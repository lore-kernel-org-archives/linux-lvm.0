Subject: Re: [linux-lvm] how to access the partition on LV?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <20050728173218.GH4954@null.msp.redhat.com>
References: <1122563861.9888.1.camel@localhost.localdomain>
	<20050728164523.GF4954@null.msp.redhat.com>
	<1122570830.9888.10.camel@localhost.localdomain>
	<20050728173218.GH4954@null.msp.redhat.com>
Date: Thu, 28 Jul 2005 13:42:10 -0400
Message-Id: <1122572530.9888.26.camel@localhost.localdomain>
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

On Thu, 2005-07-28 at 12:32 -0500, AJ Lewis wrote:
> On Thu, Jul 28, 2005 at 01:13:50PM -0400, Ming Zhang wrote:
> > On Thu, 2005-07-28 at 11:45 -0500, AJ Lewis wrote:
> > > On Thu, Jul 28, 2005 at 11:17:41AM -0400, Ming Zhang wrote:
> > > > I think this is a very common question but i can not find the answer.
> > > > any idea on how to access the partition on these lv since no device
> > > > node?
> > > > 
> > > > 
> > > > [root@fc3-i386-2 ~]# fdisk /dev/vg1/v1 -l
> > > > 
> > > > Disk /dev/vg1/v1: 469 MB, 469762048 bytes
> > > > 255 heads, 63 sectors/track, 57 cylinders
> > > > Units = cylinders of 16065 * 512 = 8225280 bytes
> > > > 
> > > >        Device Boot      Start         End      Blocks   Id  System
> > > > /dev/vg1/v1p1               1          13      104391   83  Linux
> > > > /dev/vg1/v1p2              14          57      353430   83  Linux
> > > 
> > 
> > the problem is that we export a LV via iscsi to a remote box and become
> > a scsi disk. so it is partitioned and utilized. then it does have
> > partition on it. even it is exported to a linux box, u possibly will
> > use /dev/sdx1 instead of directly use /dev/sdx, rite?
> 
> Ahh - I see.  Well, on the node exporting the LVs, you don't access it.  I
> dunno if kpartx or some other partitioning tool could do it - it might.  But
> as far as the standard partion handling code goes, LVs don't exist.  I know
> why you're doing it this way - I don't know why you want to access the
> partitions on the exporting (target) node.  Do you really need to?
yes, i guess that is the only solution. we have end users want that
feature. so i think a work around is to run a iscsi initiator at local
site and access via iscsi again.


>  
> > > You don't.  Don't put partition tables on LVs.  The whole point of using
> > > LVM is you don't need to partition anymore, and your block devices can be
> > > dynamic.  If you another block devices, you lvcreate it.  If you don't
> > > have enough space in your VG, you add a PV to it, then lvcreate the new
> > > block device.  Have you read through the HOWTO referenced below?
> > 
> > i can not see this HOWTO, where u referenced it?
> 
> It's at the bottom of all messages that go to the linux-lvm ML -
> http://tldp.org/HOWTO/LVM-HOWTO/ 

i guess this is because i got the email from u directly. so lvm list
will not send to me again. and only email via it will have that link. i
checked my archival and all emails via lvm list has that.
