Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2I1KuY08633
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2005 20:20:56 -0500
Received: from twinlark.arctic.org (twinlark.arctic.org [207.7.145.18])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2I1KoH7028344
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2005 20:20:50 -0500
Date: Thu, 17 Mar 2005 17:20:50 -0800 (PST)
From: dean gaudet <dean-list-linux-lvm@arctic.org>
Message-ID: <Pine.LNX.4.62.0503171716050.20670@twinlark.arctic.org>
MIME-Version: 1.0
Subject: [linux-lvm] oops with snapshot / 2.4.29
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

i seem to have run into an oops described in the archives -- in particular 
this thread from last year:

https://www.redhat.com/archives/linux-lvm/2004-January/msg00110.html

has there been any further work on this?  any success stories for the #2 
patch mentioned in the above thread?

my system is running 2.4.29 + linux-2.4.22-VFS-lock.patch ... it's a dual 
xeon w/hyperthreading.  i've been using snapshots for over a year for 
nightly backups and this is the first time i've run into the oops.

thanks
-dean

Mar 16 03:31:19 twinlark kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000004
Mar 16 03:31:19 twinlark kernel:  printing eip:
Mar 16 03:31:19 twinlark kernel: c021f30c
Mar 16 03:31:19 twinlark kernel: *pde = 00000000
Mar 16 03:31:19 twinlark kernel: Oops: 0002
Mar 16 03:31:19 twinlark kernel: CPU:    3
Mar 16 03:31:19 twinlark kernel: EIP:    0010:[lvm_snapshot_remap_block+220/256]    Not tainted
Mar 16 03:31:19 twinlark kernel: EFLAGS: 00010202
Mar 16 03:31:19 twinlark kernel: eax: f8a3dde0   ebx: f8d36800   ecx: f8a31000   edx: 00000000
Mar 16 03:31:19 twinlark kernel: esi: 00010180   edi: 00000001   ebp: 00000903   esp: e1483ce0
Mar 16 03:31:19 twinlark kernel: ds: 0018   es: 0018   ss: 0018
Mar 16 03:31:19 twinlark kernel: Process qmail-smtpd (pid: 18415, stackpage=e1483000)
Mar 16 03:31:19 twinlark kernel: Stack: 00000038 00000903 00000000 f7ba9600 e94e5c00 e94e5d70 00010000 c021bb28 
Mar 16 03:31:19 twinlark kernel:        e1483d34 e1483d2c 00010180 e94e5c00 00000001 c01c7662 00000001 f7ba9770 
Mar 16 03:31:19 twinlark kernel:        f750c000 00010180 00000000 000101b8 000101b8 09030903 00003a00 f7535980 
Mar 16 03:31:19 twinlark kernel: Call Trace:    [lvm_map+408/1136] [submit_bh+82/256] [lvm_make_request_fn+23/48] [generic_make_request+228/320] [submit_bh+82/256]
Mar 16 03:31:19 twinlark kernel:   [__refile_buffer+86/112] [sync_page_buffers+168/176] [try_to_free_buffers+331/368] [shrink_cache+827/1040] [shrink_caches+74/96] [try_to_free_pages_zone+98/240]
Mar 16 03:31:19 twinlark kernel:   [balance_classzone+77/496] [__alloc_pages+376/640] [filemap_nopage+494/560] [filemap_nopage+0/560] [do_no_page+330/640] [handle_mm_fault+117/256]
Mar 16 03:31:19 twinlark kernel:   [do_page_fault+968/1397] [do_mmap_pgoff+874/1488] [old_mmap+272/304] [filp_close+143/208] [do_page_fault+0/1397] [error_code+52/60]
Mar 16 03:31:19 twinlark kernel: 
Mar 16 03:31:19 twinlark kernel: Code: 89 42 04 8b 03 89 48 04 89 01 89 59 04 89 0b 89 ca eb 9f b8 
