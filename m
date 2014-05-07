Date: Wed, 7 May 2014 11:27:57 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140507152757.GA30839@redhat.com>
References: <CAPrERe1-+T+PpQ1gTBUSKzCjKn498TbH45Jnsrf5hrLLHgUiqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPrERe1-+T+PpQ1gTBUSKzCjKn498TbH45Jnsrf5hrLLHgUiqA@mail.gmail.com>
Subject: Re: [linux-lvm] Alignment: XFS + LVM2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Caubet <mcaubet@pic.es>
Cc: linux-lvm@redhat.com

On Tue, May 06 2014 at 11:54am -0400,
Marc Caubet <mcaubet@pic.es> wrote:

> Hi all,
> 
> I am trying to setup a storage pool with correct disk alignment and I hope
> somebody can help me to understand some unclear parts to me when
> configuring XFS over LVM2.
> 
> Actually we have few storage pools with the following settings each:
> 
> - LSI Controller with 3xRAID6
> - Each RAID6 is configured with 10 data disks + 2 for double-parity.
> - Each disk has a capacity of 4TB, 512e and physical sector size of 4K.
> - 3x(10+2) configuration was considered in order to gain best performance
> and data safety (less disks per RAID less probability of data corruption)

What is the chunk size used for these RAID6 devices?
Say it is 256K, you have 10 data devices, so the full stripe would be
2560K.

Which version of lvm2 and kernel are you using?  Newer versions support
a striped LV stripesize that is not a power-of-2.

> >From the O.S. side we see:
> 
> [root@stgpool01 ~]# fdisk -l /dev/sda /dev/sdb /dev/sdc
> 
> Disk /dev/sda: 40000.0 GB, 39999997214720 bytes
> 255 heads, 63 sectors/track, 4863055 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 4096 bytes
> I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> Disk identifier: 0x00000000
> 
> Disk /dev/sdb: 40000.0 GB, 39999997214720 bytes
> 255 heads, 63 sectors/track, 4863055 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 4096 bytes
> I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> Disk identifier: 0x00000000
> 
> Disk /dev/sdc: 40000.0 GB, 39999997214720 bytes
> 255 heads, 63 sectors/track, 4863055 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 4096 bytes
> I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> Disk identifier: 0x00000000
> 
> The idea is to aggregate the above devices and show only 1 storage space.
> We did as follows:
> 
> vgcreate dcvg_a /dev/sda /dev/sdb /dev/sdc
> lvcreate -i 3 -I 4096 -n dcpool -l 100%FREE -v dcvg_a

I'd imagine you'd want the stripesize of this striped LV to match the
underlying RAID6 stripesize no?  So 2560K, e.g. -i 3 -I 2560

That makes for a very large full stripe through...

> Hence, stripe of the 3 RAID6 in a LV.
> 
> And here is my first question: How can I check if the storage and the LV
> are correctly aligned?
> 
> On the other hand, I have formatted XFS as follows:
> 
> mkfs.xfs -d su=256k,sw=10 -l size=128m,lazy-count=1 /dev/dcvg_a/dcpool
> 
> So my second question is, are the above 'su' and 'sw' parameters correct on
> the current LV configuration? If not, which values should I have and why?
> AFAIK su is the stripe size configured in the controller side, but in this
> case we have a LV. Also, sw is the number of data disks in a RAID, but
> again, we have a LV with 3 stripes, and I am not sure if the number of data
> disks should be 30 instead.

Newer versions of mkfs.xfs _should_ pick up the hints exposed (as
minimum_io_size and optimal_io_size) by the striped LV.

But if not you definitely don't want to be trying to pierce through the
striped LV config to establish settings of the underlying RAID6.  Each
layer in the stack should respect the layer beneath it.  So, if the
striped LV is configured how you'd like, you should only concern
yourself with the limits that have been established for the topmost
striped LV that you're layering XFS on.
