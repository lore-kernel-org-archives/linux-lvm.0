Message-ID: <3D92DF4A.1625D3C4@cti-paysloire.cnamts.fr>
From: LEBRETON Philippe <philippe.lebreton@cti-paysloire.cnamts.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Debian 3.0, kernel 2.4.18 booting with a LVM root fs LVM doesn't work
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
Date: Thu Sep 26 05:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM <linux-lvm@sistina.com>

hello,

My configuration is :

Debian 3.0
Kernel 2.4.18
lvm10 debian package.

i want to convert my root fs to LVM and i follow the HOWTO instructions.

in my initrd image i add block, ide, scsi, fs and net drivers.
my linuxrc is :
#!/bin/sh
/sbin/modprobe ext3
/sbin/modprobe ext2
/sbin/modprobe ips
/sbin/modprobe aic7xxx
/sbin/modprobe lvm-mod
/bin/mount /proc
/sbin/vgscan
/sbin/vgchange -a y
/bin/umount /proc

when i boot, all drivers are load but mount, vgscan and vgchange doesn't
work :

can't create lock file /etc/mtab17 : permision denied (use -n flag to
override)
vgscan -- ERROR "creating lvmtab" creating lvmtab
           -- no volume groups found
vgchange -- ERROR "/etc/lvmtab" doesn't exist: please run vgscan
.
.
.
.
VFS: cannot open device 3a:00
kernel panic: VFS: unable to mount root fs 3a:00

where is the problem

Thanks

Philippe LEBRETON
