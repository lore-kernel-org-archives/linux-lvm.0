Return-Path: <thornber@btconnect.com>
Date: Tue, 22 May 2001 16:08:25 +0100
Subject: Re: [linux-lvm] Dumb (well known I hope) symbol problem
Message-ID: <20010522160825.A1338@66bassett.freeserve.co.uk>
References: <3B0A6E1B.2CA74065@in.tum.de> <20010522160131.A16787@sistina.com> <3B0A7CFA.B91FB57@in.tum.de> <3B0A7F56.C1BACC5D@in.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B0A7F56.C1BACC5D@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Tue, May 22, 2001 at 05:01:42PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

Mail me the lvm patch and the LVM/PATCHES/Makefile please.

- Joe

On Tue, May 22, 2001 at 05:01:42PM +0200, David Vidal Rodriguez wrote:
> Bad news:
> I had posted the last message after having compiled the "critical" zone. But now
> it complains just at the final stage, when the kernel is built:
> 
>   ------------------------------------------------------------------------
> 
> ld -m elf_i386 -T /var/tmp/linux/arch/i386/vmlinux.lds -e stext
> arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o init/version.o \
> 
>         --start-group \
>         arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o
> fs/fs.o ipc/ipc.o \
>         drivers/block/block.o drivers/char/char.o drivers/misc/misc.o
> drivers/net/net.o drivers/media/media.o  drivers/char/drm/drm.o
> drivers/ide/idedriver.o drivers/scsi/scsidrv.o drivers/cdrom/driver.o
> drivers/sound/sounddrivers.o drivers/pci/driver.o drivers/video/video.o
> drivers/usb/usbdrv.o drivers/input/inputdrv.o drivers/md/mddev.o \
>         net/network.o \
>         /var/tmp/linux/arch/i386/lib/lib.a /var/tmp/linux/lib/lib.a
> /var/tmp/linux/arch/i386/lib/lib.a \
>         --end-group \
>         -o vmlinux
> drivers/md/mddev.o: In function `lvm_init':
> drivers/md/mddev.o(.text+0x91): undefined reference to `lvm_init_fs'
> drivers/md/mddev.o: In function `lvm_cleanup':
> drivers/md/mddev.o(.text+0x1fe): undefined reference to `lvm_fin_fs'
> drivers/md/mddev.o: In function `lvm_do_vg_create':
> drivers/md/mddev.o(.text+0x1b05): undefined reference to `lvm_fs_create_vg'
> drivers/md/mddev.o: In function `lvm_do_vg_rename':
> drivers/md/mddev.o(.text+0x204d): undefined reference to `lvm_fs_remove_vg'
> drivers/md/mddev.o(.text+0x2221): undefined reference to `lvm_fs_create_vg'
> drivers/md/mddev.o: In function `lvm_do_vg_remove':
> drivers/md/mddev.o(.text+0x228b): undefined reference to `lvm_fs_remove_vg'
> drivers/md/mddev.o: In function `lvm_do_pv_create':
> drivers/md/mddev.o(.text+0x245f): undefined reference to `lvm_fs_create_pv'
> drivers/md/mddev.o: In function `lvm_do_pv_remove':
> drivers/md/mddev.o(.text+0x2488): undefined reference to `lvm_fs_remove_pv'
> drivers/md/mddev.o: In function `lvm_do_lv_create':
> drivers/md/mddev.o(.text+0x2d79): undefined reference to `lvm_fs_create_lv'
> drivers/md/mddev.o: In function `lvm_do_lv_remove':
> drivers/md/mddev.o(.text+0x2ea7): undefined reference to `lvm_fs_remove_lv'
> drivers/md/mddev.o: In function `lvm_do_lv_rename':
> drivers/md/mddev.o(.text+0x3de6): undefined reference to `lvm_fs_remove_lv'
> drivers/md/mddev.o(.text+0x3e06): undefined reference to `lvm_fs_create_lv'
> make: *** [vmlinux] Error 1
> 
> --
>   ------------------------------------------------------------------------
>  David Vidal R. (vidalrod <at> in DOT tum DOT de)
>  http://dvr.ismad.com
>  "Ein Computer ohne Windows ist wie ein Fisch ohne Fahrrad."
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
