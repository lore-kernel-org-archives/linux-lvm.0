Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t38FGjq4014294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 8 Apr 2015 11:16:45 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28]) by mx1.redhat.com (Postfix) with ESMTPS id 406568E784
	for <linux-lvm@redhat.com>; Wed,  8 Apr 2015 15:16:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 8695720CFA
	for <linux-lvm@redhat.com>; Wed,  8 Apr 2015 11:16:36 -0400 (EDT)
Message-Id: <1428506200.875940.250771177.6EF89B58@webmail.messagingengine.com>
From: lyndat3@your-mail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <5525331B.20604@redhat.com>
References: <1428468634.31919.250585153.41525C63@webmail.messagingengine.com>
	<5525331B.20604@redhat.com>
Date: Wed, 08 Apr 2015 08:16:40 -0700
Subject: Re: [linux-lvm] unable to lvcreate _new_ LVs on existing VG with
 existing LVs and plenty of room?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

> >     uname -rm
> >             3.19.3-1.gf10e7fc-default x86_64
> 
> Is it a home-brewed kernel?

no, it's distro-provided.

> Have you tried with a different one?

no.  afaict the only available is 3.16.x, and it has problems booting this uefi machine.

I'll dig around to see if I can find an alternative.

> >     lvm version
> >             LVM version:     2.02.98(2) (2012-10-15)
> >             Library version: 1.03.01 (2011-10-15)
> >             Driver version:  4.29.0
> 
> This looks like you might have a mismatch of device-mapper and LVM.
> 
> Where did you get that device-mapper from? I am not aware of any 1.03.01 
> version.

I don't know where the "1.03" comes from.

I have installed

rpm -q device-mapper
  device-mapper-1.02.78-20.2.2.x86_64

rpm -q --whatprovides /sbin/dmsetup
 device-mapper-1.02.78-20.2.2.x86_64

/sbin/dmsetup version
  Library version:   1.03.01 (2011-10-15)
  Driver version:    4.29.0

> > and in syslog I see
> >
> >     Apr 07 21:34:21 xen01 kernel:  md1: unknown partition table
> 
> This looks like a MD issue. Is this some hardware raid?

No, this is mdadm software raid only

> 18446744071795900416 - this is an interesting number, actually it is 
> 2**64 - 1825 * 2**20. Looks like some integer overflow.
> 
> Run the command with -vvvv and attach the output

