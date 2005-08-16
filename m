Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7G8GfV20947
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 04:16:41 -0400
Received: from mail.vianova.fi (herkules.vianova.fi [194.100.28.129])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j7G8GYeD007126
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 04:16:35 -0400
From: "Ville Herva" <vherva@ENIGMA.viasys.com>
Date: Tue, 16 Aug 2005 11:16:17 +0300
Message-ID: <20050816081617.GB3172@vianova.fi>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Upgrade from 2.6.10-ac8 to 2.6.12.5 broke lvm rootfs
Reply-To: vherva@vianova.fi,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-lvm@redhat.com

After upgrading the kernel from 2.6.10-ac8 to 2.6.12.5 the initramfs was no
longer able to mount rootfs.

  mount: error 6 mounting ext3

All the configuration options are identical, and upgrading lvm2 package:
  lvm2-2.00.25-1.01       -> lvm2-2.01.14-1.0
  device-mapper-1.00.19-2 -> device-mapper-1.01.04-1.0

Did not change anything.

Dm, ext3 and the relevant block device drivers statically compiled in.

The vg has lvm1 format, fwiw.

I enabled all the debug options I could think of in the nash-based initramfs
init script. That did not appear to tell much: all I was able to tell was
that lvm was succesfully called by the init script:

mount -t proc /proc /proc
mount -t sysfs none /sys
insmod /lib/dm-snapshot.ko 
mkdevices /dev
mkdmnod
lvm vgscan -v
# sleep 5
lvm vgchange -ay
# sleep 5
lvm vgmknodes
# sleep 5
mkrootdev /dev/root
umount /sys
# sleep 5
mount -o defaults --ro -t ext3 /dev/root /sysroot
switchroot /sysroot

but those didn't give any meaningful output (other than notices about
setting log indentation level).

Finally, I added "sleep 5" after each lvm command (commented out above),
which appeared "solve" the problem. 

Apparently the lvm scripts somehow do their initialization asynchronously
and the init script tries to mount root before it is available. I'm not sure
why this is affected by the kernel version, though.



-- v --

v@iki.fi
