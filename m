Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0UFvaho018843
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2012 10:57:36 -0500
Received: from inet07.hamilton.harte-lyne.ca (inet07.hamilton.harte-lyne.ca
	[216.185.71.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0UFvZLq032301
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2012 10:57:35 -0500
Received: from webmail.harte-lyne.ca (inet04.hamilton.harte-lyne.ca
	[216.185.71.24])
	by inet07.hamilton.harte-lyne.ca (8.13.1/8.13.1) with ESMTP id
	q0UFvOQ8014757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2012 10:57:25 -0500
Message-ID: <a14b2d4dc4f02a1f72c8e26fd7385823.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
Date: Mon, 30 Jan 2012 10:57:23 -0500
From: "James B. Byrne" <byrnejb@harte-lyne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Cannot delete lv
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


As a follow up the lvremove hang produces this in
/var/log/messages:

Jan 30 10:21:58 vhost01 kernel: INFO: task lvremove:1460
blocked for more than 120 seconds.
Jan 30 10:21:58 vhost01 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this
message.
Jan 30 10:21:58 vhost01 kernel: lvremove      D
0000000000000002     0  1460    307 0x00000080
Jan 30 10:21:58 vhost01 kernel: ffff8801a170db18
0000000000000082 0000000000000000 ffffffffa00041fc
Jan 30 10:21:58 vhost01 kernel: ffff8801a170dae8
00000000d9f78a4a ffff8801a170db08 ffff8802750f7cc0
Jan 30 10:21:58 vhost01 kernel: ffff88042d589b38
ffff8801a170dfd8 000000000000f4e8 ffff88042d589b38
Jan 30 10:21:58 vhost01 kernel: Call Trace:
Jan 30 10:21:58 vhost01 kernel: [<ffffffffa00041fc>] ?
dm_table_unplug_all+0x5c/0x100 [dm_mod]
Jan 30 10:21:58 vhost01 kernel: [<ffffffff814ed1c3>]
io_schedule+0x73/0xc0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff811b1a2e>]
__blockdev_direct_IO_newtrunc+0x6fe/0xb90
Jan 30 10:21:58 vhost01 kernel: [<ffffffff812581fd>] ?
get_disk+0x7d/0xf0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff811b1f1e>]
__blockdev_direct_IO+0x5e/0xd0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff811ae820>] ?
blkdev_get_blocks+0x0/0xc0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff811af687>]
blkdev_direct_IO+0x57/0x60
Jan 30 10:21:58 vhost01 kernel: [<ffffffff811ae820>] ?
blkdev_get_blocks+0x0/0xc0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff811128db>]
generic_file_aio_read+0x6bb/0x700
Jan 30 10:21:58 vhost01 kernel: [<ffffffff81213a21>] ?
avc_has_perm+0x71/0x90
Jan 30 10:21:58 vhost01 kernel: [<ffffffff8120d51f>] ?
security_inode_permission+0x1f/0x30
Jan 30 10:21:58 vhost01 kernel: [<ffffffff8117641a>]
do_sync_read+0xfa/0x140
Jan 30 10:21:58 vhost01 kernel: [<ffffffff81090bf0>] ?
autoremove_wake_function+0x0/0x40
Jan 30 10:21:58 vhost01 kernel: [<ffffffff811aec5c>] ?
block_ioctl+0x3c/0x40
Jan 30 10:21:58 vhost01 kernel: [<ffffffff81189342>] ?
vfs_ioctl+0x22/0xa0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff8121900b>] ?
selinux_file_permission+0xfb/0x150
Jan 30 10:21:58 vhost01 kernel: [<ffffffff8120c3b6>] ?
security_file_permission+0x16/0x20
Jan 30 10:21:58 vhost01 kernel: [<ffffffff81176e15>]
vfs_read+0xb5/0x1a0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff810d46e2>] ?
audit_syscall_entry+0x272/0x2a0
Jan 30 10:21:58 vhost01 kernel: [<ffffffff81176f51>]
sys_read+0x51/0x90
Jan 30 10:21:58 vhost01 kernel: [<ffffffff8100b0f2>]
system_call_fastpath+0x16/0x1b


Which repeats at two minute intevals.

-- 
***          E-Mail is NOT a SECURE channel          ***
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
