Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9V1Hs98023956
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2014 21:17:55 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9V1Hpnw023944
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2014 21:17:52 -0400
Received: by mail-lb0-f174.google.com with SMTP id z11so3370720lbi.33
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2014 18:17:50 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 30 Oct 2014 21:17:50 -0400
Message-ID: <CANHNcP9F=xab3SDarH7X4hrVNY9Mg8aFHvAnBqn0QvfiM-4Hwg@mail.gmail.com>
From: Roman Mashak <roman.mashak@gmail.com>
Subject: [linux-lvm] vgscan can't see LVM volumes on QEMU image
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

Hello,

I want to mount QEMU image of qcow2 type on Fedora 20 host. Here is
what commands I executed, according to the advices at
http://docs.openstack.org/image-guide/content/ch_modifying_images.html:

% modprobe nbd max_part=16
% qemu-nbd -c /dev/nbd0 image.qcow2
% partprobe /dev/nbd0
% vgscan -vvv
      Setting activation/monitoring to 1
        Processing: vgscan -vvv
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/wait_for_locks to 1
      File-based locking selected.
      Setting global/locking_dir to /run/lock/lvm
      Setting global/prioritise_write_locks to 1
      Locking /run/lock/lvm/P_global WB
        _do_flock /run/lock/lvm/P_global:aux WB
        _do_flock /run/lock/lvm/P_global WB
        _undo_flock /run/lock/lvm/P_global:aux
        Metadata cache has no info for vgname: "#global"
    Wiping cache of LVM-capable devices
        /dev/sda: Added to device cache
        /dev/disk/by-id/ata-WDC_WD10EZEX-75M2NA0_WD-WCC3F4935054:
Aliased to /dev/sda in device cache
        /dev/disk/by-id/wwn-0x50014ee25f867e03: Aliased to /dev/sda in
device cache
        /dev/sda1: Added to device cache
        /dev/disk/by-id/ata-WDC_WD10EZEX-75M2NA0_WD-WCC3F4935054-part1:
Aliased to /dev/sda1 in device cache
        /dev/disk/by-id/wwn-0x50014ee25f867e03-part1: Aliased to
/dev/sda1 in device cache
        /dev/disk/by-uuid/1c1a9d75-070a-4c5b-8d66-24cae1141dd7:
Aliased to /dev/sda1 in device cache
        /dev/sda2: Added to device cache
        /dev/disk/by-id/ata-WDC_WD10EZEX-75M2NA0_WD-WCC3F4935054-part2:
Aliased to /dev/sda2 in device cache
        /dev/disk/by-id/lvm-pv-uuid-DnkMt8-bu1E-7dJo-Sdcc-GlT6-sKec-FjFj1o:
Aliased to /dev/sda2 in device cache
        /dev/disk/by-id/wwn-0x50014ee25f867e03-part2: Aliased to
/dev/sda2 in device cache
        /dev/sr0: Added to device cache
        /dev/cdrom: Aliased to /dev/sr0 in device cache (preferred name)
        /dev/disk/by-id/ata-ASUS_DRW-24F1ST_a_S10K68EF300J0B: Aliased
to /dev/cdrom in device cache
        /dev/nbd0: Added to device cache
        /dev/nbd0p1: Added to device cache
        /dev/nbd0p2: Added to device cache
        /dev/nbd1: Added to device cache
        /dev/nbd10: Added to device cache
        /dev/nbd11: Added to device cache
        /dev/nbd12: Added to device cache
        /dev/nbd13: Added to device cache
        /dev/nbd14: Added to device cache
        /dev/nbd15: Added to device cache
        /dev/nbd2: Added to device cache
        /dev/nbd3: Added to device cache
        /dev/nbd4: Added to device cache
        /dev/nbd5: Added to device cache
        /dev/nbd6: Added to device cache
        /dev/nbd7: Added to device cache
        /dev/nbd8: Added to device cache
        /dev/nbd9: Added to device cache
        /dev/dm-0: Added to device cache
        /dev/disk/by-id/dm-name-fedora_nfv--s1-swap: Aliased to
/dev/dm-0 in device cache (preferred name)
        /dev/disk/by-id/dm-uuid-LVM-KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwTYdLBLM9aOVskeq2PlKwTefSpNK2tdqi2:
Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-swap in device cache
        /dev/disk/by-uuid/fd91acd1-1ff8-4db9-a070-f999a387489c:
Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-swap in device cache
        /dev/fedora_nfv-s1/swap: Aliased to
/dev/disk/by-id/dm-name-fedora_nfv--s1-swap in device cache (preferred
name)
        /dev/mapper/fedora_nfv--s1-swap: Aliased to
/dev/fedora_nfv-s1/swap in device cache
        /dev/dm-1: Added to device cache
        /dev/disk/by-id/dm-name-fedora_nfv--s1-root: Aliased to
/dev/dm-1 in device cache (preferred name)
        /dev/disk/by-id/dm-uuid-LVM-KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwTQy5rPQnLskMuc0luyn5HeUAJcC4sHz0t:
Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-root in device cache
        /dev/disk/by-uuid/44fd9e97-274d-4536-b8f2-9a0d6e33a33a:
Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-root in device cache
        /dev/fedora_nfv-s1/root: Aliased to
/dev/disk/by-id/dm-name-fedora_nfv--s1-root in device cache (preferred
name)
        /dev/mapper/fedora_nfv--s1-root: Aliased to
/dev/fedora_nfv-s1/root in device cache
        /dev/dm-2: Added to device cache
        /dev/disk/by-id/dm-name-fedora_nfv--s1-home: Aliased to
