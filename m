Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9GEkGDe021976
	for <linux-lvm@redhat.com>; Wed, 16 Oct 2013 10:46:17 -0400
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9GEkEJ9014533
	for <linux-lvm@redhat.com>; Wed, 16 Oct 2013 10:46:15 -0400
Received: by mail-vb0-f53.google.com with SMTP id i3so393050vbh.40
	for <linux-lvm@redhat.com>; Wed, 16 Oct 2013 07:46:14 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Oct 2013 17:46:14 +0300
Message-ID: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>
From: Ugis <ugis22@gmail.com>
Subject: [linux-lvm] poor read performance on rbd+LVM, LVM overload
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>

Hello ceph&LVM communities!

I noticed very slow reads from xfs mount that is on ceph
client(rbd+gpt partition+LVM PV + xfs on LE)
To find a cause I created another rbd in the same pool, formatted it
straight away with xfs, mounted.

Write performance for both xfs mounts is similar ~12MB/s

reads with "dd if=/mnt/somefile bs=1M | pv | dd of=/dev/null" as follows:
with LVM ~4MB/s
pure xfs ~30MB/s

Watched performance while doing reads with atop. In LVM case atop
shows LVM overloaded:
LVM | s-LV_backups  | busy     95% |  read   21515 | write      0  |
KiB/r      4 |               | KiB/w      0 |  MBr/s   4.20 | MBw/s
0.00  | avq     1.00 |  avio 0.85 ms |

client kernel 3.10.10
ceph version 0.67.4

My considerations:
I have expanded rbd under LVM couple of times(accordingly expanding
gpt partition, PV,VG,LV, xfs afterwards), but that should have no
impact on performance(tested clean rbd+LVM, same read performance as
for expanded one).

As with device-mapper, after LVM is initialized it is just a small
table with LE->PE  mapping that should reside in close CPU cache.
I am guessing this could be related to old CPU used, probably caching
near CPU does not work well(I tested also local HDDs with/without LVM
and got read speed ~13MB/s vs 46MB/s with atop showing same overload
in  LVM case).

What could make so great difference when LVM is used and what/how to
tune? As write performance does not differ, DM extent lookup should
not be lagging, where is the trick?

CPU used:
# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 4
model name      : Intel(R) Xeon(TM) CPU 3.20GHz
stepping        : 10
microcode       : 0x2
cpu MHz         : 3200.077
cache size      : 2048 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr ss
                                                       e sse2 ss ht tm
pbe syscall nx lm constant_tsc pebs bts nopl pni dtes64 monitor ds_cpl
cid cx16 xtpr lahf_lm
bogomips        : 6400.15
clflush size    : 64
cache_alignment : 128
address sizes   : 36 bits physical, 48 bits virtual
power management:

Br,
Ugis
