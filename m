Message-ID: <3FCC0EE0.9010207@backtobasicsmgmt.com>
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
References: <3FCB4AFB.3090700@backtobasicsmgmt.com> <20031201141144.GD12211@suse.de> <3FCB4CFA.4020302@backtobasicsmgmt.com> <20031201155143.GF12211@suse.de>
In-Reply-To: <20031201155143.GF12211@suse.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Reproducable OOPS with MD RAID-5 on 2.6.0-test11
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
Date: Mon Dec  1 22:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jens Axboe <axboe@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux-raid maillist <linux-raid@vger.kernel.org>, linux-lvm@sistina.com

Jens Axboe wrote:

> Alright, so no bouncing should be happening. Could you boot with
> mem=800m (and reproduce) just to rule it out completely?

Tested with mem=800m, problem still occurs. Additional test was done 
without device-mapper in place, though, and I could not reproduce the 
problem! I copied > 500MB of stuff to the XFS filesystem created using 
the entire /dev/md/0 device without a single unusual message. I then 
unmounted the filesystem and used pvcreate/vgcreate/lvcreate to make a 
3G volume on the array, made an XFS filesystem on it, mounted it, and 
tried copying data over. The oops message came back.

I'm copying this message to linux-lvm; the original oops message is 
repeated below for the benefit of those list readers. I've got one more 
round of testing to do (after the array resyncs itself), which is to try 
a filesystem other than XFS.

----

kernel BUG at fs/bio.c:177!
invalid operand: 0000 [#1]
CPU:    0
EIP:    0060:[<c014db9a>]    Not tainted
EFLAGS: 00010246
EIP is at bio_put+0x2c/0x36
eax: 00000000   ebx: f6221080   ecx: c1182180   edx: edcbf780
esi: c577b998   edi: 00000002   ebp: edcbf780   esp: f78ffeb0
ds: 007b   es: 007b   ss: 0068
Process md0_raid5 (pid: 65, threadinfo=f78fe000 task=f7924080)
Stack: c71e2640 c021d88d edcbf780 00000000 00000001 c1182180 00000009 
0001000
        edcbf780 00000000 00000000 00000000 c014e2fc edcbf780 00000000 
00000000
        f23a0ff0 f23a0ff0 edcbf7c0 c02ca51d edcbf780 00000000 00000000 
00000000
Call Trace:
  [<c021d88d>] bio_end_io_pagebuf+0x9a/0x138
  [<c014e2fc>] bio_endio+0x59/0x7e
  [<c02ca51d>] clone_endio+0x82/0xb5
  [<c02c0dc3>] handle_stripe+0x8f2/0xec0
  [<c02c17d1>] raid5d+0x71/0x105
  [<c02c898c>] md_thread+0xde/0x15c
  [<c011984b>] default_wake_function+0x0/0x12
  [<c02c88ae>] md_thread+0x0/0x15c
  [<c0107049>] kernel_thread_helper+0x5/0xb

Code: 0f 0b b1 00 bc 94 34 c0 eb d8 56 53 83 ec 08 8b 44 24 18 8b
