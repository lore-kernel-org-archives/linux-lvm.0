From: "Ben Holness" <ben@bens-house.org.uk>
Message-Id: <000001c18dc2$70deb560$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading shared libraries:
 libzso.1
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
Date: Tue Dec 25 22:01:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I am having trouble getting my Mandrake 8.1 system to boot to a logical
partition (LVM).
I followed the instructions from the man page for lvmcreate_initrd, which
worked OK, modified /boot/lilo.conf as instructed and ran lilo. I also
modified the (new) fstab file.
When I reboot, however, I get the following errors:
****
/sbin/modprobe: error while loading shared libraries: libzso.1: cannot open
shared object file: No such file or directory
vgscan -- LVM driver/module not loaded?
vgchange -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan
VFS: Cannot open root device "3a01" or 3a:01
Please append a correct "root=" boot option
Kernal panic: VFS: Unable to mount root fs on 3a:01
****
Any ideas? I am lost. I guess I need to tell Linux to load the LVM driver at
boot time, but I thought it did this anyway, because when I copied the stuff
across, I could mount the logical volumes once the system had booted... (I
have a 2.5Gb normal partition that I installed to and which will be plugged
into my volume group once I am booting with LVM)
I did a locate on "libzso.1", but it couldn't find it.
Cheers,
Ben