lvcreate -vvvv -L 30G -n LV_TEST /dev/VG0
        #libdm-config.c:881       Setting activation/monitoring to 1
        #lvmcmdline.c:1093         Processing: lvcreate -vvvv -L 30G -n LV_TEST /dev/VG0
        #lvmcmdline.c:1096         O_DIRECT will be used
        #libdm-config.c:817       Setting global/locking_type to 1
        #libdm-config.c:817       Setting global/wait_for_locks to 1
        #locking/locking.c:242       File-based locking selected.
        #libdm-config.c:786       Setting global/locking_dir to /run/lvm/lock
        #libdm-config.c:881       Setting global/prioritise_write_locks to 1
        #activate/activate.c:483       Getting target version for linear
        #ioctl/libdm-iface.c:1725         dm versions   OF   [16384] (*1)
        #activate/activate.c:520       Found linear target v1.2.1.
        #activate/activate.c:483       Getting target version for striped
        #ioctl/libdm-iface.c:1725         dm versions   OF   [16384] (*1)
        #activate/activate.c:520       Found striped target v1.5.1.
        #lvcreate.c:484     Setting logging type to disk
        #libdm-config.c:822       activation/mirror_region_size not found in config: defaulting to 512
        #lvcreate.c:1098     Finding volume group "VG0"
        #locking/file_locking.c:236       Locking /run/lvm/lock/V_VG0 WB
        #locking/file_locking.c:141         _do_flock /run/lvm/lock/V_VG0:aux WB
        #locking/file_locking.c:141         _do_flock /run/lvm/lock/V_VG0 WB
        #locking/file_locking.c:51         _undo_flock /run/lvm/lock/V_VG0:aux
        #libdm-config.c:786       Setting response to OK
        #libdm-config.c:786       Setting response to OK
        #libdm-config.c:786       Setting name to VG0
        #libdm-config.c:786       Setting metadata/format to lvm2
        #format_text/format-text.c:1864         <backtrace>
        #libdm-config.c:786       Setting id to 0ioI5Y-t2Yg-70sx-n89m-8UAm-r10E-LGrl3i
        #libdm-config.c:786       Setting format to lvm2
        #libdm-config.c:817       Setting device to 2305
        #libdm-config.c:817       Setting dev_size to 1950809088
        #libdm-config.c:817       Setting label_sector to 1
        #device/dev-cache.c:332         /dev/disk/by-partlabel/LVMs: Added to device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/LVMs: Already in device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/LVMs: Already in device cache
        #device/dev-cache.c:332         /dev/sdh: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b610247d: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5FT92CC: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b610247d: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-4.0: Aliased to /dev/sdh in device cache
        #device/dev-cache.c:332         /dev/sdh1: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b610247d-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5FT92CC-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b610247d-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:332         /dev/disk/by-partlabel/BIOS\x20Boot\x20Partition: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/100c6e13-ce85-41b4-87e4-4cecaf6d160b: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-4.0-part1: Aliased to /dev/sdh1 in device cache
        #device/dev-cache.c:332         /dev/sdh2: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b610247d-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5FT92CC-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b610247d-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:332         /dev/disk/by-partlabel/EFI\x20System\x20Partition: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/f079fa51-47aa-4329-b105-171b1b33d4bc: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-4.0-part2: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-uuid/77A6-EB3D: Aliased to /dev/sdh2 in device cache
        #device/dev-cache.c:332         /dev/sdh3: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b610247d-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5FT92CC-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b610247d-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:332         /dev/disk/by-partlabel/Linux\x20\x2fboot\x20Partition: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/92e76ee9-e178-4479-b3f7-2953c6aec5bc: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-4.0-part3: Aliased to /dev/sdh3 in device cache
        #device/dev-cache.c:332         /dev/sdh4: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5FT92CC-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b610247d-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5FT92CC-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5FT92CC-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b610247d-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/LVMs: Already in device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/5db6138a-b347-4171-9789-6bc616cb8ae0: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-4.0-part4: Aliased to /dev/sdh4 in device cache
        #device/dev-cache.c:332         /dev/sdg: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b6106703: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5GE34DF: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b6106703: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-3.0: Aliased to /dev/sdg in device cache
        #device/dev-cache.c:329         /dev/sdg1: Aliased to /dev/disk/by-partlabel/BIOS\x20Boot\x20Partition in device cache (preferred name)
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b6106703-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5GE34DF-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b6106703-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/BIOS\x20Boot\x20Partition: Already in device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/09e93459-404f-4e85-ac78-b210b78a2c5a: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-3.0-part1: Aliased to /dev/sdg1 in device cache
        #device/dev-cache.c:329         /dev/sdg2: Aliased to /dev/disk/by-partlabel/EFI\x20System\x20Partition in device cache (preferred name)
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b6106703-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5GE34DF-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b6106703-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/EFI\x20System\x20Partition: Already in device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/6196ccc5-1e27-48e6-8372-2e64118e5d03: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-3.0-part2: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/disk/by-uuid/986E-2DB9: Aliased to /dev/sdg2 in device cache
        #device/dev-cache.c:329         /dev/sdg3: Aliased to /dev/disk/by-partlabel/Linux\x20\x2fboot\x20Partition in device cache (preferred name)
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b6106703-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5GE34DF-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b6106703-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/Linux\x20\x2fboot\x20Partition: Already in device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/034cc2d5-5cdf-4079-9465-a18c981fd523: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-3.0-part3: Aliased to /dev/sdg3 in device cache
        #device/dev-cache.c:329         /dev/sdg4: Aliased to /dev/disk/by-partlabel/LVMs in device cache (preferred name)
        #device/dev-cache.c:329         /dev/disk/by-id/ata-WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-0ATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-1ATA_WDC_WD10EFRX-68PJCN0_WD-WCD2E5GE34DF-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-350014ee2b6106703-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68P_WD-WCD2E5GE34DF-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/scsi-SATA_WDC_WD10EFRX-68_WD-WCD2E5GE34DF-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/wwn-0x50014ee2b6106703-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/LVMs: Already in device cache
        #device/dev-cache.c:329         /dev/disk/by-partuuid/e0906a3e-f53a-4bde-b915-cd8c7553d983: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:329         /dev/disk/by-path/pci-0000:03:00.0-ata-3.0-part4: Aliased to /dev/sdg4 in device cache
        #device/dev-cache.c:318         /dev/disk/by-partlabel/LVMs: Already in device cache
        #device/dev-cache.c:332         /dev/dm-0: Added to device cache
        #device/dev-cache.c:329         /dev/VG0/LV_SWAP: Aliased to /dev/dm-0 in device cache (preferred name)
        #device/dev-cache.c:329         /dev/disk/by-id/dm-name-VG0-LV_SWAP: Aliased to /dev/VG0/LV_SWAP in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/dm-uuid-LVM-BL0eXaqnXklVN72UBupMl5mwWz2j0fdjD9pl2yW3xAdLtJMnMCPVvSufn3sq22l6: Aliased to /dev/VG0/LV_SWAP in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/raid-VG0-LV_SWAP: Aliased to /dev/VG0/LV_SWAP in device cache
        #device/dev-cache.c:329         /dev/disk/by-uuid/e5a409c4-d305-467a-9a9a-b4e0077b8626: Aliased to /dev/VG0/LV_SWAP in device cache
        #device/dev-cache.c:329         /dev/mapper/VG0-LV_SWAP: Aliased to /dev/VG0/LV_SWAP in device cache
        #device/dev-cache.c:332         /dev/dm-1: Added to device cache
        #device/dev-cache.c:329         /dev/VG0/LV_ROOT: Aliased to /dev/dm-1 in device cache (preferred name)
        #device/dev-cache.c:329         /dev/disk/by-id/dm-name-VG0-LV_ROOT: Aliased to /dev/VG0/LV_ROOT in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/dm-uuid-LVM-BL0eXaqnXklVN72UBupMl5mwWz2j0fdjV4oHWiFXqDU8cj3nHjJTSVy0HVxH1I5z: Aliased to /dev/VG0/LV_ROOT in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/raid-VG0-LV_ROOT: Aliased to /dev/VG0/LV_ROOT in device cache
        #device/dev-cache.c:329         /dev/disk/by-uuid/4716053b-39da-4cc1-a7ce-72171b862357: Aliased to /dev/VG0/LV_ROOT in device cache
        #device/dev-cache.c:329         /dev/mapper/VG0-LV_ROOT: Aliased to /dev/VG0/LV_ROOT in device cache
        #device/dev-cache.c:329         /dev/root: Aliased to /dev/VG0/LV_ROOT in device cache (preferred name)
        #device/dev-cache.c:332         /dev/dm-6: Added to device cache
        #device/dev-cache.c:329         /dev/VG0/LV_HOME: Aliased to /dev/dm-6 in device cache (preferred name)
        #device/dev-cache.c:329         /dev/disk/by-id/dm-name-VG0-LV_HOME: Aliased to /dev/VG0/LV_HOME in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/dm-uuid-LVM-BL0eXaqnXklVN72UBupMl5mwWz2j0fdjpzlR6fQDAhiWn12ImhmTJj61LOE5CbS2: Aliased to /dev/VG0/LV_HOME in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/raid-VG0-LV_HOME: Aliased to /dev/VG0/LV_HOME in device cache
        #device/dev-cache.c:329         /dev/disk/by-uuid/49cc8b43-0bed-44b5-a8be-de2265f2c833: Aliased to /dev/VG0/LV_HOME in device cache
        #device/dev-cache.c:329         /dev/mapper/VG0-LV_HOME: Aliased to /dev/VG0/LV_HOME in device cache
        #device/dev-cache.c:332         /dev/md0: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/md-name-xen01:0: Aliased to /dev/md0 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/md-uuid-a27155ba:0985bd71:5d55e1d3:5d719099: Aliased to /dev/md0 in device cache
        #device/dev-cache.c:329         /dev/disk/by-uuid/3e40f30f-87ba-421c-9470-9d793536968a: Aliased to /dev/md0 in device cache
        #device/dev-cache.c:329         /dev/md/xen01:0: Aliased to /dev/md0 in device cache
        #device/dev-cache.c:332         /dev/md1: Added to device cache
        #device/dev-cache.c:329         /dev/disk/by-id/md-name-xen01:1: Aliased to /dev/md1 in device cache
        #device/dev-cache.c:329         /dev/disk/by-id/md-uuid-ca205de2:7dcd4331:726dc854:f3808353: Aliased to /dev/md1 in device cache
        #device/dev-cache.c:329         /dev/md/xen01:1: Aliased to /dev/md1 in device cache
        #device/dev-io.c:525         Opened /dev/md1 RO O_DIRECT
        #device/dev-io.c:272       /dev/md1: size is 1950809088 sectors
        #device/dev-io.c:138         /dev/md1: block size is 4096 bytes
        #device/dev-io.c:578         Closed /dev/md1
        #device/dev-io.c:272       /dev/md1: size is 1950809088 sectors
        #device/dev-io.c:525         Opened /dev/md1 RO O_DIRECT
        #device/dev-io.c:138         /dev/md1: block size is 4096 bytes
        #device/dev-io.c:578         Closed /dev/md1
        #filters/filter-composite.c:31         Using /dev/md1
        #cache/lvmcache.c:1336         lvmcache: /dev/md1: now in VG #orphans_lvm2 (#orphans_lvm2) with 0 mdas
        #libdm-config.c:817       Setting size to 1044480
        #libdm-config.c:817       Setting start to 4096
        #libdm-config.c:817       Setting ignore to 0
        #libdm-config.c:817       Setting size to 524288
        #libdm-config.c:817       Setting start to 998813728768
        #libdm-config.c:817       Setting ignore to 0
        #metadata/vg.c:59         Allocated VG VG0 at 0x11a84f0.
        #cache/lvmcache.c:1336         lvmcache: /dev/md1: now in VG VG0 with 2 mdas
        #cache/lvmcache.c:1113         lvmcache: /dev/md1: setting VG0 VGID to BL0eXaqnXklVN72UBupMl5mwWz2j0fdj
        #metadata/pv_manip.c:350         /dev/md1 0:      0    640: LV_ROOT(0:0)
        #metadata/pv_manip.c:350         /dev/md1 1:    640     64: LV_SWAP(0:0)
        #metadata/pv_manip.c:350         /dev/md1 2:   1440    320: LV_HOME(0:0)
        #metadata/pv_manip.c:350         /dev/md1 3:   2400  27366: NULL(0:0)
        #format_text/archiver.c:130     Archiving volume group "VG0" metadata (seqno 8).
        #metadata/lv_manip.c:3161     Creating logical volume LV_TEST
        #metadata/lv_manip.c:2749       Extending segment type, striped
        #libdm-config.c:881       Setting allocation/mirror_logs_require_separate_pvs to 0
        #libdm-config.c:894       allocation/mirror_legs_require_separate_pvs not found in config: defaulting to 0
        #libdm-config.c:881       Setting allocation/maximise_cling to 1
        #metadata/pv_map.c:54         Allowing allocation on /dev/md1 start PE 2400 length 27366
        #metadata/lv_manip.c:2148         Trying allocation using contiguous policy.
        #metadata/lv_manip.c:1724         Still need 960 total extents:
        #metadata/lv_manip.c:1727           1 (1 data/0 parity) parallel areas of 960 extents each
        #metadata/lv_manip.c:1729           0 mirror logs of 0 extents each
        #metadata/lv_manip.c:1402         Considering allocation area 0 as /dev/md1 start PE 2400 length 960 leaving 26406.
        #metadata/lv_manip.c:1180         Allocating parallel area 0 on /dev/md1 start PE 2400 length 960.
        #metadata/pv_manip.c:350         /dev/md1 0:      0    640: LV_ROOT(0:0)
        #metadata/pv_manip.c:350         /dev/md1 1:    640     64: LV_SWAP(0:0)
        #metadata/pv_manip.c:350         /dev/md1 2:   1440    320: LV_HOME(0:0)
        #metadata/pv_manip.c:350         /dev/md1 3:   2400    960: LV_TEST(0:0)
        #metadata/pv_manip.c:350         /dev/md1 4:   3360  26406: NULL(0:0)
        #mm/memlock.c:394         Unlock: Memlock counters: locked:0 critical:0 daemon:0 suspended:0
        #device/dev-io.c:525         Opened /dev/md1 RW O_DIRECT
        #device/dev-io.c:138         /dev/md1: block size is 4096 bytes
        #format_text/format-text.c:630         Writing VG0 metadata to /dev/md1 at 20480 len 3166
        #device/dev-io.c:90   /dev/md1: lseek 18446744071795900416 failed: Invalid argument
        #device/dev-io.c:207         <backtrace>
        #format_text/format-text.c:329         <backtrace>
        #format_text/format-text.c:596         <backtrace>
        #metadata/metadata.c:2635         <backtrace>
        #format_text/format-text.c:739         Wiping pre-committed VG0 metadata from /dev/md1 header at 4096
        #metadata/lv_manip.c:4595         <backtrace>
        #metadata/lv_manip.c:4779         <backtrace>
        #lvcreate.c:1147         <backtrace>
        #mm/memlock.c:394         Unlock: Memlock counters: locked:0 critical:0 daemon:0 suspended:0
        #activate/fs.c:489         Syncing device names
        #locking/file_locking.c:74       Unlocking /run/lvm/lock/V_VG0
        #locking/file_locking.c:51         _undo_flock /run/lvm/lock/V_VG0
        #device/dev-io.c:578         Closed /dev/md1
        #metadata/vg.c:74         Freeing VG VG0 at 0x11a84f0.

