Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4REKo009787
	for <linux-lvm@redhat.com>; Thu, 27 May 2004 10:20:50 -0400
Received: from domino.teamhuber.com (domino.teamhuber.com [206.228.125.136]
	(may be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4REKni5009934
	for <linux-lvm@redhat.com>; Thu, 27 May 2004 10:20:49 -0400
MIME-Version: 1.0
Message-ID: <OFF4C9068A.F30A62F0-ON86256EA1.004DC474-86256EA1.004ECDE2@teamhuber.com>
From: CHicklin@teamhuber.com
Date: Thu, 27 May 2004 09:23:06 -0500
Content-Type: multipart/alternative;
	boundary="=_alternative 004ECDDB86256EA1_="
Subject: [linux-lvm] domino on lvm2+reiserfs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multipart message in MIME format.
--=_alternative 004ECDDB86256EA1_=
Content-Type: text/plain; charset="US-ASCII"

Hi,
        I'm having some problems with a Lotus Domino server (v6.5.1) 
running on Suse Linux Pro 9.1 (sorry, not RedHat, but I hope someone here 
can help anyway). 
        The OS is installed on the first and only SCSI hard disk on 
Channel A of a dual-channel SCSI controller.  Channel B contains 4 SCSI 
hard disks, each of which is a PV and are all part of the "datavg" volume 
group.  There is one LV in datavg, namely lotuslv.  It has a reiserfs 
filesystem on it which contains the Domino data directory.
        After installing Domino, everything seemed to be running fine.  I 
even created and destroyed a couple of snapshot LV's to test my backup 
scripts.  I left the server running overnight, only to have it lock up.  I 
think it may have to do with the snapshot LV's, but it did the same thing 
the following day without taking a snapshot.  I've attached what I think 
is the appropriate messages from the error log on the machine.
        Can anyone take a look and see if there is an obvious problem 
here?  Are there specific things to look out for when creating snapshots? 
Any issues with ReiserFS?  Thanks.

-------------- begin error messages 1 -------------
May 20 02:00:01 semco-ms kernel: lvcreate: page allocation failure. 
order:0, mode:0xd2
May 20 02:00:01 semco-ms kernel: Call Trace:
May 20 02:00:01 semco-ms kernel:  [__alloc_pages+873/880] 
__alloc_pages+0x369/0x370
May 20 02:00:01 semco-ms kernel:  [<c01495c9>] __alloc_pages+0x369/0x370
May 20 02:00:01 semco-ms kernel:  [__vmalloc+215/320] __vmalloc+0xd7/0x140
May 20 02:00:01 semco-ms kernel:  [<c015e447>] __vmalloc+0xd7/0x140
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2735925/2826430] dm_vcalloc+0x27/0x60 [dm_mod]
May 20 02:00:01 semco-ms kernel:  [<f8d6a297>] dm_vcalloc+0x27/0x60 
[dm_mod]
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2793030/2826430] init_exception_table+0x18/0x60 
[dm_snapshot]
May 20 02:00:01 semco-ms kernel:  [<f8d781a8>] 
init_exception_table+0x18/0x60 [dm_snapshot]
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2793784/2826430] snapshot_ctr+0x2aa/0x4f0 
[dm_snapshot]
May 20 02:00:01 semco-ms kernel:  [<f8d7849a>] snapshot_ctr+0x2aa/0x4f0 
[dm_snapshot]
May 20 02:00:01 semco-ms /etc/hotplug/block.agent[30703]: try 1 while 
waiting for /block/dm-1's bus_id 
May 20 02:00:01 semco-ms /etc/hotplug/block.agent[30704]: try 1 while 
waiting for /block/dm-2's bus_id 
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2737498/2826430] dm_table_add_target+0x27c/0x430 
[dm_mod]
May 20 02:00:01 semco-ms kernel:  [<f8d6a8bc>] 
dm_table_add_target+0x27c/0x430 [dm_mod]
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2738062/2826430] dm_table_create+0x80/0xb3 
[dm_mod]
May 20 02:00:01 semco-ms kernel:  [<f8d6aaf0>] dm_table_create+0x80/0xb3 
[dm_mod]
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2744915/2826430] table_load+0x95/0x1e0 [dm_mod]
May 20 02:00:01 semco-ms kernel:  [<f8d6c5b5>] table_load+0x95/0x1e0 
[dm_mod]
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2747056/2826430] ctl_ioctl+0x292/0x440 [dm_mod]
May 20 02:00:01 semco-ms kernel:  [<f8d6ce12>] ctl_ioctl+0x292/0x440 
[dm_mod]
May 20 02:00:01 semco-ms kernel:  [blkdev_get_blocks+0/160] 
blkdev_get_blocks+0x0/0xa0
May 20 02:00:01 semco-ms kernel:  [<c016bee0>] blkdev_get_blocks+0x0/0xa0
May 20 02:00:01 semco-ms kernel: 
[__crc_driver_remove_file+2744766/2826430] table_load+0x0/0x1e0 [dm_mod]
May 20 02:00:01 semco-ms kernel:  [<f8d6c520>] table_load+0x0/0x1e0 
[dm_mod]
May 20 02:00:01 semco-ms kernel:  [run_timer_softirq+206/368] 
run_timer_softirq+0xce/0x170
May 20 02:00:01 semco-ms kernel:  [<c012db7e>] 
run_timer_softirq+0xce/0x170
May 20 02:00:01 semco-ms kernel:  [sys_ioctl+646/1092] 
sys_ioctl+0x286/0x444
May 20 02:00:01 semco-ms kernel:  [<c0176d46>] sys_ioctl+0x286/0x444
May 20 02:00:01 semco-ms kernel:  [smp_apic_timer_interrupt+234/352] 
smp_apic_timer_interrupt+0xea/0x160
May 20 02:00:01 semco-ms kernel:  [<c011adca>] 
smp_apic_timer_interrupt+0xea/0x160
May 20 02:00:01 semco-ms kernel:  [sysenter_past_esp+82/121] 
sysenter_past_esp+0x52/0x79
May 20 02:00:01 semco-ms kernel:  [<c01091c9>] sysenter_past_esp+0x52/0x79
May 20 02:00:01 semco-ms kernel: 
May 20 02:00:01 semco-ms kernel: device-mapper: : Unable to allocate hash 
table space
May 20 02:00:01 semco-ms kernel: 
May 20 02:00:01 semco-ms kernel: device-mapper: error adding target to 
table
-------------- end error messages 1 -------------

