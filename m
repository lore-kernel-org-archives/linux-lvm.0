Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <20020104163939.C12868@lynx.no> <E16MhbU-00042E-00@hermes.sistina.com>
In-Reply-To: <E16MhbU-00042E-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16N6PZ-0006ex-00@hermes.sistina.com>
Subject: [linux-lvm] lvm-1.0.1rc4(ish) more robust on startup than lvm-1.0.1
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
Date: Sun Jan  6 00:05:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This is some more info for those that are interested.

On Sat, 5 Jan 2002 13:37, Adrian Head wrote:
> Andreas or any other LVM gurus,
>
> When lvcreate dies when creating an XFS snapshot it doesn't finish the
> snapshot creation and although lvdisplay shows that the XFS lv has an
> active snapshot (shows even its name) lvdisplay tells me that the snapshot
> doesn't exist and therefore, cannot be removed.
>
> During the reboot the machine fails to run through the startup scripts and
> dies somewhere within mount.
>
> I have found that kernels without the lvm-1.0.1 upgrade patch are able to
> carry on and even fix the half created snapshot whereas kernels with the
> lvm-1.0.1 upgrade patch are unable to deal with the problem snapshot and
> just die.
>
> Are you aware of what this might be?
>
> how would I recover using a lvm-1.0.1 patched kernel?
>
> Just interested
>
> Thanks

What interests me here is that the lvm-1.0.1rc4(ish) seems to be more robust 
then lvm-1.0.1 when dealing with a failed LV creation.

What seems to happen is that the snapshot is partially registered in the 
kernel.  The snapshot appears in the "/proc/lvm/global" as well as in the 
"/proc/lvm/VGs/HDA/LVs/".   However, "/dev/HDA/SNAP" is missing and I can 
generate it by doing a vgscan and a lvscan.  However, this does not fix the 
kernel from dying upon a reboot.

The only way I have found to recover from this situation is to use an old 
kernel that has only lvm-1.0.1rc4(ish) - this kernel does not Oops upon boot 
and fixes the failed snapshot so that either it can be used later or removed 
correctly.

The procedure goes something like this:
1)	create snapshot on an XFS partition - it fails with an Oops.
at this point I can not view or remove the failed snapshot although it 
appears in the correct places in /proc.  The /dev/vg/lv entries are missing.
2)	During the startup after a boot the machine dies after multiple Oopses and 
dies finally with a Kernel panic.  The kdb ouput from the start-up is 
appended below.
3)	Reboot using an old kernel with lvm-1.0.1rc4(ish) and everything starts 
fine.  You can then lvremove without a problem.
4)	I can then reboot into a kernel that has been upgraded to lvm-1.0.1 
without a problem.

The system is based on a minimal install of RH7.2 using a SGI XFS CVS kernel.

2.4.17-xfs
 + lvm-1.0.1 upgrade (from LVM CVS)
 + VFS-lock patch

Is there any other info people need?

Once the XFS snapshot creation has failed this is what happens during the boot
process after the reboot.

Unable to handle kernel NULL pointer dereference at virtual address 00000098
*pde = 00000000

Entering kdb (current=0xd75a4000, pid 152) Oops: Oops
due to oops @ 0xc0144e9e
eax = 0x00000080 ebx = 0xd8f69720 ecx = 0xc1606340 edx = 0xd75a4000
esi = 0xd6b7a000 edi = 0xd75a5f64 esp = 0xd75a5f08 eip = 0xc0144e9e
ebp = 0xc1606600 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010286
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd75a5ed4
kdb> bt
    EBP       EIP         Function(args)
0xc1606600 0xc0144e9e do_add_mount+0xfe (0xd75a5f64, 0xd6b7b000, 0x0, 0x0, 
0xd6b7a000)
                               kernel .text 0xc0100000 0xc0144da0 0xc0144f60
           0xc0145137 do_mount+0x137 (0xd6b7a000, 0xd7972000, 0xd6b7b000, 
0xc0ed0000, 0xd6b79000)
                               kernel .text 0xc0100000 0xc0145000 0xc0145160
           0xc01451d4 sys_mount+0x74 (0x807f730, 0x807f748, 0x807f758, 
0xc0ed0000, 0x807f788)
                               kernel .text 0xc0100000 0xc0145160 0xc0145210
           0xc0106d1b system_call+0x33
                               kernel .text 0xc0100000 0xc0106ce8 0xc0106d20
