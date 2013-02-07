Message-ID: <5113A5D5.3070808@redhat.com>
Date: Thu, 07 Feb 2013 14:02:13 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAMugGiGoVAKVTXHrcTwLOkiGCOF_iK5BsGKPo-5bHhXiC-f4tg@mail.gmail.com>
In-Reply-To: <CAMugGiGoVAKVTXHrcTwLOkiGCOF_iK5BsGKPo-5bHhXiC-f4tg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] create physical partition from logical partition
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
Cc: fakhreddine HABIB <fakhreddine2006@gmail.com>

On 02/06/2013 06:10 PM, fakhreddine HABIB wrote:
> Hi,
>
>     I nead please your help to create a physical partition from a logical
> partition.
>
>     I present my problem : I have the configuration (attached pic) of the
> partitions.
>
>     I use the centos system. The problem that my group volume "vg_rega" use
> the whole of the physical disk. I want to install Ubuntu system with centos
> (dual boot), but i need a physical partition to do that. How can'i convert
> the " Unused Space " logical partition to physical partition to install
> Ubuntu.

1st: backup your data! Though operations should be safe, there is always 
human factor and other risks.

Before creating a new partition you will need to resize (shrink) the PV:

     pvresize --pvresize --setphysicalvolumesize DESIRED_PV_SIZE /dev/sda2

pvresize should be safe: it will only shrink PV when there is free space 
at the end, but does not relocate LVs if the free space is in the 
middle. In that case you will need to move the extents first:

     pvmove --alloc anywhere /dev/sda2:OLDSTART-OLDEND /dev/sda2

This may not work correctly and allocate data in the region being moved 
from (which needs to verify with latest version and report)

Then you should be able to shrink the sda2 partition, using parted or 
fdisk. This may be the riskiest part.

However, Ubuntu is able to use Logical Volumes, so you should not need 
to add more physical partitions: for me "dualboot" of 2 linux systems 
with single /boot partition worked mostly fine - except when one is 
using old grub (CentOS) and another grub2 (ubuntu), but even that is not 
impossible...

-- Marian

>
>    Thank you.
>
> F.H
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
