Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8KDP4RU008521
	for <linux-lvm@redhat.com>; Thu, 20 Sep 2007 09:25:04 -0400
Received: from web33608.mail.mud.yahoo.com (web33608.mail.mud.yahoo.com
	[68.142.199.225])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l8KDOvNQ007772
	for <linux-lvm@redhat.com>; Thu, 20 Sep 2007 09:24:57 -0400
Date: Thu, 20 Sep 2007 03:38:09 -0700 (PDT)
From: Sagar Borikar <borikar_sagar@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1409526399-1190284689=:85293"
Content-Transfer-Encoding: 8bit
Message-ID: <965897.85293.qm@web33608.mail.mud.yahoo.com>
Subject: [linux-lvm] exception when snapshot size is less than the volume
	size
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
To: linux-lvm@redhat.com

--0-1409526399-1190284689=:85293
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

In my NAS box, I observed strange thing yesterday. I had the snapshot size (32MB) less than volume size was (10 GB) You can say I was trying to do failure analysis of my box. The LVM HOwto for snapshot says
"



           If the snapshot logical volume becomes full it will be dropped           (become unusable) so it is vitally important to allocate enough space.           The amount of space necessary is dependent on the usage of the           snapshot, so there is no set recipe to follow for this. If the           snapshot size equals the origin size, it will never overflow.         
"
But my box was crashed in this scenario. 
Was wondering why didn't it disable the snapshots.  
The underlying processor is MIPS and linux kernel version is 2.6.18.
After delving little bit in the sources I found that break is occurring while blowing away the snapshot facility -- so it`s not surprising that snapshots do not work anymore. Just before the error, kcopyd_client_destroy is called -- so that`s it for kcopyd jobs -- hence snapshots. The snapshot faciltiy is gone at that point, with or without the BUG_ON. The error actually occurs while freeing the exception tables in the slab cache.

Any pointers if this has been resolved?
I am working with lvm version 2.02.28.  and device mapper version 1.02.22

Here is the log 

