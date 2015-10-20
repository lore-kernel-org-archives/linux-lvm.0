References: <CAPrERe2dc0B=9_YN6sZ9SXKq2JqHQbLMaZYRtsQ1NywEKWxCJw@mail.gmail.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <56269579.8000808@redhat.com>
Date: Tue, 20 Oct 2015 21:26:49 +0200
MIME-Version: 1.0
In-Reply-To: <CAPrERe2dc0B=9_YN6sZ9SXKq2JqHQbLMaZYRtsQ1NywEKWxCJw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Cache Configuration issues
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: mcaubet@pic.es

On 10/19/2015 03:06 PM, Marc Caubet wrote:
> Hi,
>
> I am testing LVM Cache but I am completely concerned about obtained iozone
> results which are worse than without using an SSD card, so my guess is that
> I am doing something wrong.
>
> We have a machine with 2 storage devices sda (LSI Controller 1:
> RAID6(16+2)+RAID6(16+2)) & sdb (LSI Controller 2: RAID6(16+2)+RAID6(16+2)),
> 6TB Disks. Hence, we have a ~384TB (sda = 192TB + sdb = 192TB)
>
> On the other hand, we purchased a 400GB SSD card, which is shown as
> /dev/nvme0n1. I created 2 partitions 356.61 GiB and 16.00 GiB. I guess this
> shouldn't be necessary but I created a 16GiB partition for cache metadata.
>
> vgcreate dcvg_a /dev/sda /dev/sdb
> lvcreate -i 2 -I8192 -n dcpool -l 100%PVS -v dcvg_a /dev/sda /dev/sdb
> lvcreate -n cache0meta -l 100%PVS dcvg_a /dev/nvme0n1p1
> lvcreate -n cache0 -l 100%PVS dcvg_a /dev/nvme0n1p2
> lvconvert --type cache-pool --poolmetadata dcvg_a/cache0meta dcvg_a/cache0
>
> I also tried with a single SSD partition:
>
> vgcreate dcvg_a /dev/sda /dev/sdb
> lvcreate -n dcpool -l 100%PVS dcvg_a
> lvcreate --type cache -l 100%PVS -n cache0 dcvg_a/dcpool /dev/nvme0n1
>
> So here are my questions:
> - I guess both methods are the same, isn't it? The main difference is to
> define or not a specific/custom partition for the pool metadata.
> - Are they correct and which method is the recommended with 1 SSD? Is there
> any "this is the best" recommended setup?

Hello,
LVM will allocate Logical volumes itself, no need allocating partitions.
Using 2 partitions on single drive as PVs may be *harmful* as LVM may 
allocate mirror/RAID with both legs on same device.
As long as you are not using RAIDs/stripes/mirrors you are fine but it 
still makes little sense.

> - Default mode is 'writethrough' which should be safer, but I do not see
> any improvement of performance on reads and neither on writes (I used
> iozone). Instead of this, performance becomes really bad. Why?

Not sure what I/O pattern is used by iozone, but you will see almost no 
effects of caching doing random read/write (by design unless your cache 
device is as large as the slow device which makes no sense) or long 
sequential reads and writes (these can be tuned to some extent).
Only the blocks most often accessed are cached (the number of reads 
should be over threshold).
See 
https://www.kernel.org/doc/Documentation/device-mapper/cache-policies.txt.
Use `lvchange --cachesettings` to adjust them.

> - I would like to set up 'writeback', but for a single SSD (so no RAID1 for
> SSD) which are the risks? I can expect that current data being written will
> be lost, but no data corruption can be found in the Origin LV, isn't it?

Just the opposite. Expect corruption. If there are any filesystem 
metadata written only in the cache, removing the SSD will reliably 
corrupt the filesystem and I assume the FS metadata blocks being among 
those most often accessed.

> - writethrough / writeback caches can be hot-removed from the LVM? As I can
> see, it seems so.

No hot remove, not even in case of writethrough. (Work in progress.) You 
would be able to recover from losing writethrough device using some 
magic, but losing writeback cache will almost for sure corrupt your data.

Regards,

Martian

> - Any suggestions?
>
> Thanks a lot for your help,
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
