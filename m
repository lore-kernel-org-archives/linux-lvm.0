Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9Gflg06809
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 11:41:47 -0500
Received: from bart.rhadmin.org (root@12-217-82-49.client.mchsi.com
	[12.217.82.49])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id jB9HaCCl017709
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 12:36:15 -0500
Received: from bart.rhadmin.org (cfisher@localhost.rhadmin.org [127.0.0.1])
	by bart.rhadmin.org (8.12.11/8.12.11) with ESMTP id jB9GfToQ010902
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 10:41:30 -0600 (CST)
Received: from localhost (cfisher@localhost)
	by bart.rhadmin.org (8.12.11/8.12.11/Submit) with ESMTP id
	jB9GfRPA016419
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 10:41:28 -0600 (CST)
Date: Fri, 9 Dec 2005 10:41:26 -0600 (CST)
From: "Charles J. Fisher" <cfisher@rhadmin.org>
Message-ID: <Pine.BSO.4.58.0512091035470.22723@bart.rhadmin.org>
MIME-Version: 1.0
Subject: [linux-lvm] vgchange segfault
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I am running CentOS 4, and my lvm partition will no longer mount. I don't
have any backup files that I can use with a vgcfgrestore. Both vgchange
and vgscan terminate with a segmentation violation.

I can still see the contents of the lvm with explore2fs under Windows 
2000. It is on hda4.

I have attached the output of a vgscan below (it was run under rescue 
mode).

Any help is greatly appreciated.


File descriptor 3 left open
File descriptor 4 left open
File descriptor 6 left open
File descriptor 7 left open
File descriptor 8 left open
File descriptor 9 left open
File descriptor 10 left open
File descriptor 11 left open
File descriptor 13 left open
File descriptor 14 left open
File descriptor 17 left open
File descriptor 18 left open
File descriptor 19 left open
File descriptor 20 left open
File descriptor 21 left open
File descriptor 23 left open
#lvmcmdline.c:835 Processing: vgscan -vvvvvvvvv
#lvmcmdline.c:838 O_DIRECT will be used
#config/config.c:778 global/locking_type not found in config: defaulting to 1
#config/config.c:764 global/locking_dir not found in config: defaulting to /var/lock/lvm
#locking/locking.c:137 File-based locking enabled.
#vgscan.c:51 Wiping cache of LVM-capable devices
#device/dev-cache.c:343 /dev/adb: Not a block device
#device/dev-cache.c:343 /dev/agpgart: Not a block device
...
#device/dev-io.c:400 Closed /dev/loop3
#label/label.c:278 <backtrace>
#filters/filter-sysfs.c:250 /dev/md3: Skipping (sysfs)
#device/dev-io.c:369 Opened /dev/hda4 RO
#device/dev-io.c:400 Closed /dev/hda4
#device/dev-io.c:248 /dev/hda4: size is 7663005 sectors
#device/dev-io.c:369 Opened /dev/hda4 RO
#device/dev-io.c:134 /dev/hda4: block size is 512 bytes
#device/dev-io.c:400 Closed /dev/hda4
#filters/filter-composite.c:31 Using /dev/hda4
#device/dev-io.c:369 Opened /dev/hda4 RO
#device/dev-io.c:134 /dev/hda4: block size is 512 bytes
#label/label.c:168 /dev/hda4: lvm2 label detected
#device/dev-io.c:400 Closed /dev/hda4
Segmentation Violation

    ---------------------------------------------------------------------------
   / Charles J. Fisher   | I'm all in favor of keeping dangerous weapons out /
  /  cfisher@rhadmin.org |  of the hands of fools. Let's start with         /
 /   http://rhadmin.org  |  typewriters. --Frank Lloyd Wright              /
---------------------------------------------------------------------------
