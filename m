Return-Path: <jamesp@foobarhouse.com>
Date: Wed, 9 May 2001 16:43:41 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Subject: Re: [linux-lvm] 2.4.4 compile
In-Reply-To: <Pine.LNX.4.30.0105091611570.32661-100000@greebo.foobarhouse.com>
Message-ID: <Pine.LNX.4.30.0105091643120.423-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

Ooops - just been looking through the list and found the solution...
thanks

James

On Wed, 9 May 2001, James Pattinson wrote:

> Hi
>
> I'm trying to compile vanilla 2.4.4 + LVM beta7 patch.
>
> If I use the standard config (make config - hold down enter for defaults)
> then I can build a kernel. However if I enable LVM then the final kernel
> linking fails:
>
> ld -m elf_i386 -T /usr/src/v2.4.4/linux/arch/i386/vmlinux.lds -e stext
> arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
> init/version.o \
>         --start-group \
>         arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o
> mm/mm.o fs/fs.o ipc/ipc.o \
>         drivers/block/block.o drivers/char/char.o drivers/misc/misc.o
> drivers/net/net.o drivers/media/media.o  drivers/char/agp/agp.o
> drivers/char/drm/drm.o drivers/ide/idedriver.o drivers/scsi/scsidrv.o
> drivers/cdrom/driver.o drivers/sound/sounddrivers.o drivers/pci/driver.o
> drivers/pcmcia/pcmcia.o drivers/net/pcmcia/pcmcia_net.o drivers/pnp/pnp.o
> drivers/video/video.o drivers/usb/usbdrv.o drivers/md/mddev.o \
>         net/network.o \
>         /usr/src/v2.4.4/linux/arch/i386/lib/lib.a
> /usr/src/v2.4.4/linux/lib/lib.a /usr/src/v2.4.4/linux/arch/i386/lib/lib.a
> \
>         --end-group \
>         -o vmlinux
> drivers/md/mddev.o: In function `__update_hardblocksize':
> drivers/md/mddev.o(.text+0x24c1): undefined reference to
> `get_hardblocksize'
> drivers/md/mddev.o(.text+0x24fd): undefined reference to
> `get_hardblocksize'
> make: *** [vmlinux] Error 1
>
> Has anyone had success with LVM + 2.4.4 ?
>
> Cheers!
>
> James
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
