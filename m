Message-Id: <3C5750DE.1BB0E94C@us.ibm.com>
From: Mingming cao <cmm@us.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Failed to build 2.5.3-pre6 kernel---undefined lvm_get_blksize()
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
Date: Tue Jan 29 19:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, mge@sistina.de

Hello, Heinz,

While I am trying to build the 2.5.3-pre6 kernel,  I met this error:
......

         drivers/base/base.o drivers/char/char.o drivers/block/block.o
drivers/misc/misc.o drivers/net/net.o drivers/media/media.o
drivers/char/agp/agp.o drivers/char/drm/drm.o drivers/ide/idedriver.o
drivers/scsi/scsidrv.o drivers/cdrom/driver.o
drivers/sound/sounddrivers.o drivers/pci/driver.o
drivers/pcmcia/pcmcia.o drivers/net/pcmcia/pcmcia_net.o
drivers/pnp/pnp.o drivers/video/video.o drivers/usb/usbdrv.o
drivers/md/mddev.o \
        net/network.o \
        --end-group \
        -o vmlinux
drivers/md/mddev.o: In function `lvm_user_bmap':
drivers/md/mddev.o(.text+0x1182): undefined reference to
`lvm_get_blksize'
make: *** [vmlinux] Error 1
......


I could not found the body of function lvm_get_blksize() in the source
code. This also happened in 2.5.2.

Thanks,
-- 
Mingming Cao
IBM Linux Technology Center
503-578-5024  IBM T/L: 775-5024
cmm@us.ibm.com
http://www.ibm.com/linux/ltc
