content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Kernel Oopses after pvmove
Message-ID: <CAFA5F52D998444D86A82CA9BD86956A0A4B69@njex01.gp.cv.commvault.com>
From: "Andrei Erofeev" <aerofeev@commvault.com>
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
Date: Thu Sep 11 13:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Some more info:

# pvmove --version

pvmove: Logical Volume Manager 1.0.6(mp-v6)
Heinz Mauelshagen, Sistina Software  25/10/2002 (IOP 10)

# ksymoops < messages

ksymoops 2.4.8 on i686 2.4.20-4GB.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.20-4GB/ (default)
     -m /boot/System.map-2.4.20-4GB (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Sep 11 10:08:18 oak kernel: Unable to handle kernel NULL pointer
dereference@virtual address 000001ac
Sep 11 10:08:18 oak kernel: c24103de
Sep 11 10:08:18 oak kernel: *pde =3D 00000000
Sep 11 10:08:18 oak kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44
UTC 2003
Sep 11 10:08:18 oak kernel: CPU:    0
Sep 11 10:08:18 oak kernel: EIP:
0010:[mousedev:__insmod_mousedev_O/lib/modules/2.4.20-4GB/kernel/drivers
/i+-75398178/96]    Not tainted
Sep 11 10:08:18 oak kernel: EIP:    0010:[<c24103de>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
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
Sep 11 10:08:18 oak kernel:   [<c01f804f>] [<c011b5f6>] [<c011b5ff>]
[<c0133d77>] [<c01351bc>] [<c01352c4>]
Sep 11 10:08:18 oak kernel:   [<c01350f0>] [<c0130592>] [<c014ea40>]
[<c014f45d>] [<c014523b>] [<c18ce8d1>]
Sep 11 10:08:18 oak kernel:   [<c0145394>] [<c0144304>] [<c0144190>]
[<c0152b15>] [<c014452c>] [<c0108c33>]
Sep 11 10:08:18 oak kernel: Code: 66 8b 80 ac 01 00 00 66 89 44 24 04 8b
44 11 04 89 44 24 08=20


>>EIP; c24103de <[jbd]proc_jbd_debug+a851d2/dc4e54>   <=3D=3D=3D=3D=3D

>>esi; c2710000 <[jbd]proc_jbd_debug+d84df4/dc4e54>

Trace; c01f0309 <reset_pollfunc+59/1b0>
Trace; c24149bc <[jbd]proc_jbd_debug+a897b0/dc4e54>
Trace; c2410bd1 <[jbd]proc_jbd_debug+a859c5/dc4e54>
Trace; c010a287 <enable_irq+57/80>
Trace; c01f7eec <ide_do_request+20c/320>
Trace; c01f804f <do_ide_request+f/20>
Trace; c011b5f6 <do_schedule+156/2b0>
Trace; c011b5ff <do_schedule+15f/2b0>
Trace; c0133d77 <__lock_page+77/90>
Trace; c01351bc <filemap_nopage+cc/200>
Trace; c01352c4 <filemap_nopage+1d4/200>
Trace; c01350f0 <filemap_nopage+0/200>
Trace; c0130592 <do_no_page+b2/370>
Trace; c014ea40 <cached_lookup+10/60>
Trace; c014f45d <link_path_walk+80d/8a0>
Trace; c014523b <get_chrfops+ab/e0>
Trace; c18ce8d1 <[ext3]ext3_permission+11/20>
Trace; c0145394 <chrdev_open+44/50>
Trace; c0144304 <dentry_open+164/1a0>
Trace; c0144190 <filp_open+50/60>
Trace; c0152b15 <sys_ioctl+95/267>
Trace; c014452c <sys_open+5c/90>
Trace; c0108c33 <system_call+33/40>

Code;  c24103de <[jbd]proc_jbd_debug+a851d2/dc4e54>
00000000 <_EIP>:
Code;  c24103de <[jbd]proc_jbd_debug+a851d2/dc4e54>   <=3D=3D=3D=3D=3D
   0:   66 8b 80 ac 01 00 00      mov    0x1ac(%eax),%ax   =
<=3D=3D=3D=3D=3D
Code;  c24103e5 <[jbd]proc_jbd_debug+a851d9/dc4e54>
   7:   66 89 44 24 04            mov    %ax,0x4(%esp,1)
Code;  c24103ea <[jbd]proc_jbd_debug+a851de/dc4e54>
   c:   8b 44 11 04               mov    0x4(%ecx,%edx,1),%eax
Code;  c24103ee <[jbd]proc_jbd_debug+a851e2/dc4e54>
  10:   89 44 24 08               mov    %eax,0x8(%esp,1)


1 warning issued.  Results may not be reliable.
