Return-Path: <lvmlist@showme.wox.org>
Message-ID: <019501c098bc$d8782540$0f01a8c0@myplace.net>
From: "B. ten Berge" <lvmlist@showme.wox.org>
Date: Sat, 17 Feb 2001 00:37:21 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm -- lvm_blk_ioctl: Unknown Command 21264
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

Hi,

I'm using kernel 2.4.1 with the default version of devfs, the default
version of LVM and the default version of reiserfs.

The output comes from dmesg. Does anyone know whether this is a problem --
unkown command 21264 -- and if not, how do I remove this entry ?

devfs: devfs_register(): existing non-device/file entry: "root"
devfs: devfs_register(): device already registered: "group"
lvm -- lvm_blk_ioctl: unknown command 21264
reiserfs: checking transaction log (device 3a:00) ...
Using tea hash to sort names
reiserfs: using 3.5.x disk format
ReiserFS version 3.6.25(w/quota support)
VFS: Mounted root (reiserfs filesystem) readonly.
change_root: old root has d_count=3
Mounted devfs on /dev
Trying to unmount old root ... okay
Freeing unused kernel memory: 196k freed
Adding Swap: 65528k swap-space (priority -1)
Adding Swap: 65528k swap-space (priority -2)
reiserfs: checking transaction log (device 3a:02) ...
Using tea hash to sort names
reiserfs: using 3.5.x disk format

Thanks,
Bas
