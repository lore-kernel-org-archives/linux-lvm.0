Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
From: Gregory Ade <gkade@bigbrother.net>
In-Reply-To: <20021109130628.B12935@sistina.com>
References: <20021009133650.E23965@sistina.com>
	<1035782975.3398.128.camel@gopher> <20021028101739.F16452@sistina.com>
	<1035866273.9074.74.camel@gopher> <20021029101033.A22193@sistina.com>
	<1035921224.1276.24.camel@gopher> <20021031134804.A491@sistina.com>
	<1036104859.21418.104.camel@pslgregory> <20021105152824.E27825@sistina.com>
	<1036727077.7035.50.camel@pslgregory>  <20021109130628.B12935@sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-ijirme5YIHjC5Muif6/u"
Message-Id: <1039145680.1069.79.camel@pslgregory>
Mime-Version: 1.0
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
Date: Thu Dec  5 21:35:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-ijirme5YIHjC5Muif6/u
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2002-11-09 at 04:06, Heinz J . Mauelshagen wrote:
> On Thu, Nov 07, 2002 at 07:44:36PM -0800, Gregory Ade wrote:
> > Okay, I disabled high memory support (only change from production
> > kernel), rebooted with this test kernel, and tried to create a snapshot=
:
[snip]
> > It worked just fine:
[snip]
> > So I removed it:
[snip]
> > No kernel oops or BUG in the dmesg.
> >=20
> > Again, the _ONLY DIFFERENCE_ between this test kernel and the productio=
n
> > kernel is the high-memory support option.  On the test kernel, it is
> > off, and on the production kernel, it is set to 64GB.
> >=20
> > Hope this helps.

[snip]

> this proves my assumption right that something is fishy with the high
> memory support in your SMP environment.
>=20
> I guess that it might work as well in case you make a single processor ke=
rnel
> _with_ high memory enabled and repeat the very same test and that it migh=
t
> be a highmem/smp problem still to be fixed.

Well, it's not solely an SMP thing.  I finally got an opportunity to
test a non-SMP high-memory kernel tonight, and it's the exact same
failure mode as the original problem report.  Here's a full report,
complete with the Oops and a run through ksymoops.

root@burpr(pts/0):~ 24 # uname -a
Linux burpr 2.4.19-2.burpr.test #1 Thu Dec 5 16:22:49 PST 2002 i686 unknown
root@burpr(pts/0):~ 25 # cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 1
model name      : Intel(R) Xeon(TM) CPU 1.60GHz
stepping        : 1
cpu MHz         : 1595.176
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 3185.04

root@burpr(pts/0):~ 26 # free -tm
             total       used       free     shared    buffers     cached
Mem:          7580        132       7448          0         46         28
-/+ buffers/cache:         57       7523
Swap:         8191          0       8191
Total:       15772        132      15640
root@burpr(pts/0):~ 27 # lvcreate --snapshot --extents 512 --name tmp_snap =
/dev/vg00/tmp
lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/vg00=
/tmp_snap"
Segmentation fault

--->8--[ Oops output taken from dmesg ]-->8---

kernel BUG at vmalloc.c:236!
invalid operand: 0000
CPU:    0
EIP:    0010:[<c012caa6>]    Not tainted
EFLAGS: 00010246
eax: ffffffff   ebx: 00000000   ecx: 51eb851f   edx: 00000000
esi: 00000000   edi: f4f51a00   ebp: fffffff4   esp: f3ce9d20
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 740, stackpage=3Df3ce9000)
Stack: 00000000 00000000 f4f51a00 fffffff4 000001f0 f930f000 00000001 fffff=
ff4
       c02eab14 c02eac7c 000001f0 00000001 c023ad1b 00000000 000001f2 00000=
163
       f4f51b6c 00000000 f4f51a00 f3ce9df8 c023adc8 f4f51a00 f4f51a00 000bd=
000
Call Trace:    [<c023ad1b>] [<c023adc8>] [<c0238870>] [<c023614c>] [<c01dad=
7f>]
  [<c01419f7>] [<c010867b>]

Code: 0f 0b ec 00 20 cb 29 c0 31 c0 e9 bf 01 00 00 6a 02 53 e8 9f

--->8--[ Oops output taken from dmesg ]-->8---

--->8--[ Oops output from ksymoops ]-->8---

