Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBKHYaFj015898
	for <linux-lvm@redhat.com>; Wed, 20 Dec 2006 12:34:36 -0500
Received: from nirvana.newsnow.net (bush.newsnow.net [217.204.97.18])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBKHYXEf013344
	for <linux-lvm@redhat.com>; Wed, 20 Dec 2006 12:34:34 -0500
Received: from amavis by nirvana.newsnow.net with scanned-ok (Exim 3.35 #1
	(Debian)) id 1Gx5Kl-0006AY-00
	for <linux-lvm@redhat.com>; Wed, 20 Dec 2006 17:34:27 +0000
Received: from nasa.newsnow.net ([192.168.1.206] helo=nasa)
	by nirvana.newsnow.net with esmtp (Exim 3.35 #1 (Debian))
	id 1Gx5Kj-000697-00
	for <linux-lvm@redhat.com>; Wed, 20 Dec 2006 17:34:25 +0000
Received: from alan by nasa with local (Exim 4.63)
	(envelope-from <alan.mcnatty@NewsNow.co.uk>) id 1Gx5MN-0007Dr-Hv
	for linux-lvm@redhat.com; Wed, 20 Dec 2006 17:36:07 +0000
From: Alan McNatty <alan.mcnatty@NewsNow.co.uk>
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Dec 2006 17:36:06 +0000
Message-Id: <1166636167.10999.40.camel@nasa>
Mime-Version: 1.0
Subject: [linux-lvm] oops during umount of lvm snapshot
Reply-To: alan.mcnatty@NewsNow.co.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi,

I have been testing creating in effect rolling snapshots in a mysql-zrm
kinda way (mysql lock and system call). I have in the process managed to
create a kernel oops that might be of interest to ML (brought about by
me doing something pretty stupid, don't panic). 

I originally have my /var/lib/mysql as a LVM jfs partition. Then took a
number of snapshots, mounted them, etc .. Then descided to switch to
ext3, etc so backed up the contents, unmounted /var/lib/mysql,
reformatted as ext3 and remounted. Then tried (afterwards) to umount
then lvremove the snapshots .. oops (I think it is triggered by the
umount)! Life seems to be continuing as normal inspite of the oops
(subsequent snapshots seem fine, etc).

Let me know if anyone is interested in more info .. some obvious bits
follow. 

-- from syslog

Dec 20 17:15:02 ford kernel: metapage_read_end_io: I/O error
Dec 20 17:15:03 ford kernel: metapage_write_end_io: I/O error
Dec 20 17:15:05 ford kernel: kjournald starting.  Commit interval 5
seconds
Dec 20 17:15:05 ford kernel: EXT3 FS on dm-14, internal journal
Dec 20 17:15:05 ford kernel: EXT3-fs: mounted filesystem with ordered
data mode.
Dec 20 17:15:05 ford kernel: kjournald starting.  Commit interval 5
seconds
Dec 20 17:15:05 ford kernel: EXT3 FS on dm-26, internal journal
Dec 20 17:15:05 ford kernel: EXT3-fs: mounted filesystem with ordered
data mode.
Dec 20 17:15:11 ford kernel: metapage_write_end_io: I/O error
Dec 20 17:15:11 ford kernel: metapage_read_end_io: I/O error
Dec 20 17:15:11 ford kernel: metapage_read_end_io: I/O error
Dec 20 17:15:11 ford kernel: metapage_write_end_io: I/O error
Dec 20 17:15:11 ford kernel: metapage_read_end_io: I/O error
Dec 20 17:15:11 ford kernel: metapage_read_end_io: I/O error
Dec 20 17:15:11 ford kernel: metapage_write_end_io: I/O error
Dec 20 17:15:11 ford kernel: metapage_read_end_io: I/O error
Dec 20 17:15:11 ford last message repeated 2 times
Dec 20 17:15:12 ford kernel: BUG: unable to handle kernel NULL pointer
dereference at virtual address 00000024
Dec 20 17:15:12 ford kernel:  printing eip:
Dec 20 17:15:12 ford kernel: f89838a8
Dec 20 17:15:12 ford kernel: *pde = 2f277001
Dec 20 17:15:12 ford kernel: *pte = 00000000
Dec 20 17:15:12 ford kernel: Oops: 0000 [#1]
Dec 20 17:15:12 ford kernel: SMP
Dec 20 17:15:12 ford kernel: Modules linked in: jfs dm_snapshot
dm_mirror softdog tg3 genrtc ext2 ext3 jbd mbcache dm_mod sd_mod aacraid
scsi_mod unix
Dec 20 17:15:12 ford kernel: CPU:    1
Dec 20 17:15:12 ford kernel: EIP:    0060:[pg0+946014376/1070248960]
Not tainted VLI
Dec 20 17:15:12 ford kernel: EFLAGS: 00010246   (2.6.19 #1)
Dec 20 17:15:12 ford kernel: EIP is at lmWriteRecord+0x28/0x366 [jfs]
Dec 20 17:15:12 ford kernel: eax: 00000000   ebx: e222040c   ecx:
00000000   edx: e2220434
Dec 20 17:15:12 ford kernel: esi: e22203c0   edi: e22203c0   ebp:
f05290c0   esp: c82afe18
Dec 20 17:15:12 ford kernel: ds: 007b   es: 007b   ss: 0068
Dec 20 17:15:12 ford kernel: Process umount (pid: 5513, ti=c82ae000
task=c7dbf550 task.ti=c82ae000)
Dec 20 17:15:12 ford kernel: Stack: 00000001 0000000e 00000000 00000000
00000000 00000000 7fffffff 00000000
Dec 20 17:15:12 ford kernel:        c20f7700 c01840f2 00000000 00000000
00000000 e222040c e22203c0 e22203c0
Dec 20 17:15:12 ford kernel:        f05290c0 f8984eb6 e22203c0 00000000
c82afe74 00000000 edab542c 00000000
Dec 20 17:15:12 ford kernel: Call Trace:
Dec 20 17:15:12 ford kernel:  [bio_put+42/48] bio_put+0x2a/0x30
Dec 20 17:15:12 ford kernel:  [pg0+946020022/1070248960] lmLogShutdown
+0x60/0x11e [jfs]
Dec 20 17:15:12 ford kernel:  [filemap_write_and_wait+61/68]
filemap_write_and_wait+0x3d/0x44
Dec 20 17:15:12 ford kernel:  [pg0+946019339/1070248960] lmLogClose
+0x102/0x108 [jfs]
Dec 20 17:15:12 ford kernel:  [pg0+945920067/1070248960] updateSuper
+0x56/0x11a [jfs]
Dec 20 17:15:12 ford kernel:  [pg0+945920780/1070248960] jfs_umount
+0xf4/0x104 [jfs]
Dec 20 17:15:12 ford kernel:  [pg0+945902263/1070248960] jfs_put_super
+0x19/0x83 [jfs]
Dec 20 17:15:12 ford kernel:  [generic_shutdown_super+264/274]
generic_shutdown_super+0x108/0x112
Dec 20 17:15:12 ford kernel:  [kill_block_super+45/73] kill_block_super
+0x2d/0x49
Dec 20 17:15:12 ford kernel:  [deactivate_super+81/151] deactivate_super
+0x51/0x97
Dec 20 17:15:12 ford kernel:  [sys_umount+63/145] sys_umount+0x3f/0x91
Dec 20 17:15:12 ford kernel:  [sys_munmap+71/85] sys_munmap+0x47/0x55
Dec 20 17:15:12 ford kernel:  [sys_oldumount+23/27] sys_oldumount
+0x17/0x1b
Dec 20 17:15:12 ford kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Dec 20 17:15:12 ford kernel:  [fib_get_next+255/282] fib_get_next
+0xff/0x11a
Dec 20 17:15:12 ford kernel:  =======================
Dec 20 17:15:12 ford kernel: Code: 00 eb b0 55 57 56 53 83 ec 34 c7 44
24 30 00 00 00 00 c7 44 24 14 00 00 00 00 8b 44 24 48 8b 40 48 8b 4c 24
54 89 44 24 2c 85 c9 <8b> 50 24 8b 44 24 48 89 54 24 28 8b 40 44 89 44
24 24 0f 84 a4
Dec 20 17:15:12 ford kernel: EIP: [pg0+946014376/1070248960]
lmWriteRecord+0x28/0x366 [jfs] SS:ESP 0068:c82afe18
Dec 20 17:15:12 ford kernel:  BUG: warning at
kernel/exit.c:859/do_exit()
Dec 20 17:15:12 ford kernel:  [do_exit+1096/1101] do_exit+0x448/0x44d
Dec 20 17:15:12 ford kernel:  [do_trap+0/269] do_trap+0x0/0x10d
Dec 20 17:15:12 ford kernel:  [do_page_fault+737/1749] do_page_fault
+0x2e1/0x6d5
Dec 20 17:15:12 ford kernel:  [find_get_pages_tag+65/131]
find_get_pages_tag+0x41/0x83
Dec 20 17:15:12 ford kernel:  [do_page_fault+0/1749] do_page_fault
+0x0/0x6d5
Dec 20 17:15:12 ford kernel:  [error_code+57/64] error_code+0x39/0x40
Dec 20 17:15:12 ford kernel:  [pg0+946014376/1070248960] lmWriteRecord
+0x28/0x366 [jfs]
Dec 20 17:15:12 ford kernel:  [bio_put+42/48] bio_put+0x2a/0x30
Dec 20 17:15:12 ford kernel:  [pg0+946020022/1070248960] lmLogShutdown
+0x60/0x11e [jfs]
Dec 20 17:15:12 ford kernel:  [filemap_write_and_wait+61/68]
filemap_write_and_wait+0x3d/0x44
Dec 20 17:15:12 ford kernel:  [pg0+946019339/1070248960] lmLogClose
+0x102/0x108 [jfs]
Dec 20 17:15:12 ford kernel:  [pg0+945920067/1070248960] updateSuper
+0x56/0x11a [jfs]
Dec 20 17:15:12 ford kernel:  [pg0+945920780/1070248960] jfs_umount
+0xf4/0x104 [jfs]
Dec 20 17:15:12 ford kernel:  [pg0+945902263/1070248960] jfs_put_super
+0x19/0x83 [jfs]
Dec 20 17:15:12 ford kernel:  [generic_shutdown_super+264/274]
generic_shutdown_super+0x108/0x112
Dec 20 17:15:12 ford kernel:  [kill_block_super+45/73] kill_block_super
+0x2d/0x49
Dec 20 17:15:12 ford kernel:  [deactivate_super+81/151] deactivate_super
+0x51/0x97
Dec 20 17:15:12 ford kernel:  [sys_umount+63/145] sys_umount+0x3f/0x91
Dec 20 17:15:12 ford kernel:  [sys_munmap+71/85] sys_munmap+0x47/0x55
Dec 20 17:15:12 ford kernel:  [sys_oldumount+23/27] sys_oldumount
+0x17/0x1b
Dec 20 17:15:12 ford kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Dec 20 17:15:12 ford kernel:  [fib_get_next+255/282] fib_get_next
+0xff/0x11a
Dec 20 17:15:12 ford kernel:  =======================

I'm running a 2.6.19 kernel, lvdisplay --version tells me:

  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.08 (2006-07-17)
  Driver version:  4.10.0

Cheers,
Alan