, along with metadata 
> (/etc/lvm/backup/VG0), please.

cat /etc/lvm/backup/VG0 
        # Generated by LVM2 version 2.02.98(2) (2012-10-15): Tue Mar 24 21:31:51 2015

        contents = "Text Format Volume Group"
        version = 1

        description = "Created *after* executing '/sbin/vgscan'"

        creation_host = "(none)"        # Linux (none) 3.16.6-2-default #1 SMP Mon Oct 20 13:47:22 UTC 2014 (feb42ea) x86_64
        creation_time = 1427257911      # Tue Mar 24 21:31:51 2015

        VG0 {
                id = "BL0eXa-qnXk-lVN7-2UBu-pMl5-mwWz-2j0fdj"
                seqno = 8
                format = "lvm2" # informational
                status = ["RESIZEABLE", "READ", "WRITE"]
                flags = []
                extent_size = 65536             # 32 Megabytes
                max_lv = 0
                max_pv = 0
                metadata_copies = 0

                physical_volumes {

                        pv0 {
                                id = "0ioI5Y-t2Yg-70sx-n89m-8UAm-r10E-LGrl3i"
                                device = "/dev/md127"   # Hint only

                                status = ["ALLOCATABLE"]
                                flags = []
                                dev_size = 1950809088   # 930.218 Gigabytes
                                pe_start = 2048
                                pe_count = 29766        # 930.188 Gigabytes
                        }
                }

                logical_volumes {

                        LV_ROOT {
                                id = "V4oHWi-FXqD-U8cj-3nHj-JTSV-y0HV-xH1I5z"
                                status = ["READ", "WRITE", "VISIBLE"]
                                flags = []
                                creation_host = "sysresccd"
                                creation_time = 1427253293      # 2015-03-24 20:14:53 -0700
                                segment_count = 1

                                segment1 {
                                        start_extent = 0
                                        extent_count = 640      # 20 Gigabytes

                                        type = "striped"
                                        stripe_count = 1        # linear

                                        stripes = [
                                                "pv0", 0
                                        ]
                                }
                        }

                        LV_SWAP {
                                id = "D9pl2y-W3xA-dLtJ-MnMC-PVvS-ufn3-sq22l6"
                                status = ["READ", "WRITE", "VISIBLE"]
                                flags = []
                                creation_host = "sysresccd"
                                creation_time = 1427253299      # 2015-03-24 20:14:59 -0700
                                segment_count = 1

                                segment1 {
                                        start_extent = 0
                                        extent_count = 64       # 2 Gigabytes

                                        type = "striped"
                                        stripe_count = 1        # linear

                                        stripes = [
                                                "pv0", 640
                                        ]
                                }
                        }

                        LV_HOME {
                                id = "pzlR6f-QDAh-iWn1-2Imh-mTJj-61LO-E5CbS2"
                                status = ["READ", "WRITE", "VISIBLE"]
                                flags = []
                                creation_host = "sysresccd"
                                creation_time = 1427253326      # 2015-03-24 20:15:26 -0700
                                segment_count = 1

                                segment1 {
                                        start_extent = 0
                                        extent_count = 320      # 10 Gigabytes

                                        type = "striped"
                                        stripe_count = 1        # linear

                                        stripes = [
                                                "pv0", 1440
                                        ]
                                }
                        }
 

Let's see if any if that informs while I work on more info.

LT
