Message-Id: <3C444D56.65A1AE99@sara.nl>
From: Walter de Jong <walter@sara.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem with mounting xfs LVs under 2.4.17-ia64
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
Date: Tue Jan 15 09:42:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

We're running debian (woody dist) on an IA64.
The kernel is 2.4.17 with 2 patches applied:
- linux-2.4.17-ia64-011226.diff
- linux-2.4.17-xfs-2002-01-06.cvs-patch

We use lvm utils 1.0.1-rc4

When trying to mount the filesystem, we get:

ns5# mount -t xfs /dev/sara_vg/home /mnt
Segmentation fault

Jan 15 16:01:14 ns5 kernel: lvm -- lvm_blk_ioctl: unknown command 0x40081271
Jan 15 16:02:54 ns5 kernel: I/O error in filesystem ("lvm(58,0)") meta-data dev 0x0 block 0x0
Jan 15 16:02:54 ns5 kernel:        ("xfs_read_buf") error 2099955072 buf count 0
Jan 15 16:02:54 ns5 kernel:
Jan 15 16:02:54 ns5 kernel: Pid: 2810, comm:                mount
Jan 15 16:02:54 ns5 kernel: psr : 0000101008022018 ifs : 8000000000000004 ip  : [pagebuf_delwri_dequ
eue+144/320]    Not tainted
Jan 15 16:02:54 ns5 kernel: unat: 0000000000000000 pfs : 000000000000040c rsc : 0000000000000003
Jan 15 16:02:54 ns5 kernel: rnat: 3736353433323130 bsps: e00000025ca77870 pr  : 000000000002091b
Jan 15 16:02:54 ns5 kernel: ldrs: 0000000000000000 ccv : 0000000000000000 fpsr: 0009804c8a70033f
Jan 15 16:02:54 ns5 kernel: b0  : e0000000046db0c0 b6  : e00000000483dda0 b7  : e000000004491730
Jan 15 16:02:54 ns5 kernel: f6  : 1003e00000000000000a0 f7  : 1003e00000000000000a0
Jan 15 16:02:54 ns5 kernel: f8  : 100008000000000000000 f9  : 10002a000000000000000
Jan 15 16:02:54 ns5 kernel: r1  : e000000004b713d0 r2  : 0000000000000000 r3  : e000000004a0c490
Jan 15 16:02:54 ns5 kernel: r8  : 0000000000000077 r9  : 0000000000000894 r10 : 0000000000000000
Jan 15 16:02:54 ns5 kernel: r11 : 0000000000020a5b r12 : e00000025ca77990 r13 : e00000025ca70000
Jan 15 16:02:54 ns5 kernel: r14 : 0000000000000008 r15 : 00000000007cfff0 r16 : 0000000000000000
Jan 15 16:02:54 ns5 kernel: r17 : e000000278dbc848 r18 : e000000004b806d0 r19 : 0000001008026018
Jan 15 16:02:54 ns5 kernel: r20 : e000000264f48060 r21 : 000000000000ff00 r22 : 0000000000000fff
Jan 15 16:02:54 ns5 kernel: r23 : e000000004b81588 r24 : 0000001008026018 r25 : 0000000000000000
Jan 15 16:02:54 ns5 kernel: r26 : 0000000000000000 r27 : e00000025ca71588 r28 : 000000000002099b
Jan 15 16:02:54 ns5 kernel: r29 : 0000000000000001 r30 : 0000000000000000 r31 : 0000000000000000
Jan 15 16:02:54 ns5 kernel: r32 : 0000000000000000 r33 : 0000000000000000 r34 : 0000000000000000
Jan 15 16:02:54 ns5 kernel: r35 : 0000000000000000
Jan 15 16:02:54 ns5 kernel:
Jan 15 16:02:54 ns5 kernel: Call Trace: [show_stack+80/192] sp=0xe00000025ca77580 bsp=0xe00000025ca7
1538
Jan 15 16:02:54 ns5 kernel: [show_regs+1936/1984] sp=0xe00000025ca77740 bsp=0xe00000025ca714e0
Jan 15 16:02:54 ns5 kernel: [die+400/544] sp=0xe00000025ca77760 bsp=0xe00000025ca714b8
Jan 15 16:02:54 ns5 kernel: [ia64_do_page_fault+2112/2400] sp=0xe00000025ca77760 bsp=0xe00000025ca71
460
Jan 15 16:02:54 ns5 kernel: [ia64_leave_kernel+0/656] sp=0xe00000025ca777f0 bsp=0xe00000025ca71460
Jan 15 16:02:54 ns5 kernel: [pagebuf_delwri_dequeue+144/320] sp=0xe00000025ca77990 bsp=0xe00000025ca
71440
Jan 15 16:02:54 ns5 kernel: [<e000000278dbc870>] sp=0xe00000025ca77990 bsp=0xe00000025ca71440
Jan 15 16:02:54 ns5 kernel: [xfs_read_buf+480/672] sp=0xe00000025ca77990 bsp=0xe00000025ca71440
Jan 15 16:02:54 ns5 kernel: [<e00000025ca77800>] sp=0xe00000025ca77990 bsp=0xe00000025ca710b8

xfs on a regular disk partition does work, so I think it's caused by:
"lvm_blk_ioctl: unknown command 0x40081271"

Please help anyone?

-- 
                  *** If you build it, they will come ***

Walter de Jong
walter@sara.nl        http://www.sara.nl/
HPC Systems Programmer at SARA Computing and Network Services

People should be able to e-mail me, spambots should not.
