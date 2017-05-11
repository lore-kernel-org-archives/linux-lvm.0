Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C4F828A5
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 09:47:02 +0000 (UTC)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2E1C8535D
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 09:46:57 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u65so33262327wmu.1
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 02:46:57 -0700 (PDT)
MIME-Version: 1.0
From: Sergey Zhuravlev <sergey@divpro.ru>
Date: Thu, 11 May 2017 14:46:35 +0500
Message-ID: <CAPx6nLqwu=UMOaukpLf3o3rZOwzpkrYhftmRa8jGQHBNXF84Pg@mail.gmail.com>
Subject: [linux-lvm]  deadlock during backup from lvm snapshot
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

Hi

This message is a continuation of this thread:
https://www.redhat.com/archives/linux-lvm/2016-November/msg00037.html

> Please switch to newer version of lvm2.
>
> Sequence with snapshot activation had been reworked to minimize possibility to hit this kernel race - race is still there even with the latest kernel,
> but in the real world you should not have a much chance to hit it.
> If you still do - please report again - we will take more closer look and your workflow.


The bug is still there. We have over 100 servers with LVM and everyday
backups using snapshots.
And we hit this race at least 1 time every week.

On our test stand it takes about 1-2 hours to reproduce this situation.

Worst of all is that we must reboot the server after this race, and it
hits dozens of our client virtual machines.


We use Debian 8 (Jessie) on our servers.
On our test stand we tried to use this kernel versions (both are from
Debian Jessie backports):
4.6.4-1~bpo8+1
4.9.13-1~bpo8+1
and LVM versions: 2.02.111 and 2.02.168.
We also tried to use 'thin provisioning' and we hit the race here too.
We believe that there is a correlation between this bug and intensity
of IO operations on used logical volume and on its snapshot.
We also noticed that  we encounter this bug only on PV, which works on
RAID10 with SSD disks. We have similar configurations of servers with
SAS disks and we have no problems there.

Please tell us what are the exact conditions of this bug reproduction.
Knowing this, maybe we can build some workarounds.
Maybe you can recommend some workarouds?

The possibility of reconfiguring all our production servers on some
other backend looks terrible.

Here are kernel tracebacks:

May  5 05:54:15 host kernel: [18279579.236829] EXT4-fs (dm-44): write
access unavailable, skipping orphan cleanup
May  5 05:54:15 host kernel: [18279579.326680] EXT4-fs (dm-44):
mounted filesystem without journal. Opts: noload

May  5 05:58:19 host kernel: [18279823.284940] INFO: task
dmeventd:10928 blocked for more than 120 seconds.
May  5 05:58:19 host kernel: [18279823.368599]       Tainted: G
  I E   4.6.0-0.bpo.1-amd64 #1