kdb> btp 152
    EBP       EIP         Function(args)
0xc0139b4e 0xc0144e9e do_add_mount+0xfe (0xd75a5f64, 0xd6b7b000, 0x0, 0x0, 
0xd6b7a000)
                               kernel .text 0xc0100000 0xc0144da0 0xc0144f60
           0xc0145137 do_mount+0x137 (0xd6b7a000, 0xd7972000, 0xd6b7b000, 
0xc0ed0000, 0xd6b79000)
                               kernel .text 0xc0100000 0xc0145000 0xc0145160
           0xc01451d4 sys_mount+0x74 (0x807f730, 0x807f748, 0x807f758, 
0xc0ed0000, 0x807f788)
                               kernel .text 0xc0100000 0xc0145160 0xc0145210
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
0xd7982000 00000010 00000001  1  000  stop  0xd7982270 init
0xd796e000 00000011 00000010  1  000  stop  0xd796e270 rc.sysinit
0xd7838000 00000012 00000011  1  000  stop  0xd7838270 initlog
0xd74ba000 00000111 00000001  1  000  stop  0xd74ba270 minilogd
0xd74da000 00000151 00000011  1  000  stop  0xd74da270 initlog
0xd75a4000 00000152 00000151  1  000  run   0xd75a4270*mount
0xd6e54000 00000153 00000152  1  000  stop  0xd6e54270 kjournald
0xd6e48000 00000154 00000152  1  000  stop  0xd6e48270 kjournald
0xd6e40000 00000155 00000152  1  000  stop  0xd6e40270 kjournald
0xd6d22000 00000157 00000152  1  000  run   0xd6d22270 kreiserfsd
0xd6c5c000 00000158 00000152  1  000  stop  0xd6c5c270 kjournald
0xd6b16000 00000160 00000001  1  000  stop  0xd6b16270 pagebuf_daemon
more>
kdb> id %eip
0xc0144e9e do_add_mount+0xfe:   mov    0x18(%eax),%esi
0xc0144ea1 do_add_mount+0x101:  test   %esi,%esi
0xc0144ea3 do_add_mount+0x103:  je     0xc0144eae do_add_mount+0x10e:
0xc0144ea5 do_add_mount+0x105:  incl   0x28(%esi)
0xc0144ea8 do_add_mount+0x108:  mov    0x550(%edx),%eax
0xc0144eae do_add_mount+0x10e:  mov    0xc(%eax),%ebx
0xc0144eb1 do_add_mount+0x111:  mov    %esi,%edi
0xc0144eb3 do_add_mount+0x113:  test   %ebx,%ebx
0xc0144eb5 do_add_mount+0x115:  je     0xc0144ec1 do_add_mount+0x121:
0xc0144eb7 do_add_mount+0x117:  mov    (%ebx),%eax
0xc0144eb9 do_add_mount+0x119:  test   %eax,%eax
0xc0144ebb do_add_mount+0x11b:  jne    0xc0144ebf do_add_mount+0x11f:
0xc0144ebd do_add_mount+0x11d:  ud2a
0xc0144ebf do_add_mount+0x11f:  incl   (%ebx)
0xc0144ec1 do_add_mount+0x121:  push   $0x1000
0xc0144ec6 do_add_mount+0x126:  pushl  0xc(%esp,1)
kdb> go
Oops: 0000
CPU:    0
EIP:    0010:[<c0144e9e>]    Not tainted
EFLAGS: 00010286
eax: 00000080   ebx: d8f69720   ecx: c1606340   edx: d75a4000
esi: d6b7a000   edi: d75a5f64   ebp: c1606600   esp: d75a5f08
ds: 0018   es: 0018   ss: 0018
Process mount (pid: 152, stackpage=d75a5000)
Stack: c0139b4e d76741c0 d6674000 d797200a d76741c0 00000000 d7b30700 d75a4000
       00000000 c0111e10 00000000 00000000 d7972000 d75a5f64 00000000 c0145137
       d75a5f64 d6b7b000 00000000 00000000 d6b7a000 d6b79000 00000000 d76741c0
Call Trace: [<c0139b4e>] [<c0111e10>] [<c0145137>] [<c0144fac>] [<c01451d4>]
   [<c0106d1b>]