-------------- end error messages 2 -------------
May 20 06:06:10 semco-ms kernel: Unable to handle kernel paging request at 
virtual address f8d61000
May 20 06:06:10 semco-ms kernel:  printing eip:
May 20 06:06:10 semco-ms kernel: f8d79003
May 20 06:06:10 semco-ms kernel: *pde = 01891067
May 20 06:06:10 semco-ms kernel: Oops: 0002 [#1]
May 20 06:06:10 semco-ms kernel: SMP 
May 20 06:06:10 semco-ms kernel: CPU:    0
May 20 06:06:10 semco-ms kernel: EIP: 
0060:[__crc_driver_remove_file+2796705/2826430]    Not tainted
May 20 06:06:10 semco-ms kernel: EIP:    0060:[<f8d79003>]    Not tainted
May 20 06:06:10 semco-ms kernel: EFLAGS: 00010202   (2.6.4-54.5-smp) 
May 20 06:06:10 semco-ms kernel: EIP is at persistent_commit+0x63/0x100 
[dm_snapshot]
May 20 06:06:10 semco-ms kernel: eax: 00000201   ebx: 00000000   ecx: 
f8d61000   edx: f8d60000
May 20 06:06:10 semco-ms kernel: esi: f6c3c500   edi: f8d78000   ebp: 
f8d77fb0   esp: f7707ef8
May 20 06:06:10 semco-ms kernel: ds: 007b   es: 007b   ss: 0068
May 20 06:06:10 semco-ms kernel: Process kcopyd/0 (pid: 711, 
threadinfo=f7706000 task=f7af9970)
May 20 06:06:10 semco-ms kernel: Stack: 0023cf80 00000000 000016cd 
00000000 d939e46c f6c38d80 d939e46c f8d77ff4 
May 20 06:06:10 semco-ms kernel:        d939e46c d939a3f4 00000000 
f8d6e9ed 00000000 00000246 d939a3f4 f8d74778 
May 20 06:06:10 semco-ms kernel:        f8d6e9a0 f8d6e698 00000006 
00000212 c1bf2000 f8d75344 00000000 f8d6e76f 
May 20 06:06:10 semco-ms kernel: Call Trace:
May 20 06:06:10 semco-ms kernel: 
[__crc_driver_remove_file+2792594/2826430] copy_callback+0x44/0x50 
[dm_snapshot]
May 20 06:06:10 semco-ms kernel:  [<f8d77ff4>] copy_callback+0x44/0x50 
[dm_snapshot]
May 20 06:06:10 semco-ms kernel: 
[__crc_driver_remove_file+2754187/2826430] run_complete_job+0x4d/0x70 
[dm_mod]
May 20 06:06:10 semco-ms kernel:  [<f8d6e9ed>] run_complete_job+0x4d/0x70 
[dm_mod]
May 20 06:06:10 semco-ms kernel: 
[__crc_driver_remove_file+2754110/2826430] run_complete_job+0x0/0x70 
[dm_mod]
May 20 06:06:10 semco-ms kernel:  [<f8d6e9a0>] run_complete_job+0x0/0x70 
[dm_mod]
May 20 06:06:10 semco-ms kernel: 
[__crc_driver_remove_file+2753334/2826430] process_jobs+0x18/0xe0 [dm_mod]
May 20 06:06:10 semco-ms kernel:  [<f8d6e698>] process_jobs+0x18/0xe0 
[dm_mod]
May 20 06:06:10 semco-ms kernel: 
[__crc_driver_remove_file+2753549/2826430] do_work+0xf/0x30 [dm_mod]
May 20 06:06:10 semco-ms kernel:  [<f8d6e76f>] do_work+0xf/0x30 [dm_mod]
May 20 06:06:10 semco-ms kernel:  [worker_thread+391/528] 
worker_thread+0x187/0x210
May 20 06:06:10 semco-ms kernel:  [<c0135c57>] worker_thread+0x187/0x210
May 20 06:06:10 semco-ms kernel: 
[__crc_driver_remove_file+2753534/2826430] do_work+0x0/0x30 [dm_mod]
May 20 06:06:10 semco-ms kernel:  [<f8d6e760>] do_work+0x0/0x30 [dm_mod]
May 20 06:06:10 semco-ms kernel:  [default_wake_function+0/16] 
default_wake_function+0x0/0x10
May 20 06:06:10 semco-ms kernel:  [<c01209d0>] 
default_wake_function+0x0/0x10
May 20 06:06:10 semco-ms kernel:  [default_wake_function+0/16] 
default_wake_function+0x0/0x10
May 20 06:06:10 semco-ms kernel:  [<c01209d0>] 
default_wake_function+0x0/0x10
May 20 06:06:10 semco-ms kernel:  [worker_thread+0/528] 
worker_thread+0x0/0x210
May 20 06:06:10 semco-ms kernel:  [<c0135ad0>] worker_thread+0x0/0x210
May 20 06:06:10 semco-ms kernel:  [kthread+212/280] kthread+0xd4/0x118
May 20 06:06:10 semco-ms kernel:  [<c0139484>] kthread+0xd4/0x118
May 20 06:06:10 semco-ms kernel:  [kthread+0/280] kthread+0x0/0x118
May 20 06:06:10 semco-ms kernel:  [<c01393b0>] kthread+0x0/0x118
May 20 06:06:10 semco-ms kernel:  [kernel_thread_helper+5/16] 
kernel_thread_helper+0x5/0x10
May 20 06:06:10 semco-ms kernel:  [<c0107005>] 
kernel_thread_helper+0x5/0x10
May 20 06:06:10 semco-ms kernel: 
-------------- end error messages 2 -------------

--
Clayton Hicklin
Systems Engineer
Huber and Associates, Inc.
Phone: (573) 634-5000
Fax: (573) 634-5500
chicklin@teamhuber.com

--=_alternative 004ECDDB86256EA1_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi,</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; I'm
having some problems with a Lotus Domino server (v6.5.1) running on Suse
Linux Pro 9.1 (sorry, not RedHat, but I hope someone here can help anyway).
&nbsp;</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; The
OS is installed on the first and only SCSI hard disk on Channel A of a
dual-channel SCSI controller. &nbsp;Channel B contains 4 SCSI hard disks,
each of which is a PV and are all part of the &quot;datavg&quot; volume
group. &nbsp;There is one LV in datavg, namely lotuslv. &nbsp;It has a
reiserfs filesystem on it which contains the Domino data directory.</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; After
installing Domino, everything seemed to be running fine. &nbsp;I even created
and destroyed a couple of snapshot LV's to test my backup scripts. &nbsp;I
left the server running overnight, only to have it lock up. &nbsp;I think
it may have to do with the snapshot LV's, but it did the same thing the
following day without taking a snapshot. &nbsp;I've attached what I think
is the appropriate messages from the error log on the machine.</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Can
anyone take a look and see if there is an obvious problem here? &nbsp;Are
there specific things to look out for when creating snapshots? &nbsp;Any
issues with ReiserFS? &nbsp;Thanks.</font>
<br>
<br><font size=2 face="sans-serif">-------------- begin error messages
1 -------------</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: lvcreate:
page allocation failure. order:0, mode:0xd2</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: Call
Trace:</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__alloc_pages+873/880]
__alloc_pages+0x369/0x370</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;c01495c9&gt;]
__alloc_pages+0x369/0x370</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__vmalloc+215/320]
__vmalloc+0xd7/0x140</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;c015e447&gt;]
__vmalloc+0xd7/0x140</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2735925/2826430]
dm_vcalloc+0x27/0x60 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d6a297&gt;]
dm_vcalloc+0x27/0x60 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2793030/2826430]
init_exception_table+0x18/0x60 [dm_snapshot]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d781a8&gt;]
init_exception_table+0x18/0x60 [dm_snapshot]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2793784/2826430]
snapshot_ctr+0x2aa/0x4f0 [dm_snapshot]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d7849a&gt;]
snapshot_ctr+0x2aa/0x4f0 [dm_snapshot]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms /etc/hotplug/block.agent[30703]:
try 1 while waiting for /block/dm-1's bus_id </font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms /etc/hotplug/block.agent[30704]:
try 1 while waiting for /block/dm-2's bus_id </font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2737498/2826430]
dm_table_add_target+0x27c/0x430 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d6a8bc&gt;]
dm_table_add_target+0x27c/0x430 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2738062/2826430]
dm_table_create+0x80/0xb3 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d6aaf0&gt;]
dm_table_create+0x80/0xb3 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2744915/2826430]
table_load+0x95/0x1e0 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d6c5b5&gt;]
table_load+0x95/0x1e0 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2747056/2826430]
ctl_ioctl+0x292/0x440 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d6ce12&gt;]
ctl_ioctl+0x292/0x440 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[blkdev_get_blocks+0/160]
blkdev_get_blocks+0x0/0xa0</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;c016bee0&gt;]
blkdev_get_blocks+0x0/0xa0</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2744766/2826430]
table_load+0x0/0x1e0 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;f8d6c520&gt;]
table_load+0x0/0x1e0 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[run_timer_softirq+206/368]
run_timer_softirq+0xce/0x170</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;c012db7e&gt;]
run_timer_softirq+0xce/0x170</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[sys_ioctl+646/1092]
sys_ioctl+0x286/0x444</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;c0176d46&gt;]
sys_ioctl+0x286/0x444</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[smp_apic_timer_interrupt+234/352]
smp_apic_timer_interrupt+0xea/0x160</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;c011adca&gt;]
smp_apic_timer_interrupt+0xea/0x160</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[sysenter_past_esp+82/121]
sysenter_past_esp+0x52/0x79</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: &nbsp;[&lt;c01091c9&gt;]
sysenter_past_esp+0x52/0x79</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: </font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: device-mapper:
: Unable to allocate hash table space</font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: </font>
<br><font size=2 face="Courier New">May 20 02:00:01 semco-ms kernel: device-mapper:
error adding target to table</font>
<br><font size=2 face="sans-serif">-------------- end error messages 1
-------------</font>
<br>
<br><font size=2 face="sans-serif">-------------- end error messages 2
-------------</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: Unable
to handle kernel paging request at virtual address f8d61000</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;printing
eip:</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: f8d79003</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: *pde
= 01891067</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: Oops:
0002 [#1]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: SMP
</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: CPU:
&nbsp; &nbsp;0</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: EIP:
&nbsp; &nbsp;0060:[__crc_driver_remove_file+2796705/2826430] &nbsp; &nbsp;Not
tainted</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: EIP:
&nbsp; &nbsp;0060:[&lt;f8d79003&gt;] &nbsp; &nbsp;Not tainted</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: EFLAGS:
00010202 &nbsp; (2.6.4-54.5-smp) </font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: EIP
is at persistent_commit+0x63/0x100 [dm_snapshot]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: eax:
00000201 &nbsp; ebx: 00000000 &nbsp; ecx: f8d61000 &nbsp; edx: f8d60000</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: esi:
f6c3c500 &nbsp; edi: f8d78000 &nbsp; ebp: f8d77fb0 &nbsp; esp: f7707ef8</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: ds:
007b &nbsp; es: 007b &nbsp; ss: 0068</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: Process
kcopyd/0 (pid: 711, threadinfo=f7706000 task=f7af9970)</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: Stack:
0023cf80 00000000 000016cd 00000000 d939e46c f6c38d80 d939e46c f8d77ff4
</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;
&nbsp; &nbsp; &nbsp;d939e46c d939a3f4 00000000 f8d6e9ed 00000000 00000246
d939a3f4 f8d74778 </font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;
&nbsp; &nbsp; &nbsp;f8d6e9a0 f8d6e698 00000006 00000212 c1bf2000 f8d75344
00000000 f8d6e76f </font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: Call
Trace:</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2792594/2826430]
copy_callback+0x44/0x50 [dm_snapshot]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;f8d77ff4&gt;]
copy_callback+0x44/0x50 [dm_snapshot]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2754187/2826430]
run_complete_job+0x4d/0x70 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;f8d6e9ed&gt;]
run_complete_job+0x4d/0x70 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2754110/2826430]
run_complete_job+0x0/0x70 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;f8d6e9a0&gt;]
run_complete_job+0x0/0x70 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2753334/2826430]
process_jobs+0x18/0xe0 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;f8d6e698&gt;]
process_jobs+0x18/0xe0 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2753549/2826430]
do_work+0xf/0x30 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;f8d6e76f&gt;]
do_work+0xf/0x30 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[worker_thread+391/528]
worker_thread+0x187/0x210</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;c0135c57&gt;]
worker_thread+0x187/0x210</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[__crc_driver_remove_file+2753534/2826430]
do_work+0x0/0x30 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;f8d6e760&gt;]
do_work+0x0/0x30 [dm_mod]</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[default_wake_function+0/16]
default_wake_function+0x0/0x10</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;c01209d0&gt;]
default_wake_function+0x0/0x10</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[default_wake_function+0/16]
default_wake_function+0x0/0x10</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;c01209d0&gt;]
default_wake_function+0x0/0x10</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[worker_thread+0/528]
worker_thread+0x0/0x210</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;c0135ad0&gt;]
worker_thread+0x0/0x210</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[kthread+212/280]
kthread+0xd4/0x118</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;c0139484&gt;]
kthread+0xd4/0x118</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[kthread+0/280]
kthread+0x0/0x118</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;c01393b0&gt;]
kthread+0x0/0x118</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[kernel_thread_helper+5/16]
kernel_thread_helper+0x5/0x10</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: &nbsp;[&lt;c0107005&gt;]
kernel_thread_helper+0x5/0x10</font>
<br><font size=2 face="Courier New">May 20 06:06:10 semco-ms kernel: </font>
<br><font size=2 face="sans-serif">-------------- end error messages 2
-------------</font>
<br>
<br><font size=2 face="sans-serif">--<br>
Clayton Hicklin<br>
Systems Engineer<br>
Huber and Associates, Inc.<br>
Phone: (573) 634-5000<br>
Fax: (573) 634-5500<br>
chicklin@teamhuber.com<br>
</font>
--=_alternative 004ECDDB86256EA1_=--
