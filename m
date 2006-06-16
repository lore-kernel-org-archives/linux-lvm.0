Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GM881A017835
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 18:08:08 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.21])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k5GM83N9017087
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 18:08:03 -0400
Date: Sat, 17 Jun 2006 00:07:57 +0200
From: chris <cspot@gmx.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <opta9efjwu51dxvh@notebook-chl.intern>
Subject: [linux-lvm] vgchange -ay --partial fails
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: linux-lvm@redhat.com

hi!

i still have a broken volume and i still have the wish to get at least  
some data back before dropping the whole configuration.

the very promising way "partial" failed, i could not mount the broken  
volume.

what else can be done?
can I fake the missing device (i.e. write the uuid)?

thx, chris

the comlete shell output:
kistl:/etc/lvm# pvscan
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   PV /dev/hde1        VG media_volgrp   lvm2 [232,88 GB / 0    free]
   PV /dev/hdg1        VG media_volgrp   lvm2 [232,88 GB / 0    free]
   PV /dev/hdd1        VG media_volgrp   lvm2 [232,88 GB / 0    free]
   PV unknown device   VG media_volgrp   lvm2 [232,88 GB / 0    free]
   PV /dev/hda3        VG media_volgrp   lvm2 [224,91 GB / 456,00 MB free]
   PV /dev/hdb1                          lvm2 [232,88 GB]
   Total: 6 [1,36 TB] / in use: 5 [1,13 TB] / in no VG: 1 [232,88 GB]
kistl:/etc/lvm# vgchange -ay --partial
   Partial mode. Incomplete volume groups will be activated read-only.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   1 logical volume(s) in volume group "media_volgrp" now active
kistl:/etc/lvm# lvscan
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find all physical volumes for volume group media_volgrp.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find all physical volumes for volume group media_volgrp.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find all physical volumes for volume group media_volgrp.
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find all physical volumes for volume group media_volgrp.
   Volume group "media_volgrp" not found
kistl:/etc/lvm# mount /dev/mapper/media_volgrp-media_vol
mount: wrong fs type, bad option, bad superblock on  
/dev/mapper/media_volgrp-media_vol,
        or too many mounted file systems
        (could this be the IDE device where you in fact use
        ide-scsi so that sr0 or sda or so is needed?)
