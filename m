Return-Path: <frodet@nvg.org>
From: Frode =?iso-8859-1?q?Tenneb=F8?= <frodet@nvg.org>
Date: Wed, 1 Aug 2001 23:24:05 +0200
MIME-Version: 1.0
Message-Id: <01080123240507.01440@leia>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Kernel Oops
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I have tested SGI's linux-2.4-xfs in it's 2.4.7 incarnation. Compilled=20
with gcc-2.96-81 on a Dell Latitude CPt400 with an Adaptec 1460A PCMCIA=20
SCSI adapter.

I can do whatever I want until I mount an LVM volume. After some time=20
or immediately it will panic with a dump like this:


Aug  1 18:57:26 localhost kernel: Unable to handle kernel paging=20
request at virtual address c489c4f0
Aug  1 18:57:26 localhost kernel:  printing eip:
Aug  1 18:57:26 localhost kernel: c489c4f0
Aug  1 18:57:26 localhost kernel: *pde =3D 03bd1067
Aug  1 18:57:26 localhost kernel: *pte =3D 00000000
Aug  1 18:57:26 localhost kernel: Oops: 0000
Aug  1 18:57:26 localhost kernel: CPU:    0
Aug  1 18:57:26 localhost kernel: EIP:   =20
0010:[fat:__insmod_fat_S.bss_L2264+450160/60315488]
Aug  1 18:57:26 localhost kernel: EIP:    0010:[<c489c4f0>]
Aug  1 18:57:26 localhost kernel: EFLAGS: 00010086
Aug  1 18:57:26 localhost kernel: eax: c0331c20   ebx: 00000202   ecx:=20
00000801   edx: c489c4f0
Aug  1 18:57:26 localhost kernel: esi: c250f620   edi: 00000002   ebp:=20
00073000   esp: c1913c98
Aug  1 18:57:26 localhost kernel: ds: 0018   es: 0018   ss: 0018
Aug  1 18:57:26 localhost kernel: Process mount (pid: 19930,=20
stackpage=3Dc1913000)
Aug  1 18:57:26 localhost kernel: Stack: c01e6d2a 00000801 00000001=20
c01e7ada 00000801 c10e6c84 00000000 c02c5cb4
Aug  1 18:57:26 localhost kernel:        c02c5e20 c250f620 00000001=20
00000000 00000000 c01e7b94 00000000 c250f620
Aug  1 18:57:26 localhost kernel:        c250f620 c250f620 00000000=20
c01e7df7 00000000 c250f620 c0133ae3 c1912000
Aug  1 18:57:27 localhost kernel: Call Trace: [blk_get_queue+42/48]=20
[generic_make_request+186/288] [submit_bh+84/112] [ll_rw_block+583/672]=20
[getblk+211/256] [block_read+722/1184] [do_ide_request+15/32]
Aug  1 18:57:27 localhost kernel: Call Trace: [<c01e6d2a>] [<c01e7ada>]=20
[<c01e7b94>] [<c01e7df7>] [<c0133ae3>] [<c0138aa2>] [<c01f498f>]
Aug  1 18:57:27 localhost kernel:        [__alloc_pages+116/624]=20
[do_anonymous_page+58/272] [do_no_page+48/192]=20
[filemap_nopage+185/1264] [filemap_nopage+185/1264] [do_no_page+77/192]=20
[handle_mm_fault+97/208] [__alloc_pages+116/624]
Aug  1 18:57:27 localhost kernel:        [<c012bb84>] [<c012189a>]=20
[<c01219a0>] [<c0124c49>] [<c0124c49>] [<c01219bd>] [<c0121a91>]=20
[<c012bb84>]
Aug  1 18:57:27 localhost kernel:        [do_anonymous_page+58/272]=20
[cached_lookup+16/80] [path_walk+1788/2016] [file_read_actor+115/240]=20
[cached_lookup+16/80] [blkdev_open+71/128] [dentry_open+195/320]=20
[sys_read+150/208]
Aug  1 18:57:27 localhost kernel:        [<c012189a>] [<c013bf60>]=20
[<c013c86c>] [<c0124643>] [<c013bf60>] [<c01392a7>] [<c01316a3>]=20
[<c0131cc6>]
Aug  1 18:57:27 localhost kernel:        [sys_llseek+201/224]=20
[system_call+51/56]
Aug  1 18:57:27 localhost kernel:        [<c0131c19>] [<c0106ecb>]
Aug  1 18:57:27 localhost kernel:
Aug  1 18:57:27 localhost kernel: Code:  Bad EIP value.

This also happens with 2.4.8-pre3-xfs. I'm not sure if this is a LVM=20
issue, a general kernel issue or an SGi/XFS issue, but I thought I'd=20
bring it up here before I talked to the XFS guys as this is directly=20
related to LVM (#define LVM_RELEASE_NAME "0.9.1_beta6" - perhaps a=20
known problem?)

Regards,
 -Frode
--=20
^ Frode Tenneb=F8 | email: frodet@nvg.org | Frode@IRC  ^
| with Standard.Disclaimer; use Standard.Disclaimer; |