/dev/dm-2 in device cache (preferred name)
        /dev/disk/by-id/dm-uuid-LVM-KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwTtNmpzJ9SfcvKnnvdlfdseL6QLUnvP5vA:
Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-home in device cache
        /dev/disk/by-uuid/c6b30418-b427-430d-916b-dceb4d08b5d9:
Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-home in device cache
        /dev/fedora_nfv-s1/home: Aliased to
/dev/disk/by-id/dm-name-fedora_nfv--s1-home in device cache (preferred
name)
        /dev/mapper/fedora_nfv--s1-home: Aliased to
/dev/fedora_nfv-s1/home in device cache
    Wiping internal VG cache
        Metadata cache has no info for vgname: "#global"
        Metadata cache has no info for vgname: "#orphans_lvm1"
        Metadata cache has no info for vgname: "#orphans_lvm1"
        lvmcache: initialised VG #orphans_lvm1
        Metadata cache has no info for vgname: "#orphans_pool"
        Metadata cache has no info for vgname: "#orphans_pool"
        lvmcache: initialised VG #orphans_pool
        Metadata cache has no info for vgname: "#orphans_lvm2"
        Metadata cache has no info for vgname: "#orphans_lvm2"
        lvmcache: initialised VG #orphans_lvm2
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
        Asking lvmetad for complete list of known VGs
      Setting response to OK
      Setting response to OK
        Asking lvmetad for VG Kisoyq-xG0i-u1uF-iZsL-L7nV-SSX0-Ow8qwT
(name unknown)
      Setting response to OK
      Setting response to OK
      Setting name to fedora_nfv-s1
      Setting metadata/format to lvm2
        Metadata cache has no info for vgname: "fedora_nfv-s1"
      Setting id to DnkMt8-bu1E-7dJo-Sdcc-GlT6-sKec-FjFj1o
      Setting format to lvm2
      Setting device to 2050
      Setting dev_size to 1952497664
      Setting label_sector to 1
        /dev/sda2: Device is a partition, using primary device
/dev/sda for mpath component detection
        Opened /dev/sda2 RO O_DIRECT
      /dev/sda2: size is 1952497664 sectors
        Closed /dev/sda2
      /dev/sda2: size is 1952497664 sectors
        Opened /dev/sda2 RO O_DIRECT
        /dev/sda2: block size is 4096 bytes
        /dev/sda2: physical block size is 4096 bytes
        Closed /dev/sda2
        lvmcache: /dev/sda2: now in VG #orphans_lvm2 (#orphans_lvm2) with 0 mdas
      Setting size to 1044480
      Setting start to 4096
      Setting ignore to 0
        Allocated VG fedora_nfv-s1 at 0x7f985779d4c0.
        Metadata cache has no info for vgname: "fedora_nfv-s1"
        Metadata cache has no info for vgname: "fedora_nfv-s1"
        lvmcache: /dev/sda2: now in VG fedora_nfv-s1 with 1 mdas
        lvmcache: /dev/sda2: setting fedora_nfv-s1 VGID to
KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwT
        Freeing VG fedora_nfv-s1 at 0x7f985779d4c0.
    Finding volume group "fedora_nfv-s1"
      Locking /run/lock/lvm/V_fedora_nfv-s1 RB
        _do_flock /run/lock/lvm/V_fedora_nfv-s1:aux WB
        _undo_flock /run/lock/lvm/V_fedora_nfv-s1:aux
        _do_flock /run/lock/lvm/V_fedora_nfv-s1 RB
        Asking lvmetad for VG Kisoyq-xG0i-u1uF-iZsL-L7nV-SSX0-Ow8qwT
(fedora_nfv-s1)
      Setting response to OK
      Setting response to OK
      Setting name to fedora_nfv-s1
      Setting metadata/format to lvm2
      Setting id to DnkMt8-bu1E-7dJo-Sdcc-GlT6-sKec-FjFj1o
      Setting format to lvm2
      Setting device to 2050
      Setting dev_size to 1952497664
      Setting label_sector to 1
      Setting size to 1044480
      Setting start to 4096
      Setting ignore to 0
        Allocated VG fedora_nfv-s1 at 0x7f98577920b0.
        /dev/sda2 0:      0   2020: swap(0:0)
        /dev/sda2 1:   2020 223521: home(0:0)
        /dev/sda2 2: 225541  12800: root(0:0)
        Allocated VG fedora_nfv-s1 at 0x7f98577960c0.
  Found volume group "fedora_nfv-s1" using metadata type lvm2
        Freeing VG fedora_nfv-s1 at 0x7f985779e0e0.
        Unlock: Memlock counters: locked:0 critical:0 daemon:0 suspended:0
        Syncing device names
      Unlocking /run/lock/lvm/V_fedora_nfv-s1
        _undo_flock /run/lock/lvm/V_fedora_nfv-s1
        Freeing VG fedora_nfv-s1 at 0x7f98577960c0.
        Freeing VG fedora_nfv-s1 at 0x7f98577920b0.
      Unlocking /run/lock/lvm/P_global
        _undo_flock /run/lock/lvm/P_global
        Metadata cache has no info for vgname: "#global"
        Completed: vgscan -vvv
%

The volume group 'fedora_nfv-s1' actually exists on the host where I
run the commands, i.e. /dev/sda* but nothing reported about /dev/nbd*
although <image.qcow2> carries centos-6.5 with lvm in it.

vgscan is part of package lvm2-2.02.106-1.fc20.x86_64

I would appreciate helpful advises. Thanks.

-- 
Roman Mashak
