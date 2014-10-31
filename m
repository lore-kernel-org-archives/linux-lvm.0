Message-ID: <54539924.1020709@redhat.com>
Date: Fri, 31 Oct 2014 15:13:56 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CANHNcP9F=xab3SDarH7X4hrVNY9Mg8aFHvAnBqn0QvfiM-4Hwg@mail.gmail.com>	<54535811.3050906@redhat.com>
	<54535B0B.50700@redhat.com>
	<CANHNcP8vR-AJ7j9fkoWKLgSjX6Vgx4JiTCh=h4B=ftVRySag2w@mail.gmail.com>
In-Reply-To: <CANHNcP8vR-AJ7j9fkoWKLgSjX6Vgx4JiTCh=h4B=ftVRySag2w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgscan can't see LVM volumes on QEMU image
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>

On 10/31/2014 02:00 PM, Roman Mashak wrote:
> Hi,
>
> 2014-10-31 5:48 GMT-04:00 Zdenek Kabelac <zkabelac@redhat.com>:
> [skip]
>>> I'm mostly sure noone has added support for  nbd devices to lvm2.
>>>
>>> look into  /etc/lvm/lvm.conf and  add in device section  something like:
>>>
>>> types = [ "nbd", 16 ]
>>>
>>
>>
>> Ahh ignore this please - I've been having wrong impression it's something
>> new for qcow, but nbd is standard already support network block device.
>>
>> So  what is the disk layout of your qcow ?
> It has two partitions, root and swap.
>
>> It's purely whole PV ?
>
>> Have you tried  to disable 'lvmetad' ?
> After I disabled the daemon, vgscan has found the volume group on the
> image and I could mount it;

To me looks like `pvscan --cache` is not called on NBD devices as they 
appear.

Could you post udev db dump for /dev/nbd0 and /dev/nbd0p1?

     udevadm info --name=$NAME --query=all

 > however I observed that after the vgscan
