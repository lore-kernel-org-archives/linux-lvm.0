Message-ID: <3E1F0FF2.9030005@email.arizona.edu>
From: Gary Windham <windhamg@email.arizona.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 snapshot creation problem
References: <3E1CB9E4.1030704@email.arizona.edu>
In-Reply-To: <3E1CB9E4.1030704@email.arizona.edu>
Content-Transfer-Encoding: 7bit
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
Date: Fri Jan 10 12:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Gary Windham wrote:
> I am testing LVM2 under the 2.4.20 (vanilla) kernel running on RedHat 
> 8.0.  I'm Using device-mapper0.96.07 and the userspace tools 
> LVM2.1.95.13 packages.  I applied the device-mapper kernel patches 
> located at 
> http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/2.4.20-dm-2.tar.bz2. 
> 
> 
> My problem is that I have not been able to create LV snapshots under 
> LVM2.  Here's an example (command and output follow):

[snip]

Thanks to Alasdair and Joe--his latest 2.4.20 patches 
(http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/2.4.20-dm-4.tar.bz2) 
fixed the problem.  But I have a different problem now, which I believe 
to be related to highmem.  In fact, I believe it to be the same issue 
encountered by Gregory Ade w/ LVM1 last year (e.g., 
http://lists.sistina.com/pipermail/linux-lvm/2002-December/012959.html).

When I run the snapshot command, it segfaults and I get the following 
kernel bug output:

--->8--- kernel bug output --->8---
kernel BUG at vmalloc.c:242!
invalid operand: 0000
CPU:    1
EIP:    0010:[<c01345f3>]    Not tainted
EFLAGS: 00010246
eax: 00000fff   ebx: 00000000   ecx: 00000008   edx: 00000000
esi: f601a544   edi: 00000000   ebp: f8a3c080   esp: f3b39dc8
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 4205, stackpage=f3b39000)
Stack: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
f601a544
        00000000 f8a3c080 c013485b 00000000 000001f2 00000163 00000000 
00000000
        f89c1023 00000000 00000008 00000000 f601a544 f601a500 f89c126a 
f601a544
Call Trace:    [<c013485b>] [<f89c1023>] [<f89c126a>] [<f89c1544>] 
[<f89bdf56>]
   [<c0134ba6>] [<c013467b>] [<c013485b>] [<f89bf148>] [<f89bf4a7>] 
[<f89c02af>]
   [<f89bf440>] [<c0150dcf>] [<c01093df>]

Code: 0f 0b f2 00 7e bc 26 c0 31 d2 8b 5c 24 18 89 d0 8b 74 24 1c
--->8--- kernel bug output --->8---

Running this through ksymoops, I get the following:

--->8--- ksymoops output --->8---
ksymoops 2.4.5 on i686 2.4.20.  Options used
      -V (default)
      -k /proc/ksyms (default)
      -l /proc/modules (default)
      -o /lib/modules/2.4.20/ (default)
      -m /boot/System.map-2.4.20 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Error (expand_objects): cannot stat(/lib/ext3.o) for ext3
Error (expand_objects): cannot stat(/lib/jbd.o) for jbd
Error (expand_objects): cannot stat(/lib/lvm-mod.o) for lvm-mod
Error (expand_objects): cannot stat(/lib/qla2300.o) for qla2300
Error (expand_objects): cannot stat(/lib/megaraid.o) for megaraid
Error (expand_objects): cannot stat(/lib/sd_mod.o) for sd_mod
Error (expand_objects): cannot stat(/lib/scsi_mod.o) for scsi_mod
Warning (map_ksym_to_module): cannot match loaded module ext3 to a 
unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module qla2300 to a 
unique module object.  Trace may not be reliable.
kernel BUG at vmalloc.c:242!
invalid operand: 0000
CPU:    1
EIP:    0010:[<c01345f3>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010246
eax: 00000fff   ebx: 00000000   ecx: 00000008   edx: 00000000
esi: f601a544   edi: 00000000   ebp: f8a3c080   esp: f3b39dc8
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 4205, stackpage=f3b39000)
Stack: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
f601a544
        00000000 f8a3c080 c013485b 00000000 000001f2 00000163 00000000 
00000000
        f89c1023 00000000 00000008 00000000 f601a544 f601a500 f89c126a 
f601a544
Call Trace:    [<c013485b>] [<f89c1023>] [<f89c126a>] [<f89c1544>] 
[<f89bdf56>]
   [<c0134ba6>] [<c013467b>] [<c013485b>] [<f89bf148>] [<f89bf4a7>] 
[<f89c02af>]
   [<f89bf440>] [<c0150dcf>] [<c01093df>]
Code: 0f 0b f2 00 7e bc 26 c0 31 d2 8b 5c 24 18 89 d0 8b 74 24 1c


 >>EIP; c01345f3 <__vmalloc+33/110>   <=====

 >>eax; 00000fff Before first symbol
 >>esi; f601a544 <_end+35cad8e0/384933fc>
 >>ebp; f8a3c080 <END_OF_CODE+a135/????>
 >>esp; f3b39dc8 <_end+337cd164/384933fc>

Trace; c013485b <vcalloc+4b/70>
Trace; f89c1023 <[dm-mod]init_exception_table+23/70>
Trace; f89c126a <[dm-mod]init_hash_tables+9a/100>
Trace; f89c1544 <[dm-mod]snapshot_ctr+274/3a0>
Trace; f89bdf56 <[dm-mod]dm_table_add_target+156/1a0>
Trace; c0134ba6 <alloc_area_pmd+66/8e>
Trace; c013467b <__vmalloc+bb/110>
Trace; c013485b <vcalloc+4b/70>
Trace; f89bf148 <[dm-mod]populate_table+88/e0>
Trace; f89bf4a7 <[dm-mod]create+67/130>
Trace; f89c02af <[dm-mod]ctl_ioctl+cf/110>
Trace; f89bf440 <[dm-mod]create+0/130>
Trace; c0150dcf <sys_ioctl+ef/20f>
Trace; c01093df <system_call+33/38>

Code;  c01345f3 <__vmalloc+33/110>
00000000 <_EIP>:
Code;  c01345f3 <__vmalloc+33/110>   <=====
    0:   0f 0b                     ud2a      <=====
Code;  c01345f5 <__vmalloc+35/110>
    2:   f2 00 7e bc               repnz add %bh,0xffffffbc(%esi)
Code;  c01345f9 <__vmalloc+39/110>
    6:   26                        es
Code;  c01345fa <__vmalloc+3a/110>
    7:   c0                        (bad)
Code;  c01345fb <__vmalloc+3b/110>
    8:   31 d2                     xor    %edx,%edx
Code;  c01345fd <__vmalloc+3d/110>
    a:   8b 5c 24 18               mov    0x18(%esp,1),%ebx
Code;  c0134601 <__vmalloc+41/110>
    e:   89 d0                     mov    %edx,%eax
Code;  c0134603 <__vmalloc+43/110>
   10:   8b 74 24 1c               mov    0x1c(%esp,1),%esi


3 warnings and 7 errors issued.  Results may not be reliable.
--->8--- ksymoops output --->8---

I encountered these same problems with LVM1 on the same system.  The 
kernel is configured with CONFIG_SMP=y and CONFIG_HIGHMEM4G=y.

-- 
Gary Windham
Systems Programmer, Principal
The University of Arizona, CCIT
