Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1S4b7819398
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 23:37:07 -0500
Received: from ms-smtp-01-eri0.texas.rr.com (ms-smtp-01.texas.rr.com [24.93.47.40])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1S4b6b00673
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 23:37:07 -0500
Received: from tor.tx.mcbf.net (cpe-66-68-252-217.rgv.rr.com [66.68.252.217])
	by ms-smtp-01-eri0.texas.rr.com (8.12.10/8.12.7) with ESMTP id i1S4b4Lc022166
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 22:37:04 -0600 (CST)
Received: from squisher by tor.tx.mcbf.net with local (Exim 4.30)
	id 1AwwLe-00042s-Ki
	for linux-lvm@redhat.com; Fri, 27 Feb 2004 22:45:10 -0600
From: David <damailings@mcbf.net>
Message-ID: <20040228044510.GA15466@tx.mcbf.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM access hangs
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 27 23:35:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,
I just recently set up an LVM and now I'm into big trouble.
The lvm partition that I have is completely unresponsive, when I try to
access it, the kernel just hangs. I have quite a bit of data on there so
if anyone knows how I can get this back up, it would be absolutely
great.

I was using kernel 2.4.22. I created one phyiscal volume /dev/hda10,
added it to the volume group data and created a logical volume datalv
over the whole space. Then I upgraded to kernel 2.6.2 (Debian testing)
and wanted to add another physical volume.
I created the PV on /dev/hda10 and noticed that it was lvm2 while the
older one is lvm1. So I converted lvm1 to lvm2 and added the PV o the VG
data and increased the size of the LV.
I was running reiserfs, so I resized the partition. It did not want to
unmount for some reason so I resized it life (it is supported). That all
worked just fine.
Now, I even read some files from that partition but when I tried to
write something, it all crashed. When I tried to access the partition in
any way, it would not work. It was already written down in fstab and
mounts fine but any process that accesses the mount point seems to get
into a deadlock.

