Return-Path: <glenn@gecpalau.com>
Message-ID: <3AF0986A.B913EC6E@gecpalau.com>
Date: Thu, 03 May 2001 08:29:46 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems compiling 2.4.4
References: <25B9BEF7071AD511ADF000D0B74753B0018DAE@MAIL>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Lionel COTTIN wrote:

> Hi,
>
> it seems you have activated the md driver (raid 0...5), which is not LVM
> related....
> try to de-activate it if possible, then try again.
>
> I have compiled the 2.4.4 kernel with LVM 0.9.1beta7 today without any
> problem.
>
> Good luck ;)
>
> Lionel
>
> -----Message d'origine-----
> De : linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]De
> la part de Emanuel Quass
> Envoy� : mercredi 2 mai 2001 18:28
> � : linux-lvm@sistina.com
> Objet : [linux-lvm] Problems compiling 2.4.4
>
> Hi,
>
> I compiled a kernel(2.4.4) with your lvm patch (0.9.1_beta7).
> At the end of make bzImage an error occours:
>
> ld -m elf_i386 -T /mnt/kernel/linux/arch/i386/vmlinux.lds -e \
>  stext arch/i386/kernel/head.o arch/i386/kernel/init_task.o \
>  init/main.o init/version.o \
>         --start-group \
>         arch/i386/kernel/kernel.o arch/i386/mm/mm.o \
> kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
>         drivers/block/block.o drivers/char/char.o \
> drivers/misc/misc.o drivers/net/net.o drivers/media/media.o \
> drivers/ide/idedriver.o drivers/scsi/scsidrv.o \
> drivers/cdrom/driver.o drivers/pci/driver.o drivers/video/video.o \
> drivers/md/mddev.o \
>         net/network.o \
>         /mnt/kernel/linux/arch/i386/lib/lib.a \
> /mnt/kernel/linux/lib/lib.a /mnt/kernel/linux/arch/i386/lib/lib.a \
>         --end-group \
>         -o vmlinux \
> drivers/md/mddev.o: In function `__update_hardblocksize':
> drivers/md/mddev.o(.text+0x2316): undefined reference to `get_hardblocksize'
> drivers/md/mddev.o(.text+0x2352): undefined reference to `get_hardblocksize'
> make: *** [vmlinux] Error 1
>
> Does anybody knwo where this comes from!
>
> Thanks in advance
>
>         Emanuel
>
> P.S. Please CC me because I am not in the list.
>
> --
>
> ++++++++++++++++++++++++++++++++
> Emanuel Quass
> email :  emanuel.quass@temic.com
>
> In a world without fences and walls,
> who needs Windows and Gates?
> ++++++++++++++++++++++++++++++++
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

So does this mean that raid is broken in 2.4.4?

Glenn
