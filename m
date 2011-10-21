Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9LFI7Su006518
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2011 11:18:07 -0400
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9LFI5Ii022740
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2011 11:18:06 -0400
Received: by wwn22 with SMTP id 22so1026198wwn.3
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2011 08:18:05 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 21 Oct 2011 11:18:04 -0400
Message-ID: <CAHkvJJKi6TsQUQ7dSkm4MDfPKCVS=kyPN8xKgZ14HNaB6t0O3w@mail.gmail.com>
From: Hal Martin <hal.martin@gmail.com>
Subject: [linux-lvm] Cannot online resize in a cluster: Invalid argument
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello all,

I have a three node cluster that's managed using corosync and openais.
We are using clvmd to propagate lvm meta-data across nodes. clvmd is
started by corosync with the "-Iopenais -d3 -t15" arguments.

When I attempt to modify a logical volume, either through resizing or
renaming, the request fails with:
cluster request failed: Invalid argument
Failed to suspend clone_os

The detail output is:
qa-xen-0:/ # lvresize /dev/qa-xen-vm-store/clone_os -L 10G -vvvv
#lvmcmdline.c:1045         Processing: lvresize
/dev/qa-xen-vm-store/clone_os -L 10G -vvvv
#config/config.c:996       Setting global/locking_type to 3
#config/config.c:1001       global/wait_for_locks not found in config:
defaulting to 1
#locking/locking.c:271       Cluster locking selected.
#lvresize.c:773     Finding volume group qa-xen-vm-store
#locking/cluster_locking.c:497       Locking VG V_qa-xen-vm-store PW (VG) (0x4)
#device/dev-cache.c:331         /dev/block/1:0: Added to device cache
...
#filters/filter-composite.c:31         Using /dev/mapper/qa-xen-vm-store
#device/dev-io.c:535         Opened /dev/mapper/qa-xen-vm-store RO
#device/dev-io.c:137         /dev/mapper/qa-xen-vm-store: block size
is 4096 bytes
#label/label.c:162       /dev/mapper/qa-xen-vm-store: lvm2 label
detected at sector 1
#cache/lvmcache.c:1226         lvmcache: /dev/mapper/qa-xen-vm-store:
now in VG #orphans_lvm2 (#orphans_lvm2)
#format_text/format-text.c:1187         /dev/mapper/qa-xen-vm-store:
Found metadata at 57856 size 27829 (in area at 4096 size 192512) for
qa-xen-vm-store (HU1eAV-0WUq-Xxtb-emD7-9mz1-ZDwj-ba4B4X)
#cache/lvmcache.c:1226         lvmcache: /dev/mapper/qa-xen-vm-store:
now in VG qa-xen-vm-store with 1 mdas
#cache/lvmcache.c:1003         lvmcache: /dev/mapper/qa-xen-vm-store:
setting qa-xen-vm-store VGID to HU1eAV0WUqXxtbemD79mz1ZDwjba4B4X
#cache/lvmcache.c:1263         lvmcache: /dev/mapper/qa-xen-vm-store:
VG qa-xen-vm-store: Set creation host to qa-xen-0.
#format_text/archiver.c:128     Archiving volume group
"qa-xen-vm-store" metadata (seqno 149).
  Extending logical volume clone_os to 10.00 GiB
