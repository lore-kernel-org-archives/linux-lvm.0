From: Toon van der Pas <toon@hout.vanvergehaald.nl>
Message-ID: <20031119184849.GA4416@hout.vanvergehaald.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LILO: Fatal: Sorry, don't know how to handle device 0xfe02
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
Date: Wed Nov 19 12:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have a problem installing LILO under a 2.6 kernel with LVM2 and DM.
Installing LILO under the 2.4 kernel with LVM1 works.
This is what I get when I run LILO under the 2.6 kernel:

	# lilo
	Fatal: Sorry, don't know how to handle device 0xfe02

Here are some details.

	Distro: Gentoo.
	Kernel: 2.6.0-test9-gentoo
	System: HP Proliant DL360.
	uname -a: Linux vdpas.vanvergehaald.nl 2.6.0-test9-gentoo #1
		SMP Tue Nov 18 01:13:40 CET 2003
		i686 Intel(R) Xeon(TM) CPU 2.80GHz GenuineIntel
		GNU/Linux

I am using LVM2 in combination with device-mapper.
The machine has 2 internal disks connected to a Compaq Smart Array
controller, configured as a mirrored volume (RAID 1).

I started out installing Gentoo Linux on the machine, with the standard
2.4 kernel. While doing so, I configured the whole mirrored volume
for LVM1, and created several filesystems. It currently looks like this:

# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/vg01/lv03         1032088    160116    819544  17% /
/dev/vg01/lv04         3096336   1875480   1063572  64% /usr
/dev/vg01/lv05         3096336     58568   2880484   2% /var
/dev/vg01/lv06         3096336     32828   2906224   2% /home
/dev/vg01/lv07         3096336     32828   2906224   2% /appl
none                   1036076         0   1036076   0% /dev/shm
/dev/vg01/lv01          126931     11341    109037  10% /boot

Then I compiled the 2.6-test9 kernel.
I created an initrd image file, installed LILO (while running the
2.4-kernel with LVM1), and whas able to make the machine boot
into the 2.6-kernel from the harddisk.

So far so good: it boots right from the LVM volumes. Great!

Now the problem:
LILO refuses to install under the 2.6-test9 kernel.  :-(
When I run LILO, it says:

	Fatal: Sorry, don't know how to handle device 0xfe00

The 0xfe00 device happens to be /dev/mapper/vg01-lv01, which is
pointed to by /dev/vg01/lv01. This is what the /dev/mapper directory
looks like:

# ls -l /dev/mapper/
total 0
crw-r-----    1 root     root      10,  63 Jan  1  1970 control
brw-r-----    1 root     root     254,   0 Jan  1  1970 vg01-lv01
brw-r-----    1 root     root     254,   1 Jan  1  1970 vg01-lv02
brw-r-----    1 root     root     254,   2 Jan  1  1970 vg01-lv03
brw-r-----    1 root     root     254,   3 Jan  1  1970 vg01-lv04
brw-r-----    1 root     root     254,   4 Jan  1  1970 vg01-lv05
brw-r-----    1 root     root     254,   5 Jan  1  1970 vg01-lv06
brw-r-----    1 root     root     254,   6 Jan  1  1970 vg01-lv07

According to the LILO documentation, the error means that LILO isn't
able to figure out the geometry of the drive. They suggest that I
should specify the explicit geometry of the drive in /etc/lilo.conf.
But I think this is not the case. I made an strace of a LILO run,
which shows an open() call failing with ENXIO. According to errno.h
this should be interpreted as "No such device or address".
But this is not true, as you can see:

# dmsetup info vg01-lv03
Name:              vg01-lv03
State:             ACTIVE
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      254, 2
Number of targets: 1
UUID: L8LBZEZWcB331TgtdEvJEnZsoH0NyORT00000000000000000000000000000002
 
# dmsetup status vg01-lv03
0 2097152 linear
 
See also the relevant portion of the strace at the end of this email message.

Summary: I am able to install LILO under the 2.4 kernel with LVM1,
but I can't install LILO under the 2.6 kernel with LVM2 and DM.
No other problems. The 2.6 kernel boots and runs great.

Thanks for any advice.
Regards,
Toon.

stat64("/dev/mapper", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
open("/dev/mapper", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 7
fstat64(7, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
fcntl64(7, F_SETFD, FD_CLOEXEC)         = 0
getdents64(7, /* 10 entries */, 1024)   = 304
stat64("/dev/mapper/..", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
stat64("/dev/mapper/.", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
stat64("/dev/mapper/control", {st_mode=S_IFCHR|0640, st_rdev=makedev(10, 63), ...}) = 0
stat64("/dev/mapper/vg01-lv01", {st_mode=S_IFBLK|0640, st_rdev=makedev(254, 0), ...}) = 0
stat64("/dev/mapper/vg01-lv02", {st_mode=S_IFBLK|0640, st_rdev=makedev(254, 1), ...}) = 0
stat64("/dev/mapper/vg01-lv03", {st_mode=S_IFBLK|0640, st_rdev=makedev(254, 2), ...}) = 0
close(7)                                = 0
close(6)                                = 0
open("/dev/mapper/vg01-lv03", 0x4)      = 6
write(2, "Fatal: ", 7Fatal: )                  = 7
write(2, "Sorry, don\'t know how to handle "..., 45Sorry, don't know how to
handle device 0xfe02) = 45
write(2, "\n", 1)                       = 1
_exit(1)                                = ?
