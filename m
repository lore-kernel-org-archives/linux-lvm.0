Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4A2F5C72D
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2018 05:49:29 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0621530E6850
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2018 05:49:28 +0000 (UTC)
Message-Id: <5B6D2760020000F90002E4C9@prv1-mh.provo.novell.com>
Date: Thu, 09 Aug 2018 23:49:20 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2 commands sometimes were hanged after upgrade to
 v2.02.180 from v2.02.120
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
To: linux-lvm@redhat.com

Hello List,

I am using LVM2 v2.02.180 in a clvmd based cluster (three nodes), but sometimes I encountered lvm2 command hang problem.
When the comand is hanged, all lvm2 related commands from each node will be hanged.
For example,
First command was hanged at node 2,
sle12sp4b2-nd2:/ # pvmove -i 5 -v /dev/vdb /dev/vdc
    Archiving volume group "cluster-vg2" metadata (seqno 34).
    Creating logical volume pvmove1
    Moving 2560 extents of logical volume cluster-vg2/test-lv.

sle12sp4b2-nd2:/ # cat /proc/15074/stack
[<ffffffffb4662f4b>] unix_stream_read_generic+0x66b/0x870
[<ffffffffb4663215>] unix_stream_recvmsg+0x45/0x50
[<ffffffffb459ad66>] sock_read_iter+0x86/0xd0
[<ffffffffb4240239>] __vfs_read+0xd9/0x140
[<ffffffffb4240fe7>] vfs_read+0x87/0x130
[<ffffffffb42424a2>] SyS_read+0x42/0x90
[<ffffffffb4003924>] do_syscall_64+0x74/0x150
[<ffffffffb480009a>] entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[<ffffffffffffffff>] 0xffffffffffffffff

Then, I run "lvs command on each node, the command was hanged, like
sle12sp4b2-nd2:/ # lvs

sle12sp4b2-nd2:/ # cat /proc/15553/stack
[<ffffffffc059b638>] dm_consult_userspace+0x1e8/0x490 [dm_log_userspace]
[<ffffffffc059a273>] userspace_do_request.isra.3+0x53/0x140 [dm_log_userspace]
[<ffffffffc059a8f7>] userspace_status+0xa7/0x1c0 [dm_log_userspace]
[<ffffffffc0444259>] mirror_status+0x1a9/0x370 [dm_mirror]
[<ffffffffc020751d>] retrieve_status+0xad/0x1c0 [dm_mod]
[<ffffffffc0208561>] table_status+0x51/0x80 [dm_mod]
[<ffffffffc0208258>] ctl_ioctl+0x1d8/0x450 [dm_mod]
[<ffffffffc02084da>] dm_ctl_ioctl+0xa/0x10 [dm_mod]
[<ffffffffb4256c92>] do_vfs_ioctl+0x92/0x5e0
[<ffffffffb4257254>] SyS_ioctl+0x74/0x80
[<ffffffffb4003924>] do_syscall_64+0x74/0x150
[<ffffffffb480009a>] entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[<ffffffffffffffff>] 0xffffffffffffffff


Since I am trying to upgrade LVM2 from vv2.02.120 to v2.02.180, 
I do not know what is the real cause to this problem? 
maybe it is related to /etc/lvm/lvm.conf file? since the item raid_region_size = 2048 in the new conf, but in the past conf raid_region_size = 512,
or any other configuration items? 

To fix this problem, I have to make the configuration file is consistent on each node, and reboot all the nodes.

Thanks
Gang
