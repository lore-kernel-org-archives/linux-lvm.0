Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <200201042349.g04Nnag26320@oss.sgi.com>
    <1010186076.1414.22.camel@stout.americas.sgi.com>
In-Reply-To: <1010186076.1414.22.camel@stout.americas.sgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16Mgnt-00033G-00@hermes.sistina.com>
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Fri Jan  4 20:44:02 2002
List-Id: <linux-lvm.redhat.com>
To: Eric Sandeen <sandeen@sgi.com>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This is the full output from kdb when trying to create a snapshot on an XFS 
volume for me.

What I was going to do next was follow Andreas Dilger's sugestion and try 
again.

Entering kdb (current=0xc7228000, pid 1435) Oops: Oops
due to oops @ 0xc015c446
eax = 0x748b5356 ebx = 0xc01a1550 ecx = 0xd7894040 edx = 0x00000000
esi = 0xc7228000 edi = 0xd7894040 esp = 0xc7229eac eip = 0xc015c446
ebp = 0xd7ed4800 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010286
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xc7229e78
kdb> bt
    EBP       EIP         Function(args)
0xd7ed4800 0xc015c446 journal_start+0x36 (0xd7ed4800, 0x1, 0x40018000, 
0xc7229f5c, 0x2)
                               kernel .text 0xc0100000 0xc015c410 0xc015c4f0
           0xc01571a8 ext3_dirty_inode+0x58 (0xd7894040)
                               kernel .text 0xc0100000 0xc0157150 0xc0157250
           0xc0141b1e __mark_inode_dirty+0x2e (0xd7894040, 0x1)
                               kernel .text 0xc0100000 0xc0141af0 0xc0141b70
           0xc0143001 update_atime+0x51 (0xd7894040, 0x6d6, 0x1, 0x0, 0x6d6)
                               kernel .text 0xc0100000 0xc0142fb0 0xc0143010
           0xc01254ac do_generic_file_read+0x40c (0xd5fc7740, 0xd5fc7760, 
0xc7229f5c, 0xc0125690, 0x6d6)
                               kernel .text 0xc0100000 0xc01250a0 0xc01254c0
           0xc012576a generic_file_read+0x7a (0xd5fc7740, 0x40018000, 0x1000, 
0xd5fc7760, 0x0)
                               kernel .text 0xc0100000 0xc01256f0 0xc0125810
           0xc0130cf5 sys_read+0x95 (0x4, 0x40018000, 0x1000, 0x8086ab0, 
0x40018000)
                               kernel .text 0xc0100000 0xc0130c60 0xc0130d30
           0xc0106d1b system_call+0x33
                               kernel .text 0xc0100000 0xc0106ce8 0xc0106d20
kdb> btp 1435
    EBP       EIP         Function(args)
0xc01a1550 0xc015c446 journal_start+0x36 (0xd7ed4800, 0x1, 0x40018000, 
0xc7229f5c, 0x2)
                               kernel .text 0xc0100000 0xc015c410 0xc015c4f0
           0xc01571a8 ext3_dirty_inode+0x58 (0xd7894040)
                               kernel .text 0xc0100000 0xc0157150 0xc0157250
           0xc0141b1e __mark_inode_dirty+0x2e (0xd7894040, 0x1)
                               kernel .text 0xc0100000 0xc0141af0 0xc0141b70
           0xc0143001 update_atime+0x51 (0xd7894040, 0x6d6, 0x1, 0x0, 0x6d6)
                               kernel .text 0xc0100000 0xc0142fb0 0xc0143010
           0xc01254ac do_generic_file_read+0x40c (0xd5fc7740, 0xd5fc7760, 
0xc7229f5c, 0xc0125690, 0x6d6)
                               kernel .text 0xc0100000 0xc01250a0 0xc01254c0
           0xc012576a generic_file_read+0x7a (0xd5fc7740, 0x40018000, 0x1000, 
0xd5fc7760, 0x0)
                               kernel .text 0xc0100000 0xc01256f0 0xc0125810
           0xc0130cf5 sys_read+0x95 (0x4, 0x40018000, 0x1000, 0x8086ab0, 
0x40018000)
                               kernel .text 0xc0100000 0xc0130c60 0xc0130d30
           0xc0106d1b system_call+0x33
                               kernel .text 0xc0100000 0xc0106ce8 0xc0106d20
