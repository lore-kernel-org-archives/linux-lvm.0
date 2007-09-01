Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l81KND3F029002
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 16:23:14 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l81KN5Jo016673
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 16:23:06 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id C5E894FE2F
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:22:57 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 5490394E3
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:22:57 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id r9Dr3oz7ayYR for <linux-lvm@redhat.com>;
	Sat,  1 Sep 2007 22:22:55 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-243-125.netcologne.de
	[87.78.243.125]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:22:54 +0200 (CEST)
Message-ID: <46D9CA1D.8050908@wpkg.org>
Date: Sat, 01 Sep 2007 22:22:53 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how much memory does LVM need? oom-killer comes
References: <46D9C7CD.4050703@wpkg.org>
In-Reply-To: <46D9C7CD.4050703@wpkg.org>
Content-Transfer-Encoding: 7bit
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

Tomasz Chmielewski schrieb:
> I just did vgchange -an, and there came the oom-killer. This is all with 
> 2.6.22.5 kernel.
> 
> The machine has 256 MB RAM; PV is almost 1.5 TB big:
> 
> # pvs
>   PV         VG          Fmt  Attr PSize PFree
>   /dev/md0   superthecus lvm2 a-   1.46T 120.63G
> 
> After I do "vgchange -ay", the memory usage goes from ~17 MB to almost 
> 180 MB - is it normal?

Can the memory usage be so high (~180 MB out of 256 MB) because I have 
two pretty big snapshots? Normally, this machine uses about 17 MB.


# lvs
   LV                  VG          Attr   LSize   Origin Snap%  Move Log 
Copy%
   backup              superthecus owi-ao   1.20T
   backup-snap         superthecus swi-a- 100.00G backup  30.15
   backup-snap-resized superthecus swi-a-  30.00G backup  69.00
   backup1             superthecus -wi-a-   3.00G
   backup1-sync-test   superthecus -wi-a-   3.00G
   src                 superthecus -wi-a-   2.00G
   swap                superthecus -wi-ao   3.00G


Unfortunately, I can't remove these snapshots, as oom-killer comes :(
Is there any solution to that, other than adding memory (which can be 
hard to do remotely)?


# lvremove /dev/superthecus/backup-snap-resized
Do you really want to remove active logical volume 
"backup-snap-resized"? [y/n]: y
printk: 11 messages suppressed.
lvremove invoked oom-killer: gfp_mask=0x280d2, order=0, oomkilladj=0
  [<c013338e>] out_of_memory+0x68/0x166
  [<c01345e9>] __alloc_pages+0x1fb/0x285
  [<c012fa09>] handle_edge_irq+0xb1/0xcc
  [<c013a2de>] __handle_mm_fault+0x30e/0x68e
  [<c0139717>] follow_page+0xcf/0x11b
  [<c013a803>] get_user_pages+0x1a5/0x25a
  [<c013afc4>] make_pages_present+0x79/0x8e
  [<c013cd68>] do_brk+0x1c7/0x1df
  [<c013ce28>] sys_brk+0xa8/0xc8
  [<c0103aea>] syscall_call+0x7/0xb
  [<c0280000>] unix_stream_recvmsg+0x144/0x40c
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   90, btch:  15 usd:  13   Cold: hi:   30, btch:   7 
usd:   4
Active:1374 inactive:675 dirty:0 writeback:0 unstable:0
  free:16608 slab:40608 mapped:1007 pagetables:60 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:2124kB 
inactive:1760kB present:16256kB pages_scanned:5851 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61336kB min:61368kB low:76708kB high:92052kB active:3372kB 
inactive:940kB present:239716kB pages_scanned:938 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 1*8kB 31*16kB 91*32kB 35*64kB 15*128kB 6*256kB 10*512kB 
4*1024kB 1*2048kB 10*4096kB = 61336kB
Swap cache: add 5620, delete 5037, find 1791/2263, race 0+0
Free swap  = 3140372kB
Total swap = 3145720kB
Free swap:       3140372kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1935 pages shared
583 pages swap cached
0 pages dirty
0 pages writeback
1007 pages mapped
40608 pages slab
60bles
Out of memory: kill process 2160 (lvremove) score 198 or a child
Killed process 2160 (lvremove)
klogd invoked oom-killer: gfp_mask=0x200d2, order=0, oomkilladj=0
  [<c013338e>] out_of_memory+0x68/0x166
  [<c01345e9>] __0x1fb/0x285
  [<c47c7>] sock_def_readable+0x27/0x4b
  [<c013ffa6>] read_swap_cache_async+0x2f/0xac
  [<c0139040>] swapin_readahead+0x3a/0x58
  [<c013a44c>] __handle_mm_fault+0x47c/0x68e
  [<c019a5b5>] cfq_completed_request+0x243/0x273
  [<c011051b>] do_page_fault+0x20c/0x515
  [<c0148b6c>] do_sync_write+0xc6/0x109
  [<c011030f>] do_page_fault+0x0/0x515
  [<c028510a>] error_code+0x6a/0x70
  [<c012007b>] parse_args+0x89/0x20a
  [<c01149b9>] do_syslog+0x10c/0x2b4
  [<c0121221>] autoremove_wake_function+0x0/0x35
  [<c01742da>] kmsg_read+0x0/0x36
  [<c01493d8>] vfs_read+0x88/0x10a
  [<c01496fb>] sys_read+0x41/0x67
  [<c0103aea>] syscall_call+0x7/0xb
  =======================
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 
usd:   0
Normal per-cpu:
CPU    0: Hot: hi:   902   Cold: hi:   30, btch:   7 usd:   8
Active:1403 inactive:643 dirty:0 writeback:0 unstable:0
  free:16606 slab:40608 mapped:1007 pagetables:60 bounce:0
DMA free:5096kB min:4160kB low:5200kB high:6240kB active:2124kB 
inactive:1760kB present:16256kB pages_scanned:5851 all_unreclaimable? yes
lowmem_reserve[]: 0 234
Normal free:61328kB min:61368kB low:76708kB high:92052kB active:3488kB 
inactive:812kB present:239716kB pages_scanned:1002 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 0*1024kB 
0*2048kB 1*4096kB = 5096kB
Normal: 0*4kB 0*8kB 31*16kB 91*32kB 35*64kB 15*128kB 6*256kB 10*512kB 
4*1024kB 1*2048kB 10*4096kB = 61328kB
Swap cache: add 5620, delete 5037, find 1791/2264, race 0+0
Free swap  = 3140372kB
Total swap = 3145720kB
Free swap:       3140372kB
64496 pages of RAM
0 pages of HIGHMEM
1254 reserved pages
1933 pages shared
583 pages swap cached
0 pages dirty
0 pages writeback
1007 pages mapped
40608 pages slab
60 pages pagetables
Killed



-- 
Tomasz Chmielewski
http://wpkg.org
