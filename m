From: duffy1!duffy1!rjakob@chico.franken.de
Message-Id: <m10HcMm-000GgeC@duffy1.franken.de>
Subject: Re: [linux-lvm] booting with lvm
Date: Mon, 1 Mar 1999 19:20:18 +0100 (MET)
In-Reply-To: <000d01be63c1$e243e190$6630aec1@trpc.dkfz-heidelberg.de> from "Tobias Reber" at Mar 1, 99 09:59:58 am
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm-linux@msede.com

Hi,


> all your disk-driver modules. Do you have the drivers in your kernel? Also,

Of course I have the scsi adapter driver and scsi disk support in the kernel,
otherwise I could not boot anyway.

> you have to have /dev files in your ramdisk, so that vgscan can find the
> disks. As you may have already noticed from this list, a logical volume

vgscan and vgchange work fine from the ramdisk. This is not the problem.
I get a message that my volume group is activated and I can even mount the
/ for copying over the files from /etc (this was mainly for testing).
vgscan can find the volume group with a devfs mounted /dev.

> cannot boot, nor can it contain any files lilo needs during boot. However,
> the / filesystem works fine with lvm.

Not here. As long as linuxrc is running everything works as expected.
The problem is that the kernel cannot mount my root filesystem sitting on
a LV after exiting linuxrc.
Has anyone tried this with Linux 2.2.1 ??

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob
