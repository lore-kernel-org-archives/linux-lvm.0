Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p626UcDr020847
	for <linux-lvm@redhat.com>; Sat, 2 Jul 2011 02:30:38 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p626UaNa027768
	for <linux-lvm@redhat.com>; Sat, 2 Jul 2011 02:30:36 -0400
Date: Sat, 2 Jul 2011 01:30:30 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110702013030.443f3d8b@bettercgi.com>
In-Reply-To: <5d9860.22c.130e47547b4.Coremail.chaimvy@163.com>
References: <5d9860.22c.130e47547b4.Coremail.chaimvy@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] why 'lvcreate' command blocked?
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
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: chaimvy@163.com

Please let me know if you figure it out. I have a server
with a similar problem which persists even after changing=20
virtually every component of the system. One hint I learned
is that it can at times hang for serveral hours and then=20
proceed. Just because it's been several minutes does not=20
necesarily mean a 180 mile trip to the datacenter.
--=20
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Fri, 1 Jul 2011 14:49:09 +0800 (CST)
"Busby.Cheung" <chaimvy@163.com> wrote:

> Hi ALL=EF=BC=8C
>        When I used the lvcreate cmd in my system, it blocked for a
> long time. My OS kernel version is linux-2.6.29, is there any bug?
> Here is the mesg: INFO: task lvcreate:30225 blocked for more than 480
> seconds. "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
> this message. lvcreate      D ffff880028088780     0 30225  25700
>  ffff88013e02a100 0000000000000086 0000000000000000 0000000000000000
>  00000000000000d0 ffff880124879910 ffff880124879c70 00000001000aaa4a
>  ffffffffffffffff ffffffffffffffff ffffffffffffffff 7fffffffffffffff
> Call Trace:
>  [<ffffffff804d4d5d>] io_schedule+0x5d/0x9e
>  [<ffffffff802bfff5>] __blockdev_direct_IO+0x8a4/0xa3b
>  [<ffffffff80272842>] __filemap_fdatawrite_range+0x54/0x5e
>  [<ffffffff802bee5e>] blkdev_direct_IO+0x45/0x4a
>  [<ffffffff802bed84>] blkdev_get_blocks+0x0/0x95
>  [<ffffffff80272c28>] generic_file_direct_write+0xd2/0x18b
>  [<ffffffff80272f65>] __generic_file_aio_write_nolock+0x284/0x3a5
>  [<ffffffff802734d7>] generic_file_aio_read+0xe1/0x539
>  [<ffffffff80273138>] generic_file_aio_write_nolock+0x34/0x80
>  [<ffffffff8029d6db>] do_sync_write+0xc9/0x10c
>  [<ffffffff803958e4>] tty_put_char+0x2b/0x2d
>  [<ffffffff80249396>] autoremove_wake_function+0x0/0x2e
>  [<ffffffff80326a0c>] selinux_file_permission+0x5a/0x120
>  [<ffffffff8029ddd7>] vfs_write+0xad/0x136
>  [<ffffffff8029e2f4>] sys_write+0x45/0x6e
>  [<ffffffff8020bedb>] system_call_fastpath+0x16/0x1b
>=20
>    I don't know whether it is the kernel's scheduling bug or the
> lvm2's bug, anyone knows?=20
> Best Wishes!
>=20
>=20
> =20