Code: 8b 70 18 85 f6 74 09 ff 46 28 8b 82 50 05 00 00 8b 58 0c 89
 <1>Unable to handle kernel NULL pointer dereference at virtual address 
00000080 printing eip:
c0117c74
*pde = 00000000

Entering kdb (current=0xd75a4000, pid 152) Oops: Oops
due to oops @ 0xc0117c74
eax = 0x00000000 ebx = 0x00000080 ecx = 0x00000032 edx = 0xd75a4264
esi = 0xd75a4000 edi = 0x0000000b esp = 0xd75a5da4 eip = 0xc0117c74
ebp = 0xc0227590 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010202
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd75a5d70
kdb> go
Oops: 0002
CPU:    0
EIP:    0010:[<c0117c74>]    Not tainted
EFLAGS: 00010202
eax: 00000000   ebx: 00000080   ecx: 00000032   edx: d75a4264
esi: d75a4000   edi: 0000000b   ebp: c0227590   esp: d75a5da4
ds: 0018   es: 0018   ss: 0018
Process mount (pid: 152, stackpage=d75a5000)
Stack: 00000000 c0227590 c010a478 00000001 c02350fa c02c63e8 c02c4da0 00000000
       c0227590 00000001 00000018 00000018 00000001 c02c4da0 00000000 c0107411
       0000000b 000036ff 00000282 c0322e53 00000202 c0115484 00000000 c0144e9e
Call Trace: [<c010a478>] [<c0107411>] [<c0115484>] [<c0144e9e>] [<c0144e9e>]
   [<c0112176>] [<c01392ff>] [<c0135605>] [<d8f6f028>] [<c014412b>] 
[<c0111e10>]
   [<c0106e0c>] [<d8f69720>] [<c0144e9e>] [<c0139b4e>] [<c0111e10>] 
[<c0145137>]
   [<c0144fac>] [<c01451d4>] [<c0106d1b>]

Code: ff 0b 0f 94 c0 84 c0 74 76 ff 73 0c e8 9b 8d 02 00 8b 53 18
 <1>Unable to handle kernel NULL pointer dereference at virtual address 
0000000c printing eip:
c0129cb9
*pde = 00000000

Entering kdb (current=0xd75a4000, pid 152) Oops: Oops
due to oops @ 0xc0129cb9
eax = 0x00632840 ebx = 0xc1607360 ecx = 0x00000000 edx = 0x00000000
esi = 0x00000096 edi = 0xd8ca1000 esp = 0xd75a5c0c eip = 0xc0129cb9
ebp = 0xc0227590 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010046
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd75a5bd8
kdb> go
Oops: 0000
CPU:    0
EIP:    0010:[<c0129cb9>]    Not tainted
EFLAGS: 00010046
eax: 00632840   ebx: c1607360   ecx: 00000000   edx: 00000000
esi: 00000096   edi: d8ca1000   ebp: c0227590   esp: d75a5c0c
ds: 0018   es: 0018   ss: 0018
Process mount (pid: 152, stackpage=d75a5000)
Stack: 00000000 00000400 d75a4000 0000000b c011cc0e c1607360 d8ca1000 d75a4000
       c011cc84 d75a4568 00000000 c0117cf9 d75a4000 00000002 c0227590 c010a478
       00000001 c02350fa c02c63e8 c02c4da0 00000002 c0227590 00000001 00000018
Call Trace: [<c011cc0e>] [<c011cc84>] [<c0117cf9>] [<c010a478>] [<c0107411>]
   [<c0115484>] [<c0117c74>] [<c0111e10>] [<c0117c74>] [<c0111e10>] 
[<c0112176>]
   [<c0121ba8>] [<c0121821>] [<c0111e10>] [<c0106e0c>] [<c0117c74>] 
[<c010a478>]
   [<c0107411>] [<c0115484>] [<c0144e9e>] [<c0144e9e>] [<c0112176>] 
[<c01392ff>]
   [<c0135605>] [<d8f6f028>] [<c014412b>] [<c0111e10>] [<c0106e0c>] 
[<d8f69720>]
   [<c0144e9e>] [<c0139b4e>] [<c0111e10>] [<c0145137>] [<c0144fac>] 