I think at the time of the write attempt, something crashed. I found the
following output in my logs:
----SNIP /var/log/syslog-----
Feb 25 22:16:11 tor kernel: printing eip:
Feb 25 22:16:11 tor kernel: c0194c3d
Feb 25 22:16:11 tor kernel: Oops: 0000 [#1]
Feb 25 22:16:11 tor kernel: CPU:    0
Feb 25 22:16:11 tor kernel: EIP:    0060:[<c0194c3d>]    Not tainted
Feb 25 22:16:11 tor kernel: EFLAGS: 00010282
Feb 25 22:16:11 tor kernel: EIP is at scan_bitmap_block+0x3d/0x500
Feb 25 22:16:11 tor kernel: eax: 00000000   ebx: 00000000   ecx: 000000df   edx: d086d000
Feb 25 22:16:11 tor kernel: esi: d086d6f8   edi: 00000001   ebp: 00000001   esp: c6297b58
Feb 25 22:16:11 tor kernel: ds: 007b   es: 007b   ss: 0068
Feb 25 22:16:11 tor kernel: Process smbd (pid: 2702, threadinfo=c6296000 task=ca68f8e0)
Feb 25 22:16:11 tor kernel: Stack: 00000001 c6297e10 00000018 00000000 cf6f4800 c0223db1 cfc060c0 000000df 
Feb 25 22:16:11 tor kernel: c6297bb8 00000001 00000001 c01952b0 c6297d88 000000df c6297bb8 00008000 
Feb 25 22:16:11 tor kernel: 00000001 00000001 00000001 00008000 00001000 00003fff 00000196 00008000 
Feb 25 22:16:11 tor kernel: Call Trace:
Feb 25 22:16:11 tor kernel: [<c0223db1>] qdisc_restart+0x11/0xd0
Feb 25 22:16:11 tor kernel: [<c01952b0>] scan_bitmap+0x1b0/0x210
Feb 25 22:16:11 tor kernel: [<c0195c50>] reiserfs_allocate_blocknrs+0x1c0/0x790
Feb 25 22:16:11 tor kernel: [<c019cd59>] reiserfs_get_block+0x2d9/0x1270
Feb 25 22:16:11 tor kernel: [<c01eba32>] as_add_request+0x182/0x1f0
Feb 25 22:16:11 tor kernel: [<c01e3e7f>] __elv_add_request+0x1f/0x40
Feb 25 22:16:11 tor kernel: [<c01e6972>] __make_request+0x292/0x530
Feb 25 22:16:11 tor kernel: [<c01fafc2>] ide_build_sglist+0x32/0xc0
Feb 25 22:16:11 tor kernel: [<c011ea28>] __mod_timer+0x58/0x80
Feb 25 22:16:11 tor kernel: [<c01c5bbd>] __delay+0xd/0x10
Feb 25 22:16:11 tor kernel: [<c01f4def>] ide_execute_command+0x6f/0x80
Feb 25 22:16:11 tor kernel: [<c01fb81b>] __ide_dma_begin+0x2b/0x40
Feb 25 22:16:11 tor kernel: [<c01fe164>] __ide_do_rw_disk+0x174/0x620
Feb 25 22:16:11 tor kernel: [<c0114fe3>] schedule+0x2f3/0x530
Feb 25 22:16:11 tor kernel: [<c0148b35>] __block_prepare_write+0x1d5/0x420
Feb 25 22:16:11 tor kernel: [<c012d80e>] add_to_page_cache+0x3e/0xb0
Feb 25 22:16:11 tor kernel: [<c0149560>] block_prepare_write+0x20/0x30
Feb 25 22:16:11 tor kernel: [<c019ca80>] reiserfs_get_block+0x0/0x1270
Feb 25 22:16:11 tor kernel: [<c019fedb>] reiserfs_prepare_write+0x6b/0xa0
Feb 25 22:16:11 tor kernel: [<c019ca80>] reiserfs_get_block+0x0/0x1270
Feb 25 22:16:11 tor kernel: [<c01491b4>] generic_cont_expand+0xc4/0x140
Feb 25 22:16:11 tor kernel: [<c01a0898>] reiserfs_setattr+0x88/0x140
Feb 25 22:16:11 tor kernel: [<c01133e0>] do_page_fault+0x110/0x4ea
Feb 25 22:16:11 tor kernel: [<c015c7a8>] notify_change+0x138/0x180
Feb 25 22:16:11 tor kernel: [<c01443e0>] do_truncate+0x40/0x60
Feb 25 22:16:11 tor kernel: [<c01448b4>] sys_ftruncate64+0xc4/0x110
Feb 25 22:16:11 tor kernel: [<c0108c17>] syscall_call+0x7/0xb
Feb 25 22:16:11 tor kernel: 
Feb 25 22:16:11 tor kernel: Code: 8b 00 a8 04 0f 85 7a 04 00 00 66 8b 06 89 c2 81 e2 ff ff 00 
----SNAP-----
But I am not 100% certain it is related to the problem, as now when I
try to access the partition, it just hangs and I don't get an error
anymore.
And reiserfsck just quits and gives me no output. I think something is
seriously messed up here and I think it is lvm. When I do a vgdisplay, I
can see that the vg is way to full. I had just added the new pv and it
is already completely filled up even though df still shows the correct usage
level.
Please help!

Here some assorted output:
--pvdisplay--
tor:~# pvdisplay
  Physical volume "/dev/hda10" of volume group "data" is exported
  --- Physical volume ---
  PV Name               /dev/hda10
  VG Name               data (exported)
  PV Size               27.91 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              893
  Free PE               0
  Allocated PE          893
  PV UUID               ODcmyo-FeES-58Pq-mo9b-Rbu0-47kH-Vqn9zG
    
  --- Physical volume ---
  PV Name               /dev/hda9
  VG Name               data
  PV Size               23.28 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              745
  Free PE               12
  Allocated PE          733
  PV UUID               zkStfs-M4E9-4B4D-Qb95-M9t5-T0el-EK4vx5
    
--/pvdisplay--

--vgdisplay--
tor:~# vgdisplay
  --- Volume group ---
  VG Name               data
  System ID             tor1076209531
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Open LV               0
  Max PV                256
  Cur PV                2
  Act PV                2
  VG Size               51.19 GB
  PE Size               32.00 MB
  Total PE              1638
  Alloc PE / Size       1626 / 50.81 GB
  Free  PE / Size       12 / 384.00 MB
  VG UUID               C4QDlg-uKm0-kzL9-5iEw-Dfsq-0U5p-p3NZWO
--/vgdisplay--

--lvdisplay--
tor:~# lvdisplay
  --- Logical volume ---
  LV Name                /dev/data/datalv
  VG Name                data
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                50.81 GB
  Current LE             1626
  Segments               2
  Allocation             next free
  Read ahead sectors     1024
  Block device           254:0
--/lvdisplay--

Thanks,
David
