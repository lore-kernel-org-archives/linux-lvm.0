Message-Id: <200110101638.f9AGcZ9m088332@mail2.megamailservers.com>
Date: Wed, 10 Oct 2001 16:38:34 -0000
Subject: Re: [linux-lvm] More strangeness
From: <jlixfeld@andromedas.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> On Oct 10, 2001  06:18 -0400, Jason A. Lixfeld wrote:
> > No official patch for ext3 and 2.4.10?!  Can I run an older kernel
> > version?  2.4.8 or 9 maybe?  Will that run ext3 and lvmtools 1.0.1rc4?
> > 
> > This is going back to a comment I made earlier about asking for a stable
> > version of LVM/kernel to use.  Everyone said 1.0.1rc4/2.4.10 would be
> > fine (but I didn't mention ext3, because I didn't think it was a
> > factor).
> 
> Try 2.4.10-ac(latest) (optionally + ext3 patches).  That sounds relatively
> stable from reports on l-k, and also has good performance.  It already
> has ext3 and a relatively up-to-date LVM in the kernel (although there
> are newer patches for both as well).

I'd love to try 2.4.10-ac10, BUT it won't compile for me.  I got the 2.4.10 
source tree and patched it with ac10, but it flunks.  Below is the make 
bzImage capture starting from drivers/ide to fail:

--

make[3]: Entering directory `/usr/src/linux/drivers/ide'
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide.o ide.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-features.o ide-features.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ataraid.o ataraid.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o cmd640.o cmd640.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-adma.o ide-adma.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-dma.o ide-dma.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-pci.o ide-pci.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o pdc202xx.o pdc202xx.c
pdc202xx.c: In function `config_chipset_for_dma':
pdc202xx.c:529: warning: `drive_pci' might be used uninitialized in this 
function
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o piix.o piix.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o rz1000.o rz1000.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-proc.o ide-proc.c
ld -m elf_i386 -r -o ide-mod.o ide.o ide-features.o ataraid.o  cmd640.o ide-
adma.o ide-dma.o ide-pci.o pdc202xx.o piix.o rz1000.o ide-proc.o
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-probe.o ide-probe.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-geometry.o ide-geometry.c
ld -m elf_i386 -r -o ide-probe-mod.o ide-probe.o ide-geometry.o
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-disk.o ide-disk.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o ide-cd.o ide-cd.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-
trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -
mpreferred-stack-boundary=2 -march=i686    -c -o pdcraid.o pdcraid.c
pdcraid.c: In function `pdcraid_ioctl':
pdcraid.c:103: warning: unused variable `larg'
pdcraid.c: In function `pdcraid0_make_request':
pdcraid.c:288: warning: label `outerr' defined but not used
pdcraid.c: In function `pdcraid_init_one':
pdcraid.c:554: warning: unused variable `q'
pdcraid.c: In function `pdcraid_init':
pdcraid.c:586: warning: unused variable `i'
rm -f idedriver.o
ld -m elf_i386  -r -o idedriver.o ide-mod.o ide-probe-mod.o ide-disk.o ide-
cd.o ataraid.o pdcraid.o
ataraid.o: In function `ataraid_get_bhead':
ataraid.o(.text+0xf0): multiple definition of `ataraid_get_bhead'
ide-mod.o(.text+0x5540): first defined here
ataraid.o: In function `ataraid_get_private':
ataraid.o(.text+0x130): multiple definition of `ataraid_get_private'
ide-mod.o(.text+0x5580): first defined here
ataraid.o: In function `ataraid_end_request':
ataraid.o(.text+0x170): multiple definition of `ataraid_end_request'
ide-mod.o(.text+0x55c0): first defined here
ataraid.o: In function `ataraid_get_device':
ataraid.o(.text+0x280): multiple definition of `ataraid_get_device'
ide-mod.o(.text+0x56d0): first defined here
ataraid.o: In function `ataraid_release_device':
ataraid.o(.text+0x2f0): multiple definition of `ataraid_release_device'
ide-mod.o(.text+0x5740): first defined here
ataraid.o: In function `ataraid_register_disk':
ataraid.o(.text+0x340): multiple definition of `ataraid_register_disk'
ide-mod.o(.text+0x5790): first defined here
ataraid.o(.bss+0x0): multiple definition of `ataraid_gendisk'
ide-mod.o(.bss+0x2040): first defined here
make[3]: *** [idedriver.o] Error 1
make[3]: Leaving directory `/usr/src/linux/drivers/ide'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/drivers/ide'
make[1]: *** [_subdir_ide] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_dir_drivers] Error 2

Any ideas?
