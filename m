Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBCIdn122054
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 13:39:49 -0500
Received: from bart.rhadmin.org (root@12-217-82-49.client.mchsi.com
	[12.217.82.49])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBCIdmMT006607
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 13:39:48 -0500
Received: from bart.rhadmin.org (cfisher@localhost.rhadmin.org [127.0.0.1])
	by bart.rhadmin.org (8.12.11/8.12.11) with ESMTP id jBCIdh2M001457
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 12:39:44 -0600 (CST)
Received: from localhost (cfisher@localhost)
	by bart.rhadmin.org (8.12.11/8.12.11/Submit) with ESMTP id
	jBCIddSg025507
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 12:39:41 -0600 (CST)
Date: Mon, 12 Dec 2005 12:39:37 -0600 (CST)
From: "Charles J. Fisher" <cfisher@rhadmin.org>
Subject: Re: [linux-lvm] vgchange segfault
In-Reply-To: <Pine.BSO.4.58.0512091035470.22723@bart.rhadmin.org>
Message-ID: <Pine.BSO.4.58.0512121233240.8235@bart.rhadmin.org>
References: <Pine.BSO.4.58.0512091035470.22723@bart.rhadmin.org>
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 9 Dec 2005, Charles J. Fisher wrote:

> I am running CentOS 4, and my lvm partition will no longer mount. I don't
> have any backup files that I can use with a vgcfgrestore. Both vgchange
> and vgscan terminate with a segmentation violation.
> I can still see the contents of the lvm with explore2fs under Windows 
> 2000. It is on hda4.
> I have attached the output of a vgscan below (it was run under rescue 
> mode).

Well, I don't really understand what happened to my volume group, but I'm
wiping out this system and replacing it with ext3 on raw partitions, and
I'll be very hesitant to use LVM in the future.

How am I supposed to feel about my Linux Oracle instances on LVM? I'll be
migrating them if at all possible; Solaris looks very attractive at this point.

    ---------------------------------------------------------------------------
   / Charles J. Fisher     | "If Tyranny and Oppression come to this land,   /
  /  cfisher@rhadmin.org   |   it will be in the guise of fighting a        /
 /   http://rhadmin.org    |   foreign enemy." - James Madison             /
---------------------------------------------------------------------------



> File descriptor 3 left open
> File descriptor 4 left open
> File descriptor 6 left open
> File descriptor 7 left open
> File descriptor 8 left open
> File descriptor 9 left open
> File descriptor 10 left open
> File descriptor 11 left open
> File descriptor 13 left open
> File descriptor 14 left open
> File descriptor 17 left open
> File descriptor 18 left open
> File descriptor 19 left open
> File descriptor 20 left open
> File descriptor 21 left open
> File descriptor 23 left open
> #lvmcmdline.c:835 Processing: vgscan -vvvvvvvvv
> #lvmcmdline.c:838 O_DIRECT will be used
> #config/config.c:778 global/locking_type not found in config: defaulting to 1
> #config/config.c:764 global/locking_dir not found in config: defaulting to /var/lock/lvm
> #locking/locking.c:137 File-based locking enabled.
> #vgscan.c:51 Wiping cache of LVM-capable devices
> #device/dev-cache.c:343 /dev/adb: Not a block device
> #device/dev-cache.c:343 /dev/agpgart: Not a block device
> ...
> #device/dev-io.c:400 Closed /dev/loop3
> #label/label.c:278 <backtrace>
> #filters/filter-sysfs.c:250 /dev/md3: Skipping (sysfs)
> #device/dev-io.c:369 Opened /dev/hda4 RO
> #device/dev-io.c:400 Closed /dev/hda4
> #device/dev-io.c:248 /dev/hda4: size is 7663005 sectors
> #device/dev-io.c:369 Opened /dev/hda4 RO
> #device/dev-io.c:134 /dev/hda4: block size is 512 bytes
> #device/dev-io.c:400 Closed /dev/hda4
> #filters/filter-composite.c:31 Using /dev/hda4
> #device/dev-io.c:369 Opened /dev/hda4 RO
> #device/dev-io.c:134 /dev/hda4: block size is 512 bytes
> #label/label.c:168 /dev/hda4: lvm2 label detected
> #device/dev-io.c:400 Closed /dev/hda4
> Segmentation Violation
