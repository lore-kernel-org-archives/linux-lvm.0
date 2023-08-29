Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C86C6FA8F
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Aug 2023 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693282321;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jpqWWk8tGo7ESJkPP98CVsQ6BLbTs98YNZd/xydm5bo=;
	b=cxKokUSUqmeozwb/W07TjKWUQIVswARg911598s8sdgzIYuidsX/k9YctY4EJBE2Rl9ZTc
	/xSmn5PcckC3JUQCaaXk7TdhGy6Us82I6X/OTi9pBsuAtFUUNAF1TNGLz5lBCoKifekhGf
	IIvBkBsgJkTwSsN8URoqMUfxcKnDnzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-an_inyQ5PzaMk_iHB-RW2Q-1; Tue, 29 Aug 2023 00:11:58 -0400
X-MC-Unique: an_inyQ5PzaMk_iHB-RW2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCA9A85CCFE;
	Tue, 29 Aug 2023 04:11:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2B6F2166B25;
	Tue, 29 Aug 2023 04:11:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A2D819465B6;
	Tue, 29 Aug 2023 04:11:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4ACE31946588
 for <linux-lvm@listman.corp.redhat.com>; Tue, 29 Aug 2023 04:11:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2CC032026D68; Tue, 29 Aug 2023 04:11:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 262842026D4B
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 04:11:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F9E80556B
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 04:11:47 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-hZE5clvION-J0p0i6ZZ0GQ-1; Tue, 29 Aug 2023 00:11:44 -0400
X-MC-Unique: hZE5clvION-J0p0i6ZZ0GQ-1
Received: from dggpemm500014.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RZYQ63pKnzrSJG
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 11:51:42 +0800 (CST)
Received: from [10.174.178.78] (10.174.178.78) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 29 Aug 2023 11:53:19 +0800
Message-ID: <0b5edc8d-6ba6-0c8a-3d5c-84f9f7bc4d13@huawei.com>
Date: Tue, 29 Aug 2023 11:53:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: <linux-lvm@redhat.com>
From: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>
X-Originating-IP: [10.174.178.78]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [linux-lvm] vgchange acquire an exclusive VG lock for refresh
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: lixiaokeng@huawei.com, louhongxiang@huawei.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I've got an issue while execute vgchange --refresh concurrently, process vgchange and systemd-udevd
enters the D state.
root        2933  0.0  1.0  54216 31344 pts/1    D<L  11:21   0:00 vgchange --refresh
root        2934  0.0  1.1  54216 32788 pts/1    D<L  11:21   0:00 vgchange --refresh
root        2935  0.0  1.0  54216 31496 pts/1    D<L  11:21   0:00 vgchange --refresh
root        2937  0.0  1.0  54216 31500 pts/1    S<L  11:21   0:00 vgchange --refresh
root        2951  0.0  0.0      0     0 ?        D    11:21   0:00 [systemd-udevd]
root        2952  0.0  0.0      0     0 ?        D    11:21   0:00 [systemd-udevd]