[<c01451d4>]
   [<c0106d1b>]

Code: 2b 79 0c 89 f8 f7 73 18 89 c7 8b 41 14 89 44 b9 18 89 79 14
 <1>Unable to handle kernel paging request at virtual address 002aad20
 printing eip:
c012b40e
*pde = 00000000

Entering kdb (current=0xd74da000, pid 182) Oops: Oops
due to oops @ 0xc012b40e
eax = 0x00002bea ebx = 0xc15bd500 ecx = 0x00000003 edx = 0x002aa7a4
esi = 0xc02c7698 edi = 0x00000002 esp = 0xd74dbe3c eip = 0xc012b40e
ebp = 0x00015f54 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010013
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd74dbe08
kdb> bt
    EBP       EIP         Function(args)
0x00015f54 0xc012b40e rmqueue+0x8e
                               kernel .text 0xc0100000 0xc012b380 0xc012b540
           0xc012b73f __alloc_pages+0x3f
                               kernel .text 0xc0100000 0xc012b700 0xc012b880
kdb> btp 182
    EBP       EIP         Function(args)
0xd6af1cc0 0xc012b40e rmqueue+0x8e
                               kernel .text 0xc0100000 0xc012b380 0xc012b540
           0xc012b73f __alloc_pages+0x3f
                               kernel .text 0xc0100000 0xc012b700 0xc012b880
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
0xd7982000 00000010 00000001  1  000  stop  0xd7982270 init
0xd796e000 00000011 00000010  1  000  stop  0xd796e270 rc.sysinit
0xd7838000 00000012 00000011  1  000  stop  0xd7838270 initlog
0xd74ba000 00000111 00000001  1  000  stop  0xd74ba270 minilogd
0xd6e54000 00000153 00000001  1  000  stop  0xd6e54270 kjournald
0xd6e48000 00000154 00000001  1  000  stop  0xd6e48270 kjournald
0xd6e40000 00000155 00000001  1  000  stop  0xd6e40270 kjournald
0xd6d22000 00000157 00000001  1  000  stop  0xd6d22270 kreiserfsd
0xd6c5c000 00000158 00000001  1  000  stop  0xd6c5c270 kjournald
0xd6b16000 00000160 00000001  1  000  stop  0xd6b16270 pagebuf_daemon
0xd74da000 00000182 00000011  1  000  run   0xd74da270*pam_console_app
kdb> id %eip
0xc012b40e rmqueue+0x8e:        btc    %eax,(%edx)
0xc012b411 rmqueue+0x91:        movzbl 0x8(%esp,1),%ecx
0xc012b416 rmqueue+0x96:        mov    0xc(%esp,1),%edx
0xc012b41a rmqueue+0x9a:        mov    $0x1,%eax
0xc012b41f rmqueue+0x9f:        shl    %cl,%eax
0xc012b421 rmqueue+0xa1:        sub    %eax,0x4(%edx)
0xc012b424 rmqueue+0xa4:        mov    %ebp,(%esp,1)
0xc012b427 rmqueue+0xa7:        mov    %edi,%ebp
0xc012b429 rmqueue+0xa9:        mov    %ebp,%ecx
0xc012b42b rmqueue+0xab:        mov    $0x1,%edi
0xc012b430 rmqueue+0xb0:        shl    %cl,%edi
0xc012b432 rmqueue+0xb2:        cmp    0x8(%esp,1),%ebp
0xc012b436 rmqueue+0xb6:        jle    0xc012b49e rmqueue+0x11e:
0xc012b438 rmqueue+0xb8:        nop
0xc012b439 rmqueue+0xb9:        lea    0x0(%esi,1),%esi
0xc012b440 rmqueue+0xc0:        mov    0xc(%esp,1),%eax
kdb> go
Oops: 0002
CPU:    0
EIP:    0010:[<c012b40e>]    Not tainted
EFLAGS: 00010013
eax: 00002bea   ebx: c15bd500   ecx: 00000003   edx: 002aa7a4
esi: c02c7698   edi: 00000002   ebp: 00015f54   esp: d74dbe3c
ds: 0018   es: 0018   ss: 0018
Process pam_console_app (pid: 182, stackpage=d74db000)
Stack: d6af1cc0 00000286 00000000 c02c7668 c02c77bc 000001ff 00000000 00000000
       c012b73f c02c7668 c02c77b8 000001f0 d7720680 00000202 c1607130 000001f0
       00000000 c012b890 c0129996 00000001 000001f0 d7ed4874 00000000 d7720680
