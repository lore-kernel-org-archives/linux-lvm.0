Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE5F1001917
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2018 22:04:47 +0000 (UTC)
Received: from egamorf.bogon.ca (egamorf.bogon.ca [149.56.143.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55220369CE
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2018 22:04:33 +0000 (UTC)
Received: from atlas.bogon.ca ([2001:470:b358:0:2c9d:79ff:fe07:eeb0])
	by egamorf.bogon.ca with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <doug@bogon.ca>) id 1ffY5A-0002pE-8y
	for linux-lvm@redhat.com; Tue, 17 Jul 2018 22:04:32 +0000
Received: from doug by atlas.bogon.ca with local (Exim 4.90_1)
	(envelope-from <doug@bogon.ca>) id 1ffY59-0004Hh-H8
	for linux-lvm@redhat.com; Tue, 17 Jul 2018 18:04:31 -0400
Date: Tue, 17 Jul 2018 18:04:31 -0400
From: Douglas Paul <doug-lvm@bogon.ca>
Message-ID: <20180717220431.GA16463@bogon.ca>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Kernel bugcheck on conversion from RAID6 to RAID5
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

[Trying one last time without attachments]

Hello,

I am trying to reshape my way around some failing disks, migrating a RAID6
volume to a new RAID1 on new disks.

To minimize variables, I split the existing cache from the volume and tried
to convert the volume to raid5_n. 

The first pass seemed to work fine, but then I have a segmentation fault on
the second (executed after the reshape was completed):

===
depot ~ # lvconvert --splitcache Depot/AtlasGuest
  Flushing 1 blocks for cache Depot/AtlasGuest.
  Flushing 1 blocks for cache Depot/AtlasGuest.
  Logical volume Depot/AtlasGuest is not cached and cache pool Depot/AtlasGuestCache is unused.
depot ~ # lvconvert --type raid5_n Depot/AtlasGuest
  Using default stripesize 64.00 KiB.
  Replaced LV type raid5_n with possible type raid6_n_6.
  Repeat this command to convert to raid5_n after an interim conversion has finished.
  Converting raid6 (same as raid6_zr) LV Depot/AtlasGuest to raid6_n_6.
Are you sure you want to convert raid6 LV Depot/AtlasGuest? [y/n]: y
  Logical volume Depot/AtlasGuest successfully converted.
depot ~ # lvconvert --type raid5_n Depot/AtlasGuest
  Using default stripesize 64.00 KiB.
Are you sure you want to convert raid6_n_6 LV Depot/AtlasGuest to raid5_n type? [y/n]: y
Segmentation fault
===

The segfault occured with a kernel bugcheck: (pruned a bit, messages after
first lvconvert)
===
[  +0.000896] md/raid:mdX: raid level 6 active with 6 out of 6 devices, algorithm 8
[  +0.000805] md/raid:mdX: raid level 6 active with 6 out of 6 devices, algorithm 8
[  +0.001129] md/raid:mdX: raid level 6 active with 6 out of 6 devices, algorithm 5
[  +0.215572] md: reshape of RAID array mdX
[Jul17 12:42] md: mdX: reshape done.
[Jul17 12:49] md/raid:mdX: not clean -- starting background reconstruction
[  +0.000742] md/raid:mdX: raid level 6 active with 6 out of 6 devices, algorithm 5
[  +0.745790] md/raid:mdX: not clean -- starting background reconstruction
[  +0.000014] ------------[ cut here ]------------
[  +0.000001] kernel BUG at drivers/md/raid5.c:7251!
[  +0.000006] invalid opcode: 0000 [#1] SMP PTI
[  +0.000140] Modules linked in: target_core_pscsi target_core_file iscsi_target_mod target_core_iblock target_core_mod macvtap autofs4 nfsd auth_rpcgss oid_registry nfs_acl iptable_mangle iptable_filter ip_tables x_tables ipmi_ssif vhost_net vhost tap tun bridge stp llc intel_powerclamp coretemp kvm_intel kvm irqbypass crc32c_intel ghash_clmulni_intel pcbc aesni_intel crypto_simd cryptd glue_helper i2c_i801 mei_me mei e1000e ipmi_si ipmi_devintf ipmi_msghandler efivarfs virtio_pci virtio_balloon virtio_ring virtio xts aes_x86_64 ecb sha512_generic sha256_generic sha1_generic iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi fuse xfs nfs lockd grace sunrpc jfs reiserfs btrfs zstd_decompress zstd_compress xxhash lzo_compress zlib_deflate usb_storage
[  +0.002119] CPU: 0 PID: 24458 Comm: lvconvert Not tainted 4.14.52-gentoo #1
[  +0.000221] Hardware name: Supermicro Super Server/X10SDV-7TP4F, BIOS 1.0 04/07/2016
[  +0.000245] task: ffff96b4840d4f40 task.stack: ffffa2070af24000
[  +0.000193] RIP: 0010:raid5_run+0x28b/0x865
[  +0.000132] RSP: 0018:ffffa2070af27ac8 EFLAGS: 00010202
[  +0.000166] RAX: 0000000000000006 RBX: ffff96af1d62f058 RCX: ffff96af1d62f070
[  +0.000227] RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffff96b49f2152b8
[  +0.000227] RBP: ffffffffbee93fc0 R08: 007e374cc03275ee R09: ffffffffbf1f4c4c
[  +0.000227] R10: 00000000fffffff6 R11: 000000000000005c R12: 0000000000000000
[  +0.000227] R13: ffff96af1d62f070 R14: ffffffffbec42dee R15: 0000000000000000
[  +0.000227] FS:  00007fbb3f3e45c0(0000) GS:ffff96b49f200000(0000) knlGS:0000000000000000
[  +0.000256] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000183] CR2: 0000559297902d20 CR3: 00000001c0032005 CR4: 00000000003626f0
[  +0.000227] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  +0.000227] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  +0.000226] Call Trace:
[  +0.000087]  ? bioset_create+0x1d2/0x20c
[  +0.000124]  md_run+0x59a/0x96a
[  +0.000104]  ? super_validate.part.20+0x3f0/0x635
[  +0.000148]  ? sync_page_io+0x104/0x112
[  +0.000125]  raid_ctr+0x1c80/0x1fe5
[  +0.000114]  ? dm_table_add_target+0x1d8/0x275
[  +0.000141]  dm_table_add_target+0x1d8/0x275
[  +0.000138]  table_load+0x22d/0x290
[  +0.006101]  ? list_version_get_info+0xab/0xab
[  +0.006226]  ctl_ioctl+0x2de/0x351
===

raid5.c:7251 corresponds to this line:
                BUG_ON(mddev->level != mddev->new_level);

I know if I reboot at this point, I will need to do a vgcfgrestore before
the VG will activate.

Currently the volume seems to be accessible, but its SyncAction is 'frozen'
and I get a warning saying the LV needs to be inspected on most lvm tools. I
first experienced this on LVM2 2.02.173, but this last time is with
2.02.179.

I (tried to) attach the VG backups edited for the concerned LV that seemed to have
been saved during the crashing command. -- let me know if they are
interesting and I can send them directly.

I was unable to find any mention of a similar problem in the archives so I
hope I have something uncommon in my setup that could explain this.

Thanks.

-- 
Douglas Paul