process stack as follows
[root@localhost ~]# cat /proc/2937/stack
[<0>] dm_wait_for_bios_completion+0x298/0x340 [dm_mod]
[<0>] dm_wait_for_completion+0xfe/0x110 [dm_mod]
[<0>] __dm_suspend+0xd0/0x310 [dm_mod]
[<0>] dm_suspend+0x133/0x180 [dm_mod]
[<0>] dev_suspend+0x115/0x150 [dm_mod]
[<0>] ctl_ioctl+0x320/0x4c0 [dm_mod]
[<0>] dm_ctl_ioctl+0x26/0x40 [dm_mod]
[<0>] __se_sys_ioctl+0xeb/0x120
[<0>] do_syscall_64+0x30/0x40
[<0>] entry_SYSCALL_64_after_hwframe+0x61/0xc6
[root@localhost ~]# cat /proc/2935/stack
[<0>] dm_suspend+0x2b/0x180 [dm_mod]
[<0>] dev_suspend+0x115/0x150 [dm_mod]
[<0>] ctl_ioctl+0x320/0x4c0 [dm_mod]
[<0>] dm_ctl_ioctl+0x26/0x40 [dm_mod]
[<0>] __se_sys_ioctl+0xeb/0x120
[<0>] do_syscall_64+0x30/0x40
[<0>] entry_SYSCALL_64_after_hwframe+0x61/0xc6
[root@localhost ~]# cat /proc/2951/stack
[<0>] __lock_page+0x25a/0x7a0
[<0>] truncate_inode_pages_range+0xc52/0x1370
[<0>] __blkdev_put+0x15b/0x3f0
[<0>] blkdev_close+0x49/0x60
[<0>] __fput+0x1b9/0x480
[<0>] task_work_run+0xad/0xf0
[<0>] do_exit+0x47f/0x810
[<0>] do_group_exit+0x77/0x150
[<0>] get_signal+0x2a2/0xa60
[<0>] arch_do_signal_or_restart+0x1c6/0x310
[<0>] exit_to_user_mode_loop+0xdb/0x100
[<0>] exit_to_user_mode_prepare+0x7e/0x90
[<0>] syscall_exit_to_user_mode+0x12/0x40
[<0>] entry_SYSCALL_64_after_hwframe+0x61/0xc6

I recommend get an exclusive lock when vgchange --refresh.

From 7ddadf2bbbe0383893ab8f5b7cb8d51ebf7a5ed4 Mon Sep 17 00:00:00 2001
From: wangzhiqiang <wangzhiqiang95@huawei.com>
Date: Tue, 29 Aug 2023 10:28:15 +0800
Subject: [PATCH] vgchange acquire an exclusive VG lock for refresh.

Let's run the following test cases, we've got hungtask.
P2 or P3 can't suspend snap and udevd also can't read
device info because real or cow has been suspend.

    P1(vgchange)      P2(vgchange)      P3(vgchange)
--------------------------------------------------------
    suspend real
    suspend cow
                      suspend snap
                                        suspend snap
    suspend snap

function query()
{
        while true
        do
                vgchange --refresh
        done
}

query 1 &> /dev/null &
query 2 &> /dev/null &
query 3 &> /dev/null &

[  247.250669] INFO: task vgchange:2934 blocked for more than 122 seconds.
[  247.251935] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  247.252619] task:vgchange        state:D stack:    0 pid: 2934 ppid:  2930 flags:0x00000080
[  247.252626] Call Trace:
[  247.252633]  __schedule+0x547/0xe80
[  247.252640]  ? io_schedule_timeout+0xb0/0xb0
[  247.252647]  ? _raw_spin_lock+0x7a/0xd0
[  247.252652]  schedule+0x6f/0x130
[  247.252658]  schedule_preempt_disabled+0xa/0x10
[  247.252664]  __mutex_lock.constprop.0+0x311/0x700
[  247.252673]  ? kernel_text_address.part.0+0xb9/0xc0
[  247.252678]  ? ww_mutex_unlock+0x50/0x50
[  247.252685]  ? unwind_get_return_address+0x33/0x50
[  247.252692]  ? cred_has_capability.isra.0+0x14b/0x220
[  247.252698]  ? check_nnp_nosuid.isra.0+0x170/0x170
[  247.252704]  mutex_lock+0x114/0x130
[  247.252710]  ? __mutex_lock_slowpath+0x10/0x10
[  247.252716]  ? rwsem_down_write_slowpath+0x830/0x830
[  247.252733]  ? dm_get+0x40/0x70 [dm_mod]
[  247.252752]  ? dm_get_md+0xb3/0x120 [dm_mod]
[  247.252770]  dm_suspend+0x2b/0x180 [dm_mod]
[  247.252788]  dev_suspend+0x115/0x150 [dm_mod]
[  247.252805]  ctl_ioctl+0x320/0x4c0 [dm_mod]
[  247.252823]  ? dev_set_geometry+0x290/0x290 [dm_mod]
[  247.252841]  ? copy_params+0x2e0/0x2e0 [dm_mod]
[  247.252846]  ? locks_dispose_list+0xa0/0xd0
[  247.252851]  ? locks_remove_posix+0x24f/0x340
[  247.252856]  ? locks_remove_flock+0x1e6/0x250
[  247.252865]  ? ioctl_fiemap.isra.0+0x110/0x1e0
[  247.252872]  ? vfs_write+0x2a5/0x440
[  247.252877]  ? selinux_file_ioctl+0x89/0x1c0
[  247.252895]  ? ctl_ioctl+0x4c0/0x4c0 [dm_mod]
[  247.252912]  dm_ctl_ioctl+0x26/0x40 [dm_mod]
[  247.252918]  __se_sys_ioctl+0xeb/0x120
[  247.252923]  do_syscall_64+0x30/0x40
[  247.252929]  entry_SYSCALL_64_after_hwframe+0x61/0xc6

