From: "Ben Holness" <ben@bens-house.org.uk>
Subject: RE: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <000001c18f0d$32835860$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011227084538.A24890@colombina.comedia.it>
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
Date: Thu Dec 27 13:29:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> On Thu, Dec 27, 2001 at 01:31:08AM -0000, Ben Holness wrote:
> > I should also mention that I ran lvmcreate_initrd with the
> -D option, but
> > that didn't help.
> please try
> mkinitrd -v -f /boot/initrd `uname -r`
> instead of lvmcreate_initrd and tell me if it works

OK, this time I get a different error:

****

VFS: Mounted root (ext2 filesystem)
Red Hat nash version 3.1.6-mdk starting
Mounting /proc filesystem
Creating root device
Mounting root filesystem
mount: error 19 mounting ext2 flags Freeing unused kernel memory: 712k freed
Kernel panic: No init found. Try passing init= option to kernel.

****

So it looks like it got further, but has found a new stumbling block!

I also had a look at the man page for initrd and noticed that there is
a --fstab option, which I might need to use, as my current setup is as
follows:

/dev/hda1 - boot partition (mounted on /boot) 14Mb
/dev/hda6 - install partition (mounted on /) 2.5Gb
/dev/hda4 - LVM partition, contains logical volumes for /, /usr, /var, /home
and /tmp.

When I boot to hda6, I mount the LVM partitions in the relevant directories,
within /new-disk.

This means that the fstab that is relevant to LVM exists in
/new-disk/ROOT/etc/fstab when I boot to hda6, which is currently the only
configuration that is working.

So I tried running mkinitrd -v --fstab /new-disk/ROOT/etc/fstab -f
/boot/initrd `uname -r`, which gives me this error:

****

VFS: Mounted root (ext2 filesystem)
Red Hat nash version 3.1.6-mdk starting
loading lvm-mod module
LVM version LVM 0.9.1_beta7(ish) by Heinz Mauelshagen (20 June 2001)
lvm -- Module successfully initialized
Mounting /proc filesystem
Creating root device
Creating root device
Configuring LVM
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

vgchange -- no volume groups found

Mounting root filesystem
mount: error 6 mounting ext2 flags Freeing unused kernel memory: 712k freed
Kernel panic: No init found. Try passing init= option to kernel.

****

Interesting that it finds no volume groups.

A vgdisplay from when I boot to the install partition gives the following:

[root@firewall root]# vgdisplay
--- Volume group ---
VG Name               firewallvg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                11
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               53.22 GB
PE Size               4.00 MB
Total PE              13624
Alloc PE / Size       6294 / 24.59 GB
Free  PE / Size       7330 / 28.63 GB
VG UUID               gIGwr8-vA6U-XU9j-oS5s-jQI1-sWTX-TKL22S

My guess is that I have not copied something (that is LVM related) from the
original partition to the logical partition that LVM requires to work?
Could this be something in

The copy command(s) that I used were:

cd / && echo cp -a `/bin/ls -1Ab | egrep -v
"^new-disk$|^proc$|^home$|^usr$|^tmp$|^var$|^Webserver$|^opt$|^boot$"`
/new-disk/ROOT | sh
cp -a /home/* /new-disk/home/
cp -a /usr/* /new-disk/usr/
cp -a /tmp/* /new-disk/tmp/
cp -a /var/* /new-disk/var/
cp -a /opt/* /new-disk/opt/
cp -a /Webserver /new-disk/Webserver

I then had a look around and copied /proc/lvm to /new-disk/ROOT/proc/lvm and
tried again, but that didn't help.

Any further thoughts are welcomed!

Cheers,

Ben
