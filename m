Received: from [10.32.4.62] (vpn-4-62.str.redhat.com [10.32.4.62])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l6UIgPpZ007361
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 20:42:26 +0200
Message-ID: <46AE3149.50709@redhat.com>
Date: Mon, 30 Jul 2007 20:43:21 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Xen, LVM, Snapshots Random Kernel Panics
References: <2C96D4B0-33EC-4250-89C5-1B516C83A04D@smytheonline.com>
In-Reply-To: <2C96D4B0-33EC-4250-89C5-1B516C83A04D@smytheonline.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

this is one of the problems caused by one common
mempool for dm-io in kernel when using multiple snapshots.

Please try to use kernel 2.6.22, there is new dm-io
code and this is fixed.
Bug is not related to particular lvm2 tools version.

Milan
--
mbroz@redhat.com

Norbert Phillipps wrote:
> Hi all,
> 
> I'm currently running lvm 2.02.25, and device-mapper 1.02.19 on kernel
> 2.6.20.13 with Xen 3.1 on Gentoo Linux
> 
> I randomly have kernel panics when creating snapshots and also when
> removing snapshots.
> 
> Attached is one of the kernel panics that I have seen while creating a
> snapshot.  I'm trying to find a stable combination of kernel, lvm, and
> Xen version.
> 
> Thanks!
> 
> ------------[ cut here ]------------
> kernel BUG at mm/mempool.c:121!
> invalid opcode: 0000 [#1]
> SMP 
> Modules linked in: ipv6 nfs lockd nfs_acl sunrpc bridge llc dm_snapshot
> dm_mod aoe qla2xxx i2c_i801 i2c_core firmware_class e1000 uhci_hcd evdev
> CPU:    0
> EIP:    0061:[<c013d66b>]    Not tainted VLI
> EFLAGS: 00010282   (2.6.20.14-xen #5)
> EIP is at mempool_resize+0x137/0x16c
> eax: ec5a6900   ebx: ffffffe0   ecx: 000000d0   edx: ffffffe0
> esi: e9395b00   edi: f07f5080   ebp: ec5a6900   esp: e8317d5c
> ds: 007b   es: 007b   ss: 0069
> Process vgchange (pid: 8179, ti=e8316000 task=e873da70 task.ti=e8316000)
> Stack: 00692000 000000d0 ffffffe0 80000000 ffffffe0 e9395b00 f07f5080
> 00000000 
>        ee24a3c8 00000000 e8d289c0 ee24a5cd e873da70 c012d034 e8317d94
> e8317d94 
>        c0156c7e e93962c0 e9395b00 f07f5080 ee06ebf1 f07f5080 e93964c0
> 00000000 
> Call Trace:
>  [<ee24a3c8>] resize_pool+0x47/0xb2 [dm_mod]
>  [<ee24a5cd>] kcopyd_client_destroy+0x84/0xc9 [dm_mod]
>  [<c012d034>] autoremove_wake_function+0x0/0x37
>  [<c0156c7e>] kfree+0xe/0x7d
>  [<ee06ebf1>] snapshot_dtr+0x85/0xcf [dm_snapshot]
>  [<ee246d73>] dm_table_put+0x55/0xbd [dm_mod]
>  [<ee245b0e>] dm_put+0x6f/0x110 [dm_mod]
>  [<ee249561>] dev_remove+0x76/0xa4 [dm_mod]
>  [<ee249b48>] ctl_ioctl+0x1eb/0x255 [dm_mod]
>  [<c0107457>] monotonic_clock+0x37/0x74
>  [<ee2494eb>] dev_remove+0x0/0xa4 [dm_mod]
>  [<c0164874>] do_ioctl+0x64/0x6d
>  [<c01648cd>] vfs_ioctl+0x50/0x278
>  [<c0164b29>] sys_ioctl+0x34/0x53
>  [<c0104c34>] syscall_call+0x7/0xb
>  [<c0320033>] unix_dgram_sendmsg+0x2f9/0x48a
>  =======================
> Code: 8b 45 08 3b 45 04 0f 8d 4c ff ff ff 8b 14 24 89 e8 e8 c4 93 1e 00
> 8b 55 10 8b 44 24 04 ff 55 14 89 c3 85 c0 75 bf e9 37 ff ff ff <0f> 0b
> eb fe 8b 14 24 89 e8 e8 a1 93 1e 00 8b 55 10 89 d8 ff 55 
> EIP: [<c013d66b>] mempool_resize+0x137/0x16c SS:ESP 0069:e8317d5c
