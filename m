From: "Michael Guntsche" <mike@it-loops.com>
Message-ID: <PEEBJNAMMHDNIAMOGHHGAEFPCAAA.mike@it-loops.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] DevFS + LVM, problems with PVs
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
Date: Wed Nov 28 01:29:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello List,

Testing LVM with 2 spare partitions on one of my harddrives I found the
following problem with DEVFS + LVM.
If I make a VG inactive (vgchange -an) the partitions associated with it
become unavailable. I can still see them in /dev/ide/../part3 but trying to
access them gives a kernel OOPS (see below). It looks like the LVM does
something nasty to the devfs structure.
I tried it with several different kernels and devfs version, the result was
the same every time.
After much compiling and rebooting I pinpointed the problem down to the
PATCHES archive. If I use a non-patched LVM from the kernel everything
works.
I looked at the patch but didn't find a reference to devfs or similar
changes that might explain that behaviour.
I put the patch on http://mike.it-loops.com/lvm/lvm-1.0.1-2.4.16.patch.gz
if someone wants to take a look at it.
BTW, a non devfs-kernel works with the patch just fine.

I hope I gave all the relevant information, if someone needs more I'd be
glad to provide it.

Kind regards,
Michael Guntsche


________OOPS_________
ksymoops 2.4.3 on i686 2.4.16.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.16/ (default)
     -m /boot/System.map (specified)

Nov 27 18:19:41 deepblue kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000018
Nov 27 18:19:41 deepblue kernel: c0152f46
Nov 27 18:19:41 deepblue kernel: *pde = 00000000
Nov 27 18:19:41 deepblue kernel: Oops: 0002
Nov 27 18:19:41 deepblue kernel: CPU:    0
Nov 27 18:19:41 deepblue kernel: EIP:    0010:[devfs_open+118/352]    Not
tainted
Nov 27 18:19:41 deepblue kernel: EFLAGS: 00010282
Nov 27 18:19:41 deepblue kernel: eax: 00000000   ebx: cff5d8c0   ecx:
cd7b29c0   edx: c01efd20
Nov 27 18:19:41 deepblue kernel: esi: cfc5b480   edi: cff5d8c8   ebp:
cd7b29c0   esp: cd675f40
Nov 27 18:19:41 deepblue kernel: ds: 0018   es: 0018   ss: 0018
Nov 27 18:19:41 deepblue kernel: Process vgchange (pid: 620,
stackpage=cd675000)
Nov 27 18:19:41 deepblue kernel: Stack: cd7b29c0 cfc5b480 ffffffe9 cffe93c0
c01e7020 c012f081 cfc5b480 cd7b29c0
Nov 27 18:19:41 deepblue kernel:        0804d554 cff4c000 00000000 bffff4fc
c012ef92 cfc5f8c0 cffe93c0 00000000
Nov 27 18:19:41 deepblue kernel:        00000004 cff4c000 0804d554 cfc5f8c0
cffe93c0 0804d554 bffff4fc 00000000
Nov 27 18:19:41 deepblue kernel: Call Trace: [dentry_open+225/400]
[filp_open+82/96] [sys_open+54/160] [system_call+51/56]
Nov 27 18:19:41 deepblue kernel: Code: 89 50 18 eb 2b 90 8d 74 26 00 8b 43
08 85 c0 74 1a 8b 00 85
Using defaults from ksymoops -t elf32-i386 -a i386

Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   89 50 18                  mov    %edx,0x18(%eax)
Code;  00000002 Before first symbol
   3:   eb 2b                     jmp    30 <_EIP+0x30> 00000030 Before
first symbol
Code;  00000004 Before first symbol
   5:   90                        nop
Code;  00000006 Before first symbol
   6:   8d 74 26 00               lea    0x0(%esi,1),%esi
Code;  0000000a Before first symbol
   a:   8b 43 08                  mov    0x8(%ebx),%eax
Code;  0000000c Before first symbol
   d:   85 c0                     test   %eax,%eax
Code;  0000000e Before first symbol
   f:   74 1a                     je     2b <_EIP+0x2b> 0000002a Before
first symbol
Code;  00000010 Before first symbol
  11:   8b 00                     mov    (%eax),%eax
Code;  00000012 Before first symbol
  13:   85 00                     test   %eax,(%eax)
________________
