Date: Thu, 15 Apr 2004 10:57:23 -0700
From: Dave Olien <dmo@osdl.org>
Message-ID: <20040415175723.GA23061@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Oops with snapshot running udm3
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
Content-Transfer-Encoding: 7bit
To: thornber@redhat.com
Cc: linux-lvm@redhat.com


Below is the console output for a panic I got while running with a snapshot
of a striped device.  The hardware configuration has 8 processors and
16 gigabytes of memory.

I'm using a 1 gigabyte extent size in this volume group. The striped device
has 10 striped disks with a stripe size of 512k and is 160 extents big.
The snapshot device also has 160 extents.

This is running with the udm3 patch set.  It also occurs with the udm1
patch set.  At the time this occurs, the striped device has an ext2
file system containing a 140 gigabyte. An application is starting to do
sequential writes to that file.  The snapshot device is not being accessed
at all.  It's not even mounted.

This is very repeatable for me.

here's the console output:


Unable to handle kernel paging request at virtual address f8a6f000
 printing eip:
c0354473
*pde = 00000000
Oops: 0002 [#1]
PREEMPT SMP 
CPU:    2
EIP:    0060:[<c0354473>]    Not tainted VLI
EFLAGS: 00010202   (2.6.5-mm2-udm3) 
EIP is at persistent_commit+0x53/0x100
eax: c0352d90   ebx: f688df90   ecx: 00000000   edx: f8a6f000
esi: 00000000   edi: d269aba4   ebp: f7cb4eb0   esp: f7cb4e88
ds: 007b   es: 007b   ss: 0068
Process kcopyd/2 (pid: 53, threadinfo=f7cb4000 task=f7cd2190)
Stack: f688df90 000005a6 f7cb4e94 0000184f 00000000 000007fa 00000000 de740620 
       00000000 d269aba4 f7cb4ec8 c0352de9 f6c108e0 d269aba4 c0352d90 d269aba4 
       f7cb4ef0 c034f5f0 00000000 00000000 d269aba4 c0352da0 00000000 f7cb4000 
Call Trace:
 [<c0352de9>] copy_callback+0x49/0x50
 [<c0352d90>] commit_callback+0x0/0x10
 [<c034f5f0>] run_complete_job+0x60/0x70
 [<c0352da0>] copy_callback+0x0/0x50
 [<c034fa15>] process_jobs+0xc5/0x2a0
 [<c034fc0a>] do_work+0x1a/0x50
 [<c034f590>] run_complete_job+0x0/0x70
 [<c0135ba8>] worker_thread+0x228/0x380
 [<c034fbf0>] do_work+0x0/0x50
 [<c011d4da>] __wake_up_common+0x3a/0x60
 [<c011d480>] default_wake_function+0x0/0x20
 [<c011d480>] default_wake_function+0x0/0x20
 [<c013a153>] kthread_exit_files+0x33/0x60
 [<c013a23a>] kthread+0xba/0xc0
 [<c0135980>] worker_thread+0x0/0x380
 [<c013a180>] kthread+0x0/0xc0
 [<c0103305>] kernel_thread_helper+0x5/0x10

Code: 45 e4 89 55 f0 89 44 24 08 8b 43 20 89 44 24 04 ff 43 20 89 1c 24 e8 1d fc ff ff 8b 53 2c 8b 43 28 8d 14 c2 40 89 43 28 8b 45 10 <89> 02 8b 45 14 89 42 04 f0 ff 4b 24 0f 94 c0 84 c0 75 10 8b 43 