ksymoops 2.4.1 on i686 2.4.19-2.burpr.test.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.19-2.burpr.test/ (default)
     -m /boot/System.map-2.4.19-2.burpr.test (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Warning (compare_maps): mismatch on symbol usb_devfs_handle  , usbcore says=
 f922a6f4, /lib/modules/2.4.19-2.burpr.test/kernel/drivers/usb/usbcore.o sa=
ys f922a1b4.  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/drivers/usb/=
usbcore.o entry
Warning (compare_maps): mismatch on symbol icmpv6_socket  , ipv6 says f921a=
c80, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f9218960.=
  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol icmpv6_statistics  , ipv6 says f=
921ab80, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f9218=
860.  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entr=
y
Warning (compare_maps): mismatch on symbol inet6_dev_count  , ipv6 says f92=
1a7a0, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f921848=
0.  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol inet6_ifa_count  , ipv6 says f92=
1a7a4, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f921848=
4.  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol inet6_protos  , ipv6 says f921ab=
00, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f92187e0. =
 Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol inetsw6  , ipv6 says f921a740, /=
lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f9218420.  Igno=
ring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol ip6_ra_chain  , ipv6 says f921aa=
00, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f92186e0. =
 Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol ipv6_statistics  , ipv6 says f92=
1a940, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f921862=
0.  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol raw_v6_htable  , ipv6 says f921a=
a80, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f9218760.=
  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol rt6_stats  , ipv6 says f921a908,=
 /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f92185e8.  Ig=
noring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
Warning (compare_maps): mismatch on symbol udp_stats_in6  , ipv6 says f921a=
a40, /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o says f9218720.=
  Ignoring /lib/modules/2.4.19-2.burpr.test/kernel/net/ipv6/ipv6.o entry
LAPIC_NMI (acpi_id[0x0007] polarity[0x1] trigger[0x1] lint[0x1])
LAPIC_NMI (acpi_id[0x0008] polarity[0x1] trigger[0x1] lint[0x1])
cpu: 0, clocks: 996964, slice: 498482
kernel BUG at vmalloc.c:236!
invalid operand: 0000
CPU:    0
EIP:    0010:[<c012caa6>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010246
eax: ffffffff   ebx: 00000000   ecx: 51eb851f   edx: 00000000
esi: 00000000   edi: f4f51a00   ebp: fffffff4   esp: f3ce9d20
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 740, stackpage=3Df3ce9000)
Stack: 00000000 00000000 f4f51a00 fffffff4 000001f0 f930f000 00000001 fffff=
ff4=20
       c02eab14 c02eac7c 000001f0 00000001 c023ad1b 00000000 000001f2 00000=
163=20
       f4f51b6c 00000000 f4f51a00 f3ce9df8 c023adc8 f4f51a00 f4f51a00 000bd=
000=20
Call Trace:    [<c023ad1b>] [<c023adc8>] [<c0238870>] [<c023614c>] [<c01dad=
7f>]
  [<c01419f7>] [<c010867b>]
Code: 0f 0b ec 00 20 cb 29 c0 31 c0 e9 bf 01 00 00 6a 02 53 e8 9f=20

>>EIP; c012caa6 <__vmalloc+26/1fc>   <=3D=3D=3D=3D=3D
Trace; c023ad1b <lvm_snapshot_alloc_hash_table+3f/80>
Trace; c023adc8 <lvm_snapshot_alloc+6c/e0>
Trace; c0238870 <lvm_do_lv_create+518/868>
Trace; c023614c <lvm_chr_ioctl+710/81c>
Trace; c01dad7f <locate_hd_struct+27/70>
Trace; c01419f7 <sys_ioctl+16b/184>
Trace; c010867b <system_call+33/38>
Code;  c012caa6 <__vmalloc+26/1fc>
00000000 <_EIP>:
Code;  c012caa6 <__vmalloc+26/1fc>   <=3D=3D=3D=3D=3D
   0:   0f 0b                     ud2a      <=3D=3D=3D=3D=3D
Code;  c012caa8 <__vmalloc+28/1fc>
   2:   ec                        in     (%dx),%al
Code;  c012caa9 <__vmalloc+29/1fc>
   3:   00 20                     add    %ah,(%eax)
Code;  c012caab <__vmalloc+2b/1fc>
   5:   cb                        lret  =20
Code;  c012caac <__vmalloc+2c/1fc>
   6:   29 c0                     sub    %eax,%eax
Code;  c012caae <__vmalloc+2e/1fc>
   8:   31 c0                     xor    %eax,%eax
Code;  c012cab0 <__vmalloc+30/1fc>
   a:   e9 bf 01 00 00            jmp    1ce <_EIP+0x1ce> c012cc74 <__vmall=
oc+1f4/1fc>
Code;  c012cab5 <__vmalloc+35/1fc>
   f:   6a 02                     push   $0x2
Code;  c012cab7 <__vmalloc+37/1fc>
  11:   53                        push   %ebx
Code;  c012cab8 <__vmalloc+38/1fc>
  12:   e8 9f 00 00 00            call   b6 <_EIP+0xb6> c012cb5c <__vmalloc=
+dc/1fc>


13 warnings issued.  Results may not be reliable.

--->8--[ Oops output from ksymoops ]-->8---


--=20
Gregory K. Ade <gkade@bigbrother.net>
http://bigbrother.net/~gkade
OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

--=-ijirme5YIHjC5Muif6/u
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA98BrPeQUEYOr0hEsRAohjAKDY6Hm6LpCFW5JfDNlvAc9SLYpupwCdGdz3
3gqoIz0dcuMoB32BjVVr59A=
=QDG8
-----END PGP SIGNATURE-----

--=-ijirme5YIHjC5Muif6/u--
