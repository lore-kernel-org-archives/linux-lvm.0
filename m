Subject: Re: [linux-lvm] mount root filesystem on lvm
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <3EBDAFF0.5090608@inode.at>
References: <3EBBF411.6060405@inode.at>  <3EBBFF45.4050006@inode.at>
	 <1052511447.6321.22.camel@chtephan.cs.pocnet.net>
	 <3EBD22B3.4090808@inode.at>
	 <1052607008.1489.2.camel@chtephan.cs.pocnet.net>
	 <3EBDAFF0.5090608@inode.at>
Message-Id: <1052647076.580.9.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun May 11 04:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Manfred Gschweidl <m.gschweidl@inode.at>
Cc: linux-lvm@sistina.com

Am Son, 2003-05-11 um 04.05 schrieb Manfred Gschweidl:

> when i use "/dev/progs/root" boot up ends with:
> VFS: Cannot open root device "3a00" or 3a:00
> Please append s correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on 3a:00

0x3a is the LVM1 device major.

> when i use "/dev/mapper/progs-root" boot up ends with:
> VFS: Cannot open root device "mapper/progs-root" or 00:00
> Please append s correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on 00:00

Ok, 00:00 means that he didn't find anything there.

> i use the append option for "/dev/mapper/progs-root", because i can't 
> run lilo with it, because lilo says, that it doesn't find the device....

Yep.

It looks like you are currently running on LVM1 but want to switch to
LVM2 after the next reboot, right?

LILO can only look at the device numbers currently in use in /dev, but
when there is no device-mapper device there, he can't find the device
number to use with LVM2.

I don't think you can't activate a volume group at the same time with
LVM1 and LVM2, so you'll have to give it explicitly to the kernel
"command line" on the next reboot.

Before reboot, can you find out what major device-mapper uses? Type "cat
/proc/devices" and search for the line with device-mapper. My kernel is
currently using the major 254, but I don't know if the numbers are
allocated the same way with the 2.4 kernel.

Ok, then you'll have to translate the number to hexdecimal (e.g. using
this command line where you should replace 254 with your major number if
it differs: perl -e 'printf "%02x\n", 254).

After rebooting you interrupt lilo and append root=##00 to the command
line, where ## is the major number in hex (so it looks like "linux
root=fe00"). If he doesn't find the root device, try fe01, fe02, etc...
until he finds the root device. The problem is that you can't know
exactly which minor number the kernel number will assign the volume
without having tested it first.

This should of course only work when the ramdisk has correctly activated
the volume before the kernel tries to mount the root filesystem, there
should be a message printed.

-- 
Christophe Saout <christophe@saout.de>
