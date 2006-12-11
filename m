Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBBMRCFI005167
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 17:27:12 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.190])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBBMRAGP017646
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 17:27:10 -0500
Received: by nf-out-0910.google.com with SMTP id k26so39928nfc
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 14:27:09 -0800 (PST)
Message-ID: <859a78260612111427s7f680bd0l40636e912eeeea10@mail.gmail.com>
Date: Mon, 11 Dec 2006 16:27:04 -0600
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] directory # contains a hole
In-Reply-To: <4A8F680AC6EC43458BCAE06010D8E81B04620863@CORPUSMX40A.corp.emc.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <859a78260612111324o267816f7qa29ce67e5c9eff94@mail.gmail.com>
	<4A8F680AC6EC43458BCAE06010D8E81B04620863@CORPUSMX40A.corp.emc.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Thank you VERY much Keith! This has been driving my team and I nuts
for a few months now. It's great to see that it's come up on the radar
of the powers that be. And now we have something relatively definitive
to tell our users/customers.

On 12/11/06, Kearnan_Keith@emc.com <Kearnan_Keith@emc.com> wrote:
>
> Hi Matt,
>
> Please see bugzilla 213921.  We are working on this one.
>
> https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=3D213921
>
> Keith R. Kearnan
> Principal Engineer
> E-Lab
> EMC=EF=BF=BD Engineering
> Phone: (508) 249-1315
> Kearnan_Keith@emc.com
>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
On Behalf Of Matt P
> Sent: Monday, December 11, 2006 4:24 PM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] directory # contains a hole
>
> I'm not certain this is LVM related but at this point I'm grasping at
> straws. Every so often, ranging from 14 days to a little over a month,
> the System will through the following error to messages:
>
> kernel: EXT3-fs error (device dm-6): ext3_readdir: directory #30933792
> contains a hole at offset 28672
>
> After that message shows up we get numerous "Journal Aborted" errors
> (messages clip at the bottom). The File system is marked Read-Only and
> that in turn initiates a fail-over of the application to the standby
> node. Then on the standby node, the filesystem is fsck'ed and is
> easily cleaned up without requiring any special intervention.
>
> Out SAN admin isn't seeing any errors on his end, and I don't see
> anything that jumps out at me in out messages. Every time this has
> happened the inode mentioned in the above error is different. We have
> rebuilt the VG and the subsequent filesystem from scratch once. we've
> turned the firmware parameters on the QLogic card to match the
> recommendations for EMC for our HW config and OS version. The failure
> occurs on both nodes (primary and standby) in the cluster. We've got a
> ticket open with EMC and another open with RedHat.
>
> Any help and/or ideas would be much appreciated....
>
> Here's the system config:
> Red Hat Enterprise Linux AS release 4 (Nahant Update 2)
> Kernel: 2.6.9-22.ELsmp
> Qlogic HBA's Connected to an EMC Clariion
> Using QLogic's drivers and EMC Powerpath
> About 350Gig presented to the system
> LVM version:     2.01.14 (2005-08-04)
>  Library version: 1.01.04 (2005-08-02)
>  Driver version:  4.4.0
> -------------------------------------------------------------------------=
------------------
> # vgdisplay -v vg01
>     Using volume group(s) on command line
>     Finding volume group "vg01"
>   --- Volume group ---
>   VG Name               vg01
>   System ID             xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>   Format                lvm2
>   Metadata Areas        7
>   Metadata Sequence No  3
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                256
>   Cur LV                1
>   Open LV               1
>   Max PV                256
>   Cur PV                7
>   Act PV                7
>   VG Size               349.56 GB
>   PE Size               32.00 MB
>   Total PE              11186
>   Alloc PE / Size       11186 / 349.56 GB
>   Free  PE / Size       0 / 0
>   VG UUID               74biJE-Jn9V-i7jD-4Mng-2Pje-01YH-piE51u
>
>   --- Logical volume ---
>   LV Name                /dev/vg01/data
>   VG Name                vg01
>   LV UUID                000000-0000-0000-0000-0000-0000-000000
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                349.56 GB
>   Current LE             11186
>   Segments               7
>   Allocation             normal
>   Read ahead sectors     1024
>   Block device           253:6
>
>   --- Physical volumes ---
>   PV Name               /dev/emcpowera1
>   PV UUID               DcRtrM-NtY6-ispA-uPwD-sJO1-SF0A-7iZlmm
>   PV Status             allocatable
>   Total PE / Free PE    1598 / 0
>
>   PV Name               /dev/emcpowerb1
>   PV UUID               VIrhHw-LqEt-KNyZ-W86T-3oyY-9F25-Zu7zMA
>   PV Status             allocatable
>   Total PE / Free PE    1598 / 0
>
>   PV Name               /dev/emcpowerc1
>   PV UUID               ySMNRg-m3XQ-ifF0-fWZx-ztAe-lhOX-seqJ9G
>   PV Status             allocatable
>   Total PE / Free PE    1598 / 0
>
>   PV Name               /dev/emcpowerd1
>   PV UUID               puTa3Z-ZRrv-mRRS-orL0-Ndpz-dW4T-E1x46s
>   PV Status             allocatable
>   Total PE / Free PE    1598 / 0
>
>   PV Name               /dev/emcpowere1
>   PV UUID               tsmFWq-YSVA-gHbI-ZGKG-4V57-766T-G8R6R2
>   PV Status             allocatable
>   Total PE / Free PE    1598 / 0
>
>   PV Name               /dev/emcpowerf1
>   PV UUID               WipA0D-GQXE-fDWL-OPNK-tRbx-7BUO-bAAJHY
>   PV Status             allocatable
>   Total PE / Free PE    1598 / 0
>
>   PV Name               /dev/emcpowerg1
>   PV UUID               jbcB7h-qh8O-LkAB-wcJz-CxKy-GIIm-xwylk2
>   PV Status             allocatable
>   Total PE / Free PE    1598 / 0
> -------------------------------------------------------------------------=
------------------
>
> Messages Clip Below:
> -------------------------------------------------------------------------=
------------------
> Dec  8 17:50:01 localhost logger: 17:50:01 up 17 days, 4:17, 2 users,
> load average: 3.07, 4.30, 4.54
> Dec  8 17:50:04 localhost kernel: EXT3-fs error (device dm-6):
> ext3_readdir: directory #30933792 contains a hole at offset 28672
> Dec  8 17:50:04 localhost kernel: Aborting journal on device dm-6.
> Dec  8 17:50:04 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Readonly filesystem
> Dec  8 17:50:04 localhost kernel: Aborting journal on device dm-6.
> Dec  8 17:50:04 localhost kernel: ext3_abort called.
> Dec  8 17:50:04 localhost kernel: ext3_abort called.
> Dec  8 17:50:04 localhost kernel: ext3_abort called.
> Dec  8 17:50:04 localhost kernel: EXT3-fs error (device dm-6):
> ext3_journal_start_sb: Detected aborted journal
> Dec  8 17:50:04 localhost kernel: Remounting filesystem read-only
> Dec  8 17:50:04 localhost kernel: EXT3-fs error (device dm-6):
> ext3_journal_start_sb: <2>EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:04 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6):
> ext3_journal_start_sb: Detected aborted journalDetected aborted
> journal
> Dec  8 17:50:05 localhost kernel:
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost last message repeated 2 times
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_block: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_prepare_write: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost last message repeated 5 times
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_reserve_inode_write: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_inode: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_create: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost last message repeated 7 times
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_block: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_prepare_write: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost last message repeated 2 times
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_reserve_inode_write: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:05 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_dirty_inode: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 11 times
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_block: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_prepare_write: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 7 times
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_reserve_inode_write: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_dirty_inode: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 5 times
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 6 times
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> add_dirent_to_buf: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_create: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_inode: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_create: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 37 times
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 44 times
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_inode: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_create: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 4 times
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_inode: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_create: Journal has aborted
> Dec  8 17:50:06 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:06 localhost last message repeated 3 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 8 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_ordered_commit_write: IO failure
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 3 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 16 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> add_dirent_to_buf: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_rename: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 6 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_new_block: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> ext3_prepare_write: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 7 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 3 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal hasEXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 3 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:07 localhost last message repeated 3 times
> Dec  8 17:50:07 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:08 localhost last message repeated 2 times
> Dec  8 17:50:08 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:08 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:08 localhost last message repeated 2 times
> Dec  8 17:50:08 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:08 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:08 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:08 localhost last message repeated 2 times
> Dec  8 17:50:08 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:08 localhost last message repeated 33 times
> Dec  8 17:50:08 localhost kernel: EXT3-fs freeing b_committed_data
> Dec  8 17:50:08 localhost kernel: __journal_remove_journal_head:
> freeing b_committed_data
> Dec  8 17:50:09 localhost last message repeated 26 times
> Dec  8 17:50:09 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:09 localhost kernel: __journal_remove_journal_head:
> freeing b_committed_data
> Dec  8 17:50:09 localhost last message repeated 4 times
> Dec  8 17:50:09 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:09 localhost kernel: __journal_remove_journal_head:
> freeing b_committed_data
> Dec  8 17:50:09 localhost last message repeated 34 times
> Dec  8 17:50:09 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:10 localhost last message repeated 1779 times
> Dec  8 17:50:11 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:25 localhost last message repeated 51 times
> Dec  8 17:50:25 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:26 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:27 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:36 localhost last message repeated 11 times
> Dec  8 17:50:38 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:50:56 localhost last message repeated 16 times
> Dec  8 17:51:01 localhost logger: 17:51:01 up 17 days, 4:18, 2 users,
> load average: 3.81, 4.62, 4.65
> Dec  8 17:51:04 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:51:04 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:51:04 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:51:04 localhost kernel: EXT3-fs error (device dm-6) in
> start_transaction: Journal has aborted
> Dec  8 17:51:17 localhost kernel: __journal_remove_journal_head:
> freeing b_committed_data
> Dec  8 17:51:17 localhost last message repeated 8 times
> Dec  8 17:52:01 localhost logger: 17:52:01 up 17 days, 4:19, 0 users,
> load average: 1.77, 3.92, 4.41
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
