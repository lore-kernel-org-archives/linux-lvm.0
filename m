Return-Path: <carenas@chasqui.lared.net.pe>
Date: Mon, 23 Apr 2001 20:33:01 -0500 (PET)
From: Carlo Marcelo Arenas Belon <carenas@chasqui.lared.net.pe>
Subject: Re: [linux-lvm] Need help with LVM on RedHat 7.1
In-Reply-To: <3AE46CC1.FEE62DC@sc.prepass.com>
Message-ID: <Pine.LNX.4.33.0104232010370.13970-100000@chasqui.LaRed.net.pe>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM <linux-lvm@sistina.com>

> I have been holding my breath for 2.4 for so long and as I download and
> install RedHat 7.1 with 2.4.2-2, I find that LVM is not by default
> configured.

LVM is not by default configured because the lvm on the kernel
(0.9.1beta2) is broken AFAIK.

> vgscan(1) reports no lvm.o module found.

you should appy this patch to the initscripts also AFAIK

--- initscripts-5.83/rc.d/init.d/halt.lvm	Wed Feb 28 17:18:49 2001
+++ initscripts-5.83/rc.d/init.d/halt	Mon Apr 23 20:15:51 2001
@@ -163,6 +163,9 @@

 [ -f /proc/bus/usb/devices ] && umount /proc/bus/usb

+# LVM shutdown
+[ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ] && /sbin/vgchange
-a n
+
 # Remount read only anything that's left mounted.
 #echo $"Remounting remaining filesystems (if any) readonly"
 mount | awk '/ext2/ { print $3 }' | while read line; do

> So I get the sources and compile with RAID and LVM marked as modules.

you should get the new lvm userland programas and kernel module from :

  ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/

until the upgraded kernel module and programs get into the oficial kernel.

<SNIP>
> My make menuconfig; make dep; make clean; make bzImage are all fine.
> Based on some docs, I was now supposed to do 'make modules'.

while building a RH kernel don't forget to copy your configuration to a
safe place and do a $(make mrproprer) before a $(make menuconfig) or you
could end having strange dependency problems from what is left on the
kernel-source RPM

if you follow the LVM documentation you are going to be safe, i just
happened to make it work for RH7.1beta and LVM 0.9.1beta6.

and for sure, adding a new patch to the kernel SPEC and rebuilding to get
new RPMS is a nice way to get it working.

best regards,

Carlo