Call Trace: [<c012b73f>] [<c012b890>] [<c0129996>] [<c015cec5>] [<c0129b89>]
   [<c0157012>] [<c0141087>] [<c01393a5>] [<c01399f0>] [<c013910d>] 
[<c0139f83>]
   [<c01371c4>] [<c0123b92>] [<c0106d1b>]

Code: 0f bb 02 0f b6 4c 24 08 8b 54 24 0c b8 01 00 00 00 d3 e0 29
 <1>Unable to handle kernel paging request at virtual address 002aad1c
 printing eip:
c012b40e
*pde = 00000000

Entering kdb (current=0xd796e000, pid 11) Oops: Oops
due to oops @ 0xc012b40e
eax = 0x00002bcc ebx = 0xc15b9800 ecx = 0x00000003 edx = 0x002aa7a4
esi = 0xc02c7698 edi = 0x00000002 esp = 0xd796fe54 eip = 0xc012b40e
ebp = 0x00015e60 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010016
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd796fe20
kdb> bt
    EBP       EIP         Function(args)
0x00015e60 0xc012b40e rmqueue+0x8e (0xc02c7668, 0xc02c77d8, 0x1d2, 
0xc0208f4f, 0x0)
                               kernel .text 0xc0100000 0xc012b380 0xc012b540
           0xc012b73f __alloc_pages+0x3f (0xd796ffc4, 0x7, 0xcf, 0x80e498c, 
0x13)
                               kernel .text 0xc0100000 0xc012b700 0xc012b880
           0xc0106e0c error_code+0x34
                               kernel .text 0xc0100000 0xc0106dd8 0xc0106e14
Interrupt registers:
eax = 0x080e4980 ebx = 0xd796ffc4 ecx = 0x00000007 edx = 0x000000cf
esi = 0x080e498c edi = 0x00000013 esp = 0x00000023 eip = 0x0000002b
ebp = 0x080e498c xss = 0x00010202 xcs = 0xffffffff eflags = 0x080ac410
xds = 0xbffff838 xes = 0x080e498c origeax = 0x0000002b &regs = 0xd796ffbc
Interrupt from user space, end of kernel trace
kdb> btp 11
    EBP       EIP         Function(args)
0x00015810 0xc012b40e rmqueue+0x8e (0xc02c7668, 0xc02c77d8, 0x1d2, 
0xc0208f4f, 0x0)
                               kernel .text 0xc0100000 0xc012b380 0xc012b540
           0xc012b73f __alloc_pages+0x3f (0xd796ffc4, 0x7, 0xcf, 0x80e498c, 
0x13)
                               kernel .text 0xc0100000 0xc012b700 0xc012b880
           0xc0106e0c error_code+0x34
                               kernel .text 0xc0100000 0xc0106dd8 0xc0106e14
