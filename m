Message-ID: <38D6B940.906A526@msede.com>
Date: Tue, 21 Mar 2000 00:50:24 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: jorg.de.jong@ict.nl
MIME-Version: 1.0
Subject: [linux-lvm] oops during cat /proc/lvm
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Mon, 20 Mar 2000 19:59:34 +0100
From: Jorg de Jong <jorg.de.jong@ict.nl>
Subject: oops during cat /proc/lvm

Hi,

I am using kernel 2.3.99.pre2 and did a cat of the 
/proc/lvm file and this resulted in a oops.
Sometimes this fails directly after a reboot 
but sometimes it works a few times. 
I have seen this behavior in 2.3.48 aswell.

The oops result is attached. 

After doing some code reading on lvm.c in function  lvm_proc_get_info, I
can't find the problem; where I have 
some questions about is the use of kfree and vfree.

If needed I can supply you with additional info!





-- 
Jorg de Jong
Work : mailto:jorg.de.jong@ict.nl 
Play : mailto:j.e.s.de.jong@freeler.nl


ksymoops 2.3.3 on i686 2.3.99-pre2.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.3.99-pre2/ (default)
     -m /usr/src/linux/System.map (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Warning (compare_ksyms_lsmod): module nls_cp437 is in lsmod but not in ksyms, probably no symbols exported
Warning (compare_ksyms_lsmod): module nls_iso8859-1 is in lsmod but not in ksyms, probably no symbols exported
Warning (map_ksym_to_module): cannot match loaded module ymf724 to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module audiobuf to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module opl3 to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module uart401 to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module midi to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module ac97 to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module soundbase to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module sndshield to a unique module object.  Trace may not be reliable.
Mar 20 16:07:27 ida kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000000 
Mar 20 16:07:27 ida kernel: c012965b 
Mar 20 16:07:27 ida kernel: *pde = 00000000 
Mar 20 16:07:27 ida kernel: Oops: 0002 
Mar 20 16:07:27 ida kernel: CPU:    0 
Mar 20 16:07:27 ida kernel: EIP:    0010:[kfree+423/444] 
Mar 20 16:07:27 ida kernel: EFLAGS: 00010286 
Mar 20 16:07:27 ida kernel: eax: 0000001b   ebx: 00000000   ecx: 00000008   edx: c4e0a6e0 
Mar 20 16:07:27 ida kernel: esi: caaba000   edi: caaba000   ebp: 00000000   esp: c77e7ed0 
Mar 20 16:07:27 ida kernel: ds: 0018   es: 0018   ss: 0018 
Mar 20 16:07:27 ida kernel: Process cat (pid: 1762, stackpage=c77e7000) 
Mar 20 16:07:27 ida kernel: Stack: c024b662 caaba000 00000000 c0343a6c caaba000 00000000 0804d084 c77e7fb4  
Mar 20 16:07:27 ida kernel:        c01819ac caaba000 c401bc80 00000c00 00000000 c267a000 00000100 0804c078  
Mar 20 16:07:27 ida kernel:        00001008 c32c6240 c37993e0 c77e6000 c4e0a718 c4e0a718 c4e0a6fc 00000002  
Mar 20 16:07:27 ida kernel: Call Trace: [tvecs+7486/89084] [<caaba000>] [<caaba000>] [lvm_proc_get_info+300/3108] [<caaba000>] [__alloc_pages+103/168] [proc_file_read+264/580]  
Mar 20 16:07:27 ida kernel: Code: c7 05 00 00 00 00 00 00 00 00 83 c4 08 5b 5e 5f 5d 59 5a c3  
Using defaults from ksymoops -t elf32-i386 -a i386

Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   c7 05 00 00 00 00 00      movl   $0x0,0x0
Code;  00000007 Before first symbol
   7:   00 00 00 
Code;  0000000a Before first symbol
   a:   83 c4 08                  addl   $0x8,%esp
Code;  0000000d Before first symbol
   d:   5b                        popl   %ebx
Code;  0000000e Before first symbol
   e:   5e                        popl   %esi
Code;  0000000f Before first symbol
   f:   5f                        popl   %edi
Code;  00000010 Before first symbol
  10:   5d                        popl   %ebp
Code;  00000011 Before first symbol
  11:   59                        popl   %ecx
Code;  00000012 Before first symbol
  12:   5a                        popl   %edx
Code;  00000013 Before first symbol
  13:   c3                        ret    


11 warnings issued.  Results may not be reliable.