> has completed, lvmetad has started running back again (probably it
> doesn't hurt).

How did you disable it?

It has to be disabled in lvm.conf. If you only stopped it, it is a 
socket activated service and will be restarted (at least on recent 
Fedora and RHEL.)

> Please see below the output:
>
> % vgscan -vvv
>        Setting activation/monitoring to 1
>          Processing: vgscan -vvv
>          O_DIRECT will be used
>        Setting global/locking_type to 1
>        Setting global/wait_for_locks to 1
>        File-based locking selected.
>        Setting global/locking_dir to /run/lock/lvm
>        Setting global/prioritise_write_locks to 1
>        Locking /run/lock/lvm/P_global WB
>          _do_flock /run/lock/lvm/P_global:aux WB
>          _do_flock /run/lock/lvm/P_global WB
>          _undo_flock /run/lock/lvm/P_global:aux
>          Metadata cache has no info for vgname: "#global"
>      Wiping cache of LVM-capable devices
>          /dev/sda: Added to device cache
>          /dev/disk/by-id/ata-WDC_WD10EZEX-75M2NA0_WD-WCC3F4935054:
> Aliased to /dev/sda in device cache
>          /dev/disk/by-id/wwn-0x50014ee25f867e03: Aliased to /dev/sda in
> device cache
>          /dev/sda1: Added to device cache
>          /dev/disk/by-id/ata-WDC_WD10EZEX-75M2NA0_WD-WCC3F4935054-part1:
> Aliased to /dev/sda1 in device cache
>          /dev/disk/by-id/wwn-0x50014ee25f867e03-part1: Aliased to
> /dev/sda1 in device cache
>          /dev/disk/by-uuid/1c1a9d75-070a-4c5b-8d66-24cae1141dd7:
> Aliased to /dev/sda1 in device cache
>          /dev/sda2: Added to device cache
>          /dev/disk/by-id/ata-WDC_WD10EZEX-75M2NA0_WD-WCC3F4935054-part2:
> Aliased to /dev/sda2 in device cache
>          /dev/disk/by-id/lvm-pv-uuid-DnkMt8-bu1E-7dJo-Sdcc-GlT6-sKec-FjFj1o:
> Aliased to /dev/sda2 in device cache
>          /dev/disk/by-id/wwn-0x50014ee25f867e03-part2: Aliased to
> /dev/sda2 in device cache
>          /dev/sr0: Added to device cache
>          /dev/cdrom: Aliased to /dev/sr0 in device cache (preferred name)
>          /dev/disk/by-id/ata-ASUS_DRW-24F1ST_a_S10K68EF300J0B: Aliased
> to /dev/cdrom in device cache
>          /dev/nbd0: Added to device cache
>          /dev/nbd0p1: Added to device cache
>          /dev/nbd0p2: Added to device cache
>          /dev/nbd1: Added to device cache
>          /dev/nbd10: Added to device cache
>          /dev/nbd11: Added to device cache
>          /dev/nbd12: Added to device cache
>          /dev/nbd13: Added to device cache
>          /dev/nbd14: Added to device cache
>          /dev/nbd15: Added to device cache
>          /dev/nbd2: Added to device cache
>          /dev/nbd3: Added to device cache
>          /dev/nbd4: Added to device cache
>          /dev/nbd5: Added to device cache
>          /dev/nbd6: Added to device cache
>          /dev/nbd7: Added to device cache
>          /dev/nbd8: Added to device cache
>          /dev/nbd9: Added to device cache
>          /dev/dm-0: Added to device cache
>          /dev/disk/by-id/dm-name-fedora_nfv--s1-swap: Aliased to
> /dev/dm-0 in device cache (preferred name)
>          /dev/disk/by-id/dm-uuid-LVM-KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwTYdLBLM9aOVskeq2PlKwTefSpNK2tdqi2:
> Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-swap in device cache
>          /dev/disk/by-uuid/fd91acd1-1ff8-4db9-a070-f999a387489c:
> Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-swap in device cache
>          /dev/fedora_nfv-s1/swap: Aliased to
> /dev/disk/by-id/dm-name-fedora_nfv--s1-swap in device cache (preferred
> name)
>          /dev/mapper/fedora_nfv--s1-swap: Aliased to
> /dev/fedora_nfv-s1/swap in device cache
>          /dev/dm-1: Added to device cache
>          /dev/disk/by-id/dm-name-fedora_nfv--s1-root: Aliased to
> /dev/dm-1 in device cache (preferred name)
>          /dev/disk/by-id/dm-uuid-LVM-KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwTQy5rPQnLskMuc0luyn5HeUAJcC4sHz0t:
> Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-root in device cache
>          /dev/disk/by-uuid/44fd9e97-274d-4536-b8f2-9a0d6e33a33a:
> Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-root in device cache
>          /dev/fedora_nfv-s1/root: Aliased to
> /dev/disk/by-id/dm-name-fedora_nfv--s1-root in device cache (preferred
> name)
>          /dev/mapper/fedora_nfv--s1-root: Aliased to
> /dev/fedora_nfv-s1/root in device cache
>          /dev/dm-2: Added to device cache
>          /dev/disk/by-id/dm-name-fedora_nfv--s1-home: Aliased to
> /dev/dm-2 in device cache (preferred name)
>          /dev/disk/by-id/dm-uuid-LVM-KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwTtNmpzJ9SfcvKnnvdlfdseL6QLUnvP5vA:
> Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-home in device cache
>          /dev/disk/by-uuid/c6b30418-b427-430d-916b-dceb4d08b5d9:
> Aliased to /dev/disk/by-id/dm-name-fedora_nfv--s1-home in device cache
>          /dev/fedora_nfv-s1/home: Aliased to
> /dev/disk/by-id/dm-name-fedora_nfv--s1-home in device cache (preferred
> name)
>          /dev/mapper/fedora_nfv--s1-home: Aliased to
> /dev/fedora_nfv-s1/home in device cache
>      Wiping internal VG cache
>          Metadata cache has no info for vgname: "#global"
>          Metadata cache has no info for vgname: "#orphans_lvm1"
>          Metadata cache has no info for vgname: "#orphans_lvm1"
>          lvmcache: initialised VG #orphans_lvm1
>          Metadata cache has no info for vgname: "#orphans_pool"
>          Metadata cache has no info for vgname: "#orphans_pool"
>          lvmcache: initialised VG #orphans_pool
>          Metadata cache has no info for vgname: "#orphans_lvm2"
>          Metadata cache has no info for vgname: "#orphans_lvm2"
>          lvmcache: initialised VG #orphans_lvm2
>    Reading all physical volumes.  This may take a while...
>      Finding all volume groups
>          Asking lvmetad for complete list of known VGs
>        Setting response to OK
>        Setting response to OK
>          Asking lvmetad for VG 27jUR5-DR92-XsHx-MSvQ-VqRF-hTjO-ROxS6A
> (name unknown)
>        Setting response to OK
>        Setting response to OK
>        Setting name to VolGroup
>        Setting metadata/format to lvm2
>          Metadata cache has no info for vgname: "VolGroup"
>        Setting id to aj9T9q-WEBL-mQ5y-LnGf-vLDZ-QOtB-8gHbqi
>        Setting format to lvm2
>        Setting device to 11010
>        Setting dev_size to 19945472
>        Setting label_sector to 1
>          Opened /dev/nbd0p2 RO O_DIRECT
>        /dev/nbd0p2: size is 19945472 sectors
>          Closed /dev/nbd0p2
>        /dev/nbd0p2: size is 19945472 sectors
>          Opened /dev/nbd0p2 RO O_DIRECT
>          /dev/nbd0p2: block size is 4096 bytes
>          /dev/nbd0p2: physical block size is 512 bytes
>          Closed /dev/nbd0p2
>          lvmcache: /dev/nbd0p2: now in VG #orphans_lvm2 (#orphans_lvm2)
> with 0 mdas
>        Setting size to 1044480
>        Setting start to 4096
>        Setting ignore to 0
>          Allocated VG VolGroup at 0x7f35607a4dd0.
>          Metadata cache has no info for vgname: "VolGroup"
>          Metadata cache has no info for vgname: "VolGroup"
>          lvmcache: /dev/nbd0p2: now in VG VolGroup with 1 mdas
>          lvmcache: /dev/nbd0p2: setting VolGroup VGID to
> 27jUR5DR92XsHxMSvQVqRFhTjOROxS6A
>          Freeing VG VolGroup at 0x7f35607a4dd0.
>          Asking lvmetad for VG Kisoyq-xG0i-u1uF-iZsL-L7nV-SSX0-Ow8qwT
> (name unknown)
>        Setting response to OK
>        Setting response to OK
>        Setting name to fedora_nfv-s1
>        Setting metadata/format to lvm2
>          Metadata cache has no info for vgname: "fedora_nfv-s1"
>        Setting id to DnkMt8-bu1E-7dJo-Sdcc-GlT6-sKec-FjFj1o
>        Setting format to lvm2
>        Setting device to 2050
>        Setting dev_size to 1952497664
>        Setting label_sector to 1
>          /dev/sda2: Device is a partition, using primary device
> /dev/sda for mpath component detection
>          Opened /dev/sda2 RO O_DIRECT
>        /dev/sda2: size is 1952497664 sectors
>          Closed /dev/sda2
>        /dev/sda2: size is 1952497664 sectors
>          Opened /dev/sda2 RO O_DIRECT
>          /dev/sda2: block size is 4096 bytes
>          /dev/sda2: physical block size is 4096 bytes
>          Closed /dev/sda2
>          lvmcache: /dev/sda2: now in VG #orphans_lvm2 (#orphans_lvm2) with 0 mdas
>        Setting size to 1044480
>        Setting start to 4096
>        Setting ignore to 0
>          Allocated VG fedora_nfv-s1 at 0x7f35607a0570.
>          Metadata cache has no info for vgname: "fedora_nfv-s1"
>          Metadata cache has no info for vgname: "fedora_nfv-s1"
>          lvmcache: /dev/sda2: now in VG fedora_nfv-s1 with 1 mdas
>          lvmcache: /dev/sda2: setting fedora_nfv-s1 VGID to
> KisoyqxG0iu1uFiZsLL7nVSSX0Ow8qwT
>          Freeing VG fedora_nfv-s1 at 0x7f35607a0570.
>      Finding volume group "fedora_nfv-s1"
>        Locking /run/lock/lvm/V_fedora_nfv-s1 RB
>          _do_flock /run/lock/lvm/V_fedora_nfv-s1:aux WB
>          _undo_flock /run/lock/lvm/V_fedora_nfv-s1:aux
>          _do_flock /run/lock/lvm/V_fedora_nfv-s1 RB
>          Asking lvmetad for VG Kisoyq-xG0i-u1uF-iZsL-L7nV-SSX0-Ow8qwT
> (fedora_nfv-s1)
>        Setting response to OK
>        Setting response to OK
>        Setting name to fedora_nfv-s1
>        Setting metadata/format to lvm2
>        Setting id to DnkMt8-bu1E-7dJo-Sdcc-GlT6-sKec-FjFj1o
>        Setting format to lvm2
>        Setting device to 2050
>        Setting dev_size to 1952497664
>        Setting label_sector to 1
>        Setting size to 1044480
>        Setting start to 4096
>        Setting ignore to 0
>          Allocated VG fedora_nfv-s1 at 0x7f3560799170.
>          /dev/sda2 0:      0   2020: swap(0:0)
>          /dev/sda2 1:   2020 223521: home(0:0)
>          /dev/sda2 2: 225541  12800: root(0:0)
>          Allocated VG fedora_nfv-s1 at 0x7f356079d180.
>    Found volume group "fedora_nfv-s1" using metadata type lvm2
>          Freeing VG fedora_nfv-s1 at 0x7f35607a59b0.
>          Unlock: Memlock counters: locked:0 critical:0 daemon:0 suspended:0
>          Syncing device names
>        Unlocking /run/lock/lvm/V_fedora_nfv-s1
>          _undo_flock /run/lock/lvm/V_fedora_nfv-s1
>          Freeing VG fedora_nfv-s1 at 0x7f356079d180.
>          Freeing VG fedora_nfv-s1 at 0x7f3560799170.
>      Finding volume group "VolGroup"
>        Locking /run/lock/lvm/V_VolGroup RB
>          _do_flock /run/lock/lvm/V_VolGroup:aux WB
>          _undo_flock /run/lock/lvm/V_VolGroup:aux
>          _do_flock /run/lock/lvm/V_VolGroup RB
>          Asking lvmetad for VG 27jUR5-DR92-XsHx-MSvQ-VqRF-hTjO-ROxS6A (VolGroup)
>        Setting response to OK
>        Setting response to OK
>        Setting name to VolGroup
>        Setting metadata/format to lvm2
>        Setting id to aj9T9q-WEBL-mQ5y-LnGf-vLDZ-QOtB-8gHbqi
>        Setting format to lvm2
>        Setting device to 11010
>        Setting dev_size to 19945472
>        Setting label_sector to 1
>        Setting size to 1044480
>        Setting start to 4096
>        Setting ignore to 0
>          Allocated VG VolGroup at 0x7f3560799170.
>          /dev/nbd0p2 0:      0   2178: lv_root(0:0)
>          /dev/nbd0p2 1:   2178    256: lv_swap(0:0)
>          Allocated VG VolGroup at 0x7f356079d180.
>    Found volume group "VolGroup" using metadata type lvm2
>          Freeing VG VolGroup at 0x7f35607a59b0.
>          Unlock: Memlock counters: locked:0 critical:0 daemon:0 suspended:0
>          Syncing device names
>        Unlocking /run/lock/lvm/V_VolGroup
>          _undo_flock /run/lock/lvm/V_VolGroup
>          Freeing VG VolGroup at 0x7f356079d180.
>          Freeing VG VolGroup at 0x7f3560799170.
>        Unlocking /run/lock/lvm/P_global
>          _undo_flock /run/lock/lvm/P_global
>          Metadata cache has no info for vgname: "#global"
>          Completed: vgscan -vvv
> %
>
>> What is the lvm2 version in use here ?
>
> Where can I find this information?

On RPM based systems: `rpm -q lvm2`
Elsewhere: `lvm version`

>
