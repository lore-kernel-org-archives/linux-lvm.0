Return-Path: <m_ilya@agava.com>
Subject: Re: [linux-lvm] LVM problems
References: <200106191212.f5JCC3j06725@mailgate4.cinetic.de>
From: Ilya Martynov <m_ilya@agava.com>
Date: 19 Jun 2001 16:14:51 +0400
In-Reply-To: <200106191212.f5JCC3j06725@mailgate4.cinetic.de>
Message-ID: <87vglsk6o4.fsf@juil.domain>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
To: linux-lvm@sistina.com
Cc: linux-LVM-Bug@sistina.com, linux-LVM@sistina.com

--=-=-=



TH> [..skip..]

TH> ld -m elf_i386 -T /tmp/linux/arch/i386/vmlinux.lds -e stext arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o init/version.o \
TH>         --start-group \
TH>         arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
TH>          drivers/char/char.o drivers/block/block.o drivers/misc/misc.o drivers/net/net.o drivers/media/media.o drivers/char/agp/agp.o drivers/isdn/isdn.a drivers/ide/idedriver.o drivers/scsi/scsidrv.o drivers/cdrom/driver.o drivers/pci/driver.o drivers/video/video.o drivers/md/mddev.o \
TH>         net/network.o \
TH>         /tmp/linux/arch/i386/lib/lib.a /tmp/linux/lib/lib.a /tmp/linux/arch/i386/lib/lib.a \
TH>         --end-group \
TH>         -o vmlinux
TH> drivers/md/mddev.o: In function `__update_hardblocksize':
TH> drivers/md/mddev.o(.text+0x7e01): undefined reference to `get_hardblocksize'
TH> drivers/md/mddev.o(.text+0x7e3d): undefined reference to `get_hardblocksize'
TH> make: *** [vmlinux] Error 1

It is known problem and should be fixed in future releases.
For now use attached patch.

I've found it in archives of this maillist when I've faced simular problem.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: attachment;
  filename=lvm-0.9.1_beta7-2.4.5-get_hardblocksize.patch

--- lvm.c~	Wed Jun 13 15:57:06 2001
+++ lvm.c	Wed Jun 13 15:58:10 2001
@@ -1791,7 +1791,7 @@
 	int max_hardblocksize = 0, hardblocksize;
 
 	for (le = 0; le < lv->lv_allocated_le; le++) {
-		hardblocksize = get_hardblocksize(lv->lv_current_pe[le].dev);
+		hardblocksize = get_hardsect_size(lv->lv_current_pe[le].dev);
 		if (hardblocksize == 0)
 			hardblocksize = 512;
 		if (hardblocksize > max_hardblocksize)
@@ -1801,7 +1801,7 @@
 	if (lv->lv_access & LV_SNAPSHOT) {
 		for (e = 0; e < lv->lv_remap_end; e++) {
 			hardblocksize =
-				get_hardblocksize(
+				get_hardsect_size(
 					lv->lv_block_exception[e].rdev_new);
 			if (hardblocksize == 0)
 				hardblocksize = 512;

--=-=-=

-- 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
| Ilya Martynov (http://martynov.org/)                                    |
| GnuPG 1024D/323BDEE6 D7F7 561E 4C1D 8A15 8E80  E4AE BE1A 53EB 323B DEE6 |
| AGAVA Software Company (http://www.agava.com/)                          |
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

--=-=-=--