[  247.252967] INFO: task vgchange:2935 blocked for more than 122 seconds.
[  247.254242] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  247.254909] task:vgchange        state:D stack:    0 pid: 2935 ppid:  2931 flags:0x00000080
[  247.254922] Call Trace:
[  247.254929]  __schedule+0x547/0xe80
[  247.254935]  ? io_schedule_timeout+0xb0/0xb0
[  247.254942]  ? _raw_spin_lock+0x7a/0xd0
[  247.254947]  schedule+0x6f/0x130
[  247.254953]  schedule_preempt_disabled+0xa/0x10
[  247.254959]  __mutex_lock.constprop.0+0x311/0x700
[  247.254965]  ? kernel_text_address.part.0+0xb9/0xc0
[  247.254976]  ? ww_mutex_unlock+0x50/0x50
[  247.254981]  ? unwind_get_return_address+0x33/0x50
[  247.254988]  ? cred_has_capability.isra.0+0x14b/0x220
[  247.254995]  ? check_nnp_nosuid.isra.0+0x170/0x170
[  247.255000]  mutex_lock+0x114/0x130
[  247.255006]  ? __mutex_lock_slowpath+0x10/0x10
[  247.255012]  ? rwsem_down_write_slowpath+0x830/0x830
[  247.255029]  ? dm_get+0x40/0x70 [dm_mod]
[  247.255052]  ? dm_get_md+0xb3/0x120 [dm_mod]
[  247.255069]  dm_suspend+0x2b/0x180 [dm_mod]
[  247.255088]  dev_suspend+0x115/0x150 [dm_mod]
[  247.255113]  ctl_ioctl+0x320/0x4c0 [dm_mod]
[  247.255142]  ? dev_set_geometry+0x290/0x290 [dm_mod]
[  247.255160]  ? copy_params+0x2e0/0x2e0 [dm_mod]
[  247.255175]  ? nohz_balance_exit_idle+0x2b/0x160
[  247.255187]  ? rb_insert_color+0x2a/0x280
[  247.255196]  ? ioctl_fiemap.isra.0+0x110/0x1e0
[  247.255202]  ? selinux_file_ioctl+0x89/0x1c0
[  247.255219]  ? ctl_ioctl+0x4c0/0x4c0 [dm_mod]
[  247.255238]  dm_ctl_ioctl+0x26/0x40 [dm_mod]
[  247.255250]  __se_sys_ioctl+0xeb/0x120
[  247.255255]  do_syscall_64+0x30/0x40
[  247.255262]  entry_SYSCALL_64_after_hwframe+0x61/0xc6