Interrupt registers:
eax = 0x080e4980 ebx = 0xd796ffc4 ecx = 0x00000007 edx = 0x000000cf
esi = 0x080e498c edi = 0x00000013 esp = 0x00000023 eip = 0x0000002b
ebp = 0x080e498c xss = 0x00010202 xcs = 0xffffffff eflags = 0x080ac410
xds = 0xbffff838 xes = 0x080e498c origeax = 0x0000002b &regs = 0xd796ffbc
Interrupt from user space, end of kernel trace
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
0xd7982000 00000010 00000001  1  000  stop  0xd7982270 init
0xd796e000 00000011 00000010  1  000  run   0xd796e270*rc.sysinit
0xd7838000 00000012 00000011  1  000  stop  0xd7838270 initlog
0xd74ba000 00000111 00000001  1  000  stop  0xd74ba270 minilogd
0xd6e54000 00000153 00000001  1  000  stop  0xd6e54270 kjournald
0xd6e48000 00000154 00000001  1  000  stop  0xd6e48270 kjournald
0xd6e40000 00000155 00000001  1  000  stop  0xd6e40270 kjournald
0xd6d22000 00000157 00000001  1  000  stop  0xd6d22270 kreiserfsd
0xd6c5c000 00000158 00000001  1  000  stop  0xd6c5c270 kjournald
0xd6b16000 00000160 00000001  1  000  stop  0xd6b16270 pagebuf_daemon
0xd74da000 00000183 00000011  1  000  run   0xd74da270 rc.sysinit
kdb> id %eip
0xc012b40e rmqueue+0x8e:        btc    %eax,(%edx)
0xc012b411 rmqueue+0x91:        movzbl 0x8(%esp,1),%ecx
0xc012b416 rmqueue+0x96:        mov    0xc(%esp,1),%edx
0xc012b41a rmqueue+0x9a:        mov    $0x1,%eax
0xc012b41f rmqueue+0x9f:        shl    %cl,%eax
0xc012b421 rmqueue+0xa1:        sub    %eax,0x4(%edx)
0xc012b424 rmqueue+0xa4:        mov    %ebp,(%esp,1)
0xc012b427 rmqueue+0xa7:        mov    %edi,%ebp
0xc012b429 rmqueue+0xa9:        mov    %ebp,%ecx
0xc012b42b rmqueue+0xab:        mov    $0x1,%edi
0xc012b430 rmqueue+0xb0:        shl    %cl,%edi
0xc012b432 rmqueue+0xb2:        cmp    0x8(%esp,1),%ebp
0xc012b436 rmqueue+0xb6:        jle    0xc012b49e rmqueue+0x11e:
0xc012b438 rmqueue+0xb8:        nop
0xc012b439 rmqueue+0xb9:        lea    0x0(%esi,1),%esi
0xc012b440 rmqueue+0xc0:        mov    0xc(%esp,1),%eax
kdb> go
Oops: 0002
CPU:    0
EIP:    0010:[<c012b40e>]    Not tainted
EFLAGS: 00010016
eax: 00002bcc   ebx: c15b9800   ecx: 00000003   edx: 002aa7a4
esi: c02c7698   edi: 00000002   ebp: 00015e60   esp: d796fe54
ds: 0018   es: 0018   ss: 0018
Process rc.sysinit (pid: 11, stackpage=d796f000)
Stack: 00015810 00000282 00000000 c02c7668 c02c77dc 000001ff 00000000 080e498c
       c012b73f c02c7668 c02c77d8 000001d2 c0208f4f 00000000 c15950c0 16543065
       080e498c c0122505 c02c7668 c02c77bc 000001ff 00000000 080e498c 00000001
Call Trace: [<c012b73f>] [<c0208f4f>] [<c0122505>] [<c0122ae6>] [<c0122b7a>]
   [<c020a341>] [<c0111f8e>] [<c012b73f>] [<c01148b7>] [<c01309c0>] 
[<c0111e10>]
   [<c0106e0c>]

Code: 0f bb 02 0f b6 4c 24 08 8b 54 24 0c b8 01 00 00 00 d3 e0 29
 <1>Unable to handle kernel paging request at virtual address 002aad48
 printing eip:
c012b2fe
*pde = 00000000

Entering kdb (current=0xd7982000, pid 10) Oops: Oops
due to oops @ 0xc012b2fe
eax = 0xc02c76f8 ebx = 0xc02c7668 ecx = 0xc02c7698 edx = 0x002aa7a4
esi = 0x0001696c edi = 0x00002d2d esp = 0xd7983f68 eip = 0xc012b2fe
ebp = 0xc15e5b80 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010087
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd7983f34
kdb> bt
    EBP       EIP         Function(args)
0xc15e5b80 0xc012b2fe __free_pages_ok+0x16e
                               kernel .text 0xc0100000 0xc012b190 0xc012b380
kdb> btp 10
    EBP       EIP         Function(args)
