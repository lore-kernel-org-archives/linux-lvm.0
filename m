Return-Path: <mag@fbab.net>
Message-ID: <000501c06328$48c8e160$020a0a0a@totalmef>
From: "Magnus Naeslund\(f\)" <mag@fbab.net>
References: <20001207223300.D25533@archimedes.oak.suse.com> <323270000.976284597@coffee> <20001208103007.D27307@archimedes.oak.suse.com> <03b601c06155$c25d1b10$070414ac@pin.lu>
Date: Mon, 11 Dec 2000 05:10:23 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] OOPS while doing vgextend
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

LVM 0.9 kernel 2.2.17.

What's up?
I'll disable "show lvm in proc" stuff, because the EIP:
lvm_do_create_proc_entry_of_pv
look a little suspect, man...

Magnus

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 Programmer/Networker [|] Magnus Naeslund
 PGP Key: http://www.genline.nu/mag_pgp.txt
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


Dec 11 04:59:28 gprods1 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000002c
Dec 11 04:59:28 gprods1 kernel: current->tss.cr3 = 1f7e1000, %cr3 = 1f7e1000
Dec 11 04:59:28 gprods1 kernel: *pde = 00000000
Dec 11 04:59:28 gprods1 kernel: Oops: 0000
Dec 11 04:59:28 gprods1 kernel: CPU:    0
Dec 11 04:59:28 gprods1 kernel: EIP:
0010:[lvm_do_create_proc_entry_of_pv+23/100]
Dec 11 04:59:28 gprods1 kernel: EFLAGS: 00010246
Dec 11 04:59:28 gprods1 kernel: eax: 00002f2f   ebx: 00000000   ecx:
de85d400   edx: 00000000
Dec 11 04:59:28 gprods1 kernel: esi: 0000002c   edi: 08071ff8   ebp:
0000002c   esp: ddd97d94
Dec 11 04:59:28 gprods1 kernel: ds: 0018   es: 0018   ss: 0018
Dec 11 04:59:28 gprods1 kernel: Process vgextend (pid: 595, process nr: 21,
stackpage=ddd97000)
Dec 11 04:59:28 gprods1 kernel: Stack: 08071ff8 dffdc000 c01b3fa2 dffdc000
00000000 08071ff8 dffdc000 00000002
Dec 11 04:59:28 gprods1 kernel:        4004fe03 08071ff8 c01b19bb dffdc000
08071ff8 df1d98e0 ffffffe7 08071ff8
Dec 11 04:59:28 gprods1 kernel:        4004fe03 00000000 08071ff8 c01ee5e9
00000001 00000000 00000000 00000000
Dec 11 04:59:28 gprods1 kernel: Call Trace: [lvm_do_vg_extend+78/140]
[lvm_chr_ioctl+671/1696] [number+377/704] [min_sb_len.516+27276/27788]
[lf+47/92] [vsprintf+892/952] [vsprintf+892/952]
Dec 11 04:59:28 gprods1 kernel:        [sprintf+20/5456]
[head_vals.693+682/15960] [sprintf+20/5456] [head_vals.693+683/15960]
[get_partition_list+114/152] [head_vals.693+666/15960]
[do_follow_link+120/132] [lookup_dentry+351/488]
Dec 11 04:59:28 gprods1 kernel:        [get_chrfops+30/36]
[tvecs+10300/13824] [chrdev_open+63/76] [filp_open+256/328]
[sys_ioctl+441/484] [free_pages+41/44] [sys_open+130/172]
[system_call+52/56]
Dec 11 04:59:28 gprods1 kernel: Code: ac 38 e0 75 03 8d 56 ff 84 c0 75 f4 85
d2 75 05 89 ea eb 02
Dec 11 05:02:45 gprods1 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000002c
Dec 11 05:02:45 gprods1 kernel: current->tss.cr3 = 1dde8000, %cr3 = 1dde8000
Dec 11 05:02:45 gprods1 kernel: *pde = 00000000
Dec 11 05:02:45 gprods1 kernel: Oops: 0000
Dec 11 05:02:45 gprods1 kernel: CPU:    1
Dec 11 05:02:45 gprods1 kernel: EIP:
0010:[lvm_do_create_proc_entry_of_pv+23/100]
Dec 11 05:02:45 gprods1 kernel: EFLAGS: 00010246
Dec 11 05:02:45 gprods1 kernel: eax: 00002f2f   ebx: 00000000   ecx:
de85d400   edx: 00000000
Dec 11 05:02:45 gprods1 kernel: esi: 0000002c   edi: 08071ff8   ebp:
0000002c   esp: ddd97d94
Dec 11 05:02:45 gprods1 kernel: ds: 0018   es: 0018   ss: 0018
Dec 11 05:02:45 gprods1 kernel: Process vgextend (pid: 621, process nr: 21,
stackpage=ddd97000)
Dec 11 05:02:45 gprods1 kernel: Stack: 08071ff8 dffdc000 c01b3fa2 dffdc000
00000000 08071ff8 dffdc000 00000002
Dec 11 05:02:45 gprods1 kernel:        4004fe03 08071ff8 c01b19bb dffdc000
08071ff8 ddf806c0 ffffffe7 08071ff8
Dec 11 05:02:45 gprods1 kernel:        4004fe03 00000000 08071ff8 c01ee5e9
00000001 00000000 00000000 00000000
Dec 11 05:02:45 gprods1 kernel: Call Trace: [lvm_do_vg_extend+78/140]
[lvm_chr_ioctl+671/1696] [number+377/704] [min_sb_len.516+27276/27788]
[lf+47/92] [vsprintf+892/952] [vsprintf+892/952]
Dec 11 05:02:45 gprods1 kernel:        [sprintf+20/5456]
[head_vals.693+682/15960] [sprintf+20/5456] [head_vals.693+683/15960]
[get_partition_list+114/152] [head_vals.693+666/15960]
[do_follow_link+120/132] [lookup_dentry+351/488]
Dec 11 05:02:45 gprods1 kernel:        [get_chrfops+30/36]
[tvecs+10300/13824] [chrdev_open+63/76] [filp_open+256/328]
[sys_ioctl+441/484] [free_pages+41/44] [sys_open+130/172]
[system_call+52/56]
Dec 11 05:02:45 gprods1 kernel: Code: ac 38 e0 75 03 8d 56 ff 84 c0 75 f4 85
d2 75 05 89 ea eb 02
Dec 11 05:02:48 gprods1 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000002c
Dec 11 05:02:48 gprods1 kernel: current->tss.cr3 = 1dde8000, %cr3 = 1dde8000
Dec 11 05:02:48 gprods1 kernel: *pde = 00000000
Dec 11 05:02:48 gprods1 kernel: Oops: 0000
Dec 11 05:02:48 gprods1 kernel: CPU:    0
Dec 11 05:02:48 gprods1 kernel: EIP:
0010:[lvm_do_create_proc_entry_of_pv+23/100]
Dec 11 05:02:48 gprods1 kernel: EFLAGS: 00010246
Dec 11 05:02:48 gprods1 kernel: eax: 00002f2f   ebx: 00000000   ecx:
de85d200   edx: 00000000
Dec 11 05:02:48 gprods1 kernel: esi: 0000002c   edi: 08071ff8   ebp:
0000002c   esp: ddd97d94
Dec 11 05:02:48 gprods1 kernel: ds: 0018   es: 0018   ss: 0018
Dec 11 05:02:48 gprods1 kernel: Process vgextend (pid: 622, process nr: 21,
stackpage=ddd97000)
Dec 11 05:02:48 gprods1 kernel: Stack: 08071ff8 dffdc000 c01b3fa2 dffdc000
00000000 08071ff8 dffdc000 00000003
Dec 11 05:02:48 gprods1 kernel:        4004fe03 08071ff8 c01b19bb dffdc000
08071ff8 df1d9560 ffffffe7 08071ff8
Dec 11 05:02:48 gprods1 kernel:        4004fe03 00000000 08071ff8 c01ee5e9
00000001 00000000 00000000 00000000
Dec 11 05:02:48 gprods1 kernel: Call Trace: [lvm_do_vg_extend+78/140]
[lvm_chr_ioctl+671/1696] [number+377/704] [min_sb_len.516+27276/27788]
[lf+47/92] [vsprintf+892/952] [vsprintf+892/952]
Dec 11 05:02:48 gprods1 kernel:        [sprintf+20/5456]
[head_vals.693+682/15960] [sprintf+20/5456] [head_vals.693+683/15960]
[get_partition_list+114/152] [head_vals.693+666/15960]
[do_follow_link+120/132] [lookup_dentry+351/488]
Dec 11 05:02:48 gprods1 kernel:        [get_chrfops+30/36]
[tvecs+10300/13824] [chrdev_open+63/76] [filp_open+256/328]
[sys_ioctl+441/484] [free_pages+41/44] [sys_open+130/172]
[system_call+52/56]
Dec 11 05:02:48 gprods1 kernel: Code: ac 38 e0 75 03 8d 56 ff 84 c0 75 f4 85
d2 75 05 89 ea eb 02
Dec 11 05:02:53 gprods1 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000002c
Dec 11 05:02:53 gprods1 kernel: current->tss.cr3 = 1dde8000, %cr3 = 1dde8000
Dec 11 05:02:53 gprods1 kernel: *pde = 00000000
Dec 11 05:02:53 gprods1 kernel: Oops: 0000
Dec 11 05:02:53 gprods1 kernel: CPU:    0
Dec 11 05:02:53 gprods1 kernel: EIP:
0010:[lvm_do_create_proc_entry_of_pv+23/100]
Dec 11 05:02:53 gprods1 kernel: EFLAGS: 00010246
Dec 11 05:02:53 gprods1 kernel: eax: 00002f2f   ebx: 00000000   ecx:
de85d600   edx: 00000000
Dec 11 05:02:53 gprods1 kernel: esi: 0000002c   edi: 08071ff8   ebp:
0000002c   esp: ddd97d94
Dec 11 05:02:53 gprods1 kernel: ds: 0018   es: 0018   ss: 0018
Dec 11 05:02:53 gprods1 kernel: Process vgextend (pid: 624, process nr: 21,
stackpage=ddd97000)
Dec 11 05:02:53 gprods1 kernel: Stack: 08071ff8 dffdc000 c01b3fa2 dffdc000
00000000 08071ff8 dffdc000 00000004
Dec 11 05:02:53 gprods1 kernel:        4004fe03 08071ff8 c01b19bb dffdc000
08071ff8 df1d96e0 ffffffe7 08071ff8
Dec 11 05:02:53 gprods1 kernel:        4004fe03 00000000 08071ff8 c01ee5e9
00000001 00000000 00000000 00000000
Dec 11 05:02:53 gprods1 kernel: Call Trace: [lvm_do_vg_extend+78/140]
[lvm_chr_ioctl+671/1696] [number+377/704] [min_sb_len.516+27276/27788]
[vsprintf+892/952] [vsprintf+892/952] [sprintf+20/5456]
Dec 11 05:02:53 gprods1 kernel:        [head_vals.693+682/15960]
[sprintf+20/5456] [head_vals.693+683/15960] [get_partition_list+114/152]
[head_vals.693+666/15960] [do_follow_link+120/132] [lookup_dentry+351/488]
[get_chrfops+30/36]
Dec 11 05:02:53 gprods1 kernel:        [tvecs+10300/13824]
[chrdev_open+63/76] [filp_open+256/328] [sys_ioctl+441/484]
[free_pages+41/44] [sys_open+130/172] [system_call+52/56]
Dec 11 05:02:53 gprods1 kernel: Code: ac 38 e0 75 03 8d 56 ff 84 c0 75 f4 85
d2 75 05 89 ea eb 02
Dec 11 05:03:21 gprods1 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000002c
Dec 11 05:03:21 gprods1 kernel: current->tss.cr3 = 1dde8000, %cr3 = 1dde8000
Dec 11 05:03:21 gprods1 kernel: *pde = 00000000
Dec 11 05:03:21 gprods1 kernel: Oops: 0000
Dec 11 05:03:21 gprods1 kernel: CPU:    0
Dec 11 05:03:21 gprods1 kernel: EIP:
0010:[lvm_do_create_proc_entry_of_pv+23/100]
Dec 11 05:03:21 gprods1 kernel: EFLAGS: 00010246
Dec 11 05:03:21 gprods1 kernel: eax: 00002f2f   ebx: 00000000   ecx:
de85d000   edx: 00000000
Dec 11 05:03:21 gprods1 kernel: esi: 0000002c   edi: 08071d80   ebp:
0000002c   esp: ddd97d94
Dec 11 05:03:21 gprods1 kernel: ds: 0018   es: 0018   ss: 0018
Dec 11 05:03:21 gprods1 kernel: Process vgextend (pid: 628, process nr: 21,
stackpage=ddd97000)
Dec 11 05:03:21 gprods1 kernel: Stack: 08071d80 dffdc000 c01b3fa2 dffdc000
00000000 08071d80 dffdc000 00000005
Dec 11 05:03:21 gprods1 kernel:        4004fe03 08071d80 c01b19bb dffdc000
08071d80 df1d9760 ffffffe7 08071d80
Dec 11 05:03:21 gprods1 kernel:        4004fe03 00000000 08071d80 c01ee5e9
00000001 00000000 00000000 00000000
Dec 11 05:03:21 gprods1 kernel: Call Trace: [lvm_do_vg_extend+78/140]
[lvm_chr_ioctl+671/1696] [number+377/704] [min_sb_len.516+27276/27788]
[lf+47/92] [vsprintf+892/952] [vsprintf+892/952]
Dec 11 05:03:21 gprods1 kernel:        [sprintf+20/5456]
[head_vals.693+682/15960] [sprintf+20/5456] [head_vals.693+683/15960]
[get_partition_list+114/152] [head_vals.693+666/15960]
[do_follow_link+120/132] [lookup_dentry+351/488]
Dec 11 05:03:21 gprods1 kernel:        [get_chrfops+30/36]
[tvecs+10300/13824] [chrdev_open+63/76] [filp_open+256/328]
[sys_ioctl+441/484] [free_pages+41/44] [sys_open+130/172]
[system_call+52/56]
Dec 11 05:03:21 gprods1 kernel: Code: ac 38 e0 75 03 8d 56 ff 84 c0 75 f4 85
d2 75 05 89 ea eb 02
Dec 11 05:05:14 gprods1 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000002c
Dec 11 05:05:14 gprods1 kernel: current->tss.cr3 = 1dde8000, %cr3 = 1dde8000
Dec 11 05:05:14 gprods1 kernel: *pde = 00000000
Dec 11 05:05:14 gprods1 kernel: Oops: 0000
Dec 11 05:05:14 gprods1 kernel: CPU:    0
Dec 11 05:05:14 gprods1 kernel: EIP:
0010:[lvm_do_create_proc_entry_of_pv+23/100]
Dec 11 05:05:14 gprods1 kernel: EFLAGS: 00010246
Dec 11 05:05:14 gprods1 kernel: eax: 00002f2f   ebx: 00000000   ecx:
ddbc7e00   edx: 00000000
Dec 11 05:05:14 gprods1 kernel: esi: 0000002c   edi: 08071ff8   ebp:
0000002c   esp: ddd97d94
Dec 11 05:05:14 gprods1 kernel: ds: 0018   es: 0018   ss: 0018
Dec 11 05:05:14 gprods1 kernel: Process vgextend (pid: 638, process nr: 21,
stackpage=ddd97000)
Dec 11 05:05:14 gprods1 kernel: Stack: 08071ff8 dffdc000 c01b3fa2 dffdc000
00000000 08071ff8 dffdc000 00000006
Dec 11 05:05:14 gprods1 kernel:        4004fe03 08071ff8 c01b19bb dffdc000
08071ff8 df1d97e0 ffffffe7 08071ff8
Dec 11 05:05:14 gprods1 kernel:        4004fe03 00000000 08071ff8 c01ee5e9
00000001 00000000 00000000 00000000
Dec 11 05:05:14 gprods1 kernel: Call Trace: [lvm_do_vg_extend+78/140]
[lvm_chr_ioctl+671/1696] [number+377/704] [min_sb_len.516+27276/27788]
[lf+47/92] [vsprintf+892/952] [vsprintf+892/952]
Dec 11 05:05:14 gprods1 kernel:        [sprintf+20/5456]
[head_vals.693+682/15960] [sprintf+20/5456] [head_vals.693+683/15960]
[get_partition_list+114/152] [head_vals.693+666/15960]
[do_follow_link+120/132] [lookup_dentry+351/488]
Dec 11 05:05:14 gprods1 kernel:        [get_chrfops+30/36]
[tvecs+10300/13824] [chrdev_open+63/76] [filp_open+256/328]
[sys_ioctl+441/484] [free_pages+41/44] [sys_open+130/172]
[system_call+52/56]
Dec 11 05:05:14 gprods1 kernel: Code: ac 38 e0 75 03 8d 56 ff 84 c0 75 f4 85
d2 75 05 89 ea eb 02
