Return-Path: <hugo@carfax.nildram.co.uk>
Date: Fri, 25 May 2001 16:26:19 +0100
From: Hugo Mills <hugo@carfax.org.uk>
Message-ID: <20010525162619.D24299@carfax>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Patching Linus' pre- kernels?
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

   Hi - 

   I've just tried to patch a recent, but otherwise virgin, Linus
kernel, and had the kernel compile fail:

make[2]: Leaving directory `/usr/src/linux-2.4.5-pre3/arch/i386/lib'
ld -m elf_i386 -T /usr/src/linux-2.4.5-pre3/arch/i386/vmlinux.lds -e stext arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o init/version.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
        drivers/block/block.o drivers/char/char.o drivers/misc/misc.o drivers/net/net.o drivers/media/media.o  drivers/parport/driver.o drivers/char/agp/agp.o drivers/char/drm/drm.o drivers/ide/idedriver.o drivers/scsi/scsidrv.o drivers/cdrom/driver.o drivers/pci/driver.o drivers/video/video.o drivers/md/mddev.o \
        net/network.o \
        /usr/src/linux-2.4.5-pre3/arch/i386/lib/lib.a /usr/src/linux-2.4.5-pre3/lib/lib.a /usr/src/linux-2.4.5-pre3/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/md/mddev.o: In function `__update_hardblocksize':
drivers/md/mddev.o(.text+0x22f1): undefined reference to `get_hardblocksize'
drivers/md/mddev.o(.text+0x2332): undefined reference to `get_hardblocksize'
make[1]: *** [vmlinux] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.5-pre3'
make: *** [stamp-build] Error 2

I'm using:
Debian testing
Kernel 2.4.5-pre3
LVM 0.9.1-beta7

   Is the beta7 LVM expected to patch against Linus' pre- kernels? If
it is, what have I done wrong? If not, which kernels should I be able
to patch against?

   Also, are there any potential problems with running LVM and devfs
together?

   Thanks,
   Hugo.

--
    ---- Hugo Mills --- The Creature from the Black Logon ----
hugo@lug.org.uk     hugo@carfax.nildram.co.uk     hugo@soton.ac.uk
     ---- "We did a risk management review. We concluded ----
            that there was no risk of any management."
