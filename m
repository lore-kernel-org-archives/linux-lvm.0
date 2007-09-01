Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l81KDMKW003797
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 16:13:22 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l81KDEd4023421
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 16:13:15 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id BA8214FE2F
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:13:06 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 33B8894E3
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:13:06 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id hpiSBYQsFRpn for <linux-lvm@redhat.com>;
	Sat,  1 Sep 2007 22:13:02 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-243-125.netcologne.de
	[87.78.243.125]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:13:02 +0200 (CEST)
Message-ID: <46D9C7CD.4050703@wpkg.org>
Date: Sat, 01 Sep 2007 22:13:01 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how much memory does LVM need? oom-killer comes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I just did vgchange -an, and there came the oom-killer. This is all with 
2.6.22.5 kernel.

The machine has 256 MB RAM; PV is almost 1.5 TB big:

# pvs
   PV         VG          Fmt  Attr PSize PFree
   /dev/md0   superthecus lvm2 a-   1.46T 120.63G

After I do "vgchange -ay", the memory usage goes from ~17 MB to almost 
180 MB - is it normal?


# vgchange -an
vgchange invoked oom-killer: gfp_mask=0x280d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013007b>] probe_irq_on+0x6c/0xea
  [<c013a2e6>] __handle_mm_fault+0x30e/0x68e
  [<c013971f>] follow_page+0xcf/0x11b
  [<c013a80b>] get_user_pages+0x1a5/0x25a
  [<c013afcc>] make_pages_present+0x79/0x8e
  [<c013cd70>] do_brk+0x1c7/0x1df
  [<c013ce30>] sys_brk+0xa8/0xc8
  [<c0103aea>] syscall_call+0x7/0xb
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1720 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
Out of memory: kill process 2101 (rpc.statd) score 441 or a child
Killed process 2101 (rpc.statd)
klogd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013589e>] __do_page_cache_readahead+0x79/0x181
  [<c0110581>] do_page_fault+0x272/0x515
  [<c01329c9>] filemap_nopage+0x115/0x255
  [<c013a0dc>] __handle_mm_fault+0x104/0x68e
  [<c011051b>] do_page_fault+0x20c/0x515
  [<c0149452>] vfs_read+0xfa/0x10a
  [<c011030f>] do_page_fault+0x0/0x515
  [<c028525a>] error_code+0x6a/0x70
  [<c0280000>] unix_dgram_sendmsg+0x3a8/0x3b4
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1721 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
vgchange invoked oom-killer: gfp_mask=0x280d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013007b>] probe_irq_on+0x6c/0xea
  [<c013a2e6>] __handle_mm_fault+0x30e/0x68e
  [<c013971f>] follow_page+0xcf/0x11b
  [<c013a80b>] get_user_pages+0x1a5/0x25a
  [<c013afcc>] make_pages_present+0x79/0x8e
  [<c013cd70>] do_brk+0x1c7/0x1df
  [<c013ce30>] sys_brk+0xa8/0xc8
  [<c0103aea>] syscall_call+0x7/0xb
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1721 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
rpc.idmapd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013589e>] __do_page_cache_readahead+0x79/0x181
  [<c028451a>] io_sc0130a54>] sync_page+0x0/0x3c
  [<c028470f>] __wait_on_bit_lock+0x4a/0x51
  [<c0130a46>] __lock_page+0x57/0x5d
  [<c01329c9>] filemap_nopage+0x11
  [<c013a0dc>] __handle_mm_fault+0x104/0x68e
  [<c011051b>] do_page_fault+0x20c/0x515
  [<c0124062>] do_gettimeofday+0x2c/0xc4
  [<c011030f>] do_page_fault+0x0/0x515
  [<c028525a>] error_code+0x6a/0x70
  [<c0280000>] unix_dgram_sendmsg+0x3a8/0x3b4
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1722 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
vgchange invoked oom-killer: gfp_mask=0x280d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alndle_mm_fault+0x30e/0x68e
  [<c013971f>] follow_page+0xcf/0x11b
  [<c013a80b>] get_user_pages+0x1a5/0x25a
  [<c013afcc>] make_pages_present+0x79/0x8e
  [<c013cd70>] do_brk+0x1c7/0x1df
  [<c013ce30>] sys_brk+0xa8/0xc8
  [<c0103aea>] syscall_call+0x7/0xb
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
ree:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1722 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
rpc.idmapd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013589e>] __do_page_cache_readahead+0x79/0x181
  [<c028451a>] io_schedule+0xe/0x16
  [<c0130a54>] sync_page+0x0/0x3c
  [<c028470f>] __wait_on_bit_lock+0x4a/0x51
  [<c0130a46>] __lock_page+0x57/0x5d
  [<c01329c9>] filemap_nopage+0x115/0x255
  [<c013a0dc>] __handle_mm_fault+0x104/0x68e
  [<c011051b>] do_page_fault+0x20c/0x515
  [<c0124062>] do_gettimeofday+0x2c/0xc4
  [<c011030f>] do_page_fault+0x0/0x515
  [<c028525a>] error_code+0x6a/0x70
  [<c0280000>] unix_dgram_sendmsg+0x3a8/0x3b4
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1722 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
vgchange invoked oom-killer: gfp_mask=0x280d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013007b>] probe_irq_on+0x6c/0xea
  [<c013a2e6>] __handle_mm_fault+0x30e/0x68e
  [<c013971f>] follow_page+0xcf/0x11b
  [<c013a80b>] get_user_pages+0x1a5/0x25a
  [<c013afcc>] make_pages_present+0x79/0x8e
  [<c013cd70>] do_brk+0x1c7/0x1df
  [<c013ce30>] sys_brk+0xa8/0xc8
  [<c0103aea>] syscall_call+0x7/0xb
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1722 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
rpc.idmapd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013589e>] __do_page_cache_readahead+0x79/0x181
  [<c028451a>] io_schedule+0xe/0x16
  [<c0130a54>] sync_page+0x0/0x3c
  [<c028470f>] __wait_on_bit_lock+0x4a/0x51
  [<c0130a46>] __lock_page+0x57/0x5d
  [<c01329c9>] filemap_nopage+0x115/0x255
  [<c013a0dc>] __handle_mm_fault+0x104/0x68e
  [<c011051b>] do_page_fault+0x20c/0x515
  [<c0124062>] do_gettimeofday+0x2c/0xc4
  [<c011030f>] do_page_fault+0x0/0x515
  [<c028525a>] error_code+0x6a/0x70
  [<c0280000>] unix_dgram_sendmsg+0x3a8/0x3b4
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1722 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
vgchange invoked oom-killer: gfp_mask=0x280d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013007b>] probe_irq_on+0x6c/0xea
  [<c013a2e6>] __handle_mm_fault+0x30e/0x68e
  [<c013971f>] follow_page+0xcf/0x11b
  [<c013a80b>] get_user_pages+0x1a5/0x25a
  [<c013afcc>] make_pages_present+0x79/0x8e
  [<c013cd70>] do_brk+0x1c7/0x1df
  [<c013ce30>] sys_brk+0xa8/0xc8
  [<c0103aea>] syscall_call+0x7/0xb
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1722 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
rpc.idmapd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
  [<c0133396>] out_of_memory+0x68/0x166
  [<c01345f1>] __alloc_pages+0x1fb/0x285
  [<c013589e>] __do_page_cache_readahead+0x79/0x181
  [<c028451a>] io_schedule+0xe/0x16
  [<c0130a54>] sync_page+0x0/0x3c
  [<c028470f>] __wait_on_bit_lock+0x4a/0x51
  [<c0130a46>] __lock_page+0x57/0x5d
  [<c01329c9>] filemap_nopage+0x115/0x255
  [<c013a0dc>] __handle_mm_fault+0x104/0x68e
  [<c011051b>] do_page_fault+0x20c/0x515
  [<c0124062>] do_gettimeofday+0x2c/0xc4
  [<c011030f>] do_page_fault+0x0/0x515
  [<c028525a>] error_code+0x6a/0x70
  [<c0280000>] unix_dgram_sendmsg+0x3a8/0x3b4
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  14   Cold: hi:   30, btch:   7 
usd:  18
Active:2017 inactive:490 dirty:0 writeback:0 unstable:0
  free:16602 slab:40594 mapped:952 pagetables:56 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:4556kB 
inactive:916kB present:16256kB pages_scanned:8309 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61312kB min:61368kB low:76708kB high:92052kB active:3512kB 
inactive:1044kB present:239716kB pages_scanned:7494 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 0*16kB 72*32kB 40*64kB 19*128kB 9*256kB 9*512kB 
4*1024kB 1*2048kB 10*4096kB = 61312kB
Swap cache: add 5022, delete 5022, find 1982/2477, race 0+0
Free swap  = 0kB
Total swap = 0kB
Free swap:            0kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1722 pages shared
0 pages swap cached
0 pages dirty
0 pages writeback
952 pages mapped
40594 pages slab
56 pages pagetables
Out of memory: kill process 1855 (portmap) score 422 or a child
Killed process 1855 (portmap)
Out of memory: kill process 2212 (bash) score 121 or a child
Killed process 2260 (vgchange)
Killed


-- 
Tomasz Chmielewski
