Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8T7nZLJ013143
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2010 03:49:35 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8T7nKpP009676
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2010 03:49:20 -0400
Received: by bwz11 with SMTP id 11so500144bwz.33
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2010 00:49:19 -0700 (PDT)
MIME-Version: 1.0
From: Jayaraman Thiruvady <jayaraman.tg@gmail.com>
Date: Wed, 29 Sep 2010 15:48:57 +0800
Message-ID: <AANLkTi=CHfp6Y+hFoxPbO895ugbZ+7B7p0Y=XWAYyh5F@mail.gmail.com>
Subject: [linux-lvm]  LVM hangs up with snapshot merge initiated
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

   I am using LVM 2.02.74 and my kernel is vanilla kernel 2.6.33 from
kernel.org. In lvm, there are 4 LVs created. I have one of LV to be
snapshot, which is of equal size LV. When i try to merge the snapshot
to the original LV, the lvm hangs up

And i get dmegs

[  278.551794] Buffer I/O error on device dm-6, logical block 0
[  278.551853] Buffer I/O error on device dm-6, logical block 0
[  278.551906] Buffer I/O error on device dm-6, logical block 0
[  278.551959] Buffer I/O error on device dm-6, logical block 0
[  278.552012] Buffer I/O error on device dm-6, logical block 0
[  278.552065] Buffer I/O error on device dm-6, logical block 0
[  278.552118] Buffer I/O error on device dm-6, logical block 0
[  278.552171] Buffer I/O error on device dm-6, logical block 0
[  278.552224] Buffer I/O error on device dm-6, logical block 0
[  278.552278] Buffer I/O error on device dm-6, logical block 7
and then
[  603.677690] INFO: task lvs:2657 blocked for more than 120 seconds.
[  603.677755] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  603.677837] lvs           D 0000000000000000     0  2657   1862 0x00000000
[  603.677840]  ffff880331a47bb8 0000000000000082 ffff880331a47b88
00000000af93d88f
[  603.677843]  000000000135d000 ffff8801b124efc0 0000000000000000
0000000000000282
[  603.677846]  ffff880331a47fd8 000000000000fb08 ffff8801b90bae00
ffff880330c61700
[  603.677849] Call Trace:
[  603.677851]  [<ffffffff8141c1c0>] ? dm_unplug_all+0x50/0x70
[  603.677854]  [<ffffffff815466c7>] io_schedule+0x47/0x70
[  603.677856]  [<ffffffff8116cece>] __blockdev_direct_IO+0x71e/0xc00
[  603.677859]  [<ffffffff815489ec>] ? _unlock_kernel+0x4c/0xa0
[  603.677862]  [<ffffffff8116ab3e>] blkdev_direct_IO+0x4e/0x50
[  603.677865]  [<ffffffff81169cf0>] ? blkdev_get_blocks+0x0/0xc0
[  603.677867]  [<ffffffff810edede>] generic_file_aio_read+0x61e/0x670
[  603.677870]  [<ffffffff8116b610>] ? blkdev_get+0x10/0x20
[  603.677872]  [<ffffffff8116b691>] ? blkdev_open+0x71/0xc0
[  603.677875]  [<ffffffff8113bd72>] do_sync_read+0xd2/0x110
[  603.677878]  [<ffffffff8116a0bc>] ? block_ioctl+0x3c/0x40
[  603.677880]  [<ffffffff8114b9bd>] ? vfs_ioctl+0x3d/0xd0
[  603.677883]  [<ffffffff8114bf28>] ? do_vfs_ioctl+0x88/0x570
[  603.677886]  [<ffffffff81244d86>] ? security_file_permission+0x16/0x20
[  603.677888]  [<ffffffff8113c5b5>] vfs_read+0xb5/0x1a0
[  603.677891]  [<ffffffff8113c6f1>] sys_read+0x51/0x80
[  603.677894]  [<ffffffff8100a072>] system_call_fastpath+0x16/0x1b

What could be problem?

Regards,
Jayaraman .T
