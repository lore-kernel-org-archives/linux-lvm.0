Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9QLBCvZ009514
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 17:11:12 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <20061026211738.008da405@nim.leo>
References: <20061026211738.008da405@nim.leo>
Message-Id: <67e61b34aeae92681a278b5d3bde28e0@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Mirror resync direction
Date: Thu, 26 Oct 2006 16:14:34 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Oct 26, 2006, at 3:17 PM, Paul LeoNerd Evans wrote:

> I'm running kernel 2.6.17 using the lvm2 package currently in debian
> testing (2.02.06-3). I use it to set up a VG containing two
> PVs, /dev/sda2 and /dev/sdb2. I create a mirror LV using corelog:
>
>   lvcreate --mirror 1 --corelog ...
>
> I create a filesystem on it, and populate it with files. I then try
> testing how it copes with drive failures, by simulating a replaced 
> disk.
>
> To do this, I zero out one of the sides using
>
>   dd if=/dev/zero of=/dev/sda2

This doesn't really reflect what would happen if you replaced a disk, I 
don't think.  With this, you are simply going around mirror's back to 
write data to a device which it controls.

In real life, I think you would have a disk failure (which would force 
you to run 'vgreduce --removemissing vg'), then you would insert a new 
block device, pvcreate/vgextend/lvconvert.

(When dmeventd is properly running, it should take care of the steps 
that are currently manual.)

> Having done that, I do the usual restore method
>
>   pvcreate --uuid 'whatever' /dev/sda2
>   vgcfgrestore vg
>   vgchange -a y
>
> And I note that it starts to resync the mirror. But it goes in the
> "wrong" direction - sda2's PV is the master, but that's been zeroed 
> out.
> sdb2's is the slave but contains the real data. The block copying goes 
> in
> the wrong direction here, copying the master's zeroes over the good 
> data
> in the slave.

Again, mirror has no idea that you did this.  The act of dd'ing to an 
underlying device is like dd'ing to a device under a file system - it 
doesn't know you are doing it and causes corruption.

> Is this a bug in the LVM2 tools, or the dm-mirror target, or what? Is 
> it
> perhaps a limitation of --corelog; in which case, how can I protect
> against that?
>

LVM2 mirroring is still a work in progress (trying to get the right 
pieces upstream).  Depending on the version of LVM2 and the kernel 
patches you have, it may not work.

The use of --corelog simply means that the mirror device will be 
resynchronized every time the device is activated.  The persistent log 
(disk log) tracks what resynchronization has been done and can avoid 
all complete resyncs.

  brassow