0xc1040000 0xc012b2fe __free_pages_ok+0x16e
                               kernel .text 0xc0100000 0xc012b190 0xc012b380
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
0xd7982000 00000010 00000001  1  000  stop  0xd7982270*init
0xd7838000 00000012 00000001  1  000  stop  0xd7838270 initlog
0xd74ba000 00000111 00000001  1  000  stop  0xd74ba270 minilogd
0xd6e54000 00000153 00000001  1  000  stop  0xd6e54270 kjournald
0xd6e48000 00000154 00000001  1  000  stop  0xd6e48270 kjournald
0xd6e40000 00000155 00000001  1  000  stop  0xd6e40270 kjournald
0xd6d22000 00000157 00000001  1  000  stop  0xd6d22270 kreiserfsd
0xd6c5c000 00000158 00000001  1  000  stop  0xd6c5c270 kjournald
0xd6b16000 00000160 00000001  1  000  stop  0xd6b16270 pagebuf_daemon
0xd74da000 00000183 00000001  1  000  run   0xd74da270 rc.sysinit
kdb> id %eip
0xc012b2fe __free_pages_ok+0x16e:       btc    %edi,(%edx)
0xc012b301 __free_pages_ok+0x171:       sbb    %eax,%eax
0xc012b303 __free_pages_ok+0x173:       test   %eax,%eax
0xc012b305 __free_pages_ok+0x175:       jne    0xc012b260 
__free_pages_ok+0xd0: 0xc012b30b __free_pages_ok+0x17b:       mov    
(%esp,1),%edx
0xc012b30e __free_pages_ok+0x17e:       mov    0x4(%esp,1),%ecx
0xc012b312 __free_pages_ok+0x182:       shl    $0x6,%esi
0xc012b315 __free_pages_ok+0x185:       lea    (%edx,%esi,1),%eax
0xc012b318 __free_pages_ok+0x188:       mov    (%ecx),%edx
0xc012b31a __free_pages_ok+0x18a:       mov    %eax,0x4(%edx)
0xc012b31d __free_pages_ok+0x18d:       mov    %edx,(%eax)
0xc012b31f __free_pages_ok+0x18f:       mov    %ecx,0x4(%eax)
0xc012b322 __free_pages_ok+0x192:       mov    %eax,(%ecx)
0xc012b324 __free_pages_ok+0x194:       pushl  0x8(%esp,1)
0xc012b328 __free_pages_ok+0x198:       popf
0xc012b329 __free_pages_ok+0x199:       jmp    0xc012b36c 
__free_pages_ok+0x1dc:kdb> go
Oops: 0002
CPU:    0
EIP:    0010:[<c012b2fe>]    Not tainted
EFLAGS: 00010087
eax: c02c76f8   ebx: c02c7668   ecx: c02c7698   edx: 002aa7a4
esi: 0001696c   edi: 00002d2d   ebp: c15e5b80   esp: d7983f68
ds: 0018   es: 0018   ss: 0018
Process init (pid: 10, stackpage=d7983000)
Stack: c1040000 c02c7698 00000213 fffffffc d796e000 d7982000 0000000b 0000000b
       c01180c6 d796e000 00000000 d7982000 00000000 00000000 00000000 d7982000
       d79820bc d79820bc d7982000 00000000 00000000 bffff7f8 c0106d1b 0000000b
Call Trace: [<c01180c6>] [<c0106d1b>]

Code: 0f bb 3a 19 c0 85 c0 0f 85 55 ff ff ff 8b 14 24 8b 4c 24 04
 <1>Unable to handle kernel paging request at virtual address 002aad48
 printing eip:
c012b2fe
*pde = 00000000

Entering kdb (current=0xd7fe2000, pid 1) Oops: Oops
due to oops @ 0xc012b2fe
eax = 0xc02c76f8 ebx = 0xc02c7668 ecx = 0xc02c7698 edx = 0x002aa7a4
esi = 0x00016980 edi = 0x00002d30 esp = 0xd7fe3f68 eip = 0xc012b2fe
ebp = 0xc15e6080 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010087
xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd7fe3f34
kdb> bt
    EBP       EIP         Function(args)
0xc15e6080 0xc012b2fe __free_pages_ok+0x16e
                               kernel .text 0xc0100000 0xc012b190 0xc012b380
kdb> btp 1
    EBP       EIP         Function(args)
0xc1040000 0xc012b2fe __free_pages_ok+0x16e
                               kernel .text 0xc0100000 0xc012b190 0xc012b380