May  5 05:58:19 host kernel: [18279823.446040] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May  5 05:58:19 host kernel: [18279823.543268] dmeventd        D
fffffffe00000001     0 10928      1 0x00000000
May  5 05:58:19 host kernel: [18279823.543276]  ffff880f514b8fc0
ffff8822a3953300 ffff881004070000 ffff88100406fbd0
May  5 05:58:19 host kernel: [18279823.543278]  ffff8811709ad018
ffff8811709ad000 ffffffff00000000 fffffffe00000001
May  5 05:58:19 host kernel: [18279823.543280]  ffffffff815c4821
ffff880f514b8fc0 ffffffff815c731c ffff88100406fb70
May  5 05:58:19 host kernel: [18279823.543282] Call Trace:
May  5 05:58:19 host kernel: [18279823.543294]  [<ffffffff815c4821>] ?
schedule+0x31/0x80
May  5 05:58:19 host kernel: [18279823.543297]  [<ffffffff815c731c>] ?
rwsem_down_write_failed+0x20c/0x340
May  5 05:58:19 host kernel: [18279823.543304]  [<ffffffff813207f3>] ?
call_rwsem_down_write_failed+0x13/0x20
May  5 05:58:19 host kernel: [18279823.543305]  [<ffffffff815c6b19>] ?
down_write+0x29/0x40
May  5 05:58:19 host kernel: [18279823.543313]  [<ffffffffc04f316c>] ?
snapshot_status+0x7c/0x190 [dm_snapshot]
May  5 05:58:19 host kernel: [18279823.543322]  [<ffffffffc01cdd8a>] ?
retrieve_status+0xaa/0x1c0 [dm_mod]
May  5 05:58:19 host kernel: [18279823.543326]  [<ffffffffc01cee40>] ?
dm_get_live_or_inactive_table.isra.3+0x20/0x20 [dm_mod]
May  5 05:58:19 host kernel: [18279823.543330]  [<ffffffffc01cee9e>] ?
table_status+0x5e/0xa0 [dm_mod]
May  5 05:58:19 host kernel: [18279823.543335]  [<ffffffffc01ceb60>] ?
ctl_ioctl+0x200/0x480 [dm_mod]
May  5 05:58:19 host kernel: [18279823.543340]  [<ffffffffc01cedef>] ?
dm_ctl_ioctl+0xf/0x20 [dm_mod]
May  5 05:58:19 host kernel: [18279823.543343]  [<ffffffff812053a9>] ?
do_vfs_ioctl+0x99/0x5d0
May  5 05:58:19 host kernel: [18279823.543347]  [<ffffffff81087673>] ?
recalc_sigpending+0x13/0x50
May  5 05:58:19 host kernel: [18279823.543349]  [<ffffffff81087f9d>] ?
__set_task_blocked+0x3d/0x90
May  5 05:58:19 host kernel: [18279823.543351]  [<ffffffff8108a8f1>] ?
__set_current_blocked+0x31/0x50
May  5 05:58:19 host kernel: [18279823.543352]  [<ffffffff81205956>] ?
SyS_ioctl+0x76/0x90
May  5 05:58:19 host kernel: [18279823.543355]  [<ffffffff815c8536>] ?
system_call_fast_compare_end+0xc/0x96

May  5 05:58:19 host kernel: [18279823.543458] INFO: task
qemu-system-x86:2691 blocked for more than 120 seconds.
May  5 05:58:19 host kernel: [18279823.633444]       Tainted: G
  I E   4.6.0-0.bpo.1-amd64 #1
