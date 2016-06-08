Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58EB0bS022108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 8 Jun 2016 10:11:00 -0400
Received: from mailrelay.lanline.com (mailrelay.lanline.com [216.187.10.16])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD6362AFE
	for <linux-lvm@redhat.com>; Wed,  8 Jun 2016 14:10:58 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay.lanline.com (8.14.5/8.14.5) with ESMTP id u58EAskr083248
	for <linux-lvm@redhat.com>; Wed, 8 Jun 2016 10:10:55 -0400 (EDT)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (68-184-33-254.dhcp.oxfr.ma.charter.com
	[68.184.33.254]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id u58Dj8DY020789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 8 Jun 2016 09:45:09 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <22360.10096.54856.555443@quad.stoffel.home>
Date: Wed, 8 Jun 2016 10:10:56 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <CAN1xZsc8Rkd0rwmp=2dSDGjD8vmud0r_eFfUet0Ls6GyfHkrmQ@mail.gmail.com>
References: <CAN1xZsc8Rkd0rwmp=2dSDGjD8vmud0r_eFfUet0Ls6GyfHkrmQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Dmcache crash
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


Bertrand> The dmcache setup on one production server crashed this
Bertrand> afternoon. The error in syslog is below.

It looks like you might have some bad blocks on the disk.  Is your LVM
setup on top of MD RAID by any chance?  Have you run a 'check' against
the RAID to see if there's a bad block or two that needs to be
re-written?




Bertrand> After a reboot, logical volumes are still here, but inactive.

Bertrand> # lvs -a
Bertrand> � LV � � � � � � �VG � � �Attr � � � LSize � Pool �Origin � � � Data% �Meta% �Move Log Cpy%Sync
Bertrand> Convert
Bertrand> � cache � � � � � storage Cwi---C--- 834.41g � � � � � � � � � � � � � � � � � � � � � � � � � � �
Bertrand> � �
Bertrand> � [cache_cdata] � storage Cwi------- 834.41g � � � � � � � � � � � � � � � � � � � � � � � � � � �
Bertrand> � �
Bertrand> � [cache_cmeta] � storage ewi------- �16.00g � � � � � � � � � � � � � � � � � � � � � � � � � � �
Bertrand> � �
Bertrand> � [lvol0_pmspare] storage ewi------- �16.00g � � � � � � � � � � � � � � � � � � � � � � � � � � �
Bertrand> � �
Bertrand> � tank � � � � � �storage Cwi---C--- � 5.00t cache [tank_corig] � � � � � � � � � � � � � � � � �
Bertrand> � � �
Bertrand> � [tank_corig] � �storage owi---C--- � 5.00t � � � � � � � � � � � � � � � �
Bertrand> �
Bertrand> I'm not able to activate them.

Bertrand> # vgchange -ay
Bertrand> � Check of pool storage/cache failed (status:1). Manual repair required!
Bertrand> � 0 logical volume(s) in volume group "storage" now active

Bertrand> Any idea to bring back the volume online, or at least to recover the data ?

Bertrand> Kernel : 4.3.0-0.bpo.1-amd64 #1 SMP Debian 4.3.5-1~bpo8+1 (2016-02-23) x86_64 GNU/Linux
Bertrand> Distro : debian jessie

Bertrand> Any help will be greatly appreciated.

Bertrand> Regards,

Bertrand> Bertrand

Bertrand> Error log :�
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.571379] device-mapper: array: array_block_check failed:
Bertrand> blocknr 1082331758718 != wanted 16969
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.571453] device-mapper: block manager: array validator check
Bertrand> failed for block 16969
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.571515] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.571578] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -15
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.571664] device-mapper: cache: 252:3: aborting current
Bertrand> metadata transaction
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.572836] device-mapper: cache: 252:3: switching cache to
Bertrand> read-only mode
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.572840] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.572901] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -22
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.572973] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.573034] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -22
Bertrand> Jun �6 11:58:06 xxxx kernel: [3015831.573103] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't copy block
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.425768] Aborting journal on device dm-3-8.
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.425853] Buffer I/O error on dev dm-3, logical block
Bertrand> 671121408, lost sync page write
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.425939] JBD2: Error -5 detected when updating journal
Bertrand> superblock for dm-3-8.
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.444140] Buffer I/O error on dev dm-3, logical block 0, lost
Bertrand> sync page write
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.444234] EXT4-fs error (device dm-3):
Bertrand> ext4_journal_check_start:56: Detected aborted journal
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.444311] EXT4-fs (dm-3): Remounting filesystem read-only
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.444352] EXT4-fs (dm-3): previous I/O error to superblock
Bertrand> detected
Bertrand> Jun �6 11:58:11 xxxx kernel: [3015836.444428] Buffer I/O error on dev dm-3, logical block 0, lost
Bertrand> sync page write
Bertrand> Jun �6 11:58:15 xxxx kernel: [3015840.507213] migration_success_pre_commit: 12194 callbacks
Bertrand> suppressed
Bertrand> Jun �6 11:58:15 xxxx kernel: [3015840.507217] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:58:15 xxxx kernel: [3015840.507291] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22
Bertrand> Jun �6 11:58:19 xxxx kernel: [3015844.720334] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:58:19 xxxx kernel: [3015844.720406] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091051] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091124] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -22
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091207] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091274] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -22
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091482] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091551] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -22
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091622] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.091689] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -22
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.092341] device-mapper: cache: 252:3: demotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:15 xxxx kernel: [3015901.092409] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_remove_mapping' failed: error = -22
Bertrand> Jun �6 11:59:30 xxxx kernel: [3015915.162952] migration_success_pre_commit: 1194 callbacks
Bertrand> suppressed
Bertrand> Jun �6 11:59:30 xxxx kernel: [3015915.162955] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:30 xxxx kernel: [3015915.163034] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22
Bertrand> Jun �6 11:59:38 xxxx kernel: [3015923.147099] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:38 xxxx kernel: [3015923.147183] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22
Bertrand> Jun �6 11:59:39 xxxx kernel: [3015924.308771] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:39 xxxx kernel: [3015924.308846] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22
Bertrand> Jun �6 11:59:59 xxxx kernel: [3015944.161468] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 11:59:59 xxxx kernel: [3015944.161541] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22
Bertrand> Jun �6 12:00:01 xxxx kernel: [3015946.457345] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 12:00:01 xxxx kernel: [3015946.457416] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22
Bertrand> Jun �6 12:00:42 xxxx kernel: [3015987.290496] device-mapper: cache: 252:3: promotion failed;
Bertrand> couldn't update on disk metadata
Bertrand> Jun �6 12:00:42 xxxx kernel: [3015987.290569] device-mapper: cache: 252:3: metadata operation
Bertrand> 'dm_cache_insert_mapping' failed: error = -22

Bertrand> _______________________________________________
Bertrand> linux-lvm mailing list
Bertrand> linux-lvm@redhat.com
Bertrand> https://www.redhat.com/mailman/listinfo/linux-lvm
Bertrand> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