#metadata/lv_manip.c:2492       Extending segment type, striped
#metadata/pv_map.c:55         Allowing allocation on
/dev/mapper/qa-xen-vm-store start PE 180448 length 17920
#metadata/pv_map.c:55         Allowing allocation on
/dev/mapper/qa-xen-vm-store start PE 221664 length 19138
#metadata/lv_manip.c:1948         Trying allocation using contiguous policy.
#metadata/lv_manip.c:1562         Still need 1536 total extents:
#metadata/lv_manip.c:1565           1 (1 data/0 parity) parallel areas
of 1536 extents each
#metadata/lv_manip.c:1567           0 mirror logs of 0 extents each
#metadata/lv_manip.c:1948         Trying allocation using cling policy.
#metadata/lv_manip.c:1562         Still need 1536 total extents:
#metadata/lv_manip.c:1565           1 (1 data/0 parity) parallel areas
of 1536 extents each
#metadata/lv_manip.c:1567           0 mirror logs of 0 extents each
#metadata/lv_manip.c:1261         Considering allocation area 0 as
/dev/mapper/qa-xen-vm-store start PE 221664 length 19138 leaving 0.
#metadata/lv_manip.c:1044         Allocating parallel area 0 on
/dev/mapper/qa-xen-vm-store start PE 221664 length 1536.
#locking/cluster_locking.c:497       Locking VG P_qa-xen-vm-store PW
(VG|CACHE) (0x104)
#device/dev-io.c:588         Closed /dev/mapper/qa-xen-vm-store
#device/dev-io.c:535         Opened /dev/mapper/qa-xen-vm-store RW
#device/dev-io.c:137         /dev/mapper/qa-xen-vm-store: block size
is 4096 bytes
#format_text/format-text.c:629         Writing qa-xen-vm-store
metadata to /dev/mapper/qa-xen-vm-store at 86016 len 27955
#format_text/format-text.c:734         Pre-Committing qa-xen-vm-store
metadata (150) to /dev/mapper/qa-xen-vm-store header at 4096
#mm/memlock.c:402         Entering critical section (locking for suspend).
#mm/memlock.c:378         Lock:   Memlock counters: locked:0
critical:1 daemon:0 suspended:0
#mm/memlock.c:330       Locking memory
#mm/memlock.c:212         mlock        772KiB       400000 -
4c1000 r-xp 00000000 08:01 142893                             /bin/lvm
#mm/memlock.c:212         mlock         32KiB       6c1000 -
6c9000 rw-p 000c1000 08:01 142893                             /bin/lvm
#mm/memlock.c:212         mlock      10808KiB       6c9000 -
1157000 rw-p 00000000 00:00 0                                  [heap]
#mm/memlock.c:186         mlock default filter '/libncurses.so.'
matches '7f076a450000-7f076a49e000 r-xp 00000000 08:01 170277
           /lib64/libncurses.so.5.0.4': Skipping.
#mm/memlock.c:168         mlock area unreadable
7f076a49e000-7f076a69e000 ---p 0004e000 08:01 170277
  /lib64/libncurses.so.5.0.4 : Skipping.
#mm/memlock.c:186         mlock default filter '/libncurses.so.'
matches '7f076a69e000-7f076a6ac000 rw-p 0004e000 08:01 170277
           /lib64/libncurses.so.5.0.4': Skipping.
#mm/memlock.c:212         mlock          4KiB 7f076a6ac000 -
7f076a6ad000 rw-p 00000000 00:00 0
#mm/memlock.c:212         mlock       1320KiB 7f076a6ad000 -
7f076a7f7000 r-xp 00000000 08:01 170005
/lib64/libc-2.9.so
#mm/memlock.c:168         mlock area unreadable
7f076a7f7000-7f076a9f6000 ---p 0014a000 08:01 170005
  /lib64/libc-2.9.so : Skipping.
#mm/memlock.c:212         mlock         16KiB 7f076a9f6000 -
7f076a9fa000 r--p 00149000 08:01 170005
/lib64/libc-2.9.so
#mm/memlock.c:212         mlock          4KiB 7f076a9fa000 -
7f076a9fb000 rw-p 0014d000 08:01 170005
/lib64/libc-2.9.so
#mm/memlock.c:212         mlock         20KiB 7f076a9fb000 -
7f076aa00000 rw-p 00000000 00:00 0
#mm/memlock.c:186         mlock default filter '/libreadline.so.'
matches '7f076aa00000-7f076aa33000 r-xp 00000000 08:01 170244
           /lib64/libreadline.so.5.2': Skipping.
#mm/memlock.c:168         mlock area unreadable
7f076aa33000-7f076ac33000 ---p 00033000 08:01 170244
  /lib64/libreadline.so.5.2 : Skipping.
#mm/memlock.c:186         mlock default filter '/libreadline.so.'
matches '7f076ac33000-7f076ac3b000 rw-p 00033000 08:01 170244
           /lib64/libreadline.so.5.2': Skipping.
#mm/memlock.c:212         mlock          4KiB 7f076ac3b000 -
7f076ac3c000 rw-p 00000000 00:00 0
#mm/memlock.c:212         mlock        144KiB 7f076ac3c000 -
7f076ac60000 r-xp 00000000 08:01 170002
/lib64/libdevmapper.so.1.02
#mm/memlock.c:168         mlock area unreadable
7f076ac60000-7f076ae5f000 ---p 00024000 08:01 170002
  /lib64/libdevmapper.so.1.02 : Skipping.
#mm/memlock.c:212         mlock          8KiB 7f076ae5f000 -
7f076ae61000 rw-p 00023000 08:01 170002
/lib64/libdevmapper.so.1.02
#mm/memlock.c:186         mlock default filter '/libdl-' matches
'7f076ae61000-7f076ae63000 r-xp 00000000 08:01 170016
   /lib64/libdl-2.9.so': Skipping.