May  5 05:58:20 host kernel: [18279823.710952] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May  5 05:58:20 host kernel: [18279823.808225] qemu-system-x86 D
ffff8811f7a96000     0  2691  18325 0x00000000
May  5 05:58:20 host kernel: [18279823.808231]  ffff880df51e25c0
ffff8811eaea4e00 ffff880b250e8000 ffff880b250e77a8
May  5 05:58:20 host kernel: [18279823.808233]  ffff8811709ad018
ffff8811709ad000 ffffffff00000000 fffffffe00000001
May  5 05:58:20 host kernel: [18279823.808235]  ffffffff815c4821
ffff880df51e25c0 ffffffff815c731c ffff880b250e7750
May  5 05:58:20 host kernel: [18279823.808236] Call Trace:
May  5 05:58:20 host kernel: [18279823.808247]  [<ffffffff815c4821>] ?
schedule+0x31/0x80
May  5 05:58:20 host kernel: [18279823.808250]  [<ffffffff815c731c>] ?
rwsem_down_write_failed+0x20c/0x340
May  5 05:58:20 host kernel: [18279823.808256]  [<ffffffff813207f3>] ?
call_rwsem_down_write_failed+0x13/0x20
May  5 05:58:20 host kernel: [18279823.808258]  [<ffffffff815c6b19>] ?
down_write+0x29/0x40
May  5 05:58:20 host kernel: [18279823.808266]  [<ffffffffc04f4729>] ?
__origin_write+0x69/0x200 [dm_snapshot]
May  5 05:58:20 host kernel: [18279823.808272]  [<ffffffffc04f5332>] ?
do_origin.isra.14+0x62/0x80 [dm_snapshot]
May  5 05:58:20 host kernel: [18279823.808286]  [<ffffffffc01c5e25>] ?
__map_bio+0x35/0x100 [dm_mod]
May  5 05:58:20 host kernel: [18279823.808293]  [<ffffffffc01c7369>] ?
__split_and_process_bio+0x229/0x420 [dm_mod]
May  5 05:58:20 host kernel: [18279823.808299]  [<ffffffff810aed1a>] ?
update_curr+0xba/0x130
May  5 05:58:20 host kernel: [18279823.808303]  [<ffffffffc01c75c3>] ?
dm_make_request+0x63/0xc0 [dm_mod]
May  5 05:58:20 host kernel: [18279823.808309]  [<ffffffff812e4176>] ?
generic_make_request+0x106/0x1f0
May  5 05:58:20 host kernel: [18279823.808311]  [<ffffffff812e42cf>] ?
submit_bio+0x6f/0x170
May  5 05:58:20 host kernel: [18279823.808315]  [<ffffffff8122fd72>] ?
do_blockdev_direct_IO+0x2152/0x22d0
May  5 05:58:20 host kernel: [18279823.808320]  [<ffffffff8122a7e0>] ?
I_BDEV+0x10/0x10
May  5 05:58:20 host kernel: [18279823.808322]  [<ffffffff8122ae44>] ?
blkdev_direct_IO+0x54/0x80
May  5 05:58:20 host kernel: [18279823.808327]  [<ffffffff81173cf3>] ?
generic_file_direct_write+0xb3/0x180
May  5 05:58:20 host kernel: [18279823.808329]  [<ffffffff81173e7a>] ?
__generic_file_write_iter+0xba/0x1d0
May  5 05:58:20 host kernel: [18279823.808331]  [<ffffffff8122b0f0>] ?
bd_unlink_disk_holder+0xe0/0xe0
May  5 05:58:20 host kernel: [18279823.808333]  [<ffffffff8122b17f>] ?
blkdev_write_iter+0x8f/0x130
May  5 05:58:20 host kernel: [18279823.808335]  [<ffffffff8122b0f0>] ?
bd_unlink_disk_holder+0xe0/0xe0
May  5 05:58:20 host kernel: [18279823.808339]  [<ffffffff8123cd20>] ?
aio_run_iocb+0x250/0x2c0
May  5 05:58:20 host kernel: [18279823.808376]  [<ffffffffc11cf8f3>] ?
kvm_send_userspace_msi+0x63/0x80 [kvm]
May  5 05:58:20 host kernel: [18279823.808382]  [<ffffffff8123d045>] ?
aio_read_events+0x2b5/0x390
May  5 05:58:20 host kernel: [18279823.808400]  [<ffffffffc11ccfe5>] ?
kvm_vm_ioctl+0x425/0x680 [kvm]
May  5 05:58:20 host kernel: [18279823.808406]  [<ffffffff811d32b9>] ?
kmem_cache_alloc+0xb9/0x230
May  5 05:58:20 host kernel: [18279823.808410]  [<ffffffff8123e461>] ?
do_io_submit+0x271/0x530
May  5 05:58:20 host kernel: [18279823.808413]  [<ffffffff815c8536>] ?
system_call_fast_compare_end+0xc/0x96

May  5 05:58:20 host kernel: [18279823.808535] INFO: task tar:10966
blocked for more than 120 seconds.
May  5 05:58:20 host kernel: [18279823.887118]       Tainted: G
  I E   4.6.0-0.bpo.1-amd64 #1
