Message-ID: <1043113906.3e2ca7b2864b6@mail.serviceweb.net>
From: tlove@serviceweb.net
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM Root
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
Date: Mon Jan 20 19:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Hi all,
I've been trying to create an LVM root on my system, and have followed the 
various how-to.  I have been successful so far creating my kernel with initrd 
and LVM (version 2) support, and my initrd image.
I have two partitions on the drive - a 20MB boot partition with the kernel and 
grub on it - and the second containing my LVM FS.  
grub.conf (menu.lst):

title= initrd test
root (hd0,0)
kernel /boot/bzImage root=FE02 ramdisk 8192
initrd /inird.gz


when I boot I get:
<runs vgscan and vgchange -ay successfully (finds LVs)> then...
device-mapper: unknown block ioctl 0x5310
reiserfs: checking trasaction log (device fe:02) ...
Warning, log replay starting on readonly filesystem
Using r5 hash to sort names
ReiserFS version 3.6.25
VFS: Mounted root reiserfs filesystem) readonly
Trying to move old root to /initrd ... failed
Unmounting old root
Trying to free ramdisk memory ... okay
mount_dev_fs(): unable to mount devfs, err: -2
Freeing unused kernel memory: 120k freed
Warning: unable to open an initial console.
Kernel panic: No init found.  Try passing init= option to kernel.


Any help would be much appreciated!
--Ted
