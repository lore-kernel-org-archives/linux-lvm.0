From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
Message-ID: <20021029101033.A22193@sistina.com>
References: <1033579350.6468.61.camel@gopher> <20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory> <20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher> <20021028101739.F16452@sistina.com> <1035866273.9074.74.camel@gopher>
Mime-Version: 1.0
In-Reply-To: <1035866273.9074.74.camel@gopher>; from gkade@bigbrother.net on Mon, Oct 28, 2002 at 08:37:52PM -0800
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
Date: Tue Oct 29 03:15:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Gregory,

as Jon already thought, this seems to be a flaw in the VM subsystem.

The ksymoops you provided shows that, because it fails in vmalloc when
lvm_snapshot_alloc_hash_table() tries to allocated virtual memory for the
copy-on-write exeception table it needs to track the changes which happen
to the original logical volume.

Is there any chance to prove that by running the system with less than 2GB
of memory and _without_ high memory support for a test run?

Regards,
Heinz    -- The LVM Guy --


On Mon, Oct 28, 2002 at 08:37:52PM -0800, Gregory K. Ade wrote:
> On Mon, 2002-10-28 at 01:17, Heinz J . Mauelshagen wrote:
> 
> > Run the kernel oops you probably got for "lvcreate --snapshot ..." through
> > ksymoops, please.
> 
> Okay, just for consistency's sake, I ran:
> 
> --->8--[Cut Here]-->8---
> root@burpr(pts/24):/ 36 # lvdisplay /dev/vg00/tmp
> --- Logical volume ---
> LV Name                /dev/vg00/tmp
> VG Name                vg00
> LV Write Access        read/write
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                2 GB
> Current LE             512
> Allocated LE           512
> Allocation             next free
> Read ahead sectors     120
> Block device           58:1
> 
> 
> root@burpr(pts/24):/ 37 # lvcreate --snapshot --extents 512 --name
> tmp_snap /dev/vg00/tmp
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> "/dev/vg00/tmp_snap"
> Segmentation fault
> root@burpr(pts/24):/ 38 #
> --->8--[Cut Here]-->8---
> 
> That gave me an oops.  pulling it from dmesg and sticking it into a
> file, I ran ksymoops, and here's the output in all it's hairy glory:
> 
> --->8--[Cut Here]-->8---
> ksymoops 2.4.1 on i686 2.4.19-2.burpr.  Options used
>      -V (default)
>      -k /proc/ksyms (default)
>      -l /proc/modules (default)
>      -o /lib/modules/2.4.19-2.burpr/ (default)
>      -m /boot/System.map-2.4.19-2.burpr (default)
> 
> Warning: You did not tell me where to find symbol information.  I will
> assume that the log matches the kernel and modules that are running
> right now and I'll use the default options above for symbol resolution.
> If the current kernel and/or modules do not match the log, you can get
> more accurate output by telling me the kernel version and where to find
> map, modules, ksyms etc.  ksymoops -h explains the options.
> 
> Warning (compare_maps): mismatch on symbol usb_devfs_handle  , usbcore says f9233274, /lib/modules/2.4.19-2.burpr/kernel/drivers/usb/usbcore.o says f9232d34.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/drivers/usb/usbcore.o entry
> Warning (compare_maps): mismatch on symbol icmpv6_socket  , ipv6 says f92232e0, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f9220420.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol icmpv6_statistics  , ipv6 says f92212e0, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921e420.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol inet6_dev_count  , ipv6 says f921f000, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921c140.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol inet6_ifa_count  , ipv6 says f921f004, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921c144.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol inet6_protos  , ipv6 says f9221260, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921e3a0.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol inetsw6  , ipv6 says f921efa0, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921c0e0.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol ip6_ra_chain  , ipv6 says f92209a0, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921dae0.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol ipv6_statistics  , ipv6 says f921f1a0, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921c2e0.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol raw_v6_htable  , ipv6 says f92211e0, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921e320.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol rt6_stats  , ipv6 says f921f168, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921c2a8.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> Warning (compare_maps): mismatch on symbol udp_stats_in6  , ipv6 says f92209e0, /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o says f921db20.  Ignoring /lib/modules/2.4.19-2.burpr/kernel/net/ipv6/ipv6.o entry
> kernel BUG at vmalloc.c:236!
> invalid operand: 0000
> CPU:    2
> EIP:    0010:[<c0132082>]    Not tainted
> Using defaults from ksymoops -t elf32-i386 -a i386
> EFLAGS: 00010246
> eax: ffffffff   ebx: 00000000   ecx: 51eb851f   edx: 00000000
> esi: 00000000   edi: e6421400   ebp: fffffff4   esp: d5d7bd20
> ds: 0018   es: 0018   ss: 0018
> Process lvcreate (pid: 19229, stackpage=d5d7b000)
> Stack: 00000000 00000000 e6421400 fffffff4 000001f0 f931a000 00000001 fffffff4
>        c030ca14 c030cb7c 000001f0 00000001 c024cd45 00000000 000001f2 00000163
>        e642156c 00000000 e6421400 d5d7bdf8 c024cdf8 e6421400 e6421400 000bd000
> Call Trace:    [<c024cd45>] [<c024cdf8>] [<c024a850>] [<c02480cc>] [<c01eaaff>]
>   [<c014b397>] [<c01089cb>]
> Code: 0f 0b ec 00 00 ae 2b c0 31 c0 e9 e4 01 00 00 6a 02 53 e8 3f
> 
> >>EIP; c0132082 <__vmalloc+26/224>   <=====
> Trace; c024cd45 <lvm_snapshot_alloc_hash_table+45/8c>
> Trace; c024cdf8 <lvm_snapshot_alloc+6c/e0>
> Trace; c024a850 <lvm_do_lv_create+528/878>
> Trace; c02480cc <lvm_chr_ioctl+71c/828>
> Trace; c01eaaff <locate_hd_struct+27/70>
> Trace; c014b397 <sys_ioctl+1bb/1f6>
> Trace; c01089cb <system_call+33/38>
> Code;  c0132082 <__vmalloc+26/224>
> 00000000 <_EIP>:
> Code;  c0132082 <__vmalloc+26/224>   <=====
>    0:   0f 0b                     ud2a      <=====
> Code;  c0132084 <__vmalloc+28/224>
>    2:   ec                        in     (%dx),%al
> Code;  c0132085 <__vmalloc+29/224>
>    3:   00 00                     add    %al,(%eax)
> Code;  c0132087 <__vmalloc+2b/224>
>    5:   ae                        scas   %es:(%edi),%al
> Code;  c0132088 <__vmalloc+2c/224>
>    6:   2b c0                     sub    %eax,%eax
> Code;  c013208a <__vmalloc+2e/224>
>    8:   31 c0                     xor    %eax,%eax
> Code;  c013208c <__vmalloc+30/224>
>    a:   e9 e4 01 00 00            jmp    1f3 <_EIP+0x1f3> c0132275 <__vmalloc+219/224>
> Code;  c0132091 <__vmalloc+35/224>
>    f:   6a 02                     push   $0x2
> Code;  c0132093 <__vmalloc+37/224>
>   11:   53                        push   %ebx
> Code;  c0132094 <__vmalloc+38/224>
>   12:   e8 3f 00 00 00            call   56 <_EIP+0x56> c01320d8 <__vmalloc+7c/224>
> 
> 
> 13 warnings issued.  Results may not be reliable.
> --->8--[Cut Here]-->8---
> 
> Anything else I can provide?
> 
> -- 
> Gregory K. Ade <gkade@bigbrother.net>
> http://bigbrother.net/~gkade
> OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
