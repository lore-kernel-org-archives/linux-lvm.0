content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <CAFA5F52D998444D86A82CA9BD86956A01D895@njex01.gp.cv.commvault.com>
From: "Andrei Erofeev" <aerofeev@commvault.com>
Subject: [linux-lvm] Kernel Oopses after pvmove
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
Date: Thu Sep 11 10:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I've been trying to free one PE on a stock SuSE 8.2 system. The "pvmove
-v /dev/hda10" completed successfully, and moved around 400 extends just
fine.

However, right after this the "vgdisplay -v" started coredumping, many
programs froze, and a bunch of Oopses was printed to /var/log/messages.
I basically couldn't do anything until I rebooted the machine.

The root file system was not on LVM, however I was running pvmove "on
the fly", i.e. w/o unmounting the logical volumes.

Is this something known?

- Andrei


Linux oak 2.4.20-4GB #1 Mon Mar 17 17:54:44 UTC 2003 i686 unknown
unknown GNU/Linux

--- /var/log/messages begins ---

Sep 11 10:01:10 oak su: (to root) aerofeev on /dev/pts/28
Sep 11 10:01:10 oak su: pam_unix2: session started for user root,
service su=20
Sep 11 10:08:18 oak kernel: Unable to handle kernel NULL pointer
dereference at virtual address 000001ac
Sep 11 10:08:18 oak kernel:  printing eip:
Sep 11 10:08:18 oak kernel: c24103de
Sep 11 10:08:18 oak kernel: *pde =3D 00000000
Sep 11 10:08:18 oak kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44
UTC 2003
Sep 11 10:08:18 oak kernel: CPU:    0
Sep 11 10:08:18 oak kernel: EIP:
0010:[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers
/i+-75398178/96]    Not tainted
Sep 11 10:08:18 oak kernel: EIP:    0010:[<c24103de>]    Not tainted
Sep 11 10:08:18 oak kernel: EFLAGS: 00010216
Sep 11 10:08:18 oak kernel: eax: 00000000   ebx: 08052ae0   ecx:
d0c24000   edx: 00000300
Sep 11 10:08:18 oak kernel: esi: c2710000   edi: 08052ae0   ebp:
cb0b2000   esp: cb0b3d4c
Sep 11 10:08:18 oak kernel: ds: 0018   es: 0018   ss: 0018
Sep 11 10:08:18 oak kernel: Process vgdisplay (pid: 16506,
stackpage=3Dcb0b3000)
Sep 11 10:08:18 oak kernel: Stack: 00000030 c01f0309 00660180 00000000
00000000 c18fb800 c18fb99c 400581fc=20
Sep 11 10:08:18 oak kernel:        cb0b3d8c c24149bc c2710000 c18fb800
080527e0 00000000 000001f7 00000000=20
Sep 11 10:08:18 oak kernel:        080527e0 00000001 40058060 00000000
c03ac0b0 c004fe27 c004fe27 ffffffe7=20
Sep 11 10:08:18 oak kernel: Call Trace:    [reset_pollfunc+89/432]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5380292/96]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5396143/96] [enable_irq+87/128] [ide_do_request+524/800]
Sep 11 10:08:18 oak kernel: Call Trace:    [<c01f0309>] [<c24149bc>]
[<c2410bd1>] [<c010a287>] [<c01f7eec>]
Sep 11 10:08:18 oak kernel:   [do_ide_request+15/32]
[do_schedule+342/688] [do_schedule+351/688] [__lock_page+119/144]
[filemap_nopage+204/512] [filemap_nopage+468/512]
Sep 11 10:08:18 oak kernel:   [<c01f804f>] [<c011b5f6>] [<c011b5ff>]
[<c0133d77>] [<c01351bc>] [<c01352c4>]
Sep 11 10:08:18 oak kernel:   [filemap_nopage+0/512]
[do_no_page+178/880] [cached_lookup+16/96] [link_path_walk+2061/2208]
[get_chrfops+171/224]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-8
7201583/96]
Sep 11 10:08:18 oak kernel:   [<c01350f0>] [<c0130592>] [<c014ea40>]
[<c014f45d>] [<c014523b>] [<c18ce8d1>]
Sep 11 10:08:18 oak kernel:   [chrdev_open+68/80] [dentry_open+356/416]
[filp_open+80/96] [sys_ioctl+149/615] [sys_open+92/144]
[system_call+51/64]
Sep 11 10:08:18 oak kernel:   [<c0145394>] [<c0144304>] [<c0144190>]
[<c0152b15>] [<c014452c>] [<c0108c33>]
Sep 11 10:08:18 oak kernel: Modules: [(lvm-mod:<c2410060>:<c241ff84>)]
[(ext3:<c18c0060>:<c18d2de8>)]
Sep 11 10:08:18 oak kernel: Code: 66 8b 80 ac 01 00 00 66 89 44 24 04 8b
44 11 04 89 44 24 08=20
Sep 11 10:08:35 oak kernel:  <1>Unable to handle kernel NULL pointer
dereference at virtual address 000001ac
Sep 11 10:08:35 oak kernel:  printing eip:
Sep 11 10:08:35 oak kernel: c24103de
Sep 11 10:08:35 oak kernel: *pde =3D 00000000
Sep 11 10:08:35 oak kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44
UTC 2003
Sep 11 10:08:35 oak kernel: CPU:    0
Sep 11 10:08:35 oak kernel: EIP:
0010:[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers
/i+-75398178/96]    Not tainted
Sep 11 10:08:35 oak kernel: EIP:    0010:[<c24103de>]    Not tainted
Sep 11 10:08:35 oak kernel: EFLAGS: 00010216
Sep 11 10:08:35 oak kernel: eax: 00000000   ebx: 08052ae0   ecx:
d0c24000   edx: 00000300
Sep 11 10:08:35 oak kernel: esi: c2710000   edi: 08052ae0   ebp:
c5158000   esp: c5159d4c
Sep 11 10:08:35 oak kernel: ds: 0018   es: 0018   ss: 0018
Sep 11 10:08:35 oak kernel: Process vgdisplay (pid: 16526,
stackpage=3Dc5159000)
Sep 11 10:08:35 oak kernel: Stack: 00000030 00000309 00660180 00000000
00000000 c18fb800 c18fb99c 400581fc=20
Sep 11 10:08:35 oak kernel:        c5159d8c c24149bc c2710000 c18fb800
080527e0 00000000 c2401436 00000000=20
Sep 11 10:08:35 oak kernel:        080527e0 00000001 40058060 00000000
c2710000 c004fe27 c004fe27 ffffffe7=20
Sep 11 10:08:35 oak kernel: Call Trace:
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5380292/96]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5396143/96] [copy_files+216/672] [__mmdrop+49/73] [sys_wait4+398/960]
Sep 11 10:08:35 oak kernel: Call Trace:    [<c24149bc>] [<c2410bd1>]
[<c011d4a8>] [<c011deb1>] [<c0121b5e>]
Sep 11 10:08:35 oak kernel:   [do_schedule+351/688] [reschedule+5/16]
[activate_page+140/160] [mark_page_accessed+39/48]
[filemap_nopage+468/512] [filemap_nopage+0/512]
Sep 11 10:08:35 oak kernel:   [<c011b5ff>] [<c0108cf5>] [<c013b61c>]
[<c01341f7>] [<c01352c4>] [<c01350f0>]
Sep 11 10:08:35 oak kernel:   [do_no_page+178/880] [cached_lookup+16/96]
[link_path_walk+2061/2208] [get_chrfops+171/224]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-8
7201583/96] [chrdev_open+68/80]
Sep 11 10:08:35 oak kernel:   [<c0130592>] [<c014ea40>] [<c014f45d>]
[<c014523b>] [<c18ce8d1>] [<c0145394>]
Sep 11 10:08:35 oak kernel:   [dentry_open+356/416] [filp_open+80/96]
[sys_ioctl+149/615] [sys_open+92/144] [system_call+51/64]
Sep 11 10:08:35 oak kernel:   [<c0144304>] [<c0144190>] [<c0152b15>]
[<c014452c>] [<c0108c33>]
Sep 11 10:08:35 oak kernel: Modules: [(lvm-mod:<c2410060>:<c241ff84>)]
[(ext3:<c18c0060>:<c18d2de8>)]
Sep 11 10:08:35 oak kernel: Code: 66 8b 80 ac 01 00 00 66 89 44 24 04 8b
44 11 04 89 44 24 08=20
Sep 11 10:08:43 oak kernel:  <1>Unable to handle kernel NULL pointer
dereference at virtual address 000001ac
Sep 11 10:08:43 oak kernel:  printing eip:
Sep 11 10:08:43 oak kernel: c24103de
Sep 11 10:08:43 oak kernel: *pde =3D 00000000
Sep 11 10:08:43 oak kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44
UTC 2003
Sep 11 10:08:43 oak kernel: CPU:    0
Sep 11 10:08:43 oak kernel: EIP:
0010:[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers
/i+-75398178/96]    Not tainted
Sep 11 10:08:43 oak kernel: EIP:    0010:[<c24103de>]    Not tainted
Sep 11 10:08:43 oak kernel: EFLAGS: 00010216
Sep 11 10:08:43 oak kernel: eax: 00000000   ebx: 08052ae0   ecx:
d0c24000   edx: 00000300
Sep 11 10:08:43 oak kernel: esi: c2710000   edi: 08052ae0   ebp:
ce9dc000   esp: ce9ddd4c
Sep 11 10:08:43 oak kernel: ds: 0018   es: 0018   ss: 0018
Sep 11 10:08:43 oak kernel: Process vgdisplay (pid: 16543,
stackpage=3Dce9dd000)
Sep 11 10:08:43 oak kernel: Stack: 00000030 00000309 00660180 00000000
00000000 c18fb800 c18fb99c 400581fc=20
Sep 11 10:08:43 oak kernel:        ce9ddd8c c24149bc c2710000 c18fb800
080527e0 00000000 c2401436 00000000=20
Sep 11 10:08:43 oak kernel:        080527e0 00000001 40058060 00000000
c2710000 c004fe27 c004fe27 ffffffe7=20
Sep 11 10:08:43 oak kernel: Call Trace:
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5380292/96]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5396143/96] [copy_files+216/672] [__mmdrop+49/73] [sys_wait4+398/960]
Sep 11 10:08:43 oak kernel: Call Trace:    [<c24149bc>] [<c2410bd1>]
[<c011d4a8>] [<c011deb1>] [<c0121b5e>]
Sep 11 10:08:43 oak kernel:   [do_schedule+351/688] [reschedule+5/16]
[exec_modprobe+0/144] [filemap_nopage+204/512] [filemap_nopage+468/512]
[filemap_nopage+0/512]
Sep 11 10:08:43 oak kernel:   [<c011b5ff>] [<c0108cf5>] [<c012a800>]
[<c01351bc>] [<c01352c4>] [<c01350f0>]
Sep 11 10:08:43 oak kernel:   [do_no_page+178/880] [cached_lookup+16/96]
[link_path_walk+2061/2208] [get_chrfops+171/224]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-8
7201583/96] [chrdev_open+68/80]
Sep 11 10:08:43 oak kernel:   [<c0130592>] [<c014ea40>] [<c014f45d>]
[<c014523b>] [<c18ce8d1>] [<c0145394>]
Sep 11 10:08:43 oak kernel:   [dentry_open+356/416] [filp_open+80/96]
[sys_ioctl+149/615] [sys_open+92/144] [system_call+51/64]
Sep 11 10:08:43 oak kernel:   [<c0144304>] [<c0144190>] [<c0152b15>]
[<c014452c>] [<c0108c33>]
Sep 11 10:08:43 oak kernel: Modules: [(lvm-mod:<c2410060>:<c241ff84>)]
[(ext3:<c18c0060>:<c18d2de8>)]
Sep 11 10:08:43 oak kernel: Code: 66 8b 80 ac 01 00 00 66 89 44 24 04 8b
44 11 04 89 44 24 08=20
Sep 11 10:08:58 oak kernel:  <1>Unable to handle kernel NULL pointer
dereference at virtual address 000001ac
Sep 11 10:08:58 oak kernel:  printing eip:
Sep 11 10:08:58 oak kernel: c24103de
Sep 11 10:08:58 oak kernel: *pde =3D 00000000
Sep 11 10:08:58 oak kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44
UTC 2003
Sep 11 10:08:58 oak kernel: CPU:    0
Sep 11 10:08:58 oak kernel: EIP:
0010:[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers
/i+-75398178/96]    Not tainted
Sep 11 10:08:58 oak kernel: EIP:    0010:[<c24103de>]    Not tainted
Sep 11 10:08:58 oak kernel: EFLAGS: 00010216
Sep 11 10:08:58 oak kernel: eax: 00000000   ebx: 08052ae0   ecx:
d0c24000   edx: 00000300
Sep 11 10:08:58 oak kernel: esi: c2710000   edi: 08052ae0   ebp:
ce9dc000   esp: ce9ddd4c
Sep 11 10:08:58 oak kernel: ds: 0018   es: 0018   ss: 0018
Sep 11 10:08:58 oak kernel: Process vgdisplay (pid: 16563,
stackpage=3Dce9dd000)
Sep 11 10:08:58 oak kernel: Stack: 00000030 00000309 00660180 00000000
00000000 c18fb800 c18fb99c 400581fc=20
Sep 11 10:08:58 oak kernel:        ce9ddd8c c24149bc c2710000 c18fb800
080527e0 00000000 c1de1978 00000000=20
Sep 11 10:08:58 oak kernel:        080527e0 00000001 40058060 00000000
c2710000 c004fe27 c004fe27 ffffffe7=20
Sep 11 10:08:58 oak kernel: Call Trace:
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5380292/96]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5396143/96] [n_tty_receive_buf+507/1216] [n_tty_receive_buf+333/1216]
[bh_action+34/64]
Sep 11 10:08:58 oak kernel: Call Trace:    [<c24149bc>] [<c2410bd1>]
[<c01b82fb>] [<c01b824d>] [<c0122db2>]
Sep 11 10:08:58 oak kernel:   [tasklet_hi_action+57/112]
[do_softirq+95/176] [pty_write+293/336] [opost_block+103/384]
[pty_write+293/336] [tty_default_put_char+26/32]
Sep 11 10:08:58 oak kernel:   [<c0122cb9>] [<c0122aaf>] [<c01bb495>]
[<c01b7ae7>] [<c01bb495>] [<c01b74ea>]
Sep 11 10:08:58 oak kernel:   [cached_lookup+16/96]
[link_path_walk+2061/2208] [get_chrfops+171/224]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-8
7201583/96] [chrdev_open+68/80] [dentry_open+356/416]
Sep 11 10:08:58 oak kernel:   [<c014ea40>] [<c014f45d>] [<c014523b>]
[<c18ce8d1>] [<c0145394>] [<c0144304>]
Sep 11 10:08:58 oak kernel:   [filp_open+80/96] [sys_ioctl+149/615]
[sys_open+92/144] [system_call+51/64]
Sep 11 10:08:58 oak kernel:   [<c0144190>] [<c0152b15>] [<c014452c>]
[<c0108c33>]
Sep 11 10:08:58 oak kernel: Modules: [(lvm-mod:<c2410060>:<c241ff84>)]
[(ext3:<c18c0060>:<c18d2de8>)]
Sep 11 10:08:58 oak kernel: Code: 66 8b 80 ac 01 00 00 66 89 44 24 04 8b
44 11 04 89 44 24 08=20
Sep 11 10:09:28 oak kernel:  <1>Unable to handle kernel NULL pointer
dereference at virtual address 000001ac
Sep 11 10:09:28 oak kernel:  printing eip:
Sep 11 10:09:28 oak kernel: c2411bbe
Sep 11 10:09:28 oak kernel: *pde =3D 00000000
Sep 11 10:09:28 oak kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44
UTC 2003
Sep 11 10:09:28 oak kernel: CPU:    0
Sep 11 10:09:28 oak kernel: EIP:
0010:[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers
/i+-75392066/96]    Not tainted
Sep 11 10:09:28 oak kernel: EIP:    0010:[<c2411bbe>]    Not tainted
Sep 11 10:09:28 oak kernel: EFLAGS: 00010202
Sep 11 10:09:28 oak kernel: eax: 00000000   ebx: 004c12a0   ecx:
c2710000   edx: c18fbc00
Sep 11 10:09:28 oak kernel: esi: 00000002   edi: 00000008   ebp:
00000001   esp: ce41fd88
Sep 11 10:09:28 oak kernel: ds: 0018   es: 0018   ss: 0018
Sep 11 10:09:28 oak kernel: Process bash (pid: 16584,
stackpage=3Dce41f000)
Sep 11 10:09:28 oak kernel: Stack: c84fb440 00000001 c84fb080 c18fbd70
c18fbc00 c2710000 00a9c180 00000260=20
Sep 11 10:09:28 oak kernel:        00000003 ce41fdc0 ce41fdbc 00000001
00a9d420 cb656740 00300000 00000008=20
Sep 11 10:09:28 oak kernel:        00000000 c241203f cb656740 00000000
c01d2156 c039f360 00000000 cb656740=20
Sep 11 10:09:28 oak kernel: Call Trace:
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5390913/96] [generic_make_request+198/320] [__submit_bh+78/208]
[block_read_full_page+651/736] [do_schedule+351/688]
Sep 11 10:09:28 oak kernel: Call Trace:    [<c241203f>] [<c01d2156>]
[<c01d221e>] [<c01478db>] [<c011b5ff>]
Sep 11 10:09:28 oak kernel:   [lru_cache_add+88/112]
[ext2_readpage+15/32] [ext2_get_block+0/1008] [read_cache_page+173/336]
[ext2_get_page+31/224] [ext2_readpage+0/32]
Sep 11 10:09:28 oak kernel:   [<c013b688>] [<c017069f>] [<c0170280>]
[<c01362bd>] [<c016e4ef>] [<c0170690>]
Sep 11 10:09:28 oak kernel:   [ext2_find_entry+128/400]
[ext2_inode_by_name+22/112] [ext2_lookup+39/144] [real_lookup+154/192]
[link_path_walk+1268/2208] [getname+74/176]
Sep 11 10:09:28 oak kernel:   [<c016e8a0>] [<c016ea06>] [<c0171847>]
[<c014eb2a>] [<c014f144>] [<c014e80a>]
Sep 11 10:09:28 oak kernel:   [path_lookup+33/48] [__user_walk+42/80]
[sys_stat64+23/112] [system_call+51/64]
Sep 11 10:09:28 oak kernel:   [<c014f7a1>] [<c014f9da>] [<c014c277>]
[<c0108c33>]
Sep 11 10:09:28 oak kernel: Modules: [(lvm-mod:<c2410060>:<c241ff84>)]
Sep 11 10:09:28 oak kernel: Code: 66 8b 90 ac 01 00 00 66 89 54 24 2e 83
7c 24 4c 01 0f 85 c7=20
Sep 11 10:09:45 oak kernel:  <1>Unable to handle kernel NULL pointer
dereference at virtual address 000001ac
Sep 11 10:09:45 oak kernel:  printing eip:
Sep 11 10:09:45 oak kernel: c2411bbe
Sep 11 10:09:45 oak kernel: *pde =3D 00000000
Sep 11 10:09:45 oak kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44
UTC 2003
Sep 11 10:09:45 oak kernel: CPU:    0
Sep 11 10:09:45 oak kernel: EIP:
0010:[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers
/i+-75392066/96]    Not tainted
Sep 11 10:09:45 oak kernel: EIP:    0010:[<c2411bbe>]    Not tainted
Sep 11 10:09:45 oak kernel: EFLAGS: 00010206
Sep 11 10:09:45 oak kernel: eax: 00000000   ebx: 000a1db0   ecx:
c2710000   edx: c18fba00
Sep 11 10:09:45 oak kernel: esi: 00000002   edi: 00000008   ebp:
00000001   esp: ccdcbe30
Sep 11 10:09:45 oak kernel: ds: 0018   es: 0018   ss: 0018
Sep 11 10:09:45 oak kernel: Process Eterm (pid: 16586,
stackpage=3Dccdcb000)
Sep 11 10:09:45 oak kernel: Stack: ccdcbe40 ccdcbf02 00000001 c18fbb70
c18fba00 c2710000 0007c180 00000050=20
Sep 11 10:09:45 oak kernel:        00000002 00003a02 c01468ef 00003a02
0007df30 c2dc5f20 00300000 00000008=20
Sep 11 10:09:45 oak kernel:        00000000 c241203f c2dc5f20 00000000
c01d2156 c039f360 00000000 c2dc5f20=20
Sep 11 10:09:45 oak kernel: Call Trace:    [getblk+47/160]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-7
5390913/96] [generic_make_request+198/320] [__submit_bh+78/208]
[block_read_full_page+651/736]
Sep 11 10:09:45 oak kernel: Call Trace:    [<c01468ef>] [<c241203f>]
[<c01d2156>] [<c01d221e>] [<c01478db>]
Sep 11 10:09:45 oak kernel:
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-8
7240945/96]
[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers/i+-8
7244336/96] [__do_generic_file_read+497/1264] [file_read_actor+0/240]
[generic_file_read+261/304] [file_read_actor+0/240]
Sep 11 10:09:45 oak kernel:   [<c18c4f0f>] [<c18c41d0>] [<c01343f1>]
[<c0134910>] [<c0134b05>] [<c0134910>]
Sep 11 10:09:45 oak kernel:   [sys_read+120/256] [system_call+51/64]
Sep 11 10:09:45 oak kernel:   [<c0144a18>] [<c0108c33>]
Sep 11 10:09:45 oak kernel: Modules: [(lvm-mod:<c2410060>:<c241ff84>)]
[(ext3:<c18c0060>:<c18d2de8>)]
Sep 11 10:09:45 oak kernel: Code: 66 8b 90 ac 01 00 00 66 89 54 24 2e 83
7c 24 4c 01 0f 85 c7=20
Sep 11 10:12:28 oak init: Switching to runlevel: 6

--- /var/log/messages ends ---
