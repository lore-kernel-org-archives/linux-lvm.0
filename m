Date: Tue, 2 Oct 2001 20:37:09 +0200
From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Message-ID: <20011002203709.A25072@balu.kawo2.rwth-aachen.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] linux2.4.10/lvm1.0.1rc3 does not compile
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

LVM 1.0.1rc3 does not compile (link) with Linux 2.4.10 on my system.
This is the error message i get:


ld -m elf_i386 -T /usr/src/linux-2.4.10/arch/i386/vmlinux.lds -e stext
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
init/version.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o
mm/mm.o fs/fs.o ipc/ipc.o \
         drivers/char/char.o drivers/block/block.o drivers/misc/misc.o
drivers/net/net.o drivers/media/media.o drivers/ide/idedriver.o
drivers/scsi/scsidrv.o drivers/cdrom/driver.o drivers/pci/driver.o
drivers/video/video.o drivers/md/mddev.o \
        net/network.o \
        /usr/src/linux-2.4.10/arch/i386/lib/lib.a
/usr/src/linux-2.4.10/lib/lib.a
/usr/src/linux-2.4.10/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/md/mddev.o: In function `lvm_do_le_remap':
drivers/md/mddev.o(.text+0x1bc5): undefined reference to `__update_hardsectsize'
drivers/md/mddev.o: In function `lvm_do_lv_create':
drivers/md/mddev.o(.text+0x3193): undefined reference to `__update_hardsectsize'
drivers/md/mddev.o: In function `lvm_do_lv_extend_reduce':
drivers/md/mddev.o(.text+0x3c9a): undefined reference to `__update_hardsectsize'
drivers/md/mddev.o(.text+0x3cbf): undefined reference to `__update_hardsectsize'
make: *** [vmlinux] Error 1


Does anyone know what went wrong?

Regards, Markus
