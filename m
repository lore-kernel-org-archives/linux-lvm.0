Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1HE4p100561
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 09:04:51 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1HE4oRW000565
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 09:04:50 -0500
Received: from wolverine (wolverine.planbit.co.uk [192.168.0.104])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 2C07812EC7
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 14:04:24 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Date: Fri, 17 Feb 2006 14:04:45 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060216123222.GA23655@redhat.com>
Message-Id: <20060217140424.2C07812EC7@bluewhale.planbit.co.uk>
Subject: [linux-lvm] Booting into LVM
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

I am trying to boot into LVM and am having some problems.  Here is a
summary:

I have a server with a hardware RAID system (which provides logical SCSI
disks) which I want to have running as early as possible in the boot
process.  I cannot boot directly into it, so I have a small (32MB) IDE-FLASH
device onto which I wish to put a standard Linux boot partition.  My plan is
to install LVM onto the (large) RAID system and use logical volumes for "/",
"/var/", etc.

I did a "stock" Debian install and it all worked fine.  The boot partition
is on the IDE-FLASH disk and all the other partitions are via LVM on logical
volumes from the 4TB RAID array.  Unfortunately, the kernel is 2.6.8.  I
need to run 2.6.14 so I built up a new kernel image using the original
sources and a load of patches that I needed.  This kernel image works fine
on other machines, but it will not boot on this machine.  It complains that
it cannot mount "mapper/root" when the Grub line is "root=/dev/mapper/root".

My guess is that LVM isn't being loaded/started/configured correctly at boot
time or that there is some problem with "/dev"...

Can anyone shed any light on this?

Thanks,

Roger
