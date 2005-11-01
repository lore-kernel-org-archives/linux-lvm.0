Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA1G3NV25034
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 11:03:23 -0500
Received: from mail.inostor.com (w130.z209220038.sjc-ca.dsl.cnc.net
	[209.220.38.130])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA1G3Mih028410
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 11:03:22 -0500
Received: from jgs4.ino.pvt (unknown [172.16.1.75])
	by mail.inostor.com (Postfix) with ESMTP id 9B5682B51D
	for <linux-lvm@redhat.com>; Tue,  1 Nov 2005 07:58:59 -0800 (PST)
From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
Date: Tue, 01 Nov 2005 08:03:21 -0800
Message-Id: <1130861002.4970.3.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 snapshot BREAKS on 2nd snapshot
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
To: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>

I have a reliable recipe for breaking lmv2.

I reported this previously (on 10/19 -- see 
  https://www.redhat.com/archives/linux-lvm/2005-October/msg00044.html
where the subject-line was "Segfault & BUG/OOPS during lvremove
snapshot"), but no one responded. I think I didn't adequately describe
the scenario or perhaps the seriousness.


I get this kcopyd BUG (and consequent Oops)
----------------------------------------------------------------------
 ------------[ cut here ]------------
 kernel BUG at drivers/md/kcopyd.c:145!
 invalid operand: 0000 [#1]
 Modules linked in: xfs exportfs dm_snapshot ipv6 parport_pc lp parport
autofs4 rfcomm l2cap bluetooth sunrpc ohci_hcd i2c_piix4 i2c_core tulip
e100 mii floppy ext3 jbd raid1 dm_mod aic7xxx scsi_transport_spi sd_mod
scsi_mod
 CPU:    0
 EIP:    0060:[<f886da1a>]    Not tainted VLI
 EFLAGS: 00010283   (2.6.13-1.1526_FC4) 
 EIP is at client_free_pages+0x2a/0x40 [dm_mod]
 eax: 00000100   ebx: c1bb50a0   ecx: f7fff060   edx: 00000000
 esi: f91b8080   edi: 00000000   ebp: 00000000   esp: c7a24f1c
 ds: 007b   es: 007b   ss: 0068
 Process lvremove (pid: 9931, threadinfo=c7a24000 task=ca3ee000)
 Stack: c1bb50a0 f886efc2 f21011e0 f89c296f f91b8080 f21018e0 f8868d3b
db3e07a0 
        f8a8d000 00000004 f886b460 f886acba f8875860 f886b4af c7a24000
00000000 
        f886c96d f8a8d000 f886c8a0 f2b28b00 091bb3f8 c7a24000 c01affee
091bb3f8 
 Call Trace:
  [<f886efc2>] kcopyd_client_destroy+0x12/0x26 [dm_mod]
  [<f89c296f>] snapshot_dtr+0x4f/0x60 [dm_snapshot]
  [<f8868d3b>] table_destroy+0x3b/0x90 [dm_mod]
  [<f886b460>] dev_remove+0x0/0xd0 [dm_mod]
  [<f886acba>] __hash_remove+0x5a/0xa0 [dm_mod]
  [<f886b4af>] dev_remove+0x4f/0xd0 [dm_mod]
  [<f886c96d>] ctl_ioctl+0xcd/0x110 [dm_mod]
  [<f886c8a0>] ctl_ioctl+0x0/0x110 [dm_mod]
  [<c01affee>] do_ioctl+0x4e/0x60
  [<c01b00ff>] vfs_ioctl+0x4f/0x1c0
  [<c01b02c4>] sys_ioctl+0x54/0x70
  [<c01041e9>] syscall_call+0x7/0xb
 Code: 00 53 89 c3 8b 40 24 39 43 28 75 1f 8b 43 20 e8 6d ff ff ff c7 43
20 00 00 00 00 c7 43 24 00 00 00 00 c7 43 28 00 00 00 00 5b c3 <0f> 0b
91 00 cb f3 86 f8 eb d7 8d b6 00 00 00 00 8d bf 00 00 00 
  <1>Unable to handle kernel NULL pointer dereference at virtual address
00000034
  printing eip:
 c019b50c
 *pde = 00000000
 Oops: 0000 [#2]
 Modules linked in: xfs exportfs dm_snapshot ipv6 parport_pc lp parport
autofs4 rfcomm l2cap bluetooth sunrpc ohci_hcd i2c_piix4 i2c_core tulip
e100 mii floppy ext3 jbd raid1 dm_mod aic7xxx scsi_transport_spi sd_mod
scsi_mod
 CPU:    0
 EIP:    0060:[<c019b50c>]    Not tainted VLI
 EFLAGS: 00010287   (2.6.13-1.1526_FC4) 
 EIP is at bio_add_page+0xc/0x30
 eax: 00000000   ebx: dc0fece0   ecx: 00001000   edx: c165f160
 esi: 00000000   edi: dc0fece0   ebp: f6461f30   esp: f6461e90
 ds: 007b   es: 007b   ss: 0068
 Process kcopyd (pid: 3120, threadinfo=f6461000 task=f6a4d550)
 Stack: 00000010 f886d02e 00000000 e34d2188 00000000 00000001 00000000
00001000 
        c165f160 f6461f30 00000000 00000001 00000010 f886d10b f6461f30
f548d3c0 
        f886ce40 f548d3c0 e34d2188 00000001 00000001 f886ce60 00000000
db3e0a00 
 Call Trace:
  [<f886d02e>] do_region+0xde/0x110 [dm_mod]
  [<f886d10b>] dispatch_io+0xab/0xd0 [dm_mod]
  [<f886ce40>] list_get_page+0x0/0x20 [dm_mod]
  [<f886ce60>] list_next_page+0x0/0x10 [dm_mod]
  [<f886db60>] complete_io+0x0/0x360 [dm_mod]
  [<f886d28e>] async_io+0x5e/0xb0 [dm_mod]
  [<f886d3d4>] dm_io_async+0x34/0x40 [dm_mod]
  [<f886db60>] complete_io+0x0/0x360 [dm_mod]
  [<f886ce40>] list_get_page+0x0/0x20 [dm_mod]
  [<f886ce60>] list_next_page+0x0/0x10 [dm_mod]
  [<f886dec0>] run_io_job+0x0/0x60 [dm_mod]
  [<f886df12>] run_io_job+0x52/0x60 [dm_mod]
  [<f886db60>] complete_io+0x0/0x360 [dm_mod]
  [<f886e1a6>] process_jobs+0x16/0x590 [dm_mod]
  [<f886e720>] do_work+0x0/0x30 [dm_mod]
  [<c0142c81>] worker_thread+0x271/0x520
  [<c0120170>] default_wake_function+0x0/0x10
  [<c0142a10>] worker_thread+0x0/0x520
  [<c014a935>] kthread+0x85/0x90
  [<c014a8b0>] kthread+0x0/0x90
  [<c01012f1>] kernel_thread_helper+0x5/0x14
 Code: 07 00 00 00 00 c7 47 04 00 00 00 00 c7 47 08 00 00 00 00 31 c0 5b
5e 5f 5d c3 90 8d 74 26 00 53 89 c3 8b 40 0c 8b 80 80 00 00 00 <8b> 40
34 ff 74 24 08 51 89 d1 89 da e8 b3 fe ff ff 5a 59 5b c3 
-------------------------------------------------------------------------


This happens during lvremove of a 2nd Snapshot, in the presence of i/o
to the origin volume. This nicely hangs the system (Fedora Core FC4).

It doesn't happen is there is only one snapshot on the origin volume. It
doesn't happen without i/o to the origin volume. It seems to happen more
reliably with read/write than just read, but it *does* happen with just
read -- the first time I saw a problem it was due to cron.daily running
slocate (updatedb). I can also force the BUG with a loop something like
  while :;do ls -lartR /mnt/F/test;sleep 1;done
which I execute while my snapshot exercise script is repeatedly creating
and removing a snapshot.

The lvm environment is as follows:
pvs | grep VGf
  /dev/sdf11 VGf11 lvm2 a-   134.71G 14.71G
vgs | grep VGf
  VGf11   1   3   2 wz--n 134.71G 14.71G
grep VGf
  F    VGf11 owi-ao 100.00G
  FS   VGf11 swi-a-  10.00G F       24.55
  Fs1  VGf11 swi-a-  10.00G F        0.04
dmsetup info | grep -A1 VGf
Name:              VGf11-FS-cow
State:             ACTIVE
--
Name:              VGf11-Fs1
State:             ACTIVE
--
Name:              VGf11-Fs1-cow
State:             ACTIVE
--
Name:              VGf11-FS
State:             ACTIVE
--
Name:              VGf11-F-real
State:             ACTIVE
--
Name:              VGf11-F
State:             ACTIVE

The above is the lvm environment after crash and reboot.


My snapshot exercise script is as follows:
--------------------
#!/bin/sh
VG="/dev/VGf11"
ORG="$VG/F"
SN="Fs1"
SS="$VG/$SN"
NN=0

while :
do
 lvs $SS &>/dev/null && { echo "'$SS' exists -- do lvremove and
restart"; exit 1; }
 ((NN++))
 echo $NN: `date`
 echo lvcreate "'$SS'"..
 lvcreate -sn$SN -L10G $ORG
 EC=$?
 [[ 0 -eq $EC ]] || { echo "ERROR '$EC' in create!"; exit 2; }
 sleep 10;
 echo lvremove "'$SS'"..
 lvremove -f $SS
 EC=$?
 [[ 0 -eq $EC ]] || { echo "ERROR '$EC' in remove!"; exit 3; }
 sleep 2;
done
#==eof===

My system is fairly vanilla. Using FC4 and a standard-issue FC kernel
(2.6.13-1.1526_FC4) on a P3 1200MHz 1024MB ram, with a ext3 FS on the
origin volume.


Should I cross-post this on the kernel list? And maybe somewhere on
Fedora?


BTW: I recently checked a hunch that it may have something to do
with high memory. I have rebooted with a kernel option mem=512m, and am
currently into snapshot cycle #75 while doing a shell read-loop as
above.
..This seems to be already lasting longer than the last run (which had 1GB
ram) -- so I think I'll let it run all weekend in this test mode
(snapshot cycle + read-loop).
resultrs: 10/31: 
---------------
Hit the same kcopyd.c:145 BUG after snapshot create/remove cycle number 308
 -- while simultaneously running a loop reading from the filesystem on the origin volume
    (and simultaneously running a loop performing dmsetup info calls)
    The dmsetup process hung in uninterruptible sleep when the lvremove failed.
-----------------------------------------------------------------------------------------

Thanks,
..jim
