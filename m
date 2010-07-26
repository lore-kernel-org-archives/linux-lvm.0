Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6QCH9Sr023590
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2010 08:17:09 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6QCGvLU002075
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2010 08:16:58 -0400
Date: Mon, 26 Jul 2010 08:16:54 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4C4D4B47.8000201@redhat.com>
Message-ID: <Pine.LNX.4.64.1007260805250.3000@bmsred.bmsi.com>
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
	<4C4D4B47.8000201@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk Partitioning tools, GUI preferably- best for
 LVM Logical Volume Management ; jor
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: giovanni_re <john_re@fastmail.us>

On Mon, 26 Jul 2010, Bryn M. Reeves wrote:

> On 07/24/2010 04:28 AM, giovanni_re wrote:
> > So, I've got that big LV 4th partition, with empty space (2TB drive),
> > and now I want to create some more linux partitions so I can install
> > some other distros.
> 
> If you want VMs then partitioning an LV makes sense. You present the
> entire LV as a virtual disk to the guest and the emulated devices appear
> to that OS as a regular partitioned disk. This is a very common technique.

Using Xen modified OSes, you don't need to partition the LVs.  The 
xen storage driver presents each mapped block device as a virtual
partition.

> If you want to boot these directly on the hardware however you might
> want to reconsider your approach. Partitioned LVs are not supported
> out-of-the box by any distro that I know of. I think you would need to
> mess around with custom boot scripts to get the system to boot properly
> and you'll probably need to do some special tricks to get a standard
> distro installer to install onto these partitioned LVs. You would also
> need to figure out a way of sharing a /boot partition (on the physical
> disk) between all the installed distributions to avoid conflicts since
> PC BIOS boot support does not handle LVM devices.

Booting multiple LVM supporting OSes works fine with LVM.  Have a LV for the
root filesystem of each Linux OS, and have them all on the Grub menu.
Make the /boot partition extra large.  I do this with every laptop
and desktop as SOP.  Make Fedora upgrades much less fearful.

If necessary, you can boot non LVM OSes installed in a DOS partition
via a chain menu entry in grub.  (e.g. boot Windows)

> If this is your goal then you might find it easier to allocate a single
> LV to each new installation and use that directly. With a bit of fancy
> footwork in grub (and as long as each distro supports installation to an
> existing LVM2 volume group) I think this should work and would be easier
> and simpler to set up.

If every distro sticks to reasonable naming conventions in /boot (so
that they don't step on each others kernels), then it all works fine.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
