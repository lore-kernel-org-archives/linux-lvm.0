From: Maximo Ramos <maximo@violadores.org>
Message-ID: <20030125204853.GA12203@sputnik.violadores.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 for kernels 2.4.20
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
Date: Sun Jan 26 10:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

sorry to bother you but I am trying to use LVM2 in my 2.4.20 kernel ...

the current device-mapper doesn't have a path for 2.4.20 so ...

I've got 2.4.20-dm-7.tar.bz2 but that's a lot of patch files with no README
in it ...

I patch my kernel with those files, one-by-one (there are 40) but after the 
modules building, I've got:

[~]$modprobe dm-mod
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol mempool_destroy_Raf572a67
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol path_release_R8193b2f1
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol vmalloc_to_page_Raa214b41
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol bdput_Ra57a35a2
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol bdget_Rc89d026a
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol path_walk_Ra2e7eba5
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol vcalloc_R5c2c7068
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol blk_dev_Rffc56eca
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol blkdev_get_Ra638f186
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol mempool_free_slab_R8a99a016
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol set_bh_page_R294227b0
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol blkdev_put_Rccb77982
/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol _alloc_pages_R86a3f582

and more ... and some modules I've alread had, got some errors too:

[~]$depmod -a
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/block/floppy.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/block/loop.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/cdrom/cdrom.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/char/agp/agpgart.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/char/busmouse.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/char/drm/mga.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/char/rtc.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/char/serial.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/md/dm-mod.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/net/ppp_async.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/net/ppp_generic.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/scsi/ide-scsi.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/scsi/scsi_mod.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/scsi/sd_mod.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20/kernel/drivers/scsi/sg.o

more more more of this .....

now, what went wrong? :( 

please help!!

-- 
.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
Maximo Ramos           Lost in The Land of The Morning Calm

    "I am free of prejudices. I hate everyone equally."
.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
