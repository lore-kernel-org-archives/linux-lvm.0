Return-Path: <TobHahn@web.de>
Date: Tue, 19 Jun 2001 14:12:03 +0200
Message-Id: <200106191212.f5JCC3j06725@mailgate4.cinetic.de>
MIME-Version: 1.0
From: "Tobias Hahn" <TobHahn@web.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM problems
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
To: linux-LVM-Bug@sistina.com, linux-LVM@sistina.com

Hi!

I have serious trouble trying to get LVM to work again since I upgraded my lvm-tools to 0.9beta6. I cannot access my vg (and needless to say, almost all of my system is on that vg :-( ). The problem is that the kernel complains about an unsupported ioctl. I looked up this problem in lvm-related mailinglists and figured out that this is a version mismatch between kernel lvm and user lvm. At that point I was using kernel 2.4.3. According to the mailing list, the problem should be fixed in kernel 2.4.4. However, kernel 2.4.5 (downloaded from ftp.kernel.org) still contains 0.9beta2. So I downloaded the lvm-source from ftp.sistina.com (both beta6 and beta7) and tried to patch kernel 2.4.5 following the instructions in PATCHES/README. The patched kernel, however, does not link any longer.

All I'm asking for is a way to get my data back - either by telling me how lvm can be convinced to run or by just getting that stuff off lvm and removing lvm from my system. It would be very nice if someone could at least acknowledge receipt of this problem report, my last mail seems to have vanished out in the void.

Thanx everyone for reading this mail!

Regards, Tobias Hahn

ld -m elf_i386 -T /tmp/linux/arch/i386/vmlinux.lds -e stext arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o init/version.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
         drivers/char/char.o drivers/block/block.o drivers/misc/misc.o drivers/net/net.o drivers/media/media.o drivers/char/agp/agp.o drivers/isdn/isdn.a drivers/ide/idedriver.o drivers/scsi/scsidrv.o drivers/cdrom/driver.o drivers/pci/driver.o drivers/video/video.o drivers/md/mddev.o \
        net/network.o \
        /tmp/linux/arch/i386/lib/lib.a /tmp/linux/lib/lib.a /tmp/linux/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/md/mddev.o: In function `__update_hardblocksize':
drivers/md/mddev.o(.text+0x7e01): undefined reference to `get_hardblocksize'
drivers/md/mddev.o(.text+0x7e3d): undefined reference to `get_hardblocksize'
make: *** [vmlinux] Error 1

______________________________________________________________________________
Ferienklick.de - Jede Menge Urlaub auf einen Blick!
Hier geht's zu Ihrem Traumstrand: http://ferienklick.de/?PP=2-0-100-105-1