May  5 05:58:20 host kernel: [18279823.964673] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May  5 05:58:20 host kernel: [18279824.062035] tar             D
ffff8811f7b96000     0 10966  10956 0x00000000
May  5 05:58:20 host kernel: [18279824.062043]  ffff880f51602380
ffff8811eaed2f40 ffff8804a7d60000 ffff8804a7d5f990
May  5 05:58:20 host kernel: [18279824.062045]  ffff8811709ad018
ffff8811709ad000 ffffffff00000000 fffffffe00000001
May  5 05:58:20 host kernel: [18279824.062047]  ffffffff815c4821
ffff880f51602380 ffffffff815c731c ffff8804a7d5f930
May  5 05:58:20 host kernel: [18279824.062049] Call Trace:
May  5 05:58:20 host kernel: [18279824.062061]  [<ffffffff815c4821>] ?
schedule+0x31/0x80
May  5 05:58:20 host kernel: [18279824.062065]  [<ffffffff815c731c>] ?
rwsem_down_write_failed+0x20c/0x340
May  5 05:58:20 host kernel: [18279824.062071]  [<ffffffff813207f3>] ?
call_rwsem_down_write_failed+0x13/0x20
May  5 05:58:20 host kernel: [18279824.062073]  [<ffffffff815c6b19>] ?
down_write+0x29/0x40
May  5 05:58:20 host kernel: [18279824.062082]  [<ffffffffc04f55ca>] ?
snapshot_map+0x5a/0x370 [dm_snapshot]
May  5 05:58:20 host kernel: [18279824.062091]  [<ffffffffc01c5e25>] ?
__map_bio+0x35/0x100 [dm_mod]
May  5 05:58:20 host kernel: [18279824.062095]  [<ffffffffc01c7369>] ?
__split_and_process_bio+0x229/0x420 [dm_mod]
May  5 05:58:20 host kernel: [18279824.062098]  [<ffffffffc01c75c3>] ?
dm_make_request+0x63/0xc0 [dm_mod]
May  5 05:58:20 host kernel: [18279824.062104]  [<ffffffff812e4176>] ?
generic_make_request+0x106/0x1f0
May  5 05:58:20 host kernel: [18279824.062107]  [<ffffffff812e42cf>] ?
submit_bio+0x6f/0x170
May  5 05:58:20 host kernel: [18279824.062112]  [<ffffffff81172b36>] ?
add_to_page_cache_lru+0x76/0xd0
May  5 05:58:20 host kernel: [18279824.062153]  [<ffffffffc026849f>] ?
ext4_mpage_readpages+0x2af/0x890 [ext4]
May  5 05:58:20 host kernel: [18279824.062157]  [<ffffffff811c95ba>] ?
alloc_pages_current+0x8a/0x110
May  5 05:58:20 host kernel: [18279824.062160]  [<ffffffff81181490>] ?
__do_page_cache_readahead+0x1a0/0x250
May  5 05:58:20 host kernel: [18279824.062164]  [<ffffffff810c09ac>] ?
mutex_optimistic_spin+0x15c/0x1c0
May  5 05:58:20 host kernel: [18279824.062165]  [<ffffffff8118160e>] ?
ondemand_readahead+0xce/0x230
May  5 05:58:20 host kernel: [18279824.062168]  [<ffffffff8117475e>] ?
generic_file_read_iter+0x4ee/0x7e0
May  5 05:58:20 host kernel: [18279824.062171]  [<ffffffff811fa675>] ?
pipe_write+0x395/0x410
May  5 05:58:20 host kernel: [18279824.062173]  [<ffffffff811f15c3>] ?
new_sync_read+0xa3/0xe0
May  5 05:58:20 host kernel: [18279824.062175]  [<ffffffff811f1ae1>] ?
vfs_read+0x81/0x120
May  5 05:58:20 host kernel: [18279824.062177]  [<ffffffff811f2f62>] ?
SyS_read+0x52/0xc0
May  5 05:58:20 host kernel: [18279824.062179]  [<ffffffff815c8536>] ?
system_call_fast_compare_end+0xc/0x96

---
Best regards,
Sergey Zhuravlev