#mm/memlock.c:168         mlock area unreadable
7f076ae63000-7f076b063000 ---p 00002000 08:01 170016
  /lib64/libdl-2.9.so : Skipping.
#mm/memlock.c:186         mlock default filter '/libdl-' matches
'7f076b063000-7f076b064000 r--p 00002000 08:01 170016
   /lib64/libdl-2.9.so': Skipping.
#mm/memlock.c:186         mlock default filter '/libdl-' matches
'7f076b064000-7f076b065000 rw-p 00003000 08:01 170016
   /lib64/libdl-2.9.so': Skipping.
#mm/memlock.c:212         mlock        116KiB 7f076b065000 -
7f076b082000 r-xp 00000000 08:01 170025
/lib64/ld-2.9.so
#mm/memlock.c:212         mlock         16KiB 7f076b279000 -
7f076b27d000 rw-p 00000000 00:00 0
#mm/memlock.c:212         mlock          4KiB 7f076b280000 -
7f076b281000 rw-p 00000000 00:00 0
#mm/memlock.c:212         mlock          4KiB 7f076b281000 -
7f076b282000 r--p 0001c000 08:01 170025
/lib64/ld-2.9.so
#mm/memlock.c:212         mlock          4KiB 7f076b282000 -
7f076b283000 rw-p 0001d000 08:01 170025
/lib64/ld-2.9.so
#mm/memlock.c:212         mlock        268KiB 7fffa086b000 -
7fffa08ae000 rw-p 00000000 00:00 0                          [stack]
#mm/memlock.c:176         mlock ignore filter '[vdso]' matches
'7fffa0940000-7fffa0941000 r-xp 00000000 00:00 0
   [vdso]': Skipping.
#mm/memlock.c:176         mlock ignore filter '[vsyscall]' matches
'ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0
   [vsyscall]': Skipping.
#mm/memlock.c:297         Locked 13869056 bytes
#locking/cluster_locking.c:497       Locking LV
HU1eAV0WUqXxtbemD79mz1ZDwjba4B4Xjr2bZasokY126nki9bO38iFTHJDbsAyj PW
(LV|NONBLOCK|CLUSTER) (0x9c)
#locking/cluster_locking.c:160   cluster request failed: Invalid argument
#locking/locking.c:396         <backtrace>
#locking/locking.c:465         <backtrace>
#lvresize.c:729   Failed to suspend clone_os
#format_text/format-text.c:738         Wiping pre-committed
qa-xen-vm-store metadata from /dev/mapper/qa-xen-vm-store header at
4096
#locking/cluster_locking.c:497       Locking VG P_qa-xen-vm-store PW
(VG|CACHE) (0x104)
#locking/cluster_locking.c:497       Locking VG P_qa-xen-vm-store CR
(VG|HOLD|CACHE) (0x121)
#locking/cluster_locking.c:425       Requesting backup of VG metadata
for qa-xen-vm-store
#format_text/archiver.c:395     Creating volume group backup
"/etc/lvm/backup/qa-xen-vm-store" (seqno 150).
#format_text/format-text.c:929         Writing qa-xen-vm-store
metadata to /etc/lvm/backup/.lvm_qa-xen-0_30840_1908312135
#format_text/format-text.c:973         Committing qa-xen-vm-store metadata (150)
#format_text/format-text.c:974         Renaming
/etc/lvm/backup/qa-xen-vm-store.tmp to /etc/lvm/backup/qa-xen-vm-store
#mm/memlock.c:389         Unlock: Memlock counters: locked:1
critical:1 daemon:0 suspended:0
#locking/cluster_locking.c:419       Requesting sync names.
#locking/cluster_locking.c:497       Locking VG V_qa-xen-vm-store UN (VG) (0x6)
#device/dev-io.c:588         Closed /dev/mapper/qa-xen-vm-store
#metadata/vg.c:68         Freeing VG qa-xen-vm-store at 0x71f350.

The only patch we are applying to lvm2 is removal of the glum code
that caused lvm to hang when a node was offline. In all other respects
this is the stock version of lvm from
ftp://sources.redhat.com/pub/lvm2/ .

I thought this might be related to
https://bugzilla.redhat.com/show_bug.cgi?id=364081 but I am not that
experienced with C coding and cannot seem to track down where the
problem lies.

Any help on this would be greatly appreciated, as the ability to
online resize/rename is a critical feature that is currently
non-functional for me.

Thanks,
Hal Martin
