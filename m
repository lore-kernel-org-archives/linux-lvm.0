From: Daniel Savard <dsavard@videotron.ca>
MIME-Version: 1.0
Message-Id: <01111617512007.02805@dirac.cids.ca>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] root fs on a LVM cause kernel panic
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
Date: Fri Nov 16 16:57:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I did further testing. Still not working. However, to make things clear I will
detail my environment.

Hardware:
 IBM Netfinity 5000 with RAID
 3 hot-swap disks 9 GB each
 1 Iomega SCSI external 2GB JAZ drive
 1 SCSI tape drive

OS:
  Started from RedHat 7.0
  Kernel at 2.4.13
  Many upgrades to rpms
  gcc at 3.0.2
  glibc 2.2.4
  LVM support built-in
  JFS support built-in
  SCSI support built-in

LVM:
  1.0.1-rc4

JFS:
  1.0.8

I am building a Linux From Scratch (LFS) system. For this purpose, I have
created a VG (datavg). And a 1GB LV (lv_lfs). The LFS system has been built
sucessfully. The old system is RedHat 7.0, with root fs on a non LVM ext2
filesystem. I was able to create the LVM, the JFS filesystem and compile
everything in this file system accordingly to instructions for LFS 3.0. No
major modifications where required from LFS 3.0, except the latest versions of
packages were used.

So, I have a fully functionnal RedHat system on plain ext2 filesystems with LVM
and JFS. The root fs is non-LVM ext2.

I also have a LV which contains a new root fs which is a JFS filesystem. I also
tried with ext2 filesystem and it doesn't fix the problem.

Now, the problem is:

I want to boot with my LV JFS filesystem as root fs. I followed man page
instructions for lvmcreate_initrd and created the initrd file. I checked the
initrd and everything seems to be there.

After a chat discussion with roadrunner on the openprojects lvm channel. We
checked everything in the initrd, as well as the linuxrc file in it and it
seems ok.

While booting I am ending with a kernel panic message. The few last lines of
the boot message are as follow:

VFS: Cannot open root device "3a01" or 3a:01
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 3a:01

I was suggested to try the following in the linuxrc file:

I added the following line just before the /sbin/umount /proc line:

/bin/echo "3A:01" > /proc/sys/kernel/real-root-dev

The /bin/echo executable was added to the initrd. It didn't fix the problem.

My lilo.conf file is as follow:

image=/boot/lfskernel-2.4.13
        initrd = /boot/initrd-lvm-2.4.13.gz
        root = /dev/datavg/lv_lfs
        label = lvmjfs
        append = "ramdisk_size=8192"
        read-only

I also tested with ramdisk_size=X, where X is the size returned by the
lvmcreate_initrd script for the ramdisk.

Any help would be greatly appreciated.
-- 

================================
Daniel Savard
Internet: dsavard@videotron.ca
================================
