Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0J205O21218
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 21:00:05 -0500
Received: from w3f.coventive.coms.coventive.com (202-145-53-92.adsl.ttn.net
	[202.145.53.92])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0J1xtCK000923
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 20:59:58 -0500
Received: from [192.168.20.46] (pc46.sa.coventive.com [192.168.20.46])
	by w3f.coventive.coms.coventive.com (8.11.6/8.11.6) with ESMTP id
	j0J1xpB01005
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 09:59:52 +0800
Message-ID: <41EDC10D.6000705@coventive.com>
Date: Wed, 19 Jan 2005 10:08:13 +0800
From: Chung Hsien Hu <mozo@coventive.com>
MIME-Version: 1.0
References: <dff37527050118093648e504e@mail.gmail.com>	<20050118194449.GQ26670@agk.surrey.redhat.com>	<dff3752705011811541b040c4e@mail.gmail.com>	<41ED6C68.10109@svs.gsfc.nasa.gov>
	<dff3752705011813103fd9fa26@mail.gmail.com>
In-Reply-To: <dff3752705011813103fd9fa26@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] kernel bug of snapshot
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

Hi,
For testing snapshot of LVM2, I am trying to make snapshot over 3 kinds of
filesystem, xfs, ext3 and reiserfs. A crontab is made like this:
*/1 * * * * root snap_rotate xfs_volume
*/2 * * * * root snap_rotate ext_volume
*/3 * * * * root snap_rotate reiserfs_volume

What snap_rotate is a script to remove the old snapshot, and then make 
an new one
over the same logical volume after that. And the crontab do these on 
xfs, ext3 and
reiserfs volumes by every 1, 2 and 3 minutes seperately.

This crontab job lasted for about 10hours (equal to 1000 times of 
rotate), utill
it reported kernel bug, and I found lvm program hang in "D" state.

Any clues? Seems to be some memory allocation problem?