[  493.015195] INFO: task systemd-udevd:2951 blocked for more than 122 seconds.
[  493.016461] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  493.017131] task:systemd-udevd   state:D stack:    0 pid: 2951 ppid:   719 flags:0x000043a6
[  493.017138] Call Trace:
[  493.017145]  __schedule+0x547/0xe80
[  493.017152]  ? io_schedule_timeout+0xb0/0xb0
[  493.017157]  ? orc_find.part.0+0x240/0x240
[  493.017163]  ? get_stack_info_noinstr+0x16/0x140
[  493.017171]  ? bpf_ksym_find+0xc0/0x110
[  493.017189]  schedule+0x6f/0x130
[  493.017195]  io_schedule+0x6d/0xa0
[  493.017202]  __lock_page+0x25a/0x7a0
[  493.017209]  ? wait_on_page_bit_killable+0x6c0/0x6c0
[  493.017216]  ? __lock_page_or_retry+0x3e0/0x3e0
[  493.017222]  ? add_to_page_cache_lru+0x370/0x370
[  493.017231]  truncate_inode_pages_range+0xc52/0x1370
[  493.017242]  ? generic_error_remove_page+0x90/0x90
[  493.017248]  ? __filemap_fdatawait_range+0x179/0x270
[  493.017256]  ? filemap_range_has_page+0x170/0x170
[  493.017264]  ? __bitmap_or_equal+0x89/0x120
[  493.017271]  ? _find_next_bit.constprop.0+0xde/0x120
[  493.017279]  ? cpumask_next+0x2c/0x40
[  493.017287]  ? smp_call_function_many_cond+0x430/0x5f0
[  493.017295]  ? touch_buffer+0xa0/0xa0
[  493.017305]  ? __find_get_block+0x110/0x110
[  493.017311]  ? __find_get_block+0x110/0x110
[  493.017316]  ? touch_buffer+0xa0/0xa0
[  493.017322]  __blkdev_put+0x15b/0x3f0
[  493.017328]  ? blkdev_put+0x1c0/0x1c0
[  493.017333]  blkdev_close+0x49/0x60
[  493.017339]  __fput+0x1b9/0x480
[  493.017346]  task_work_run+0xad/0xf0
[  493.017354]  do_exit+0x47f/0x810
[  493.017361]  ? exit_mm+0x450/0x450
[  493.017371]  ? _raw_spin_lock_irq+0x7b/0xd0
[  493.017377]  do_group_exit+0x77/0x150
[  493.017384]  get_signal+0x2a2/0xa60
[  493.017393]  arch_do_signal_or_restart+0x1c6/0x310
[  493.017399]  ? get_sigframe_size+0x20/0x20
[  493.017405]  ? vfs_read+0x1f6/0x2d0
[  493.017411]  ? unroll_tree_refs+0x18a/0x1e0
[  493.017424]  exit_to_user_mode_loop+0xdb/0x100
[  493.017430]  exit_to_user_mode_prepare+0x7e/0x90
[  493.017438]  syscall_exit_to_user_mode+0x12/0x40
[  493.017445]  entry_SYSCALL_64_after_hwframe+0x61/0xc6

cat /proc/2937/stack
[<0>] dm_wait_for_bios_completion+0x298/0x340 [dm_mod]
[<0>] dm_wait_for_completion+0xfe/0x110 [dm_mod]
[<0>] __dm_suspend+0xd0/0x310 [dm_mod]
[<0>] dm_suspend+0x133/0x180 [dm_mod]
[<0>] dev_suspend+0x115/0x150 [dm_mod]
[<0>] ctl_ioctl+0x320/0x4c0 [dm_mod]
[<0>] dm_ctl_ioctl+0x26/0x40 [dm_mod]
[<0>] __se_sys_ioctl+0xeb/0x120
[<0>] do_syscall_64+0x30/0x40
[<0>] entry_SYSCALL_64_after_hwframe+0x61/0xc6

Signed-off-by: wangzhiqiang <wangzhiqiang95@huawei.com>
---
 tools/vgchange.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/vgchange.c b/tools/vgchange.c
index e4b57db..eb3096d 100644
--- a/tools/vgchange.c
+++ b/tools/vgchange.c
@@ -837,7 +837,7 @@ int vgchange(struct cmd_context *cmd, int argc, char **argv)
                        cmd->lockd_vg_enforce_sh = 1;
        }

-       if (update)
+       if (update || arg_is_set(cmd, refresh_ARG))
                flags |= READ_FOR_UPDATE;
        else if (arg_is_set(cmd, activate_ARG))
                flags |= READ_FOR_ACTIVATE;
--
2.33.0

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

