Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9GFWg7f026683
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 11:32:42 -0400
Received: from cdc-exfep1.ciber.cbr.inc (fw.ciber.com [12.10.248.50])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9GFWWvu007017
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 11:32:32 -0400
Subject: Re: [linux-lvm] New to LVM
From: Peter Larsen <plarsen@CIBER.com>
In-Reply-To: <200810161109.37242.d_baron@012.net.il>
References: <200810161109.37242.d_baron@012.net.il>
Date: Thu, 16 Oct 2008 11:32:30 -0400
Message-Id: <1224171150.7716.15.camel@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2008-10-16 at 11:09 +0200, David Baron wrote:
> Looks very good, but have a few questions before setting up that disk:
> 
> 1. Realttime patch kernels -- use with these, io performance hit for audio 
> work?

Straight up LVM has very little overhead once setup. Not really sure
what you mean by real-time patch kernels; the requirement for LVM is to
have device mapper (the dm* module(s)). 
> 
> 2. LV for /? LV_ROOT--Ok to do this? Avoid it? OK if device mapper compiled in 
> kernel (I do not use an initrd)?

Sure! Works great. The only thing that won't work is /boot - but
hopefully GRUB will fix that soon.

It's possible without initrd - you just have to link the dm* modules
static in the kernel. However, it's easily setup with initrd which is
the method I prefer.

> 3. Changes to /etc/fstab look straightforward. Changes to lilo.conf (yes, 
> there are those of us who have not switched to grub)?

LILO - man, haven't used that forever. But the boot loaders don't care.
You still need a /boot that's "non-lvm". Once the kernel is loaded,
there'll be device mapper support and you're go.

> 4. If I leave / as regular partition, how big should this be (containing /lib, 
> /bin, /sbin, /etc, etc.)? Boot on this or separate or does it matter?

That's really a non-LVM question. It depends on your approach. /
basically holds /etc and a few core binaries/libaries. It usually takes
up less than 1GB but I would use 2G minimum. However, it really defeats
the purpose of LVM? With LVM you get the flexibility to change your
sizes/setup dynamically. The idea is to use as little "normal"
partitions as possible to get the maximum flexibility.

> 5. I will create all this on by hdd, copy everything into the fileystems from 
> my current hdb and then move the hdd to the hdb slot. Docs say this is OK (and 
> imply that I could even try it out booting from the old hdb  /boot). True?

Everything now a days uses UUID or similar ways to identify devices.
When you format a hdd with LVM it gets assigned an UUID. This is what
the "assembler" looks for - your groups are groups of UUIDs. So you can
move your disks around as much as you want.

Only grub/lilo is really fixated on the BIOS address of your harddisk.
Everything else shouldn't care anymore (and yes /etc/fstab should use
UUIDs too).

--- 
Regards
    Peter Larsen

I'm telling you that the kernel is stable not because it's a kernel,
but because I refuse to listen to arguments like this.
	-- Linus Torvalds
