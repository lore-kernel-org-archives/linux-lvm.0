Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i59Kk8012793
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 16:46:08 -0400
Received: from intellx2.physics.uiuc.edu (lx2.physics.uiuc.edu
	[128.174.129.13])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i59Kk2Xn022134
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 16:46:02 -0400
Date: Wed, 9 Jun 2004 15:46:02 -0500 (CDT)
From: Damian Menscher <menscher@uiuc.edu>
Message-ID: <Pine.LNX.4.53.0406091532390.1163@lx2.physics.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] lvm kernel module OOPS
Reply-To: Damian Menscher <menscher@uiuc.edu>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm running RedHat 9 fully patched (2.4.20-31.9smp) with mostly default
settings.  In order to get consistent backups with dump(1), I take
advantage of LVM snapshots (lvm-1.0.3-12).  I have nightly backups to a
remote tapedrive, and disk-to-disk backups a few times during the day.
It works pretty well, usually.  But then there's the occasional kernel
crash.  :(

The first time this happened, the server (astro) was under fairly high
load, as a result of a memory-intensive program causing the machine to
swap.  While that was going on, my 18:00 backups ran, and this was the
result:

May 25 18:15:00 astro logger:  18:15:00  up 41 days,  1:57, 33 users,  load average: 5.13, 5.72, 4.01
May 25 18:22:50 astro kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000004
May 25 18:22:51 astro kernel:  printing eip:
May 25 18:22:51 astro kernel: f883ff8b
May 25 18:22:51 astro kernel: *pde = 00000000
May 25 18:22:51 astro kernel: Oops: 0002
May 25 18:22:51 astro kernel: vfat fat es1371 gameport ac97_codec soundcore ide-cd cdrom parport_pc lp parport nfsd lockd sunrpc e100 ipt_REJECT ipt_LOG ipt_limit ipt_mac ipt_state ip_conn
May 25 18:22:51 astro kernel: CPU:    1
May 25 18:22:51 astro kernel: EIP:    0060:[<f883ff8b>]    Not tainted
May 25 18:22:51 astro kernel: EFLAGS: 00010202
May 25 18:22:51 astro kernel:
May 25 18:22:51 astro kernel: EIP is at lvm_find_exception_table [lvm-mod] 0x7b (2.4.20-30.9smp)
May 25 18:22:51 astro kernel: eax: f8b19cd8   ebx: f8b2c4e8   ecx: f8b14770   edx: 00000000
May 25 18:22:51 astro kernel: esi: 05144f80   edi: 00000001   ebp: 00000802   esp: c48dfd68
May 25 18:22:51 astro kernel: ds: 0068   es: 0068   ss: 0068
May 25 18:22:51 astro kernel: Process dump (pid: 18145, stackpage=c48df000)
May 25 18:22:51 astro kernel: Stack: 000007ff f884bcbf f5678a00 00000000 00000000 c48dfdee f883efde 00000802
May 25 18:22:51 astro kernel:        05144f80 f5678a00 05144f80 00000000 0279cd00 05144280 f5678a00 00000001
May 25 18:22:51 astro kernel:        f883b66d c48dfdee c48dfde8 05144280 f5678a00 e6907f38 f884bcbf c915c700
May 25 18:22:51 astro kernel: Call Trace:   [<f884bcbf>] do_get_write_access [jbd] 0x31f (0xc48dfd6c))
May 25 18:22:51 astro kernel: [<f883efde>] lvm_snapshot_remap_block [lvm-mod] 0x7e (0xc48dfd80))
May 25 18:22:51 astro kernel: [<f883b66d>] lvm_map [lvm-mod] 0x20d (0xc48dfda8))
May 25 18:22:51 astro kernel: [<f884bcbf>] do_get_write_access [jbd] 0x31f (0xc48dfdc0))
May 25 18:22:51 astro kernel: [<f883ba67>] lvm_make_request_fn [lvm-mod] 0x17 (0xc48dfe00))
May 25 18:22:51 astro kernel: [<c01b612a>] generic_make_request [kernel] 0xda (0xc48dfe0c))
May 25 18:22:51 astro kernel: [<c01b61d7>] submit_bh [kernel] 0x57 (0xc48dfe34))
May 25 18:22:51 astro kernel: [<c0156927>] block_read_full_page [kernel] 0x257 (0xc48dfe50))
May 25 18:22:51 astro kernel: [<c013c108>] add_to_page_cache_unique [kernel] 0x68 (0xc48dfea0))
May 25 18:22:51 astro kernel: [<c013c24a>] page_cache_read [kernel] 0xda (0xc48dfeb4))
May 25 18:22:51 astro kernel: [<c015a950>] blkdev_get_block [kernel] 0x0 (0xc48dfebc))
May 25 18:22:51 astro kernel: [<c013cb2b>] generic_file_readahead [kernel] 0xdb (0xc48dfedc))
May 25 18:22:51 astro kernel: [<c013ce33>] do_generic_file_read [kernel] 0x1c3 (0xc48dff0c))
May 25 18:22:51 astro kernel: [<c013d450>] file_read_actor [kernel] 0x0 (0xc48dff38))
May 25 18:22:51 astro kernel: [<c013d600>] generic_file_read [kernel] 0xb0 (0xc48dff58))
May 25 18:22:51 astro kernel: [<c013d450>] file_read_actor [kernel] 0x0 (0xc48dff68))
May 25 18:22:51 astro kernel: [<c0152f27>] sys_read [kernel] 0x97 (0xc48dff94))
May 25 18:22:51 astro kernel: [<c01098cf>] system_call [kernel] 0x33 (0xc48dffc0))
May 25 18:22:51 astro kernel:
May 25 18:22:51 astro kernel:
May 25 18:22:51 astro kernel: Code: 89 42 04 8b 03 89 48 04 89 01 89 59 04 89 0b 89 c8 eb ce 0f
May 25 18:23:28 cayuga kernel: nfs: server astro not responding, still trying
May 25 18:23:34 cayuga modprobe: modprobe: Can't locate module char-major-10-134
May 25 18:24:47 cayuga modprobe: modprobe: Can't locate module char-major-10-134

