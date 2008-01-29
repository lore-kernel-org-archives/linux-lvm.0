Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0T9bKXs003056
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 04:37:20 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0T9ak8U013246
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 04:36:46 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id C4A5B624CA
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 10:36:40 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 41FF09383
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 10:36:39 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id dLvZ0DH96ssQ for <linux-lvm@redhat.com>;
	Tue, 29 Jan 2008 10:36:37 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b0605.pool.mediaWays.net [77.11.6.5])
	by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 10:36:37 +0100 (CET)
Message-ID: <479EF3A4.8040905@wpkg.org>
Date: Tue, 29 Jan 2008 10:36:36 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] "vgchange -a n VG" freezes, other LVM commands too
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I just wanted to deactivate a volume group - I used:

vgchange -a n volume_group


Unfortunately, it didn't work and it seems frozen - the command is still 
being executed, and is in "D" state.

Any other LVM command (lvs etc.) freezes as well (D state), adding +1 to 
the system load average.

This is what happens when I start lvs with verbose/debug parameters:



# lvs -vvvv -dddd
#lvmcmdline.c:871         Processing: lvs -vvvv -dddd
#lvmcmdline.c:874         O_DIRECT will be used
#config/config.c:846       Setting global/locking_type to 1
#config/config.c:823       Setting global/locking_dir to /var/lock/lvm
#locking/locking.c:139       File-based locking enabled.
#config/config.c:851       report/aligned not found in config: 
defaulting to 1
#config/config.c:851       report/buffered not found in config: 
defaulting to 1
#config/config.c:851       report/headings not found in config: 
defaulting to 1
#config/config.c:829       report/separator not found in config: 
defaulting to
#config/config.c:829       report/lvs_sort not found in config: 
defaulting to vg_name,lv_name
#config/config.c:829       report/lvs_cols_verbose not found in config: 
defaulting to 
lv_name,vg_name,seg_count,lv_attr,lv_size,lv_major,lv_minor,lv_kernel_major,lv_kernel_minor,origin,snap_percent,move_pv,copy_percent,mirror_log,lv_uuid
#toollib.c:286     Finding all logical volumes
#device/dev-io.c:439         Opened /dev/loop0 RO
#device/dev-io.c:264       /dev/loop0: size is 0 sectors
#filters/filter.c:106         /dev/loop0: Skipping: Too small to hold a PV
#device/dev-io.c:485         Closed /dev/loop0
#device/dev-io.c:439         Opened /dev/sda RO
#device/dev-io.c:264       /dev/sda: size is 3985632 sectors
#device/dev-io.c:134         /dev/sda: block size is 4096 bytes
#filters/filter.c:112         /dev/sda: Skipping: Partition table 
signature found
#device/dev-io.c:485         Closed /dev/sda
#device/dev-io.c:439         Opened /dev/sdq RO O_DIRECT
#device/dev-io.c:134         /dev/sdq: block size is 4096 bytes


And it stays there.

Any clues how to unblock it?


If it is important, some other kernel thread (drbd0_worker from DRBD) 
is/was accessing that volume group when I started that command.



-- 
Tomasz Chmielewski
http://wpkg.org
