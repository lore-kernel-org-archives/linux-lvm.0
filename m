Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4514IUi006451
	for <linux-lvm@redhat.com>; Sun, 4 May 2008 21:04:18 -0400
Received: from web33601.mail.mud.yahoo.com (web33601.mail.mud.yahoo.com
	[68.142.199.190])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m45144HJ004365
	for <linux-lvm@redhat.com>; Sun, 4 May 2008 21:04:04 -0400
Date: Sun, 4 May 2008 18:03:58 -0700 (PDT)
From: Sagar Borikar <borikar_sagar@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-892190949-1209949438=:30397"
Content-Transfer-Encoding: 8bit
Message-ID: <400525.30397.qm@web33601.mail.mud.yahoo.com>
Subject: [linux-lvm] Share getting disappeared untill system is reboot
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

--0-892190949-1209949438=:30397
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Folks,
   
  I am not sure whether this is the right list for below mentioned question. If not please direct me to the right list. Thanks in advance.
   
  I am currently finding a strange issue with 2.6.18 kernel while performing the stress test with iozone on the NAS box under development. When I am trying to pump the data over iozone on the NAS box, the share on which the data transfer is progressing, gets disappeared suddenly till I reboot the system. Although this problem is seen infrequently, the frequency is quite high i.e upto 3 times out of five tests. I was able to capture following stack dump on the system. 
   
  1 input overrun(s)
zoneinfo 1725 02 1744XFS internal error XFS_WANT_CORRUPTED_GOTO at line 2191 of file fs/xfs/x
fs_bmap_btree.c. Caller 0x802b61a4
Call Trace:
[<801098a8>] dump_stack+0x18/0x44
[<802c6150>] xfs_error_report+0x58/0x64
[<802b629c>] xfs_bmbt_insert+0x16c/0x194
[<802a7674>] xfs_bmap_add_extent_delay_real+0x888/0x15e8
[<802a6c30>] xfs_bmap_add_extent+0x328/0x4e4
[<802afa40>] xfs_bmapi+0xa98/0x13e4
[<802d6e30>] xfs_iomap_write_allocate+0x340/0x5d8
[<802d5718>] xfs_iomap+0x408/0x4dc
[<803014bc>] xfs_bmap+0x30/0x3c
[<802f68ac>] xfs_map_blocks+0x50/0x84
[<802f7cdc>] xfs_page_state_convert+0x3f4/0x840
[<802f820c>] xfs_vm_writepage+0xe4/0x140
[<80198778>] mpage_writepages+0x24c/0x45c
[<802f8298>] xfs_vm_writepages+0x30/0x3c
[<801507d4>] do_writepages+0x44/0x84
[<80196648>] __sync_single_inode+0x68/0x234
[<801969a0>] __writeback_single_inode+0x18c/0x1ac
[<80196bc8>] sync_sb_inodes+0x208/0x2f0
[<80196d34>] writeback_inodes+0x84/0xd0
[<80150400>] background_writeout+0xac/0xfc
[<80151350>] __pdflush+0x130/0x228
[<80151478>] pdflush+0x30/0x3c
[<801398dc>] kthread+0x98/0xe0
[<80104c58>] kernel_thread_helper+0x10/0x18

Filesystem "dm-3": XFS internal error xfs_trans_cancel at line 1138 of file fs/xfs/xfs_trans.c. Caller 0x802d7084
Call Trace:
[<801098a8>] dump_stack+0x18/0x44
[<802c6150>] xfs_error_report+0x58/0x64
[<802e89a4>] xfs_trans_cancel+0x98/0x150
[<802d7084>] xfs_iomap_write_allocate+0x594/0x5d8
[<802d5718>] xfs_iomap+0x408/0x4dc
[<803014bc>] xfs_bmap+0x30/0x3c
[<802f68ac>] xfs_map_blocks+0x50/0x84
[<802f7cdc>] xfs_page_state_convert+0x3f4/0x840
[<802f820c>] xfs_vm_writepage+0xe4/0x140
[<80198778>] mpage_writepages+0x24c/0x45c
[<802f8298>] xfs_vm_writepages+0x30/0x3c
[<801507d4>] do_writepages+0x44/0x84
[<80196648>] __sync_single_inode+0x68/0x234
[<801969a0>] __writeback_single_inode+0x18c/0x1ac
[<80196bc8>] sync_sb_inodes+0x208/0x2f0
[<80196d34>] writeback_inodes+0x84/0xd0
[<80150400>] background_writeout+0xac/0xfc
[<80151350>] __pdflush+0x130/0x228
[<80151478>] pdflush+0x30/0x3c
[<801398dc>] kthread+0x98/0xe0
[<80104c58>] kernel_thread_helper+0x10/0x18

xfs_force_shutdown(dm-3,0x8) called from line 1139 of file fs/xfs/xfs_trans.c. Return address = 0x80302eec
Filesystem "dm-3": Corruption of in-memory data detected. Shutting down filesystem: dm-3
Please umount the filesystem, and rectify the problem(s)

  After googling, I figured out that 2.6.19 has fixed this issue.  Any pointers on that?
   
  Thanks
  Sagar

       