kdb> ps
Task Addr  Pid      Parent   [*] cpu  State Thread     Command
0xd7fe2000 00000001 00000000  1  000  stop  0xd7fe2270*init
0xc163c000 00000002 00000001  1  000  stop  0xc163c270 keventd
0xc1638000 00000003 00000000  1  000  stop  0xc1638270 ksoftirqd_CPU0
0xc1636000 00000004 00000000  1  000  stop  0xc1636270 kswapd
0xc1634000 00000005 00000000  1  000  stop  0xc1634270 bdflush
0xc1632000 00000006 00000000  1  000  stop  0xc1632270 kupdated
0xd7ec4000 00000007 00000001  1  000  stop  0xd7ec4270 mdrecoveryd
0xd7eae000 00000008 00000001  1  000  stop  0xd7eae270 raid5d
0xd7b32000 00000009 00000001  1  000  stop  0xd7b32270 kjournald
0xd7838000 00000012 00000001  1  000  run   0xd7838270 initlog
0xd74ba000 00000111 00000001  1  000  stop  0xd74ba270 minilogd
0xd6e54000 00000153 00000001  1  000  stop  0xd6e54270 kjournald
0xd6e48000 00000154 00000001  1  000  stop  0xd6e48270 kjournald
0xd6e40000 00000155 00000001  1  000  stop  0xd6e40270 kjournald
0xd6d22000 00000157 00000001  1  000  stop  0xd6d22270 kreiserfsd
0xd6c5c000 00000158 00000001  1  000  stop  0xd6c5c270 kjournald
0xd6b16000 00000160 00000001  1  000  stop  0xd6b16270 pagebuf_daemon
0xd74da000 00000183 00000001  1  000  run   0xd74da270 rc.sysinit
kdb> id %eip
0xc012b2fe __free_pages_ok+0x16e:       btc    %edi,(%edx)
0xc012b301 __free_pages_ok+0x171:       sbb    %eax,%eax
0xc012b303 __free_pages_ok+0x173:       test   %eax,%eax
0xc012b305 __free_pages_ok+0x175:       jne    0xc012b260 
__free_pages_ok+0xd0: 0xc012b30b __free_pages_ok+0x17b:       mov    
(%esp,1),%edx
0xc012b30e __free_pages_ok+0x17e:       mov    0x4(%esp,1),%ecx
0xc012b312 __free_pages_ok+0x182:       shl    $0x6,%esi
0xc012b315 __free_pages_ok+0x185:       lea    (%edx,%esi,1),%eax
0xc012b318 __free_pages_ok+0x188:       mov    (%ecx),%edx
0xc012b31a __free_pages_ok+0x18a:       mov    %eax,0x4(%edx)
0xc012b31d __free_pages_ok+0x18d:       mov    %edx,(%eax)
0xc012b31f __free_pages_ok+0x18f:       mov    %ecx,0x4(%eax)
0xc012b322 __free_pages_ok+0x192:       mov    %eax,(%ecx)
0xc012b324 __free_pages_ok+0x194:       pushl  0x8(%esp,1)
0xc012b328 __free_pages_ok+0x198:       popf
0xc012b329 __free_pages_ok+0x199:       jmp    0xc012b36c 
__free_pages_ok+0x1dc:kdb> go
Oops: 0002
CPU:    0
EIP:    0010:[<c012b2fe>]    Not tainted
EFLAGS: 00010087
eax: c02c76f8   ebx: c02c7668   ecx: c02c7698   edx: 002aa7a4
esi: 00016980   edi: 00002d30   ebp: c15e6080   esp: d7fe3f68
ds: 0018   es: 0018   ss: 0018
Process init (pid: 1, stackpage=d7fe3000)
Stack: c1040000 c02c7698 00000217 fffffffc d7982000 d7fe2000 0000000a ffffffff
       c01180c6 d7982000 00000000 d7fe2000 00000000 00000000 00000000 d7fe2000
       d7fe20bc d7fe20bc d7fe2000 00000000 bffff52c bffff50c c0106d1b ffffffff
Call Trace: [<c01180c6>] [<c0106d1b>]

Code: 0f bb 3a 19 c0 85 c0 0f 85 55 ff ff ff 8b 14 24 8b 4c 24 04
 <0>Kernel panic: Attempted to kill init!

Entering kdb (current=0xd7fe2000, pid 1) due to panic
kdb> bt
Stack is not in kernel space, backtrace not available
kdb>

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8N+mN8ZJI8OvSkAcRAoKyAJ952XozB1v8dSS8A8k8sdW/4iYDIQCfZjBR
Nizi+BpBBeeAzCty9RSQo5g=
=jW02
-----END PGP SIGNATURE-----
