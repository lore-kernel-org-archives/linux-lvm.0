Message-ID: <3EBE8FCC.10302@inode.at>
From: Manfred Gschweidl <m.gschweidl@inode.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mount root filesystem on lvm
References: <3EBBF411.6060405@inode.at>  <3EBBFF45.4050006@inode.at>	 <1052511447.6321.22.camel@chtephan.cs.pocnet.net>	 <3EBD22B3.4090808@inode.at>	 <1052607008.1489.2.camel@chtephan.cs.pocnet.net>	 <3EBDAFF0.5090608@inode.at> <1052647076.580.9.camel@chtephan.cs.pocnet.net>
In-Reply-To: <1052647076.580.9.camel@chtephan.cs.pocnet.net>
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
Date: Sun May 11 13:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: linux-lvm@sistina.com

hello and thanks for your help.

i modified my linuxrc file on the ramdisk, so that it does a "cat 
/proc/devices" and "ls -l /dev/mapper". so i found out, that the device 
number is also 254 and with the ls-comand i get the information that the 
minor number was 6 (with the 2.4.12 kernel i couldn't find ot out, 
because there i was not using the device-mapper interface).

after appending this to the new kernel on startup, the root filesystem 
can now be found, and the system boots.

but now i have an problem... ;-)

when booting up with the initial ramdisk, and doing a "lvm vgscan" and 
"lvm vgchange -a y", all volume groups and logical volumes are found 
("ls /dev/mapper" on the end of the linuxrc script shows all found 
logical volumes).
but after freeing memory of the initial ramdisk and mounting of the root 
fs, now one of the entries in "/dev/mapper" exists, except the "control" 
entry. and "lvm vgscan" and "lvm vgchange -a y" does not help. so i 
cannot mount any other logical volumes?????
the kernel complaines, that maybe a old kernel driver is using the 
volume groups, but how can that be???

cat /proc/devices show up, that there is still an entry for lvm, but 
also for device-mappper. is this maybe the error???


if you can't help me out with this, this is no problem, because you 
helped me a lot, since i can boot now...;-)
but the "/usr", "/var".... directories are also residing on lvm volumes...


thanks for your detailed help,


manfred






Christophe Saout wrote:
> Am Son, 2003-05-11 um 04.05 schrieb Manfred Gschweidl:
> 
> 
>>when i use "/dev/progs/root" boot up ends with:
>>VFS: Cannot open root device "3a00" or 3a:00
>>Please append s correct "root=" boot option
>>Kernel panic: VFS: Unable to mount root fs on 3a:00
> 
> 
> 0x3a is the LVM1 device major.
> 
> 
>>when i use "/dev/mapper/progs-root" boot up ends with:
>>VFS: Cannot open root device "mapper/progs-root" or 00:00
>>Please append s correct "root=" boot option
>>Kernel panic: VFS: Unable to mount root fs on 00:00
> 
> 
> Ok, 00:00 means that he didn't find anything there.
> 
> 
>>i use the append option for "/dev/mapper/progs-root", because i can't 
>>run lilo with it, because lilo says, that it doesn't find the device....
> 
> 
> Yep.
> 
> It looks like you are currently running on LVM1 but want to switch to
> LVM2 after the next reboot, right?
> 
> LILO can only look at the device numbers currently in use in /dev, but
> when there is no device-mapper device there, he can't find the device
> number to use with LVM2.
> 
> I don't think you can't activate a volume group at the same time with
> LVM1 and LVM2, so you'll have to give it explicitly to the kernel
> "command line" on the next reboot.
> 
> Before reboot, can you find out what major device-mapper uses? Type "cat
> /proc/devices" and search for the line with device-mapper. My kernel is
> currently using the major 254, but I don't know if the numbers are
> allocated the same way with the 2.4 kernel.
> 
> Ok, then you'll have to translate the number to hexdecimal (e.g. using
> this command line where you should replace 254 with your major number if
> it differs: perl -e 'printf "%02x\n", 254).
> 
> After rebooting you interrupt lilo and append root=##00 to the command
> line, where ## is the major number in hex (so it looks like "linux
> root=fe00"). If he doesn't find the root device, try fe01, fe02, etc...
> until he finds the root device. The problem is that you can't know
> exactly which minor number the kernel number will assign the volume
> without having tested it first.
> 
> This should of course only work when the ramdisk has correctly activated
> the volume before the kernel tries to mount the root filesystem, there
> should be a message printed.
> 
