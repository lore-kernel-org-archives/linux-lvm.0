Date: Sat, 1 Apr 2000 17:25:53 -0500 (EST)
From: Shane Shrybman <shane@zeke.yi.org>
Subject: [linux-lvm] [PATCH] LVM in 2.3.99-pre4-[12]
Message-ID: <Pine.LNX.4.10.10004011710460.16258-100000@zeke.goatskin.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm mailing list <linux-lvm@msede.com>


Hello all !

Part of the current LVM patch (patch-2.3.99-pre1-LVM-0.8final.gz)  for
development  kernels fails when applied to kernels > 2.3.99-pre3.

This is a little patch to fix that problem. Apply after
applying patch-2.3.99-pre1-LVM-0.8final.gz

This patch works for me and I think it is relatively safe (since it only
touches the config file) but, I am not a coder and this is
my first patch ever. So use at your own risk!

--- drivers/block/Config.in.orig        Fri Mar 31 12:23:42 2000
+++ drivers/block/Config.in     Fri Mar 31 12:31:41 2000
@@ -49,6 +49,12 @@
 #if [ "$CONFIG_MD_LINEAR" = "y" -o "$CONFIG_MD_STRIPED" = "y" ]; then
 #   bool '    Boot support (linear, striped)' CONFIG_MD_BOOT
 #fi
+
+ tristate 'Logical volume manager (LVM) support' CONFIG_BLK_DEV_LVM N
+ if [ "$CONFIG_BLK_DEV_LVM" != "n" ]; then
+    bool '   LVM information in proc filesystem' CONFIG_LVM_PROC_FS Y
+ fi
+
 tristate 'RAM disk support' CONFIG_BLK_DEV_RAM
 dep_bool '  Initial RAM disk (initrd) support' CONFIG_BLK_DEV_INITRD
$CONFIG_BLK_DEV_RAM

 
Shane