Ending XFS recovery on filesystem: dm-1 (logdev: internal)
xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.
Return address = 0x80302d7c
Filesystem "dm-1": I/O Error Detected.  Shutting down filesystem: dm-1
Please umount the filesystem, and rectify the problem(s)
xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.
Return address = 0x80302d7c
Buffer I/O error on device dm-1, logical block 2097024
Buffer I/O error on device dm-1, logical block 2097025
Buffer I/O error on device dm-1, logical block 2097026
Buffer I/O error on device dm-1, logical block 2097027
Buffer I/O error on device dm-1, logical block 2097028
Buffer I/O error on device dm-1, logical block 2097029
Buffer I/O error on device dm-1, logical block 2097030
Buffer I/O error on device dm-1, logical block 2097031
Buffer I/O error on device dm-1, logical block 2097024
Buffer I/O error on device dm-1, logical block 2097025
xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.
Return address = 0x80302d7c
xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.
Return address = 0x80302d7c
xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.
Return address = 0x80302d7c
xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.
Return address = 0x80302d7c
Break instruction in kernel code[#1]:
Cpu 0
$ 0   : 00000000 805d0000 00000000 812e2bc0
$ 4   : 816032c0 816032c0 9004e000 ffff00fe
$ 8   : 98c35fe0 0000e000 00000000 9f7b8000
$12   : 9bc2ad88 8051ba34 0000000a 00000002
$16   : c009d000 00000000 9715ee48 9d12a1c8
$20   : 00000200 816032c0 00000000 7f94cc60
$24   : ffffffff 00000004
$28   : 98c34000 98c35da0 00000000 803f4dbc
Hi    : 0000000d
Lo    : 70a3d716
epc   : 8016a1f0 kmem_cache_free+0x60/0xec     Not tainted
ra    : 803f4dbc exit_exception_table+0x58/0xa0
Status: 9004e003    KERNEL EXL IE
Cause : 00000024
PrId  : 000034c1
Modules linked in: aes bonding block2mtd
Process lvremove (pid: 31393, threadinfo=98c34000, task=9f5c6628)
Stack : 9d12a180 c009b020 00000001 c003b000 c009d000 00000000 00000000 803f4dbc
        00000000 00000000 9d12a180 c009b020 9d12a180 c009b020 00000001 c003b000
        100345d0 1002c7b8 803f5588 803f5570 00000000 8011df80 803edcd4 00000000
        c009b020 9bc33e80 803ecdb0 00000000 9bc33e80 9d12a580 00000000 c003b000
        9d12a580 9bc33e80 00000000 803ece6c 9ba67a00 9d12a580 9d12a580 9bc33e80
        ...
Call Trace:
[<8016a1f0>] kmem_cache_free+0x60/0xec
[<803f4dbc>] exit_exception_table+0x58/0xa0
[<803f5588>] snapshot_dtr+0x38/0x88
[<803ecdb0>] table_destroy+0x68/0xcc
[<803ece6c>] dm_table_put+0x38/0x44
[<803ec05c>] dm_put+0xac/0xc8
[<803f0200>] dev_remove+0xbc/0xe0
[<803f1460>] ctl_ioctl+0xf8/0x164
[<80183320>] do_ioctl+0x60/0x74
[<80183690>] vfs_ioctl+0x1e0/0x200
[<80183700>] sys_ioctl+0x50/0x90
[<8010c040>] stack_done+0x20/0x3c




 
       
---------------------------------
Take the Internet to Go: Yahoo!Go puts the Internet in your pocket: mail, news, photos & more. 
--0-1409526399-1190284689=:85293
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

In my NAS box, I observed strange thing yesterday. I had the snapshot size (32MB) less than volume size was (10 GB) You can say I was trying to do failure analysis of my box. The LVM HOwto for snapshot says<br>"<br><br><table class="warning" border="0" width="100%"><tbody><tr><th align="left" valign="CENTER"><b></b><br></th></tr><tr><td><br></td><td align="left" valign="top"><div>           If the snapshot logical volume becomes full it will be dropped           (become unusable) so it is vitally important to allocate enough space.           The amount of space necessary is dependent on the usage of the           snapshot, so there is no set recipe to follow for this. If the           snapshot size equals the origin size, it will never overflow.         </div></td></tr></tbody></table>"<br>But my box was crashed in this scenario. <br>Was wondering why didn't it disable the snapshots.&nbsp; <br>The underlying processor is MIPS and linux kernel version is 2.6.18.<br>After
 delving little bit in the sources I found that break is occurring while blowing away the snapshot facility -- so it`s not surprising that snapshots do not work anymore. Just before the error, kcopyd_client_destroy is called -- so that`s it for kcopyd jobs -- hence snapshots. The snapshot faciltiy is gone at that point, with or without the BUG_ON. The error actually occurs while freeing the exception tables in the slab cache.<br><br>Any pointers if this has been resolved?<br>I am working with lvm version 2.02.28.&nbsp; and device mapper version 1.02.22<br><br>Here is the log <br><br>Ending XFS recovery on filesystem: dm-1 (logdev: internal)<br>xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.<br>Return address = 0x80302d7c<br>Filesystem "dm-1": I/O Error Detected.&nbsp; Shutting down filesystem: dm-1<br>Please umount the filesystem, and rectify the problem(s)<br>xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.<br>Return
 address = 0x80302d7c<br>Buffer I/O error on device dm-1, logical block 2097024<br>Buffer I/O error on device dm-1, logical block 2097025<br>Buffer I/O error on device dm-1, logical block 2097026<br>Buffer I/O error on device dm-1, logical block 2097027<br>Buffer I/O error on device dm-1, logical block 2097028<br>Buffer I/O error on device dm-1, logical block 2097029<br>Buffer I/O error on device dm-1, logical block 2097030<br>Buffer I/O error on device dm-1, logical block 2097031<br>Buffer I/O error on device dm-1, logical block 2097024<br>Buffer I/O error on device dm-1, logical block 2097025<br>xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.<br>Return address = 0x80302d7c<br>xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.<br>Return address = 0x80302d7c<br>xfs_force_shutdown(dm-1,0x1) called from line 424 of file fs/xfs/xfs_rw.c.<br>Return address = 0x80302d7c<br>xfs_force_shutdown(dm-1,0x1) called from line 424 of
 file fs/xfs/xfs_rw.c.<br>Return address = 0x80302d7c<br>Break instruction in kernel code[#1]:<br>Cpu 0<br>$ 0&nbsp;&nbsp; : 00000000 805d0000 00000000 812e2bc0<br>$ 4&nbsp;&nbsp; : 816032c0 816032c0 9004e000 ffff00fe<br>$ 8&nbsp;&nbsp; : 98c35fe0 0000e000 00000000 9f7b8000<br>$12&nbsp;&nbsp; : 9bc2ad88 8051ba34 0000000a 00000002<br>$16&nbsp;&nbsp; : c009d000 00000000 9715ee48 9d12a1c8<br>$20&nbsp;&nbsp; : 00000200 816032c0 00000000 7f94cc60<br>$24&nbsp;&nbsp; : ffffffff 00000004<br>$28&nbsp;&nbsp; : 98c34000 98c35da0 00000000 803f4dbc<br>Hi&nbsp;&nbsp;&nbsp; : 0000000d<br>Lo&nbsp;&nbsp;&nbsp; : 70a3d716<br>epc&nbsp;&nbsp; : 8016a1f0 kmem_cache_free+0x60/0xec&nbsp;&nbsp;&nbsp;&nbsp; Not tainted<br>ra&nbsp;&nbsp;&nbsp; : 803f4dbc exit_exception_table+0x58/0xa0<br>Status: 9004e003&nbsp;&nbsp;&nbsp; KERNEL EXL IE<br>Cause : 00000024<br>PrId&nbsp; : 000034c1<br>Modules linked in: aes bonding block2mtd<br>Process lvremove (pid: 31393, threadinfo=98c34000, task=9f5c6628)<br>Stack
 : 9d12a180 c009b020 00000001 c003b000 c009d000 00000000 00000000 803f4dbc<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000 00000000 9d12a180 c009b020 9d12a180 c009b020 00000001 c003b000<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100345d0 1002c7b8 803f5588 803f5570 00000000 8011df80 803edcd4 00000000<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c009b020 9bc33e80 803ecdb0 00000000 9bc33e80 9d12a580 00000000 c003b000<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9d12a580 9bc33e80 00000000 803ece6c 9ba67a00 9d12a580 9d12a580 9bc33e80<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>Call Trace:<br>[&lt;8016a1f0&gt;] kmem_cache_free+0x60/0xec<br>[&lt;803f4dbc&gt;] exit_exception_table+0x58/0xa0<br>[&lt;803f5588&gt;] snapshot_dtr+0x38/0x88<br>[&lt;803ecdb0&gt;] table_destroy+0x68/0xcc<br>[&lt;803ece6c&gt;] dm_table_put+0x38/0x44<br>[&lt;803ec05c&gt;] dm_put+0xac/0xc8<br>[&lt;803f0200&gt;] dev_remove+0xbc/0xe0<br>[&lt;803f1460&gt;]
 ctl_ioctl+0xf8/0x164<br>[&lt;80183320&gt;] do_ioctl+0x60/0x74<br>[&lt;80183690&gt;] vfs_ioctl+0x1e0/0x200<br>[&lt;80183700&gt;] sys_ioctl+0x50/0x90<br>[&lt;8010c040&gt;] stack_done+0x20/0x3c<br><br><br><br><br> <p>&#32;
      <hr size=1>Take the Internet to Go: Yahoo!Go puts the <a href="http://us.rd.yahoo.com/evt=48253/*http://mobile.yahoo.com/go?refer=1GNXIC">Internet in your pocket:</a> mail, news, photos & more. 
--0-1409526399-1190284689=:85293--
