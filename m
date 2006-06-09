Message-ID: <44895D27.50107@conterra.de>
Date: Fri, 09 Jun 2006 13:36:07 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Is it better to use partitions or entire disk for LVM?
References: <1cbd6f830606040746j5af7c102y75d13748e4d2c627@mail.gmail.com>
	<20060605223153.GA21795@redhat.com>
In-Reply-To: <20060605223153.GA21795@redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Heinz Mauelshagen wrote:
> On Sun, Jun 04, 2006 at 10:46:45AM -0400, Mag Gam wrote:
>> Is it better to create 1 partition on a disk, and use that into the LVM, or
>> have a blank disk, and use that in the LVM (if possible)?
> 
> As long as we still need to live with partition tables, the advantage
> of having 1 partition to create a PV on it is, that all related tools
> (e.g. parted) *show* that there's an LVM partition.
> 
> Without a partition table on the device, it is easier to overlook that
> the device is being used by LVM.
> 
> Of course LVM tools such as 'pvscan' or 'pvs' will show that fact.
> 
> Having said that, it is up to you to go without the technically superfluous
> partition table on an LVM-only device or not.

But, using a partition introduces some odd offset between physical and logical
sector numbers. In general this does not matter, but if the underlaying
device is a raid array, you may gain some performance, if the PE's are 
aligned with the underlaying stripe set. Also any embedded EXT2 system
may profit from this (see: -E stride).

But I don't think we "still need to live with partition tables" for ever.
If I have a look at GPT or LDM, they overcome the partition table by degrading
it to a protective dummy partition. It's only purpose is to defend against fdisk.
Thus the PV is no longer part of a partitioned disk. Instead LVM takes over
the whole disk and the "partition" becomes a dummy part of the PV.
Also the partition Id must NOT be 0x8E. Until the kernel is aware about this,
it will show up both sda and sda1. LVM, however, should correctly choose sda
over sda1 as the "sector_xl" entry won't match for sda1.

I think this concept may even be driven further towards booting from LVM.
The first boot sector may never contain any LVM aware logic. But instead
of reserving some space outside LVM, why not provide the necessary space
INSIDE lvm? I may reserve the first PE (or PEs) for a regular LV to hold /boot.
The boot-sector just has to point to it and loads the kernel and initrd.
The kernel will then load the VG to mount its root from LVM.
Thus the boostrap code (i.e. grub) does not need to know too much about LVM.
(may be the installation procedure has to...)

does this make any sense?

Regards, Dieter.
