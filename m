Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l76Ev1oY019900
	for <linux-lvm@redhat.com>; Mon, 6 Aug 2007 10:57:01 -0400
Received: from smtp.smytheonline.com (ext4.smytheonline.com [38.96.154.84])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l76EuveX011970
	for <linux-lvm@redhat.com>; Mon, 6 Aug 2007 10:56:57 -0400
Received: from [192.168.1.20] (norbert.smytheonline.com [192.168.1.20])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.smytheonline.com (Postfix) with ESMTP id E83ED3CC623
	for <linux-lvm@redhat.com>; Mon,  6 Aug 2007 10:56:49 -0400 (EDT)
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Message-Id: <D5A89B68-E08E-4F67-98BE-1C6B6E4DDABF@smytheonline.com>
From: Norbert Phillipps <nphillipps@smytheonline.com>
Date: Mon, 6 Aug 2007 10:54:57 -0400
Subject: [linux-lvm] lvcreate kernel oops 2.6.22
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Below is the log of a kernel oops while using lvcreate to make a  
snapshot.  I'm running kernel 2.6.22 with Ubuntu and Xen patches.   
Approximately 8 snapshots are being created sequentially and at any  
given time the box has about 10-15 snapshots.  Any suggestions on  
avoiding oopses?

thanks,
Norbert

Aug  6 00:51:02 ram Oops: 0000 [#1]
Aug  6 00:51:02 ram SMP
Aug  6 00:51:02 ram Modules linked in: dm_snapshot ipv6 nfs lockd  
nfs_acl sunrpc bridge llc dm_mod aoe e1000 uhci_hcd evdev
Aug  6 00:51:02 ram CPU:    0
Aug  6 00:51:02 ram EIP:    0061:[<ee094488>]    Not tainted VLI
Aug  6 00:51:02 ram EFLAGS: 00010202   (2.6.22 #1)
Aug  6 00:51:02 ram EIP is at __map_bio+0x32/0xa4 [dm_mod]
Aug  6 00:51:02 ram eax: ee9110c0   ebx: 00000000   ecx: d6cfbf40    
edx: e3ecba40
Aug  6 00:51:02 ram esi: e3ecba40   edi: d6cfbf38   ebp: ee9110c0    
esp: e6fb1d34
Aug  6 00:51:02 ram ds: 007b   es: 007b   fs: 00d8  gs: 0033  ss: 0069
Aug  6 00:51:02 ram Process lvcreate (pid: 11382, ti=e6fb0000  
task=df9a2ab0 task.ti=e6fb0000)
Aug  6 00:51:02 ram Stack: 003ffff8 00000000 00000000 e05865c0  
d6cfbf48 e8b129c0 ee094e01 00000000
Aug  6 00:51:02 ram 00000001 00000008 e159c440 c03f5400 c65ee9c0  
e05865c0 ffc00008 ffffffff
Aug  6 00:51:02 ram c0157006 00000000 ee095f6c d6cfbf38 ee9110c0  
ee07e080 e05865c0 00002fbb
Aug  6 00:51:02 ram Call Trace:
Aug  6 00:51:02 ram [<ee094e01>] __split_bio+0x194/0x475 [dm_mod]
Aug  6 00:51:02 ram [<c0157006>] __vunmap+0x62/0xe5
Aug  6 00:51:02 ram [<ee095f6c>] close_dev+0x23/0x2c [dm_mod]
Aug  6 00:51:02 ram [<ee0950fb>] __flush_deferred_io+0x19/0x22 [dm_mod]
Aug  6 00:51:02 ram [<ee09526f>] dm_resume+0x96/0xdf [dm_mod]
Aug  6 00:51:02 ram [<ee09825d>] dev_suspend+0x101/0x178 [dm_mod]
Aug  6 00:51:02 ram [<ee098b38>] ctl_ioctl+0x1eb/0x255 [dm_mod]
Aug  6 00:51:02 ram [<c0171866>] dput+0x83/0xf1
Aug  6 00:51:02 ram [<c016a1df>] __link_path_walk+0xa09/0xc51
Aug  6 00:51:02 ram [<ee09815c>] dev_suspend+0x0/0x178 [dm_mod]
Aug  6 00:51:02 ram [<ee09894d>] ctl_ioctl+0x0/0x255 [dm_mod]
Aug  6 00:51:02 ram [<c016c360>] do_ioctl+0x70/0xa9
Aug  6 00:51:02 ram [<ee09894d>] ctl_ioctl+0x0/0x255 [dm_mod]
Aug  6 00:51:02 ram [<c016c3e9>] vfs_ioctl+0x50/0x26a
Aug  6 00:51:02 ram [<c016c637>] sys_ioctl+0x34/0x51
Aug  6 00:51:02 ram [<c0104a18>] syscall_call+0x7/0xb
Aug  6 00:51:02 ram =======================
Aug  6 00:51:02 ram Code: 89 c5 89 d6 89 cf 8b 4a 20 85 c9 0f 84 88  
00 00 00 c7 42 34 fa 44 09 ee 89 7a 3c 8b 07 83 c0 0c f0 ff 00 8b 5d  
04 8d 4f 08 89 e8 <ff> 53 1c 89 c2 83 f8 01 74 56 85 c0 78 14 83 f8  
02 74 0f 85 c0
Aug  6 00:51:02 ram EIP: [<ee094488>] __map_bio+0x32/0xa4 [dm_mod]  
SS:ESP 0069:e6fb1d34
