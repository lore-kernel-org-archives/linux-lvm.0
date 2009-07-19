Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6JLoxrN018463
	for <linux-lvm@redhat.com>; Sun, 19 Jul 2009 17:50:59 -0400
Received: from eastrmmtao103.cox.net (eastrmmtao103.cox.net [68.230.240.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6JLohlM014393
	for <linux-lvm@redhat.com>; Sun, 19 Jul 2009 17:50:43 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090719215044.IXDT12338.eastrmmtao103.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Sun, 19 Jul 2009 17:50:44 -0400
Message-ID: <4A639532.6050506@cox.net>
Date: Sun, 19 Jul 2009 16:50:42 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 and external enclosures
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

(The purpose of this "exercise" is to implement a backup strategy.)

I created PVs then an LV on a pair of drives in a USB dual 
enclosure, created the FS, backed up my data, umounted the fs, and 
disconnected/powered down the enclosure.

Upon powering it back up/reconnecting it, I did vgscan, vgchange, 
mount, but got IO and "unable to read superblock" errors.

Rebooting, even with the external drives disconnected, made things 
all better (though I did have to do an lvchange -a y).

***** START ******

# vgscan
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   Reading all physical volumes.  This may take a while...
   /dev/dm-1: read failed after 0 of 4096 at 2000380952576: 
Input/output error
   /dev/dm-1: read failed after 0 of 4096 at 2000381009920: 
Input/output error
   /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
   /dev/dm-1: read failed after 0 of 4096 at 4096: Input/output error
   /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
   Found volume group "backup_vg" using metadata type lvm2
   Found volume group "main_huge_vg" using metadata type lvm2


# vgchange -a y backup_vg
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
   1 logical volume(s) in volume group "backup_vg" now active


# mount -v /mnt/backups
mount: wrong fs type, bad option, bad superblock on 
/dev/mapper/backup_vg-backup_lv,
        missing codepage or helper program, or other error
        In some cases useful info is found in syslog - try
        dmesg | tail  or so


[28722.859373] EXT4-fs: unable to read superblock
[28722.859458] EXT3-fs: unable to read superblock

***** STOP *****

Any thoughts on getting lvm2 to play nice with dynamic devices?

Thanks

-- 
Scooty Puff, Sr
The Doom-Bringer
