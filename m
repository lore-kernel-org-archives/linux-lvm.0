Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9QLK4r19441
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 17:20:04 -0400
From: Krisztian Mark Szentes <szentes@produktivIT.com>
Date: Tue, 26 Oct 2004 22:26:35 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200410262226.35755.szentes@produktivIT.com>
Subject: [linux-lvm] lvm kernel bug relating to snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


Hello

I use kernel 2.6.8 (standard Debian kernel 2.6.8-1-k7) and LVM 2.0. On a 
logical volume of the size 100 GiB, I freezed the xfs filesystem and tried 
to make a snapshot with lvcreate which segfaulted and wrote into syslog:

# pvcreate /dev/hda8
# vgcreate vg00 /dev/hda8
# lvcreate -L100G -nlv00 vg00
# mkfs.xfs /dev/vg00/lv00
(mount and put document tree on it)
# lvcreate -L 5G -c 1024k -s -n snapshot0 /dev/vg00/lv00
(lvcreate did not like the reserved word snapshot...)

# lvcreate -L 5G -c 1024k -s -n snap0 /dev/vg00/lv00
gives me:

Oct 14 22:57:26 stingray kernel: ------------[ cut here ]------------
Oct 14 22:57:26 stingray kernel: kernel BUG at drivers/md/dm-io.c:148!
Oct 14 22:57:26 stingray kernel: invalid operand: 0000 [#1]
Oct 14 22:57:26 stingray kernel: PREEMPT
Oct 14 22:57:26 stingray kernel: Modules linked in: dm_snapshot ipv6 
uhci_hcd pci_hotplug via_agp agpgart parport_pc parport
 floppy evdev pcspkr ehci_hcd usbcore via_ircc irda crc_ccitt xfs 
capability commoncap dm_mod via_rhine mii crc32 rtc ext3 j
bd mbcache ide_generic via82cxxx ide_disk ide_core unix font vesafb 
cfbcopyarea cfbimgblt cfbfillrect
Oct 14 22:57:26 stingray kernel: CPU:    0
Oct 14 22:57:26 stingray kernel: EIP:    0060:
[__crc_pm_idle+775153/5541136]    Not tainted
Oct 14 22:57:26 stingray kernel: EFLAGS: 00010202   (2.6.8-1-k7)
Oct 14 22:57:26 stingray kernel: EIP is at bio_set_alloc+0x80/0x150 
[dm_mod]
Oct 14 22:57:26 stingray kernel: eax: f71de800   ebx: 00000102   ecx: 
f761ede0   edx: f71cf000
Oct 14 22:57:26 stingray kernel: esi: f71de800   edi: f89d5780   ebp: 
00000000   esp: f7189db4
Oct 14 22:57:26 stingray kernel: ds: 007b   es: 007b   ss: 0068
Oct 14 22:57:26 stingray kernel: Process lvcreate (pid: 1913, 
threadinfo=f7188000 task=f7431710)
Oct 14 22:57:26 stingray kernel: Stack: f71de800 00000010 00000000 00000010 
00000004 00000800 00000000 00000000
Oct 14 22:57:26 stingray kernel:        f7189e98 f89cd8da f89d5780 00000010 
00000102 f7189e48 00000000 00000010
Oct 14 22:57:26 stingray kernel:        00000001 f7189e98 00000000 00000000 
00000010 f89cda7f 00000010 00000000
Oct 14 22:57:26 stingray kernel: Call Trace:
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+776795/5541136] 
do_region+0x4a/0x130 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+777216/5541136] 
dispatch_io+0xbf/0xd0 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+776577/5541136] 
vm_get_page+0x0/0x40 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+776641/5541136] 
vm_next_page+0x0/0x20 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+777332/5541136] 
sync_io+0x63/0xf0 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+777940/5541136] 
dm_io_sync_vm+0x43/0x50 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+776577/5541136] 
vm_get_page+0x0/0x40 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+776641/5541136] 
vm_next_page+0x0/0x20 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+2285106/5541136] 
chunk_io+0x61/0x70 [dm_snapshot]
Oct 14 22:57:26 stingray kernel:  [bdget+65/272] bdget+0x41/0x110
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+2285356/5541136] 
read_header+0x2b/0x90 [dm_snapshot]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+2286291/5541136] 
persistent_read_metadata+0x22/0xc0 [dm_snapshot]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+2282487/5541136] 
snapshot_resume+0x26/0x60 [dm_snapshot]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+762079/5541136] 
dm_table_resume_targets+0x3e/0x50 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+756150/5541136] 
dm_resume+0x75/0xd0 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+769993/5541136] 
do_resume+0x128/0x190 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+773675/5541136] 
ctl_ioctl+0xea/0x150 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [__crc_pm_idle+770097/5541136] 
dev_suspend+0x0/0x20 [dm_mod]
Oct 14 22:57:26 stingray kernel:  [sys_ioctl+269/656] sys_ioctl+0x10d/0x290
Oct 14 22:57:26 stingray kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 14 22:57:26 stingray kernel: Code: 0f 0b 94 00 22 ef 9c f8 c7 44 24 10 
00 00 00 00 8b 44 24 10

After the segmentation fault, the /var partition (which is located on the 
LV) could not be reached: all reads and writes to/from it blocked until 
the machine got rebooted.

I thought you might be interested. I wanted to check the list archives but 
lists.sistina.com did not answer.

Salut

Mark