kdb> ps
Task Addr  Pid      Parent   [*] cpu  State Thread     Command
0xd7fe2000 00000001 00000000  1  000  stop  0xd7fe2270 init
0xc163c000 00000002 00000001  1  000  stop  0xc163c270 keventd
0xc1638000 00000003 00000000  1  000  stop  0xc1638270 ksoftirqd_CPU0
0xc1636000 00000004 00000000  1  000  stop  0xc1636270 kswapd
0xc1634000 00000005 00000000  1  000  stop  0xc1634270 bdflush
0xc1632000 00000006 00000000  1  000  stop  0xc1632270 kupdated
0xd7ec4000 00000007 00000001  1  000  stop  0xd7ec4270 mdrecoveryd
0xd7eae000 00000008 00000001  1  000  stop  0xd7eae270 raid5d
0xd7b32000 00000009 00000001  1  000  stop  0xd7b32270 kjournald
0xd72a6000 00000153 00000001  1  000  stop  0xd72a6270 kjournald
0xd729c000 00000154 00000001  1  000  stop  0xd729c270 kjournald
0xd7292000 00000155 00000001  1  000  stop  0xd7292270 kjournald
0xd7174000 00000157 00000001  1  000  stop  0xd7174270 kreiserfsd
0xd70ac000 00000158 00000001  1  000  stop  0xd70ac270 kjournald
0xd6f68000 00000160 00000001  1  000  stop  0xd6f68270 pagebuf_daemon
0xd6250000 00000525 00000001  1  000  stop  0xd6250270 dhcpcd
0xd6c56000 00000661 00000001  1  000  stop  0xd6c56270 syslogd
0xd623a000 00000666 00000001  1  000  stop  0xd623a270 klogd
0xd619e000 00000686 00000001  1  000  stop  0xd619e270 portmap
0xd60ac000 00000714 00000001  1  000  stop  0xd60ac270 rpc.statd
0xd62d6000 00000827 00000001  1  000  stop  0xd62d6270 crond
more>
0xd5f3a000 00000863 00000001  1  000  stop  0xd5f3a270 atd
0xd6a80000 00000870 00000001  1  000  stop  0xd6a80270 login
0xd5f5a000 00000871 00000001  1  000  stop  0xd5f5a270 login
0xd5f56000 00000872 00000001  1  000  stop  0xd5f56270 mingetty
0xd6c9c000 00000873 00000001  1  000  stop  0xd6c9c270 mingetty
0xd5f6a000 00000874 00000001  1  000  stop  0xd5f6a270 mingetty
0xd6c9a000 00000875 00000001  1  000  stop  0xd6c9a270 mingetty
0xd6338000 00000876 00000001  1  000  stop  0xd6338270 login
0xd739c000 00000879 00000876  1  000  stop  0xd739c270 bash
0xd5d86000 00000925 00000870  1  000  stop  0xd5d86270 bash
0xd580c000 00000977 00000871  1  000  stop  0xd580c270 bash
0xc7228000 00001435 00000925  1  000  run   0xc7228270*lvcreate
kdb> id %eip
0xc015c446 journal_start+0x36:  cmp    %ebp,(%eax)
0xc015c448 journal_start+0x38:  je     0xc015c46d journal_start+0x5d:
0xc015c44a journal_start+0x3a:  push   $0xc02309e0
0xc015c44f journal_start+0x3f:  push   $0xe1
0xc015c454 journal_start+0x44:  push   $0xc022becf
0xc015c459 journal_start+0x49:  push   $0xc022b6a0
0xc015c45e journal_start+0x4e:  push   $0xc022e6a0
0xc015c463 journal_start+0x53:  call   0xc0115380 printk:
0xc015c468 journal_start+0x58:  ud2a
0xc015c46a journal_start+0x5a:  add    $0x14,%esp
0xc015c46d journal_start+0x5d:  incl   0x8(%ebx)
0xc015c470 journal_start+0x60:  jmp    0xc015c4e0 journal_start+0xd0:
0xc015c472 journal_start+0x62:  push   $0x1
0xc015c474 journal_start+0x64:  push   $0xf0
0xc015c479 journal_start+0x69:  push   $0x14
0xc015c47b journal_start+0x6b:  push   $0xc022b6a0
kdb> go
Oops: 0000
CPU:    0
EIP:    0010:[<c015c446>]    Not tainted
EFLAGS: 00010286
eax: 748b5356   ebx: c01a1550   ecx: d7894040   edx: 00000000
esi: c7228000   edi: d7894040   ebp: d7ed4800   esp: c7229eac
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 1435, stackpage=c7229000)
Stack: c01a1550 c01a1550 ffffffe2 d7894040 00000000 c01571a8 d7ed4800 00000001
       40018000 c7229f5c 00000002 00000018 d7894040 d7b41000 00000001 c0141b1e
       d7894040 3c36dd6f d5fc7760 d78940f0 c0143001 d7894040 00000001 00000000
Call Trace: [<c01a1550>] [<c01a1550>] [<c01571a8>] [<c0141b1e>] [<c0143001>]
   [<c01254ac>] [<c012576a>] [<c0125690>] [<c0130cf5>] [<c0106d1b>]

Code: 39 28 74 23 68 e0 09 23 c0 68 e1 00 00 00 68 cf be 22 c0 68


On Sat, 5 Jan 2002 09:14, Eric Sandeen wrote:
> On Fri, 2002-01-04 at 16:49, Adrian Head wrote:
> > What does your backtrace look like?  Its the ext3_dirt_inode in my
> > backtrace thats got me.  I have compiled a kernel without ext3 so will
> > also give it a run later.
>
> No, ext3 functions do not show up for me when it oopses on snapshot
> creation:
>
> kdb> bt
>     EBP       EIP         Function(args)
> 0xc1c2bf78 0xc013649e path_init+0x36 (0xc1c2a000)
>                                kernel .text 0xc0100000 0xc0136468
> 0xc013659c 0xc1c2bf90 0xc01366cf __user_walk+0x2f (0xc1c2a000, 0x804f1bc)
>                                kernel .text 0xc0100000 0xc01366a0
> 0xc01366f8 0xc1c2bfbc 0xc013381e sys_stat64+0x1a (0x8052474, 0xbfffe980,
> 0x40196154, 0x804f1bc, 0x3) kernel .text 0xc0100000 0xc0133804 0xc0133874
> 0xc0106c5b system_call+0x33
>                                kernel .text 0xc0100000 0xc0106c28
> 0xc0106c60
>
>
> It's trying to stat64 /dev/sda2, one of my lvm partitions.  I dunno why
> this blows up.  :/
>
> The code has some fastcalls & inlines around here, though, so this may
> not be the most accurate.
>
> Still looking...
>
> -Eric

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8NmkN8ZJI8OvSkAcRAk6FAJ0SKQPujP4BQbjs0tZprVhAyDwehQCfcjxA
lONpZIiIHSojcBPRkyNFfvA=
=k23i
-----END PGP SIGNATURE-----
