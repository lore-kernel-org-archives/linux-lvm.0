Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 11:22:24 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Patching Linus' pre- kernels?
Message-ID: <20010528112224.I26710@sistina.com>
References: <20010525162619.D24299@carfax>
Mime-Version: 1.0
In-Reply-To: <20010525162619.D24299@carfax>; from hugo@carfax.org.uk on Fri, May 25, 2001 at 04:26:19PM +0100
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

Hugo,

there's 2 optional solutions:

- change get_hardblocksize to get_hardsect_size and recompile -or-
- get the recent LVM code from CVS at www.sistina.com

Regards,
Heinz    -- The LVM Guy --


On Fri, May 25, 2001 at 04:26:19PM +0100, Hugo Mills wrote:
>    Hi - 
> 
>    I've just tried to patch a recent, but otherwise virgin, Linus
> kernel, and had the kernel compile fail:
> 
> make[2]: Leaving directory `/usr/src/linux-2.4.5-pre3/arch/i386/lib'
> ld -m elf_i386 -T /usr/src/linux-2.4.5-pre3/arch/i386/vmlinux.lds -e stext arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o init/version.o \
>         --start-group \
>         arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
>         drivers/block/block.o drivers/char/char.o drivers/misc/misc.o drivers/net/net.o drivers/media/media.o  drivers/parport/driver.o drivers/char/agp/agp.o drivers/char/drm/drm.o drivers/ide/idedriver.o drivers/scsi/scsidrv.o drivers/cdrom/driver.o drivers/pci/driver.o drivers/video/video.o drivers/md/mddev.o \
>         net/network.o \
>         /usr/src/linux-2.4.5-pre3/arch/i386/lib/lib.a /usr/src/linux-2.4.5-pre3/lib/lib.a /usr/src/linux-2.4.5-pre3/arch/i386/lib/lib.a \
>         --end-group \
>         -o vmlinux
> drivers/md/mddev.o: In function `__update_hardblocksize':
> drivers/md/mddev.o(.text+0x22f1): undefined reference to `get_hardblocksize'
> drivers/md/mddev.o(.text+0x2332): undefined reference to `get_hardblocksize'
> make[1]: *** [vmlinux] Error 1
> make[1]: Leaving directory `/usr/src/linux-2.4.5-pre3'
> make: *** [stamp-build] Error 2
> 
> I'm using:
> Debian testing
> Kernel 2.4.5-pre3
> LVM 0.9.1-beta7
> 
>    Is the beta7 LVM expected to patch against Linus' pre- kernels? If
> it is, what have I done wrong? If not, which kernels should I be able
> to patch against?
> 
>    Also, are there any potential problems with running LVM and devfs
> together?
> 
>    Thanks,
>    Hugo.
> 
> --
>     ---- Hugo Mills --- The Creature from the Black Logon ----
> hugo@lug.org.uk     hugo@carfax.nildram.co.uk     hugo@soton.ac.uk
>      ---- "We did a risk management review. We concluded ----
>             that there was no risk of any management."
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