------------[ cut here ]------------
kernel BUG at drivers/md/kcopyd.c:145!
invalid operand: 0000 [#1]
PREEMPT SMP
Modules linked in: bonding lm85 i2c_sensor i2c_i801 usb_storage i2c_dev 
i2c_core dm_snapshot uhci_hcd usbcore appletalk ipx p8022 psnap llc nfsd 
exportfs lockd sunrpc quota_v2 nls_iso8859_1 nls_cp437 vfat fat xfs 
reiserfs ext3 jbd st sg loop iscsi_trgt 3w_9xxx tg3 dm_mod sd_mod 
scsi_mod 8250 serial_core unix
CPU:    0
EIP:    0060:[<f886b84b>]    Not tainted VLI
EFLAGS: 00010283   (2.6.10-ac10)
EIP is at client_free_pages+0x3b/0x50 [dm_mod]
eax: 00000100   ebx: f658f3e0   ecx: f6d60b00   edx: 00000000
esi: f8a7e080   edi: 00000000   ebp: 00000000   esp: f3353f10
ds: 007b   es: 007b   ss: 0068
Process lvm (pid: 27317, threadinfo=f3352000 task=f7241a20)
Stack: f658f3e0 f658f3e0 f886c34e f658f3e0 f5a35780 f895da04 f658f3e0 
f702fa20
       f8a7e080 f6d5ec80 f88660ea f8a7e080 f5183e80 f8992000 00000004 
080c3b48
       f8868492 f6d5ec80 00000000 f8872ce0 f8868d21 f5183e80 f3352000 
00000000
Call Trace:
 [<f886c34e>] kcopyd_client_destroy+0x1e/0x3a [dm_mod]
 [<f895da04>] snapshot_dtr+0x74/0x90 [dm_snapshot]
 [<f88660ea>] table_destroy+0x8a/0xa0 [dm_mod]
 [<f8868492>] __hash_remove+0x62/0x90 [dm_mod]
 [<f8868d21>] dev_remove+0x51/0xf0 [dm_mod]
 [<f886a411>] ctl_ioctl+0xf1/0x150 [dm_mod]
 [<f8868cd0>] dev_remove+0x0/0xf0 [dm_mod]
 [<c016b5aa>] sys_ioctl+0xca/0x230
 [<c01028af>] syscall_call+0x7/0xb
Code: 14 75 28 8b 43 0c 89 04 24 e8 52 ff ff ff c7 43 0c 00 00 00 00 c7 
43 10 00 00 00 00 c7 43 14 00 00 00 00 8b 5c 24 04 83 c4 08 c3 <0f> 0b 
91 00 d1 c6 86 f8 eb ce 8d 74 26 00 8d bc 27 00 00 00 00
 <1>Unable to handle kernel paging request at virtual address f8bcc070
 printing eip:
f895efbf
*pde = 00000000
Oops: 0002 [#2]
PREEMPT SMP
Modules linked in: bonding lm85 i2c_sensor i2c_i801 usb_storage i2c_dev 
i2c_core dm_snapshot uhci_hcd usbcore appletalk ipx p8022 psnap llc nfsd 
exportfs lockd sunrpc quota_v2 nls_iso8859_1 nls_cp437 vfat fat xfs 
reiserfs ext3 jbd st sg loop iscsi_trgt 3w_9xxx tg3 dm_mod sd_mod 
scsi_mod 8250 serial_core unix
CPU:    0
EIP:    0060:[<f895efbf>]    Not tainted VLI
EFLAGS: 00010282   (2.6.10-ac10)
EIP is at write_exception+0x2f/0x50 [dm_snapshot]
eax: 0019e872   ebx: f7389ed0   ecx: f8bcc070   edx: 00000000
esi: 00000000   edi: f732eedc   ebp: f895dd40   esp: f7389eb4
ds: 007b   es: 007b   ss: 0068
Process kcopyd (pid: 1330, threadinfo=f7388000 task=f71b8020)
Stack: f6968940 00000007 f6968940 f895f377 f6968940 00000007 f7389ed0 
0019e872
       00000000 00000009 00000000 f6c95468 00000000 f732eedc f895dd85 
f5a357dc
       f732eedc f895dd30 f732eedc f886b9c3 00000000 00000000 f732eedc 
00000000
Call Trace:
 [<f895f377>] persistent_commit+0x47/0x110 [dm_snapshot]
 [<f895dd85>] copy_callback+0x45/0x50 [dm_snapshot]
 [<f895dd30>] commit_callback+0x0/0x10 [dm_snapshot]
 [<f886b9c3>] run_complete_job+0x63/0x80 [dm_mod]
 [<f886bc25>] process_jobs+0x55/0xd0 [dm_mod]
 [<f886bcb8>] do_work+0x18/0x50 [dm_mod]
 [<f886b960>] run_complete_job+0x0/0x80 [dm_mod]
 [<c012ab09>] worker_thread+0x1b9/0x260
 [<f886bca0>] do_work+0x0/0x50 [dm_mod]
 [<c01163a0>] default_wake_function+0x0/0x20
 [<c01163a0>] default_wake_function+0x0/0x20
 [<c012a950>] worker_thread+0x0/0x260
 [<c012ef4a>] kthread+0xba/0xc0
 [<c012ee90>] kthread+0x0/0xc0
 [<c01009b5>] kernel_thread_helper+0x5/0x10
Code: 44 24 14 89 5c 24 08 8b 5c 24 18 89 44 24 04 8b 44 24 10 89 04 24 
e8 71 ff ff ff 89 c1 85 c9 b8 ea ff ff ff 74 18 8b 03 8b 53 04 <89> 01 
8b 43 08 89 51 04 8b 53 0c 89 41 08 31 c0 89 51 0c 8b 5c

-- 
Mozo Hu. mozo@coventive
R&D Assistant Manager, Coventive Advance Technologies
