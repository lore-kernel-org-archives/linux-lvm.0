Message-ID: <6413350.1074097638140.JavaMail.Administrator@atp>
From: trylinux <trylinux@nc.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] No Subject
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
Date: Wed Jan 14 18:23:11 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: trylinux@nc.rr.com

First things first. Is there a FAQ for this group?

Now then, I'm running Fedore Core/1 (Red Hat 9) with LVM 1.0.3-13 (or at
least RPM says it's 1.0.3). I have a single volume group containing a single
disk. While /boot is NOT in the volume group (for obvious reasons),
everything else, include / is. / is a ext3 filesystem.

I recently used vgrename to rename the volume group (from rootvol to rootvg
-- just a test to learn some more), and it seemed to succeed. I was able to
run afterwards with no problems. On the first reboot after this, though, my
system can no longer boot. Here's a rough transscription of what's going on:

...kernel booting/initializing...
Loading lvm-mod.o module
LVM version 1.0.5+(22/07/2002) module loaded
Loading jbd.o module
Journalled Block Device driver loaded
Loading ext3.o module
Mounting /proc filesystem
Creating block devices
Scanning logical volumes
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "rootvg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a BGDA backup of your volume
group

Activating logical volumes
vgchange -- volume group "rootvg" successfully activated

Mounting root filesystem
mount: error 2 mounting ext3
pivotroot: pivot_root(/sysroot,/sysroot/initrt) failed: 2
umount /initrd/proc failed: 2
Freeing unused kernel memory: 136k freed
Kernel panic: No init found. Try passing init= option to kernel.


I'd be happy to provide more info if it would help anyone. (grub.conf,
fstab,
etc.)

Cheers,
Rob