---------------------------------
Be a better friend, newshound, and know-it-all with Yahoo! Mobile.  Try it now.
--0-892190949-1209949438=:30397
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div>Folks,</div>  <div>&nbsp;</div>  <div>I am not sure whether this is the right list for below mentioned question. If not please direct me to the right list. Thanks in advance.</div>  <div>&nbsp;</div>  <div>I am currently finding a strange issue with 2.6.18 kernel while performing the stress test with iozone on the NAS box under development. When I am trying to pump the data over iozone on the NAS box, the share on which the data transfer is progressing, gets disappeared suddenly till I reboot the system. Although this problem is seen infrequently, the frequency is quite high i.e upto 3 times out of five tests. I was able to capture following stack dump on the system. </div>  <div>&nbsp;</div>  <div>1 input overrun(s)<BR>zoneinfo 1725 02 1744XFS internal error XFS_WANT_CORRUPTED_GOTO at line 2191 of file fs/xfs/x<BR>fs_bmap_btree.c. Caller 0x802b61a4<BR>Call Trace:<BR>[&lt;801098a8&gt;] dump_stack+0x18/0x44<BR>[&lt;802c6150&gt;]
 xfs_error_report+0x58/0x64<BR>[&lt;802b629c&gt;] xfs_bmbt_insert+0x16c/0x194<BR>[&lt;802a7674&gt;] xfs_bmap_add_extent_delay_real+0x888/0x15e8<BR>[&lt;802a6c30&gt;] xfs_bmap_add_extent+0x328/0x4e4<BR>[&lt;802afa40&gt;] xfs_bmapi+0xa98/0x13e4<BR>[&lt;802d6e30&gt;] xfs_iomap_write_allocate+0x340/0x5d8<BR>[&lt;802d5718&gt;] xfs_iomap+0x408/0x4dc<BR>[&lt;803014bc&gt;] xfs_bmap+0x30/0x3c<BR>[&lt;802f68ac&gt;] xfs_map_blocks+0x50/0x84<BR>[&lt;802f7cdc&gt;] xfs_page_state_convert+0x3f4/0x840<BR>[&lt;802f820c&gt;] xfs_vm_writepage+0xe4/0x140<BR>[&lt;80198778&gt;] mpage_writepages+0x24c/0x45c<BR>[&lt;802f8298&gt;] xfs_vm_writepages+0x30/0x3c<BR>[&lt;801507d4&gt;] do_writepages+0x44/0x84<BR>[&lt;80196648&gt;] __sync_single_inode+0x68/0x234<BR>[&lt;801969a0&gt;] __writeback_single_inode+0x18c/0x1ac<BR>[&lt;80196bc8&gt;] sync_sb_inodes+0x208/0x2f0<BR>[&lt;80196d34&gt;] writeback_inodes+0x84/0xd0<BR>[&lt;80150400&gt;] background_writeout+0xac/0xfc<BR>[&lt;80151350&gt;]
 __pdflush+0x130/0x228<BR>[&lt;80151478&gt;] pdflush+0x30/0x3c<BR>[&lt;801398dc&gt;] kthread+0x98/0xe0<BR>[&lt;80104c58&gt;] kernel_thread_helper+0x10/0x18<BR><BR>Filesystem "dm-3": XFS internal error xfs_trans_cancel at line 1138 of file fs/xfs/xfs_trans.c. Caller 0x802d7084<BR>Call Trace:<BR>[&lt;801098a8&gt;] dump_stack+0x18/0x44<BR>[&lt;802c6150&gt;] xfs_error_report+0x58/0x64<BR>[&lt;802e89a4&gt;] xfs_trans_cancel+0x98/0x150<BR>[&lt;802d7084&gt;] xfs_iomap_write_allocate+0x594/0x5d8<BR>[&lt;802d5718&gt;] xfs_iomap+0x408/0x4dc<BR>[&lt;803014bc&gt;] xfs_bmap+0x30/0x3c<BR>[&lt;802f68ac&gt;] xfs_map_blocks+0x50/0x84<BR>[&lt;802f7cdc&gt;] xfs_page_state_convert+0x3f4/0x840<BR>[&lt;802f820c&gt;] xfs_vm_writepage+0xe4/0x140<BR>[&lt;80198778&gt;] mpage_writepages+0x24c/0x45c<BR>[&lt;802f8298&gt;] xfs_vm_writepages+0x30/0x3c<BR>[&lt;801507d4&gt;] do_writepages+0x44/0x84<BR>[&lt;80196648&gt;] __sync_single_inode+0x68/0x234<BR>[&lt;801969a0&gt;]
 __writeback_single_inode+0x18c/0x1ac<BR>[&lt;80196bc8&gt;] sync_sb_inodes+0x208/0x2f0<BR>[&lt;80196d34&gt;] writeback_inodes+0x84/0xd0<BR>[&lt;80150400&gt;] background_writeout+0xac/0xfc<BR>[&lt;80151350&gt;] __pdflush+0x130/0x228<BR>[&lt;80151478&gt;] pdflush+0x30/0x3c<BR>[&lt;801398dc&gt;] kthread+0x98/0xe0<BR>[&lt;80104c58&gt;] kernel_thread_helper+0x10/0x18<BR><BR>xfs_force_shutdown(dm-3,0x8) called from line 1139 of file fs/xfs/xfs_trans.c. Return address = 0x80302eec<BR>Filesystem "dm-3": Corruption of in-memory data detected. Shutting down filesystem: dm-3<BR>Please umount the filesystem, and rectify the problem(s)<BR></div>  <div>After googling, I figured out that 2.6.19 has fixed this issue.&nbsp; Any pointers on that?</div>  <div>&nbsp;</div>  <div>Thanks</div>  <div>Sagar</div><p>&#32;

      <hr size=1>Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile. <a href="http://us.rd.yahoo.com/evt=51733/*http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ "> Try it now.</a>
--0-892190949-1209949438=:30397--
