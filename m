Return-Path: <vherva@niksula.hut.fi>
Date: Thu, 21 Jun 2001 20:33:03 +0300
From: Ville Herva <vherva@niksula.hut.fi>
Message-ID: <20010621203303.A14617@niksula.cs.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Subject: [linux-lvm] Problems with lvm root
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm unable to boot with lvm root. The boot process halts with these
messages:

VFS: Mounted root (ext2 filesystem).

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "scratch"
vgscan -- found inactive volume group "root-stripe"
vgscan -- ERROR 6 writing volume group backup file
/etc/lvmtab.d/root-stripe.tmp in vg_cfgbackup.c [line 266]
vgscan -- ERROR: unable to do a backup of volume group "root-stripe"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
"root-stripe" from "/etc/lvmtab"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" creating "/etc/lvmtab" and
"/etc/lvmtab.d"

vgchange -- volume group "scratch" successfully activated

VFS: Cannot open root device "3a01" or 3a:01
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 3a:01


(For full boot log, see http://iki.fi/v/lvm-root.log).

With non-lvm root and same kernel, the volume groups are identified just
fine:

Jun 20 15:01:31 herkules vgscan: vgscan -- reading all physical volumes
(this may take a while...)
Jun 20 15:01:31 herkules vgscan: vgscan -- found active volume group scratch
Jun 20 15:01:31 herkules vgscan: vgscan -- found inactive volume group
root-stripe
Jun 20 15:01:31 herkules vgscan: vgscan -- /etc/lvmtab and /etc/lvmtab.d
successfully created
Jun 20 15:01:31 herkules vgscan: vgscan -- WARNING: This program does not do
a VGDA backup of your volume groups

(For full boot log, see http://iki.fi/v/non-lvm-root.log).

And I can mount the lvm partitions (/dev/root-stripe/root, in particular)
just well.

I created the lvm initrd from the other rootfs (/dev/sdb) which should be
identical to the one on lvm (/dev/root-stripe/root). I also tried chrooting
to the initrd rootfs and creating the lvm initrd, but it gave the same
result.

The lilo entry is

image=/boot/vmlinux-2.4.5ac2
        label=245ac2-lvm
        initrd=/boot/initrd-lvm-2.4.5-ac2.gz
        read-only
        root=/dev/root-stripe/root
        append="console=ttyS0,9600n8 console=tty0 ramdisk_size=8192"


This is linux-2.4.5-ac2 + lvm-0.9.1beta7.


Any ideas



-- v --

v@iki.fi