I chalked it up a rare event due to the extreme load the machine was
experiencing (I think the load was above 10 at the time, and it was
using a full gig of swap), and went on with life.  But it just happened
again, when nobody was on the server, during my 12:00 backups:

Jun  9 12:02:36 astro kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000004
Jun  9 12:02:36 astro kernel:  printing eip:
Jun  9 12:02:36 astro kernel: f883ff8b
Jun  9 12:02:36 astro kernel: *pde = 00000000
Jun  9 12:02:36 astro kernel: Oops: 0002
Jun  9 12:02:36 astro kernel: es1371 gameport ac97_codec soundcore ide-cd cdrom parport_pc lp parport nfsd lockd sunrpc e100 ipt_REJECT ipt_LOG ipt_limit ipt_mac ipt_state ip_conntrack ipt
Jun  9 12:02:36 astro kernel: CPU:    3
Jun  9 12:02:36 astro kernel: EIP:    0060:[<f883ff8b>]    Not tainted
Jun  9 12:02:36 astro kernel: EFLAGS: 00010202
Jun  9 12:02:36 astro kernel:
Jun  9 12:02:36 astro kernel: EIP is at lvm_find_exception_table [lvm-mod] 0x7b (2.4.20-31.9smp)
Jun  9 12:02:36 astro kernel: eax: f8900510   ebx: f891c3a8   ecx: f8900090   edx: 00000000
Jun  9 12:02:36 astro kernel: esi: 03373b80   edi: 00000001   ebp: 00000802   esp: c0d2dd68
Jun  9 12:02:36 astro kernel: ds: 0068   es: 0068   ss: 0068
Jun  9 12:02:36 astro kernel: Process dump (pid: 13098, stackpage=c0d2d000)
Jun  9 12:02:36 astro kernel: Stack: 000007ff c01b618a f02db400 00000000 00000000 c0d2ddee f883efde 00000802
Jun  9 12:02:36 astro kernel:        03373b80 f02db400 03373b80 f883b9d0 009cb900 03372280 f02db400 00000001
Jun  9 12:02:36 astro kernel:        f883b66d c0d2ddee c0d2dde8 03372280 f02db400 c722de00 f884bcbf d41862c0
Jun  9 12:02:36 astro kernel: Call Trace:   [<c01b618a>] generic_make_request [kernel] 0xda (0xc0d2dd6c))
Jun  9 12:02:36 astro kernel: [<f883efde>] lvm_snapshot_remap_block [lvm-mod] 0x7e (0xc0d2dd80))
Jun  9 12:02:36 astro kernel: [<f883b9d0>] lvm_push_callback [lvm-mod] 0xa0 (0xc0d2dd94))
Jun  9 12:02:36 astro kernel: [<f883b66d>] lvm_map [lvm-mod] 0x20d (0xc0d2dda8))
Jun  9 12:02:36 astro kernel: [<f884bcbf>] do_get_write_access [jbd] 0x31f (0xc0d2ddc0))
Jun  9 12:02:36 astro kernel: [<f883ba67>] lvm_make_request_fn [lvm-mod] 0x17 (0xc0d2de00))
Jun  9 12:02:36 astro kernel: [<c01b618a>] generic_make_request [kernel] 0xda (0xc0d2de0c))
Jun  9 12:02:36 astro kernel: [<c01b6237>] submit_bh [kernel] 0x57 (0xc0d2de34))
Jun  9 12:02:36 astro kernel: [<c0156937>] block_read_full_page [kernel] 0x257 (0xc0d2de50))
Jun  9 12:02:36 astro kernel: [<c013c108>] add_to_page_cache_unique [kernel] 0x68 (0xc0d2dea0))
Jun  9 12:02:36 astro kernel: [<c013c24a>] page_cache_read [kernel] 0xda (0xc0d2deb4))
Jun  9 12:02:36 astro kernel: [<c015a960>] blkdev_get_block [kernel] 0x0 (0xc0d2debc))
Jun  9 12:02:36 astro kernel: [<c013cb2b>] generic_file_readahead [kernel] 0xdb (0xc0d2dedc))
Jun  9 12:02:36 astro kernel: [<c013cffa>] do_generic_file_read [kernel] 0x38a (0xc0d2df0c))
Jun  9 12:02:36 astro kernel: [<c013d450>] file_read_actor [kernel] 0x0 (0xc0d2df38))
Jun  9 12:02:36 astro kernel: [<c013d600>] generic_file_read [kernel] 0xb0 (0xc0d2df58))
Jun  9 12:02:36 astro kernel: [<c013d450>] file_read_actor [kernel] 0x0 (0xc0d2df68))
Jun  9 12:02:36 astro kernel: [<c0152f37>] sys_read [kernel] 0x97 (0xc0d2df94))
Jun  9 12:02:36 astro kernel: [<c01098cf>] system_call [kernel] 0x33 (0xc0d2dfc0))
Jun  9 12:02:36 astro kernel:
Jun  9 12:02:36 astro kernel:
Jun  9 12:02:36 astro kernel: Code: 89 42 04 8b 03 89 48 04 89 01 89 59 04 89 0b 89 c8 eb ce 0f

Debugging kernel crashes is slightly beyond my skill level, but I wanted
to report the problem.  I can provide additional information if needed.

Damian Menscher
-- 
-=#| Physics Grad Student & SysAdmin @ U Illinois Urbana-Champaign |#=-
-=#| 488 LLP, 1110 W. Green St, Urbana, IL 61801 Ofc:(217)333-0038 |#=-
-=#| 4602 Beckman, VMIL/MS, Imaging Technology Group:(217)244-3074 |#=-
-=#| <menscher@uiuc.edu> www.uiuc.edu/~menscher/ Fax:(217)333-9819 |#=-
-=#| The above opinions are not necessarily those of my employers. |#=-
