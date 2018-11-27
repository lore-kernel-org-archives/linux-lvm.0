Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 360E24F6A0
	for <linux-lvm@redhat.com>; Tue, 27 Nov 2018 17:38:40 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
	[209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52B8F3DE04
	for <linux-lvm@redhat.com>; Tue, 27 Nov 2018 17:38:38 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id j3so7900284uap.3
	for <linux-lvm@redhat.com>; Tue, 27 Nov 2018 09:38:38 -0800 (PST)
MIME-Version: 1.0
References: <CAOp5WB5YdUwQ5ieQ558mgFbZ3HDDaUMikORm7TpeAARmitO9=g@mail.gmail.com>
In-Reply-To: <CAOp5WB5YdUwQ5ieQ558mgFbZ3HDDaUMikORm7TpeAARmitO9=g@mail.gmail.com>
From: Andrew Hall <andyjohnhall@gmail.com>
Date: Tue, 27 Nov 2018 17:38:24 +0000
Message-ID: <CAOp5WB6rNbke5VKYoGS2GJfUs=C4MT6N-NHLTCMX-duSSeD1nw@mail.gmail.com>
Subject: Re: [linux-lvm] lvextend operation results in suspended volume
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

OK so we followed the pvcreate --restorefile option from the following
document and set /dev/sdb1 to have the lower number of extents in the
file (manually edited) to 4291534 and it worked !
https://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mdatarecover.html

We were then able to activate the LV and mount it again with all the
data available. I hope this helps if anyone searches this list in
future. Thanks.

On Mon, 26 Nov 2018 at 18:24, Andrew Hall <andyjohnhall@gmail.com> wrote:
>
> Can anyone confirm if the following situation is recoverable or not ?
> Thanks very much.
>
> 1. We have an LV which was recently extended using a VG with
> sufficient PE available. A filesystem resize operation was included
> with the -r flag :
>
> description = "Created *before* executing 'lvextend -L+100G -r
> /dev/vgname/lvname'"
> creation_time = 1542042235      # Mon Nov 12 17:03:55 2018
>
> 2. We then see the following in syslog confirming completion of this operation :
>
> Nov 12 17:04:06 servername kernel: EXT4-fs (dm-2): resizing filesystem
> from 7739015168 to 7765229568 blocks
> Nov 12 17:04:08 servername kernel: EXT4-fs (dm-2): resized filesystem
> to 7765229568
>
> 3. A few minutes later we see a further extend and resize operation :
>
> description = "Created *before* executing 'lvextend -L+200G -r
> /dev/vgname/lvname'"
> creation_time = 1542042358      # Mon Nov 12 17:05:58 2018
>
> 4. We then see the following in the syslog confirming errors with this
> operation :
>
> Nov 12 17:05:59 servername kernel: device-mapper: table: 253:2: sdb1
> too small for target: start=35156248576, len=37756928,
> dev_size=35156248576
>
> Nov 12 17:08:09 servername kernel: INFO: task jbd2/dm-2-8:698 blocked
> for more than 120 seconds.
> Nov 12 17:08:09 servername kernel: "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Nov 12 17:08:09 servername kernel: jbd2/dm-2-8     D ffff8804682b7c30
>    0   698      2 0x00000000
> Nov 12 17:08:09 servername kernel: ffff8804682b7ad0 0000000000000046
> ffff8804639ab980 ffff8804682b7fd8
> Nov 12 17:08:09 servername kernel: ffff8804682b7fd8 ffff8804682b7fd8
> ffff8804639ab980 ffff88047fc54780
> Nov 12 17:08:09 servername kernel: 0000000000000000 7fffffffffffffff
> ffffffff812112d0 ffff8804682b7c30
> Nov 12 17:08:09 servername kernel: Call Trace:
> Nov 12 17:08:09 servername kernel: [<ffffffff812112d0>] ?
> generic_block_bmap+0x70/0x70
> Nov 12 17:08:09 servername kernel: [<ffffffff8163a909>] schedule+0x29/0x70
> Nov 12 17:08:09 servername kernel: [<ffffffff816385f9>]
> schedule_timeout+0x209/0x2d0
> Nov 12 17:08:09 servername kernel: [<ffffffff8101c829>] ? read_tsc+0x9/0x10
> Nov 12 17:08:09 servername kernel: [<ffffffff810d814c>] ?
> ktime_get_ts64+0x4c/0xf0
> Nov 12 17:08:09 servername kernel: [<ffffffff8101c829>] ? read_tsc+0x9/0x10
> Nov 12 17:08:09 servername kernel: [<ffffffff812112d0>] ?
> generic_block_bmap+0x70/0x70
> Nov 12 17:08:09 servername kernel: [<ffffffff81639f3e>]
> io_schedule_timeout+0xae/0x130
> Nov 12 17:08:09 servername kernel: [<ffffffff81639fd8>] io_schedule+0x18/0x20
> Nov 12 17:08:09 servername kernel: [<ffffffff812112de>] sleep_on_buffer+0xe/0x20
> Nov 12 17:08:09 servername kernel: [<ffffffff81638780>] __wait_on_bit+0x60/0x90
> Nov 12 17:08:09 servername kernel: [<ffffffff812112d0>] ?
> generic_block_bmap+0x70/0x70
> Nov 12 17:08:09 servername kernel: [<ffffffff81638837>]
> out_of_line_wait_on_bit+0x87/0xb0
> Nov 12 17:08:09 servername kernel: [<ffffffff810a6b60>] ?
> wake_atomic_t_function+0x40/0x40
> Nov 12 17:08:09 servername kernel: [<ffffffff8121289a>]
> __wait_on_buffer+0x2a/0x30
> Nov 12 17:08:09 servername kernel: [<ffffffffa042bd58>]
> jbd2_journal_commit_transaction+0xe88/0x19a0 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff81013588>] ? __switch_to+0xf8/0x4b0
> Nov 12 17:08:09 servername kernel: [<ffffffffa0430d79>]
> kjournald2+0xc9/0x260 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff810a6ae0>] ?
> wake_up_atomic_t+0x30/0x30
> Nov 12 17:08:09 servername kernel: [<ffffffffa0430cb0>] ?
> commit_timeout+0x10/0x10 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff810a5aef>] kthread+0xcf/0xe0
> Nov 12 17:08:09 servername kernel: [<ffffffff810a5a20>] ?
> kthread_create_on_node+0x140/0x140
> Nov 12 17:08:09 servername kernel: [<ffffffff81645858>] ret_from_fork+0x58/0x90
> Nov 12 17:08:09 servername kernel: [<ffffffff810a5a20>] ?
> kthread_create_on_node+0x140/0x140
> Nov 12 17:08:09 servername kernel: INFO: task kworker/u12:1:17864
> blocked for more than 120 seconds.
> Nov 12 17:08:09 servername kernel: "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Nov 12 17:08:09 servername kernel: kworker/u12:1   D ffff88025a3f36b0
>    0 17864      2 0x00000080
> Nov 12 17:08:09 servername kernel: Workqueue: writeback
> bdi_writeback_workfn (flush-253:2)
> Nov 12 17:08:09 servername kernel: ffff88025a3f3550 0000000000000046
> ffff880018d2e780 ffff88025a3f3fd8
> Nov 12 17:08:09 servername kernel: ffff88025a3f3fd8 ffff88025a3f3fd8
> ffff880018d2e780 ffff88047fd14780
> Nov 12 17:08:09 servername kernel: 0000000000000000 7fffffffffffffff
> ffffffffa0428720 ffff88025a3f36b0
> Nov 12 17:08:09 servername kernel: Call Trace:
> Nov 12 17:08:09 servername kernel: [<ffffffffa0428720>] ?
> start_this_handle+0x5d0/0x5d0 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff8163a909>] schedule+0x29/0x70
> Nov 12 17:08:09 servername kernel: [<ffffffff816385f9>]
> schedule_timeout+0x209/0x2d0
> Nov 12 17:08:09 servername kernel: [<ffffffff812e7049>] ?
> blk_throtl_bio+0xc9/0x550
> Nov 12 17:08:09 servername kernel: [<ffffffff8101c829>] ? read_tsc+0x9/0x10
> Nov 12 17:08:09 servername kernel: [<ffffffffa0428720>] ?
> start_this_handle+0x5d0/0x5d0 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff81639f3e>]
> io_schedule_timeout+0xae/0x130
> Nov 12 17:08:09 servername kernel: [<ffffffff81639fd8>] io_schedule+0x18/0x20
> Nov 12 17:08:09 servername kernel: [<ffffffffa042872e>]
> sleep_on_shadow_bh+0xe/0x20 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff81638780>] __wait_on_bit+0x60/0x90
> Nov 12 17:08:09 servername kernel: [<ffffffffa0428720>] ?
> start_this_handle+0x5d0/0x5d0 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff81638837>]
> out_of_line_wait_on_bit+0x87/0xb0
> Nov 12 17:08:09 servername kernel: [<ffffffff810a6b60>] ?
> wake_atomic_t_function+0x40/0x40
> Nov 12 17:08:09 servername kernel: [<ffffffffa0429bad>]
> do_get_write_access+0x2dd/0x4e0 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffff81212cbd>] ? __getblk+0x2d/0x2e0
> Nov 12 17:08:09 servername kernel: [<ffffffffa0429794>] ?
> __jbd2_journal_file_buffer+0xe4/0x220 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffffa0429dd7>]
> jbd2_journal_get_write_access+0x27/0x40 [jbd2]
> Nov 12 17:08:09 servername kernel: [<ffffffffa056910b>]
> __ext4_journal_get_write_access+0x3b/0x80 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffffa0537950>]
> ext4_reserve_inode_write+0x70/0xa0 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffffa053ade0>] ?
> ext4_dirty_inode+0x40/0x60 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffffa05379d3>]
> ext4_mark_inode_dirty+0x53/0x210 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffffa053ade0>]
> ext4_dirty_inode+0x40/0x60 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffff8120b5ca>]
> __mark_inode_dirty+0xca/0x290
> Nov 12 17:08:09 servername kernel: [<ffffffffa0534b2d>]
> ext4_da_update_reserve_space+0x13d/0x190 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffffa0566ee5>]
> ext4_ext_map_blocks+0x9d5/0xed0 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffffa0534cf9>]
> ext4_map_blocks+0x179/0x590 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffffa0538222>]
> ext4_writepages+0x692/0xd60 [ext4]
> Nov 12 17:08:09 servername kernel: [<ffffffff811758fe>] do_writepages+0x1e/0x40
> Nov 12 17:08:09 servername kernel: [<ffffffff81208410>]
> __writeback_single_inode+0x40/0x220
> Nov 12 17:08:09 servername kernel: [<ffffffff81208e7e>]
> writeback_sb_inodes+0x25e/0x420
> Nov 12 17:08:09 servername kernel: [<ffffffff812090df>]
> __writeback_inodes_wb+0x9f/0xd0
> Nov 12 17:08:09 servername kernel: [<ffffffff81209923>] wb_writeback+0x263/0x2f0
> Nov 12 17:08:09 servername kernel: [<ffffffff811f875c>] ?
> get_nr_inodes+0x4c/0x70
> Nov 12 17:08:09 servername kernel: [<ffffffff8120bbab>]
> bdi_writeback_workfn+0x2cb/0x460
> Nov 12 17:08:09 servername kernel: [<ffffffff8109d5fb>]
> process_one_work+0x17b/0x470
> Nov 12 17:08:09 servername kernel: [<ffffffff8109e3cb>]
> worker_thread+0x11b/0x400
> Nov 12 17:08:09 servername kernel: [<ffffffff8109e2b0>] ?
> rescuer_thread+0x400/0x400
> Nov 12 17:08:09 servername kernel: [<ffffffff810a5aef>] kthread+0xcf/0xe0
> Nov 12 17:08:09 servername kernel: [<ffffffff810a5a20>] ?
> kthread_create_on_node+0x140/0x140
> Nov 12 17:08:09 servername kernel: [<ffffffff81645858>] ret_from_fork+0x58/0x90
> Nov 12 17:08:09 servername kernel: [<ffffffff810a5a20>] ?
> kthread_create_on_node+0x140/0x140
>
> 5. The system was then broke at that point as the LV was suspended :
>
> [root@servername ~]# lvdisplay /dev/vgname/lvname | grep Status
>   LV Status              suspended
>
> 6. Any attempt to activate it results in the following :
>
> [root@servername ~]# lvchange -ay /dev/vgname/lvname
>   device-mapper: resume ioctl on (253:2) failed: Invalid argument
>   Unable to resume vgname-lvname (253:2)
>
> [98337.345943] device-mapper: table: 253:2: sdb1 too small for target:
> start=35156248576, len=37756928, dev_size=35156248576
>
> [root@servername ~]# pvresize /dev/sdb1
>   /dev/sdb1: cannot resize to 4291534 extents as 4296143 are allocated.
>   0 physical volume(s) resized / 1 physical volume(s) not resized
>
> 7. Prior to the operation we see the following VG config file :
>
> [root@servername archive]# cat vgname_00014-1742536132.vg
> # Generated by LVM2 version 2.02.130(2)-RHEL7 (2015-10-14): Mon Nov 12
> 17:05:58 2018
>
> contents = "Text Format Volume Group"
> version = 1
>
> description = "Created *before* executing 'lvextend -L+200G -r
> /dev/vgname/lvname'"
> creation_time = 1542042358    # Mon Nov 12 17:05:58 2018
>
> vgname {
>     id = "D0lvmr-QXbz-4hmv-IFMn-KGku-B0ER-dMt60n"
>     seqno = 14
>     format = "lvm2"            # informational
>     status = ["RESIZEABLE", "READ", "WRITE"]
>     flags = []
>     extent_size = 8192        # 4 Megabytes
>     max_lv = 0
>     max_pv = 0
>     metadata_copies = 0
>
>     physical_volumes {
>
>         pv0 {
>             id = "gw60sW-aoKL-Cfcf-h2aV-cgHY-yrtq-i7zB5C"
>             device = "/dev/sdb1"    # Hint only
>
>             status = ["ALLOCATABLE"]
>             flags = []
>             dev_size = 36228047093    # 16.87 Terabytes
>             pe_start = 2048
>             pe_count = 4422369    # 16.87 Terabytes
>         }
>
>         pv1 {
>             id = "ntEAG3-JMQ8-WEqf-kGcR-Qgeb-lHEF-2jbVbs"
>             device = "/dev/sdb2"    # Hint only
>
>             status = ["ALLOCATABLE"]
>             flags = []
>             dev_size = 27347265536    # 12.7346 Terabytes
>             pe_start = 2048
>             pe_count = 3338289    # 12.7346 Terabytes
>         }
>     }
>
>     logical_volumes {
>
>         lvname {
>             id = "oUcIdD-uD5m-M0EY-33XQ-U5Yn-7ez1-ejRzbZ"
>             status = ["READ", "WRITE", "VISIBLE"]
>             flags = []
>             creation_host = "servername"
>             creation_time = 1477501162    # 2016-10-26 17:59:22 +0100
>             segment_count = 2
>
>             segment1 {
>                 start_extent = 0
>                 extent_count = 4291534    # 16.3709 Terabytes
>
>                 type = "striped"
>                 stripe_count = 1    # linear
>
>                 stripes = [
>                     "pv0", 0
>                 ]
>             }
>             segment2 {
>                 start_extent = 4291534
>                 extent_count = 3291698    # 12.5568 Terabytes
>
>                 type = "striped"
>                 stripe_count = 1    # linear
>
>                 stripes = [
>                     "pv1", 0
>                 ]
>             }
>         }
>     }
> }
>
> 8. Any operation afterwards shows the following extra segment in the
> lvname volume :
>
> [root@servername archive]# cat vgname_00015-765415489.vg
> # Generated by LVM2 version 2.02.130(2)-RHEL7 (2015-10-14): Fri Nov 23
> 10:56:50 2018
>
> contents = "Text Format Volume Group"
> version = 1
>
> description = "Created *before* executing 'pvresize -v /dev/sdb1'"
> creation_time = 1542970610    # Fri Nov 23 10:56:50 2018
>
> vgname {
>     id = "D0lvmr-QXbz-4hmv-IFMn-KGku-B0ER-dMt60n"
>     seqno = 15
>     format = "lvm2"            # informational
>     status = ["RESIZEABLE", "READ", "WRITE"]
>     flags = []
>     extent_size = 8192        # 4 Megabytes
>     max_lv = 0
>     max_pv = 0
>     metadata_copies = 0
>
>     physical_volumes {
>
>         pv0 {
>             id = "gw60sW-aoKL-Cfcf-h2aV-cgHY-yrtq-i7zB5C"
>             device = "/dev/sdb1"    # Hint only
>
>             status = ["ALLOCATABLE"]
>             flags = []
>             dev_size = 36228047093    # 16.87 Terabytes
>             pe_start = 2048
>             pe_count = 4422369    # 16.87 Terabytes
>         }
>
>         pv1 {
>             id = "ntEAG3-JMQ8-WEqf-kGcR-Qgeb-lHEF-2jbVbs"
>             device = "/dev/sdb2"    # Hint only
>
>             status = ["ALLOCATABLE"]
>             flags = []
>             dev_size = 27347265536    # 12.7346 Terabytes
>             pe_start = 2048
>             pe_count = 3338289    # 12.7346 Terabytes
>         }
>     }
>
>     logical_volumes {
>
>         lvname {
>             id = "oUcIdD-uD5m-M0EY-33XQ-U5Yn-7ez1-ejRzbZ"
>             status = ["READ", "WRITE", "VISIBLE"]
>             flags = []
>             creation_host = "servername"
>             creation_time = 1477501162    # 2016-10-26 17:59:22 +0100
>             segment_count = 3
>
>             segment1 {
>                 start_extent = 0
>                 extent_count = 4291534    # 16.3709 Terabytes
>
>                 type = "striped"
>                 stripe_count = 1    # linear
>
>                 stripes = [
>                     "pv0", 0
>                 ]
>             }
>             segment2 {
>                 start_extent = 4291534
>                 extent_count = 3338289    # 12.7346 Terabytes
>
>                 type = "striped"
>                 stripe_count = 1    # linear
>
>                 stripes = [
>                     "pv1", 0
>                 ]
>             }
>             segment3 {
>                 start_extent = 7629823
>                 extent_count = 4609    # 18.0039 Gigabytes
>
>                 type = "striped"
>                 stripe_count = 1    # linear
>
>                 stripes = [
>                     "pv0", 4291534
>                 ]
>             }
>         }
>     }
> }
>
> 9. Note that segment1 extent_count(4291534) + segment3
> extent_count(4609) = 4296143 which relates to the following error :
>
> /dev/sdb1: cannot resize to 4291534 extents as 4296143 are allocated.
>
> Any thoughts on how to potentially recover from this would be most
> greatly appreciated ! Thanks very much.
