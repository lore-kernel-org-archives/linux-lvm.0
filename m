Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <Pine.LNX.4.33.0201042103110.11386-100000@chuckle.americas.sgi.com>
In-Reply-To: <Pine.LNX.4.33.0201042103110.11386-100000@chuckle.americas.sgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16NaOa-0001NG-00@hermes.sistina.com>
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
Date: Mon Jan  7 08:05:02 2002
List-Id: <linux-lvm.redhat.com>
To: Eric Sandeen <sandeen@sgi.com>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This is the kdb output from trying to create a snapshot of an XFS volume when 
I have removed ext3 from my kernel. (For clarifcation - in all my previous 
tests ext3 was compiled into my kernel - in this test I did not select ext3 
at all in menuconfig)

The only other thing I have noticed is that when the original XFS logical 
volume is unmounted snapshot creation is fine.  I'm not sure if this works on 
the other tests I have tried so I will go back and redo them.

id %eip is weird.  What does this really mean?  looks like the instructions 
point nowhere.  Am I correct?

Entering kdb (current=0xd600e000, pid 940) Oops: Oops
due to oops @ 0xb800
eax = 0xffffffff ebx = 0xd600e000 ecx = 0x0000b800 edx = 0xc018fd25
esi = 0x00000008 edi = 0xd600e000 esp = 0xd600ff0c eip = 0x0000b800
ebp = 0xd600ff30 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010086
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd600fed8
kdb> bt
    EBP       EIP         Function(args)
0xd600ff30 0x0000b800 <unknown>+0xb800 (0x1)
                               kernel <unknown> 0x0 0x0 0x0
           0xc011ce83 dequeue_signal+0x43 (0xd600e560, 0xd600ff30, 
0xd600e560, 0xd600ffc4, 0xc01392ff)
                               kernel .text 0xc0100000 0xc011ce40 0xc011cef0
           0xc01069b9 do_signal+0x59 (0x11, 0xbfffec40, 0xbfffebb0, 0x8, 0x11)
                               kernel .text 0xc0100000 0xc0106960 0xc0106c00
           0xc0106d54 signal_return+0x14
                               kernel .text 0xc0100000 0xc0106d40 0xc0106d58
kdb> btp 940
    EBP       EIP         Function(args)
0xc011ce83 0x0000b800 <unknown>+0xb800 (0x1)
                               kernel <unknown> 0x0 0x0 0x0
           0xc011ce83 dequeue_signal+0x43 (0xd600e560, 0xd600ff30, 
0xd600e560, 0xd600ffc4, 0xc01392ff)
                               kernel .text 0xc0100000 0xc011ce40 0xc011cef0
           0xc01069b9 do_signal+0x59 (0x11, 0xbfffec40, 0xbfffebb0, 0x8, 0x11)
                               kernel .text 0xc0100000 0xc0106960 0xc0106c00
           0xc0106d54 signal_return+0x14
                               kernel .text 0xc0100000 0xc0106d40 0xc0106d58
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
0xd7228000 00000156 00000001  1  000  stop  0xd7228270 kreiserfsd
0xd7022000 00000159 00000001  1  000  stop  0xd7022270 pagebuf_daemon
0xd630c000 00000522 00000001  1  000  stop  0xd630c270 dhcpcd
0xd6fce000 00000658 00000001  1  000  stop  0xd6fce270 syslogd
0xd630a000 00000663 00000001  1  000  stop  0xd630a270 klogd
0xd61a2000 00000683 00000001  1  000  stop  0xd61a2270 portmap
0xd617c000 00000711 00000001  1  000  stop  0xd617c270 rpc.statd
0xd6108000 00000823 00000001  1  000  stop  0xd6108270 crond
0xd651c000 00000860 00000001  1  000  stop  0xd651c270 atd
0xd7986000 00000867 00000001  1  000  stop  0xd7986270 login
0xd627a000 00000868 00000001  1  000  stop  0xd627a270 mingetty
0xd6194000 00000869 00000001  1  000  stop  0xd6194270 mingetty
0xd613e000 00000870 00000001  1  000  stop  0xd613e270 mingetty
more>
0xd6400000 00000871 00000001  1  000  stop  0xd6400270 mingetty
0xd60e4000 00000872 00000001  1  000  stop  0xd60e4270 mingetty
0xd6284000 00000873 00000001  1  000  stop  0xd6284270 mgetty
0xd67f2000 00000876 00000867  1  000  stop  0xd67f2270 bash
0xd600e000 00000940 00000876  1  000  run   0xd600e270*lvcreate
kdb> id %eip
0xb800: kdb: Bad user address 0xb800
add    %al,(%eax)
0xb802: add    %al,(%eax)
0xb804: add    %al,(%eax)
0xb806: add    %al,(%eax)
0xb808: add    %al,(%eax)
0xb80a: add    %al,(%eax)
0xb80c: add    %al,(%eax)
0xb80e: add    %al,(%eax)
0xb810: add    %al,(%eax)
0xb812: add    %al,(%eax)
0xb814: add    %al,(%eax)
0xb816: add    %al,(%eax)
0xb818: add    %al,(%eax)
0xb81a: add    %al,(%eax)
0xb81c: add    %al,(%eax)
0xb81e: add    %al,(%eax)
kdb> go
Oops: 0000
CPU:    0
EIP:    0010:[<0000b800>]    Not tainted
EFLAGS: 00010086
eax: ffffffff   ebx: d600e000   ecx: 0000b800   edx: c018fd25
esi: 00000008   edi: d600e000   ebp: d600ff30   esp: d600ff0c
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 940, stackpage=d600f000)
Stack: c011ce83 00000001 00000000 00000008 c01069b9 d600e560 d600ff30 d600e560
       d600ffc4 c01392ff 00000282 d604ab40 d600e000 00000011 c1672144 c011de97
       00000011 d600e568 00000000 d600ff70 d600ffa4 c011e252 00000011 d600ff90
Call Trace: [<c011ce83>] [<c01069b9>] [<c01392ff>] [<c011de97>] [<c011e252>]
   [<c0106d54>]

Code:  Bad EIP value.
- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8OavO8ZJI8OvSkAcRAlktAJ0Uyq3AyRtrrBDkxe5oszt+wrbjAwCfU+wC
w9VQ0Hb8tpt8qmCTsM+gJDk=
=5Vw0
-----END PGP SIGNATURE-----
