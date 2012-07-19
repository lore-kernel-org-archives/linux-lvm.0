Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6JIcuuf025823
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2012 14:38:57 -0400
Received: from igw1.tempest.sk (mx1.tempest.sk [195.28.127.2])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6JIci0Z020593
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2012 14:38:45 -0400
Received: from EXCASHT01.tempest.intra (excasht01.tempest.intra [195.28.100.5])
	by igw1.tempest.sk (Postfix) with ESMTP id 2C82F38ABB
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2012 20:38:26 +0200 (CEST)
Message-ID: <50085421.7060900@tempest.sk>
Date: Thu, 19 Jul 2012 20:38:25 +0200
From: Tomas Vanderka <tomas_vanderka@tempest.sk>
MIME-Version: 1.0
References: <5006BF05.9090305@tempest.sk>
In-Reply-To: <5006BF05.9090305@tempest.sk>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig032E1DAF2AD841D771F35CBB"
Subject: Re: [linux-lvm] Replacing failed disk in raid volume without hot
	spare
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
To: linux-lvm@redhat.com

--------------enig032E1DAF2AD841D771F35CBB
Content-Type: multipart/mixed; boundary="------------010109010208040309000008"

This is a multi-part message in MIME format.
--------------010109010208040309000008
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>>=20
>> Tried all of theese, nothing seems to work
>>=20
>> [root lvm ~]# lvconvert --repair test/raid6
>>  Couldn't find device with uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl=
=2E
>> Attempt to replace failed RAID images (requires full device resync)? [=
y/n]: y
>>  Insufficient suitable allocatable extents for logical volume : 87 mor=
e required
>>  Failed to allocate replacement images for test/raid6
>>  Failed to replace faulty devices in test/raid6.
>=20
> could you perhaps attach the verbose output from this command?
> e.g.> echo  y | lvconvert --repair test/raid6 -vvvv >& output.txt
>=20
>  brassow
>=20

That one obviously failed because there is no usable device available in =
the VG (1 failed/missing, 4 allready in raid6, 0 available)

The problem is I can't extend my VG with the new disk (because VG is miss=
ing devices) and I also can not "vgchange --removemissing" because that d=
estroys my raid6 volume.

I only managed to add the new disk to VG by doing

pvcreate --uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl new-disk

but later device mapper got confused with errors like these

device-mapper: raid: New device injected into existing array without 'reb=
uild' parameter specified
device-mapper: table: 253:12: raid: Unable to assemble array: Invalid sup=
erblocks
device-mapper: ioctl: error adding target to table


I played with it a little more and it works like this

vgextend
 =3D does not work with missing devices, so can not add a new disk

vgchange --removemissing
 =3D destroys partial raid volumes, I tried this so I could do vgextend l=
ater

pvcreate --uuid
 =3D confuses device-mapper

lvconvert --repair
 =3D only works if I have usable disk in VG that is not part of a partial=
 raid volume, fails otherwise
 =3D it also does nothing if I unplug a disk, do some writes to raid whil=
e it's offline, then plug it in. I guess it should do a resync, but nothi=
ng happens, and raid still
runs in partial mode, devmapper knows that disk is failed thou (-vvvv out=
put attached)

lvconvert --replace
 =3D only works if I have usable disk in VG that is not part of a partial=
 raid volume, fails otherwise
 =3D this can be used to force resync of a partial volume by replacing te=
mporarily missing disk

v.

--------------010109010208040309000008
Content-Type: text/plain;
 name="output.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="output.txt"

#lvmcmdline.c:1070         Processing: lvconvert --repair test/raid6 -vvv=
v
#lvmcmdline.c:1073         O_DIRECT will be used
#libdm-config.c:789       Setting global/locking_type to 1
#libdm-config.c:789       Setting global/wait_for_locks to 1
#locking/locking.c:242       File-based locking selected.
#libdm-config.c:758       Setting global/locking_dir to /var/lock/lvm
#libdm-common.c:785         Preparing SELinux context for /var/lock/lvm t=
o system_u:object_r:lvm_lock_t:s0.
#libdm-common.c:788         Resetting SELinux context to default value.
#libdm-config.c:789       Setting activation/mirror_region_size to 512
#activate/activate.c:471       Getting target version for mirror
#ioctl/libdm-iface.c:1687         dm versions   OF   [16384] (*1)
#activate/activate.c:471       Getting target version for mirror
#ioctl/libdm-iface.c:1687         dm versions   OF   [16384] (*1)
#locking/file_locking.c:236       Locking /var/lock/lvm/V_test WB
#libdm-common.c:785         Preparing SELinux context for /var/lock/lvm/V=
_test to system_u:object_r:lvm_lock_t:s0.
#locking/file_locking.c:141         _do_flock /var/lock/lvm/V_test:aux WB=

#locking/file_locking.c:141         _do_flock /var/lock/lvm/V_test WB
#locking/file_locking.c:51         _undo_flock /var/lock/lvm/V_test:aux
#libdm-common.c:788         Resetting SELinux context to default value.
#device/dev-cache.c:333         /dev/sr0: Added to device cache
#device/dev-cache.c:330         /dev/block/11:0: Aliased to /dev/sr0 in d=
evice cache
#device/dev-cache.c:330         /dev/scd0: Aliased to /dev/sr0 in device =
cache (preferred name)
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:00:07.1-scsi-1=
:0:0:0: Aliased to /dev/scd0 in device cache
#device/dev-cache.c:330         /dev/disk/by-label/CentOS_6.3_Final: Alia=
sed to /dev/scd0 in device cache
#device/dev-cache.c:330         /dev/cdrom: Aliased to /dev/scd0 in devic=
e cache (preferred name)
#device/dev-cache.c:330         /dev/cdrw: Aliased to /dev/cdrom in devic=
e cache
#device/dev-cache.c:330         /dev/dvd: Aliased to /dev/cdrom in device=
 cache
#device/dev-cache.c:330         /dev/dvdrw: Aliased to /dev/cdrom in devi=
ce cache
#device/dev-cache.c:333         /dev/sda: Added to device cache
#device/dev-cache.c:330         /dev/block/8:0: Aliased to /dev/sda in de=
vice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:0:0: Aliased to /dev/sda in device cache
#device/dev-cache.c:333         /dev/sda1: Added to device cache
#device/dev-cache.c:330         /dev/block/8:1: Aliased to /dev/sda1 in d=
evice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:0:0-part1: Aliased to /dev/sda1 in device cache
#device/dev-cache.c:330         /dev/disk/by-uuid/6db79b49-211c-4708-aa5e=
-b62751fe1b6d: Aliased to /dev/sda1 in device cache
#device/dev-cache.c:333         /dev/sda2: Added to device cache
#device/dev-cache.c:330         /dev/block/8:2: Aliased to /dev/sda2 in d=
evice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:0:0-part2: Aliased to /dev/sda2 in device cache
#device/dev-cache.c:333         /dev/sdh: Added to device cache
#device/dev-cache.c:330         /dev/block/8:112: Aliased to /dev/sdh in =
device cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:1:0: Aliased to /dev/sdh in device cache
#device/dev-cache.c:333         /dev/sdc: Added to device cache
#device/dev-cache.c:330         /dev/block/8:32: Aliased to /dev/sdc in d=
evice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:2:0: Aliased to /dev/sdc in device cache
#device/dev-cache.c:333         /dev/sdd: Added to device cache
#device/dev-cache.c:330         /dev/block/8:48: Aliased to /dev/sdd in d=
evice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:3:0: Aliased to /dev/sdd in device cache
#device/dev-cache.c:333         /dev/sde: Added to device cache
#device/dev-cache.c:330         /dev/block/8:64: Aliased to /dev/sde in d=
evice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:4:0: Aliased to /dev/sde in device cache
#device/dev-cache.c:333         /dev/sdf: Added to device cache
#device/dev-cache.c:330         /dev/block/8:80: Aliased to /dev/sdf in d=
evice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:5:0: Aliased to /dev/sdf in device cache
#device/dev-cache.c:333         /dev/sdg: Added to device cache
#device/dev-cache.c:330         /dev/block/8:96: Aliased to /dev/sdg in d=
evice cache
#device/dev-cache.c:330         /dev/disk/by-path/pci-0000:03:00.0-scsi-0=
:0:6:0: Aliased to /dev/sdg in device cache
#device/dev-cache.c:333         /dev/loop0: Added to device cache
#device/dev-cache.c:330         /dev/block/7:0: Aliased to /dev/loop0 in =
device cache
#device/dev-cache.c:333         /dev/loop1: Added to device cache
#device/dev-cache.c:330         /dev/block/7:1: Aliased to /dev/loop1 in =
device cache
#device/dev-cache.c:333         /dev/loop2: Added to device cache
#device/dev-cache.c:330         /dev/block/7:2: Aliased to /dev/loop2 in =
device cache
#device/dev-cache.c:333         /dev/loop3: Added to device cache
#device/dev-cache.c:330         /dev/block/7:3: Aliased to /dev/loop3 in =
device cache
#device/dev-cache.c:333         /dev/loop4: Added to device cache
#device/dev-cache.c:330         /dev/block/7:4: Aliased to /dev/loop4 in =
device cache
#device/dev-cache.c:333         /dev/loop5: Added to device cache
#device/dev-cache.c:330         /dev/block/7:5: Aliased to /dev/loop5 in =
device cache
#device/dev-cache.c:333         /dev/loop6: Added to device cache
#device/dev-cache.c:330         /dev/block/7:6: Aliased to /dev/loop6 in =
device cache
#device/dev-cache.c:333         /dev/loop7: Added to device cache
#device/dev-cache.c:330         /dev/block/7:7: Aliased to /dev/loop7 in =
device cache
#device/dev-cache.c:333         /dev/ram0: Added to device cache
#device/dev-cache.c:330         /dev/block/1:0: Aliased to /dev/ram0 in d=
evice cache
#device/dev-cache.c:333         /dev/ram1: Added to device cache
#device/dev-cache.c:330         /dev/block/1:1: Aliased to /dev/ram1 in d=
evice cache
#device/dev-cache.c:333         /dev/ram10: Added to device cache
#device/dev-cache.c:330         /dev/block/1:10: Aliased to /dev/ram10 in=
 device cache
#device/dev-cache.c:333         /dev/ram11: Added to device cache
#device/dev-cache.c:330         /dev/block/1:11: Aliased to /dev/ram11 in=
 device cache
#device/dev-cache.c:333         /dev/ram12: Added to device cache
#device/dev-cache.c:330         /dev/block/1:12: Aliased to /dev/ram12 in=
 device cache
#device/dev-cache.c:333         /dev/ram13: Added to device cache
#device/dev-cache.c:330         /dev/block/1:13: Aliased to /dev/ram13 in=
 device cache
#device/dev-cache.c:333         /dev/ram14: Added to device cache
#device/dev-cache.c:330         /dev/block/1:14: Aliased to /dev/ram14 in=
 device cache
#device/dev-cache.c:333         /dev/ram15: Added to device cache
#device/dev-cache.c:330         /dev/block/1:15: Aliased to /dev/ram15 in=
 device cache
#device/dev-cache.c:333         /dev/ram2: Added to device cache
#device/dev-cache.c:330         /dev/block/1:2: Aliased to /dev/ram2 in d=
evice cache
#device/dev-cache.c:333         /dev/ram3: Added to device cache
#device/dev-cache.c:330         /dev/block/1:3: Aliased to /dev/ram3 in d=
evice cache
#device/dev-cache.c:333         /dev/ram4: Added to device cache
#device/dev-cache.c:330         /dev/block/1:4: Aliased to /dev/ram4 in d=
evice cache
#device/dev-cache.c:333         /dev/ram5: Added to device cache
#device/dev-cache.c:330         /dev/block/1:5: Aliased to /dev/ram5 in d=
evice cache
#device/dev-cache.c:333         /dev/ram6: Added to device cache
#device/dev-cache.c:330         /dev/block/1:6: Aliased to /dev/ram6 in d=
evice cache
#device/dev-cache.c:333         /dev/ram7: Added to device cache
#device/dev-cache.c:330         /dev/block/1:7: Aliased to /dev/ram7 in d=
evice cache
#device/dev-cache.c:333         /dev/ram8: Added to device cache
#device/dev-cache.c:330         /dev/block/1:8: Aliased to /dev/ram8 in d=
evice cache
#device/dev-cache.c:333         /dev/ram9: Added to device cache
#device/dev-cache.c:330         /dev/block/1:9: Aliased to /dev/ram9 in d=
evice cache
#device/dev-cache.c:333         /dev/dm-0: Added to device cache
#device/dev-cache.c:330         /dev/mapper/vg_lvm-lv_root: Aliased to /d=
ev/dm-0 in device cache (preferred name)
#device/dev-cache.c:330         /dev/vg_lvm/lv_root: Aliased to /dev/mapp=
er/vg_lvm-lv_root in device cache (preferred name)
#device/dev-cache.c:330         /dev/disk/by-id/dm-name-vg_lvm-lv_root: A=
liased to /dev/vg_lvm/lv_root in device cache
#device/dev-cache.c:330         /dev/disk/by-id/dm-uuid-LVM-WRtjp4poFSUNv=
HiEbk2UIimZ1ghoqnIKVIarD8MbjRPQsMHySK0EtKDTpbAeIobN: Aliased to /dev/vg_l=
vm/lv_root in device cache
#device/dev-cache.c:330         /dev/disk/by-uuid/b8cb5a51-1042-4dbc-9b06=
-e851b5ab58b4: Aliased to /dev/vg_lvm/lv_root in device cache
#device/dev-cache.c:330         /dev/block/253:0: Aliased to /dev/vg_lvm/=
lv_root in device cache
#device/dev-cache.c:330         /dev/root: Aliased to /dev/vg_lvm/lv_root=
 in device cache (preferred name)
#device/dev-cache.c:333         /dev/dm-1: Added to device cache
#device/dev-cache.c:330         /dev/mapper/vg_lvm-lv_swap: Aliased to /d=
ev/dm-1 in device cache (preferred name)
#device/dev-cache.c:330         /dev/vg_lvm/lv_swap: Aliased to /dev/mapp=
er/vg_lvm-lv_swap in device cache (preferred name)
#device/dev-cache.c:330         /dev/disk/by-id/dm-name-vg_lvm-lv_swap: A=
liased to /dev/vg_lvm/lv_swap in device cache
#device/dev-cache.c:330         /dev/disk/by-id/dm-uuid-LVM-WRtjp4poFSUNv=
HiEbk2UIimZ1ghoqnIKqiMX9iIIU3koMijYnUbkkSIaOqLQ7qa0: Aliased to /dev/vg_l=
vm/lv_swap in device cache
#device/dev-cache.c:330         /dev/disk/by-uuid/5c66a443-dcc6-4fa5-ac55=
-7284b6aa95e8: Aliased to /dev/vg_lvm/lv_swap in device cache
#device/dev-cache.c:330         /dev/block/253:1: Aliased to /dev/vg_lvm/=
lv_swap in device cache
#device/dev-cache.c:333         /dev/dm-10: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rmeta_4: Aliased t=
o /dev/dm-10 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:10: Aliased to /dev/mapper=
/test-raid6_rmeta_4 in device cache
#device/dev-cache.c:333         /dev/dm-11: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rimage_4: Aliased =
to /dev/dm-11 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:11: Aliased to /dev/mapper=
/test-raid6_rimage_4 in device cache
#device/dev-cache.c:333         /dev/dm-12: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6: Aliased to /dev/d=
m-12 in device cache (preferred name)
#device/dev-cache.c:330         /dev/test/raid6: Aliased to /dev/mapper/t=
est-raid6 in device cache (preferred name)
#device/dev-cache.c:330         /dev/disk/by-id/dm-name-test-raid6: Alias=
ed to /dev/test/raid6 in device cache
#device/dev-cache.c:330         /dev/disk/by-id/dm-uuid-LVM-hMUcwwpeBYXgx=
febyJeENvvhCxvlbjW1om4oFTxTzhgfhvQIsrIebizDlLIrIrce: Aliased to /dev/test=
/raid6 in device cache
#device/dev-cache.c:330         /dev/block/253:12: Aliased to /dev/test/r=
aid6 in device cache
#device/dev-cache.c:333         /dev/dm-2: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rmeta_0: Aliased t=
o /dev/dm-2 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:2: Aliased to /dev/mapper/=
test-raid6_rmeta_0 in device cache
#device/dev-cache.c:333         /dev/dm-3: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rimage_0: Aliased =
to /dev/dm-3 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:3: Aliased to /dev/mapper/=
test-raid6_rimage_0 in device cache
#device/dev-cache.c:333         /dev/dm-4: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rmeta_1: Aliased t=
o /dev/dm-4 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:4: Aliased to /dev/mapper/=
test-raid6_rmeta_1 in device cache
#device/dev-cache.c:333         /dev/dm-5: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rimage_1: Aliased =
to /dev/dm-5 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:5: Aliased to /dev/mapper/=
test-raid6_rimage_1 in device cache
#device/dev-cache.c:333         /dev/dm-6: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rmeta_2: Aliased t=
o /dev/dm-6 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:6: Aliased to /dev/mapper/=
test-raid6_rmeta_2 in device cache
#device/dev-cache.c:333         /dev/dm-7: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rimage_2: Aliased =
to /dev/dm-7 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:7: Aliased to /dev/mapper/=
test-raid6_rimage_2 in device cache
#device/dev-cache.c:333         /dev/dm-8: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rmeta_3: Aliased t=
o /dev/dm-8 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:8: Aliased to /dev/mapper/=
test-raid6_rmeta_3 in device cache
#device/dev-cache.c:333         /dev/dm-9: Added to device cache
#device/dev-cache.c:330         /dev/mapper/test-raid6_rimage_3: Aliased =
to /dev/dm-9 in device cache (preferred name)
#device/dev-cache.c:330         /dev/block/253:9: Aliased to /dev/mapper/=
test-raid6_rimage_3 in device cache
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram0
#filters/filter-composite.c:31         Using /dev/ram0
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#label/label.c:180       /dev/ram0: No label detected
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:524         Opened /dev/loop0 RO O_DIRECT
#device/dev-io.c:271       /dev/loop0: size is 0 sectors
#filters/filter.c:169         /dev/loop0: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop0
#device/dev-io.c:524         Opened /dev/sda RO O_DIRECT
#device/dev-io.c:271       /dev/sda: size is 16777216 sectors
#device/dev-io.c:137         /dev/sda: block size is 4096 bytes
#filters/filter.c:175         /dev/sda: Skipping: Partition table signatu=
re found
#device/dev-io.c:577         Closed /dev/sda
#filters/filter.c:152         /dev/cdrom: Skipping: Unrecognised LVM devi=
ce type 11
#ioctl/libdm-iface.c:1687         dm status   (253:0) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/root
#filters/filter-composite.c:31         Using /dev/root
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#label/label.c:180       /dev/root: No label detected
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram1
#filters/filter-composite.c:31         Using /dev/ram1
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#label/label.c:180       /dev/ram1: No label detected
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:524         Opened /dev/loop1 RO O_DIRECT
#device/dev-io.c:271       /dev/loop1: size is 0 sectors
#filters/filter.c:169         /dev/loop1: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:577         Closed /dev/sda1
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#device/dev-io.c:577         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#label/label.c:180       /dev/sda1: No label detected
#device/dev-io.c:577         Closed /dev/sda1
#ioctl/libdm-iface.c:1687         dm status   (253:1) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#filters/filter-composite.c:31         Using /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#label/label.c:180       /dev/vg_lvm/lv_swap: No label detected
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram2
#filters/filter-composite.c:31         Using /dev/ram2
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#label/label.c:180       /dev/ram2: No label detected
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:524         Opened /dev/loop2 RO O_DIRECT
#device/dev-io.c:271       /dev/loop2: size is 0 sectors
#filters/filter.c:169         /dev/loop2: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop2
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:577         Closed /dev/sda2
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:137         /dev/sda2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sda2
#filters/filter-composite.c:31         Using /dev/sda2
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:137         /dev/sda2: block size is 4096 bytes
#label/label.c:156       /dev/sda2: lvm2 label detected at sector 1
#cache/lvmcache.c:1337         lvmcache: /dev/sda2: now in VG #orphans_lv=
m2 (#orphans_lvm2) with 0 mdas
#format_text/format-text.c:1192         /dev/sda2: Found metadata at 7168=
 size 1366 (in area at 4096 size 1044480) for vg_lvm (WRtjp4-poFS-UNvH-iE=
bk-2UIi-mZ1g-hoqnIK)
#cache/lvmcache.c:1337         lvmcache: /dev/sda2: now in VG vg_lvm with=
 1 mdas
#cache/lvmcache.c:1114         lvmcache: /dev/sda2: setting vg_lvm VGID t=
o WRtjp4poFSUNvHiEbk2UIimZ1ghoqnIK
#cache/lvmcache.c:1374         lvmcache: /dev/sda2: VG vg_lvm: Set creati=
on host to lvm.localdomain.
#device/dev-io.c:577         Closed /dev/sda2
#ioctl/libdm-iface.c:1687         dm status   (253:2) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_0: Reser=
ved internal LV device test/raid6_rmeta_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_0: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram3
#filters/filter-composite.c:31         Using /dev/ram3
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#label/label.c:180       /dev/ram3: No label detected
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:524         Opened /dev/loop3 RO O_DIRECT
#device/dev-io.c:271       /dev/loop3: size is 0 sectors
#filters/filter.c:169         /dev/loop3: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop3
#ioctl/libdm-iface.c:1687         dm status   (253:3) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_0: Rese=
rved internal LV device test/raid6_rimage_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_0:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram4
#filters/filter-composite.c:31         Using /dev/ram4
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#label/label.c:180       /dev/ram4: No label detected
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:524         Opened /dev/loop4 RO O_DIRECT
#device/dev-io.c:271       /dev/loop4: size is 0 sectors
#filters/filter.c:169         /dev/loop4: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop4
#ioctl/libdm-iface.c:1687         dm status   (253:4) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_1: Reser=
ved internal LV device test/raid6_rmeta_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_1: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram5
#filters/filter-composite.c:31         Using /dev/ram5
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#label/label.c:180       /dev/ram5: No label detected
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:524         Opened /dev/loop5 RO O_DIRECT
#device/dev-io.c:271       /dev/loop5: size is 0 sectors
#filters/filter.c:169         /dev/loop5: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop5
#ioctl/libdm-iface.c:1687         dm status   (253:5) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_1: Rese=
rved internal LV device test/raid6_rimage_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_1:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram6
#filters/filter-composite.c:31         Using /dev/ram6
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#label/label.c:180       /dev/ram6: No label detected
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:524         Opened /dev/loop6 RO O_DIRECT
#device/dev-io.c:271       /dev/loop6: size is 0 sectors
#filters/filter.c:169         /dev/loop6: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop6
#ioctl/libdm-iface.c:1687         dm status   (253:6) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_2: Reser=
ved internal LV device test/raid6_rmeta_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_2: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram7
#filters/filter-composite.c:31         Using /dev/ram7
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#label/label.c:180       /dev/ram7: No label detected
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:524         Opened /dev/loop7 RO O_DIRECT
#device/dev-io.c:271       /dev/loop7: size is 0 sectors
#filters/filter.c:169         /dev/loop7: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop7
#ioctl/libdm-iface.c:1687         dm status   (253:7) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_2: Rese=
rved internal LV device test/raid6_rimage_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_2:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram8
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram8
#filters/filter-composite.c:31         Using /dev/ram8
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#label/label.c:180       /dev/ram8: No label detected
#device/dev-io.c:577         Closed /dev/ram8
#ioctl/libdm-iface.c:1687         dm status   (253:8) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_3: Reser=
ved internal LV device test/raid6_rmeta_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_3: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram9
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram9
#filters/filter-composite.c:31         Using /dev/ram9
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#label/label.c:180       /dev/ram9: No label detected
#device/dev-io.c:577         Closed /dev/ram9
#ioctl/libdm-iface.c:1687         dm status   (253:9) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_3: Rese=
rved internal LV device test/raid6_rimage_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_3:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram10
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram10
#filters/filter-composite.c:31         Using /dev/ram10
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#label/label.c:180       /dev/ram10: No label detected
#device/dev-io.c:577         Closed /dev/ram10
#ioctl/libdm-iface.c:1687         dm status   (253:10) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_4: Reser=
ved internal LV device test/raid6_rmeta_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_4: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram11
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram11
#filters/filter-composite.c:31         Using /dev/ram11
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#label/label.c:180       /dev/ram11: No label detected
#device/dev-io.c:577         Closed /dev/ram11
#ioctl/libdm-iface.c:1687         dm status   (253:11) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_4: Rese=
rved internal LV device test/raid6_rimage_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_4:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram12
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram12
#filters/filter-composite.c:31         Using /dev/ram12
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#label/label.c:180       /dev/ram12: No label detected
#device/dev-io.c:577         Closed /dev/ram12
#ioctl/libdm-iface.c:1687         dm status   (253:12) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/test/raid6
#filters/filter-composite.c:31         Using /dev/test/raid6
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#label/label.c:180       /dev/test/raid6: No label detected
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram13
#filters/filter-composite.c:31         Using /dev/ram13
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#label/label.c:180       /dev/ram13: No label detected
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram14
#filters/filter-composite.c:31         Using /dev/ram14
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#label/label.c:180       /dev/ram14: No label detected
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram15
#filters/filter-composite.c:31         Using /dev/ram15
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#label/label.c:180       /dev/ram15: No label detected
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:524         Opened /dev/sdc RO O_DIRECT
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#device/dev-io.c:137         /dev/sdc: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdc
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#device/dev-io.c:524         Opened /dev/sdc RO O_DIRECT
#device/dev-io.c:137         /dev/sdc: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdc
#filters/filter-composite.c:31         Using /dev/sdc
#device/dev-io.c:524         Opened /dev/sdc RO O_DIRECT
#device/dev-io.c:137         /dev/sdc: block size is 4096 bytes
#label/label.c:156       /dev/sdc: lvm2 label detected at sector 1
#cache/lvmcache.c:1337         lvmcache: /dev/sdc: now in VG #orphans_lvm=
2 (#orphans_lvm2) with 0 mdas
#format_text/format-text.c:1192         /dev/sdc: Found metadata at 49664=
 size 5056 (in area at 4096 size 1044480) for test (hMUcww-peBY-Xgxf-ebyJ=
-eENv-vhCx-vlbjW1)
#cache/lvmcache.c:1337         lvmcache: /dev/sdc: now in VG test with 1 =
mdas
#cache/lvmcache.c:1114         lvmcache: /dev/sdc: setting test VGID to h=
MUcwwpeBYXgxfebyJeENvvhCxvlbjW1
#cache/lvmcache.c:1374         lvmcache: /dev/sdc: VG test: Set creation =
host to lvm.localdomain.
#device/dev-io.c:524         Opened /dev/sdd RO O_DIRECT
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#device/dev-io.c:137         /dev/sdd: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdd
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#device/dev-io.c:524         Opened /dev/sdd RO O_DIRECT
#device/dev-io.c:137         /dev/sdd: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdd
#filters/filter-composite.c:31         Using /dev/sdd
#device/dev-io.c:524         Opened /dev/sdd RO O_DIRECT
#device/dev-io.c:137         /dev/sdd: block size is 4096 bytes
#label/label.c:156       /dev/sdd: lvm2 label detected at sector 1
#cache/lvmcache.c:1337         lvmcache: /dev/sdd: now in VG #orphans_lvm=
2 (#orphans_lvm2) with 0 mdas
#format_text/format-text.c:1192         /dev/sdd: Found metadata at 49664=
 size 5056 (in area at 4096 size 1044480) for test (hMUcww-peBY-Xgxf-ebyJ=
-eENv-vhCx-vlbjW1)
#cache/lvmcache.c:1337         lvmcache: /dev/sdd: now in VG test (hMUcww=
peBYXgxfebyJeENvvhCxvlbjW1) with 1 mdas
#device/dev-io.c:524         Opened /dev/sde RO O_DIRECT
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#device/dev-io.c:137         /dev/sde: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sde
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#device/dev-io.c:524         Opened /dev/sde RO O_DIRECT
#device/dev-io.c:137         /dev/sde: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sde
#filters/filter-composite.c:31         Using /dev/sde
#device/dev-io.c:524         Opened /dev/sde RO O_DIRECT
#device/dev-io.c:137         /dev/sde: block size is 4096 bytes
#label/label.c:156       /dev/sde: lvm2 label detected at sector 1
#cache/lvmcache.c:1337         lvmcache: /dev/sde: now in VG #orphans_lvm=
2 (#orphans_lvm2) with 0 mdas
#format_text/format-text.c:1192         /dev/sde: Found metadata at 49664=
 size 5056 (in area at 4096 size 1044480) for test (hMUcww-peBY-Xgxf-ebyJ=
-eENv-vhCx-vlbjW1)
#cache/lvmcache.c:1337         lvmcache: /dev/sde: now in VG test (hMUcww=
peBYXgxfebyJeENvvhCxvlbjW1) with 1 mdas
#device/dev-io.c:524         Opened /dev/sdf RO O_DIRECT
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#device/dev-io.c:137         /dev/sdf: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdf
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#device/dev-io.c:524         Opened /dev/sdf RO O_DIRECT
#device/dev-io.c:137         /dev/sdf: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdf
#filters/filter-composite.c:31         Using /dev/sdf
#device/dev-io.c:524         Opened /dev/sdf RO O_DIRECT
#device/dev-io.c:137         /dev/sdf: block size is 4096 bytes
#label/label.c:156       /dev/sdf: lvm2 label detected at sector 1
#cache/lvmcache.c:1337         lvmcache: /dev/sdf: now in VG #orphans_lvm=
2 (#orphans_lvm2) with 0 mdas
#format_text/format-text.c:1192         /dev/sdf: Found metadata at 49664=
 size 5056 (in area at 4096 size 1044480) for test (hMUcww-peBY-Xgxf-ebyJ=
-eENv-vhCx-vlbjW1)
#cache/lvmcache.c:1337         lvmcache: /dev/sdf: now in VG test (hMUcww=
peBYXgxfebyJeENvvhCxvlbjW1) with 1 mdas
#device/dev-io.c:480         /dev/sdg: open failed: No such device or add=
ress
#filters/filter.c:158         /dev/sdg: Skipping: open failed
#device/dev-io.c:524         Opened /dev/sdh RO O_DIRECT
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#device/dev-io.c:137         /dev/sdh: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdh
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#device/dev-io.c:524         Opened /dev/sdh RO O_DIRECT
#device/dev-io.c:137         /dev/sdh: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sdh
#filters/filter-composite.c:31         Using /dev/sdh
#device/dev-io.c:524         Opened /dev/sdh RO O_DIRECT
#device/dev-io.c:137         /dev/sdh: block size is 4096 bytes
#label/label.c:156       /dev/sdh: lvm2 label detected at sector 1
#cache/lvmcache.c:1337         lvmcache: /dev/sdh: now in VG #orphans_lvm=
2 (#orphans_lvm2) with 0 mdas
#format_text/format-text.c:1192         /dev/sdh: Found metadata at 49664=
 size 5056 (in area at 4096 size 1044480) for test (hMUcww-peBY-Xgxf-ebyJ=
-eENv-vhCx-vlbjW1)
#cache/lvmcache.c:1337         lvmcache: /dev/sdh: now in VG test (hMUcww=
peBYXgxfebyJeENvvhCxvlbjW1) with 1 mdas
#label/label.c:266         Using cached label for /dev/sdc
#label/label.c:266         Using cached label for /dev/sdd
#label/label.c:266         Using cached label for /dev/sde
#label/label.c:266         Using cached label for /dev/sdf
#label/label.c:266         Using cached label for /dev/sdh
#metadata/vg.c:59         Allocated VG test at 0x2d5ff90.
#label/label.c:266         Using cached label for /dev/sdh
#label/label.c:266         Using cached label for /dev/sdc
#label/label.c:266         Using cached label for /dev/sdd
#label/label.c:266         Using cached label for /dev/sde
#label/label.c:266         Using cached label for /dev/sdf
#libdm-config.c:789       Setting devices/ignore_suspended_devices to 0
#libdm-config.c:758       Setting devices/cache_dir to /etc/lvm/cache
#libdm-config.c:789       Setting devices/write_cache_state to 1
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram0
#filters/filter-composite.c:31         Using /dev/ram0
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#label/label.c:180       /dev/ram0: No label detected
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:524         Opened /dev/loop0 RO O_DIRECT
#device/dev-io.c:271       /dev/loop0: size is 0 sectors
#filters/filter.c:169         /dev/loop0: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop0
#device/dev-io.c:524         Opened /dev/sda RO O_DIRECT
#device/dev-io.c:271       /dev/sda: size is 16777216 sectors
#device/dev-io.c:137         /dev/sda: block size is 4096 bytes
#filters/filter.c:175         /dev/sda: Skipping: Partition table signatu=
re found
#device/dev-io.c:577         Closed /dev/sda
#filters/filter.c:152         /dev/cdrom: Skipping: Unrecognised LVM devi=
ce type 11
#ioctl/libdm-iface.c:1687         dm status   (253:0) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/root
#filters/filter-composite.c:31         Using /dev/root
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#label/label.c:180       /dev/root: No label detected
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram1
#filters/filter-composite.c:31         Using /dev/ram1
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#label/label.c:180       /dev/ram1: No label detected
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:524         Opened /dev/loop1 RO O_DIRECT
#device/dev-io.c:271       /dev/loop1: size is 0 sectors
#filters/filter.c:169         /dev/loop1: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:577         Closed /dev/sda1
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#device/dev-io.c:577         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#label/label.c:180       /dev/sda1: No label detected
#device/dev-io.c:577         Closed /dev/sda1
#ioctl/libdm-iface.c:1687         dm status   (253:1) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#filters/filter-composite.c:31         Using /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#label/label.c:180       /dev/vg_lvm/lv_swap: No label detected
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram2
#filters/filter-composite.c:31         Using /dev/ram2
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#label/label.c:180       /dev/ram2: No label detected
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:524         Opened /dev/loop2 RO O_DIRECT
#device/dev-io.c:271       /dev/loop2: size is 0 sectors
#filters/filter.c:169         /dev/loop2: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop2
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:577         Closed /dev/sda2
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:137         /dev/sda2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sda2
#filters/filter-composite.c:31         Using /dev/sda2
#label/label.c:266         Using cached label for /dev/sda2
#ioctl/libdm-iface.c:1687         dm status   (253:2) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_0: Reser=
ved internal LV device test/raid6_rmeta_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_0: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram3
#filters/filter-composite.c:31         Using /dev/ram3
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#label/label.c:180       /dev/ram3: No label detected
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:524         Opened /dev/loop3 RO O_DIRECT
#device/dev-io.c:271       /dev/loop3: size is 0 sectors
#filters/filter.c:169         /dev/loop3: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop3
#ioctl/libdm-iface.c:1687         dm status   (253:3) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_0: Rese=
rved internal LV device test/raid6_rimage_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_0:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram4
#filters/filter-composite.c:31         Using /dev/ram4
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#label/label.c:180       /dev/ram4: No label detected
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:524         Opened /dev/loop4 RO O_DIRECT
#device/dev-io.c:271       /dev/loop4: size is 0 sectors
#filters/filter.c:169         /dev/loop4: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop4
#ioctl/libdm-iface.c:1687         dm status   (253:4) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_1: Reser=
ved internal LV device test/raid6_rmeta_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_1: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram5
#filters/filter-composite.c:31         Using /dev/ram5
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#label/label.c:180       /dev/ram5: No label detected
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:524         Opened /dev/loop5 RO O_DIRECT
#device/dev-io.c:271       /dev/loop5: size is 0 sectors
#filters/filter.c:169         /dev/loop5: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop5
#ioctl/libdm-iface.c:1687         dm status   (253:5) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_1: Rese=
rved internal LV device test/raid6_rimage_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_1:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram6
#filters/filter-composite.c:31         Using /dev/ram6
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#label/label.c:180       /dev/ram6: No label detected
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:524         Opened /dev/loop6 RO O_DIRECT
#device/dev-io.c:271       /dev/loop6: size is 0 sectors
#filters/filter.c:169         /dev/loop6: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop6
#ioctl/libdm-iface.c:1687         dm status   (253:6) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_2: Reser=
ved internal LV device test/raid6_rmeta_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_2: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram7
#filters/filter-composite.c:31         Using /dev/ram7
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#label/label.c:180       /dev/ram7: No label detected
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:524         Opened /dev/loop7 RO O_DIRECT
#device/dev-io.c:271       /dev/loop7: size is 0 sectors
#filters/filter.c:169         /dev/loop7: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop7
#ioctl/libdm-iface.c:1687         dm status   (253:7) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_2: Rese=
rved internal LV device test/raid6_rimage_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_2:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram8
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram8
#filters/filter-composite.c:31         Using /dev/ram8
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#label/label.c:180       /dev/ram8: No label detected
#device/dev-io.c:577         Closed /dev/ram8
#ioctl/libdm-iface.c:1687         dm status   (253:8) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_3: Reser=
ved internal LV device test/raid6_rmeta_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_3: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram9
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram9
#filters/filter-composite.c:31         Using /dev/ram9
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#label/label.c:180       /dev/ram9: No label detected
#device/dev-io.c:577         Closed /dev/ram9
#ioctl/libdm-iface.c:1687         dm status   (253:9) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_3: Rese=
rved internal LV device test/raid6_rimage_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_3:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram10
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram10
#filters/filter-composite.c:31         Using /dev/ram10
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#label/label.c:180       /dev/ram10: No label detected
#device/dev-io.c:577         Closed /dev/ram10
#ioctl/libdm-iface.c:1687         dm status   (253:10) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_4: Reser=
ved internal LV device test/raid6_rmeta_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_4: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram11
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram11
#filters/filter-composite.c:31         Using /dev/ram11
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#label/label.c:180       /dev/ram11: No label detected
#device/dev-io.c:577         Closed /dev/ram11
#ioctl/libdm-iface.c:1687         dm status   (253:11) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_4: Rese=
rved internal LV device test/raid6_rimage_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_4:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram12
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram12
#filters/filter-composite.c:31         Using /dev/ram12
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#label/label.c:180       /dev/ram12: No label detected
#device/dev-io.c:577         Closed /dev/ram12
#ioctl/libdm-iface.c:1687         dm status   (253:12) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/test/raid6
#filters/filter-composite.c:31         Using /dev/test/raid6
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#label/label.c:180       /dev/test/raid6: No label detected
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram13
#filters/filter-composite.c:31         Using /dev/ram13
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#label/label.c:180       /dev/ram13: No label detected
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram14
#filters/filter-composite.c:31         Using /dev/ram14
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#label/label.c:180       /dev/ram14: No label detected
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram15
#filters/filter-composite.c:31         Using /dev/ram15
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#label/label.c:180       /dev/ram15: No label detected
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdc
#label/label.c:266         Using cached label for /dev/sdc
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdd
#label/label.c:266         Using cached label for /dev/sdd
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sde
#label/label.c:266         Using cached label for /dev/sde
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdf
#label/label.c:266         Using cached label for /dev/sdf
#device/dev-io.c:480         /dev/sdg: open failed: No such device or add=
ress
#filters/filter.c:158         /dev/sdg: Skipping: open failed
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdh
#label/label.c:266         Using cached label for /dev/sdh
#format_text/import_vsn1.c:205   Couldn't find device with uuid Bf4qAN-Kz=
nA-qunU-2Xj4-y33X-QK7U-4TG24l.
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rmeta_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_0
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rimage_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_0=

#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rmeta_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_1
#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rimage_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_1=

#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rmeta_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_2
#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rimage_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_2=

#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rmeta_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_3
#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rimage_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_3=

#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rmeta_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_4
#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rimage_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_4=

#format_text/format-text.c:524         Read test metadata (10) from /dev/=
sdc at 49664 size 5056
#metadata/vg.c:59         Allocated VG test at 0x2d5b420.
#label/label.c:266         Using cached label for /dev/sdh
#label/label.c:266         Using cached label for /dev/sdc
#label/label.c:266         Using cached label for /dev/sdd
#label/label.c:266         Using cached label for /dev/sde
#label/label.c:266         Using cached label for /dev/sdf
#libdm-config.c:789       Setting devices/ignore_suspended_devices to 0
#libdm-config.c:758       Setting devices/cache_dir to /etc/lvm/cache
#libdm-config.c:789       Setting devices/write_cache_state to 1
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram0
#filters/filter-composite.c:31         Using /dev/ram0
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#label/label.c:180       /dev/ram0: No label detected
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:524         Opened /dev/loop0 RO O_DIRECT
#device/dev-io.c:271       /dev/loop0: size is 0 sectors
#filters/filter.c:169         /dev/loop0: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop0
#device/dev-io.c:524         Opened /dev/sda RO O_DIRECT
#device/dev-io.c:271       /dev/sda: size is 16777216 sectors
#device/dev-io.c:137         /dev/sda: block size is 4096 bytes
#filters/filter.c:175         /dev/sda: Skipping: Partition table signatu=
re found
#device/dev-io.c:577         Closed /dev/sda
#filters/filter.c:152         /dev/cdrom: Skipping: Unrecognised LVM devi=
ce type 11
#ioctl/libdm-iface.c:1687         dm status   (253:0) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/root
#filters/filter-composite.c:31         Using /dev/root
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#label/label.c:180       /dev/root: No label detected
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram1
#filters/filter-composite.c:31         Using /dev/ram1
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#label/label.c:180       /dev/ram1: No label detected
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:524         Opened /dev/loop1 RO O_DIRECT
#device/dev-io.c:271       /dev/loop1: size is 0 sectors
#filters/filter.c:169         /dev/loop1: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:577         Closed /dev/sda1
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#device/dev-io.c:577         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#label/label.c:180       /dev/sda1: No label detected
#device/dev-io.c:577         Closed /dev/sda1
#ioctl/libdm-iface.c:1687         dm status   (253:1) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#filters/filter-composite.c:31         Using /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#label/label.c:180       /dev/vg_lvm/lv_swap: No label detected
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram2
#filters/filter-composite.c:31         Using /dev/ram2
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#label/label.c:180       /dev/ram2: No label detected
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:524         Opened /dev/loop2 RO O_DIRECT
#device/dev-io.c:271       /dev/loop2: size is 0 sectors
#filters/filter.c:169         /dev/loop2: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop2
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:577         Closed /dev/sda2
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:137         /dev/sda2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sda2
#filters/filter-composite.c:31         Using /dev/sda2
#label/label.c:266         Using cached label for /dev/sda2
#ioctl/libdm-iface.c:1687         dm status   (253:2) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_0: Reser=
ved internal LV device test/raid6_rmeta_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_0: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram3
#filters/filter-composite.c:31         Using /dev/ram3
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#label/label.c:180       /dev/ram3: No label detected
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:524         Opened /dev/loop3 RO O_DIRECT
#device/dev-io.c:271       /dev/loop3: size is 0 sectors
#filters/filter.c:169         /dev/loop3: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop3
#ioctl/libdm-iface.c:1687         dm status   (253:3) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_0: Rese=
rved internal LV device test/raid6_rimage_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_0:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram4
#filters/filter-composite.c:31         Using /dev/ram4
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#label/label.c:180       /dev/ram4: No label detected
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:524         Opened /dev/loop4 RO O_DIRECT
#device/dev-io.c:271       /dev/loop4: size is 0 sectors
#filters/filter.c:169         /dev/loop4: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop4
#ioctl/libdm-iface.c:1687         dm status   (253:4) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_1: Reser=
ved internal LV device test/raid6_rmeta_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_1: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram5
#filters/filter-composite.c:31         Using /dev/ram5
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#label/label.c:180       /dev/ram5: No label detected
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:524         Opened /dev/loop5 RO O_DIRECT
#device/dev-io.c:271       /dev/loop5: size is 0 sectors
#filters/filter.c:169         /dev/loop5: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop5
#ioctl/libdm-iface.c:1687         dm status   (253:5) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_1: Rese=
rved internal LV device test/raid6_rimage_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_1:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram6
#filters/filter-composite.c:31         Using /dev/ram6
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#label/label.c:180       /dev/ram6: No label detected
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:524         Opened /dev/loop6 RO O_DIRECT
#device/dev-io.c:271       /dev/loop6: size is 0 sectors
#filters/filter.c:169         /dev/loop6: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop6
#ioctl/libdm-iface.c:1687         dm status   (253:6) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_2: Reser=
ved internal LV device test/raid6_rmeta_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_2: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram7
#filters/filter-composite.c:31         Using /dev/ram7
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#label/label.c:180       /dev/ram7: No label detected
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:524         Opened /dev/loop7 RO O_DIRECT
#device/dev-io.c:271       /dev/loop7: size is 0 sectors
#filters/filter.c:169         /dev/loop7: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop7
#ioctl/libdm-iface.c:1687         dm status   (253:7) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_2: Rese=
rved internal LV device test/raid6_rimage_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_2:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram8
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram8
#filters/filter-composite.c:31         Using /dev/ram8
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#label/label.c:180       /dev/ram8: No label detected
#device/dev-io.c:577         Closed /dev/ram8
#ioctl/libdm-iface.c:1687         dm status   (253:8) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_3: Reser=
ved internal LV device test/raid6_rmeta_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_3: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram9
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram9
#filters/filter-composite.c:31         Using /dev/ram9
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#label/label.c:180       /dev/ram9: No label detected
#device/dev-io.c:577         Closed /dev/ram9
#ioctl/libdm-iface.c:1687         dm status   (253:9) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_3: Rese=
rved internal LV device test/raid6_rimage_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_3:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram10
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram10
#filters/filter-composite.c:31         Using /dev/ram10
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#label/label.c:180       /dev/ram10: No label detected
#device/dev-io.c:577         Closed /dev/ram10
#ioctl/libdm-iface.c:1687         dm status   (253:10) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_4: Reser=
ved internal LV device test/raid6_rmeta_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_4: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram11
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram11
#filters/filter-composite.c:31         Using /dev/ram11
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#label/label.c:180       /dev/ram11: No label detected
#device/dev-io.c:577         Closed /dev/ram11
#ioctl/libdm-iface.c:1687         dm status   (253:11) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_4: Rese=
rved internal LV device test/raid6_rimage_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_4:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram12
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram12
#filters/filter-composite.c:31         Using /dev/ram12
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#label/label.c:180       /dev/ram12: No label detected
#device/dev-io.c:577         Closed /dev/ram12
#ioctl/libdm-iface.c:1687         dm status   (253:12) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/test/raid6
#filters/filter-composite.c:31         Using /dev/test/raid6
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#label/label.c:180       /dev/test/raid6: No label detected
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram13
#filters/filter-composite.c:31         Using /dev/ram13
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#label/label.c:180       /dev/ram13: No label detected
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram14
#filters/filter-composite.c:31         Using /dev/ram14
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#label/label.c:180       /dev/ram14: No label detected
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram15
#filters/filter-composite.c:31         Using /dev/ram15
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#label/label.c:180       /dev/ram15: No label detected
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdc
#label/label.c:266         Using cached label for /dev/sdc
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdd
#label/label.c:266         Using cached label for /dev/sdd
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sde
#label/label.c:266         Using cached label for /dev/sde
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdf
#label/label.c:266         Using cached label for /dev/sdf
#device/dev-io.c:480         /dev/sdg: open failed: No such device or add=
ress
#filters/filter.c:158         /dev/sdg: Skipping: open failed
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdh
#label/label.c:266         Using cached label for /dev/sdh
#format_text/import_vsn1.c:205     Couldn't find device with uuid Bf4qAN-=
KznA-qunU-2Xj4-y33X-QK7U-4TG24l.
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rmeta_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_0
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rimage_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_0=

#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rmeta_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_1
#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rimage_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_1=

#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rmeta_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_2
#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rimage_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_2=

#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rmeta_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_3
#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rimage_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_3=

#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rmeta_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_4
#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rimage_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_4=

#format_text/format-text.c:524         Read test metadata (10) from /dev/=
sdd at 49664 size 5056
#metadata/vg.c:74         Freeing VG test at 0x2d5b420.
#metadata/vg.c:59         Allocated VG test at 0x2d56ba0.
#label/label.c:266         Using cached label for /dev/sdh
#label/label.c:266         Using cached label for /dev/sdc
#label/label.c:266         Using cached label for /dev/sdd
#label/label.c:266         Using cached label for /dev/sde
#label/label.c:266         Using cached label for /dev/sdf
#libdm-config.c:789       Setting devices/ignore_suspended_devices to 0
#libdm-config.c:758       Setting devices/cache_dir to /etc/lvm/cache
#libdm-config.c:789       Setting devices/write_cache_state to 1
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram0
#filters/filter-composite.c:31         Using /dev/ram0
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#label/label.c:180       /dev/ram0: No label detected
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:524         Opened /dev/loop0 RO O_DIRECT
#device/dev-io.c:271       /dev/loop0: size is 0 sectors
#filters/filter.c:169         /dev/loop0: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop0
#device/dev-io.c:524         Opened /dev/sda RO O_DIRECT
#device/dev-io.c:271       /dev/sda: size is 16777216 sectors
#device/dev-io.c:137         /dev/sda: block size is 4096 bytes
#filters/filter.c:175         /dev/sda: Skipping: Partition table signatu=
re found
#device/dev-io.c:577         Closed /dev/sda
#filters/filter.c:152         /dev/cdrom: Skipping: Unrecognised LVM devi=
ce type 11
#ioctl/libdm-iface.c:1687         dm status   (253:0) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/root
#filters/filter-composite.c:31         Using /dev/root
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#label/label.c:180       /dev/root: No label detected
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram1
#filters/filter-composite.c:31         Using /dev/ram1
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#label/label.c:180       /dev/ram1: No label detected
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:524         Opened /dev/loop1 RO O_DIRECT
#device/dev-io.c:271       /dev/loop1: size is 0 sectors
#filters/filter.c:169         /dev/loop1: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:577         Closed /dev/sda1
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#device/dev-io.c:577         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#label/label.c:180       /dev/sda1: No label detected
#device/dev-io.c:577         Closed /dev/sda1
#ioctl/libdm-iface.c:1687         dm status   (253:1) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#filters/filter-composite.c:31         Using /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#label/label.c:180       /dev/vg_lvm/lv_swap: No label detected
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram2
#filters/filter-composite.c:31         Using /dev/ram2
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#label/label.c:180       /dev/ram2: No label detected
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:524         Opened /dev/loop2 RO O_DIRECT
#device/dev-io.c:271       /dev/loop2: size is 0 sectors
#filters/filter.c:169         /dev/loop2: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop2
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:577         Closed /dev/sda2
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:137         /dev/sda2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sda2
#filters/filter-composite.c:31         Using /dev/sda2
#label/label.c:266         Using cached label for /dev/sda2
#ioctl/libdm-iface.c:1687         dm status   (253:2) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_0: Reser=
ved internal LV device test/raid6_rmeta_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_0: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram3
#filters/filter-composite.c:31         Using /dev/ram3
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#label/label.c:180       /dev/ram3: No label detected
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:524         Opened /dev/loop3 RO O_DIRECT
#device/dev-io.c:271       /dev/loop3: size is 0 sectors
#filters/filter.c:169         /dev/loop3: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop3
#ioctl/libdm-iface.c:1687         dm status   (253:3) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_0: Rese=
rved internal LV device test/raid6_rimage_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_0:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram4
#filters/filter-composite.c:31         Using /dev/ram4
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#label/label.c:180       /dev/ram4: No label detected
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:524         Opened /dev/loop4 RO O_DIRECT
#device/dev-io.c:271       /dev/loop4: size is 0 sectors
#filters/filter.c:169         /dev/loop4: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop4
#ioctl/libdm-iface.c:1687         dm status   (253:4) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_1: Reser=
ved internal LV device test/raid6_rmeta_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_1: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram5
#filters/filter-composite.c:31         Using /dev/ram5
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#label/label.c:180       /dev/ram5: No label detected
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:524         Opened /dev/loop5 RO O_DIRECT
#device/dev-io.c:271       /dev/loop5: size is 0 sectors
#filters/filter.c:169         /dev/loop5: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop5
#ioctl/libdm-iface.c:1687         dm status   (253:5) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_1: Rese=
rved internal LV device test/raid6_rimage_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_1:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram6
#filters/filter-composite.c:31         Using /dev/ram6
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#label/label.c:180       /dev/ram6: No label detected
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:524         Opened /dev/loop6 RO O_DIRECT
#device/dev-io.c:271       /dev/loop6: size is 0 sectors
#filters/filter.c:169         /dev/loop6: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop6
#ioctl/libdm-iface.c:1687         dm status   (253:6) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_2: Reser=
ved internal LV device test/raid6_rmeta_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_2: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram7
#filters/filter-composite.c:31         Using /dev/ram7
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#label/label.c:180       /dev/ram7: No label detected
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:524         Opened /dev/loop7 RO O_DIRECT
#device/dev-io.c:271       /dev/loop7: size is 0 sectors
#filters/filter.c:169         /dev/loop7: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop7
#ioctl/libdm-iface.c:1687         dm status   (253:7) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_2: Rese=
rved internal LV device test/raid6_rimage_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_2:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram8
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram8
#filters/filter-composite.c:31         Using /dev/ram8
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#label/label.c:180       /dev/ram8: No label detected
#device/dev-io.c:577         Closed /dev/ram8
#ioctl/libdm-iface.c:1687         dm status   (253:8) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_3: Reser=
ved internal LV device test/raid6_rmeta_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_3: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram9
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram9
#filters/filter-composite.c:31         Using /dev/ram9
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#label/label.c:180       /dev/ram9: No label detected
#device/dev-io.c:577         Closed /dev/ram9
#ioctl/libdm-iface.c:1687         dm status   (253:9) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_3: Rese=
rved internal LV device test/raid6_rimage_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_3:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram10
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram10
#filters/filter-composite.c:31         Using /dev/ram10
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#label/label.c:180       /dev/ram10: No label detected
#device/dev-io.c:577         Closed /dev/ram10
#ioctl/libdm-iface.c:1687         dm status   (253:10) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_4: Reser=
ved internal LV device test/raid6_rmeta_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_4: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram11
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram11
#filters/filter-composite.c:31         Using /dev/ram11
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#label/label.c:180       /dev/ram11: No label detected
#device/dev-io.c:577         Closed /dev/ram11
#ioctl/libdm-iface.c:1687         dm status   (253:11) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_4: Rese=
rved internal LV device test/raid6_rimage_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_4:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram12
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram12
#filters/filter-composite.c:31         Using /dev/ram12
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#label/label.c:180       /dev/ram12: No label detected
#device/dev-io.c:577         Closed /dev/ram12
#ioctl/libdm-iface.c:1687         dm status   (253:12) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/test/raid6
#filters/filter-composite.c:31         Using /dev/test/raid6
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#label/label.c:180       /dev/test/raid6: No label detected
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram13
#filters/filter-composite.c:31         Using /dev/ram13
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#label/label.c:180       /dev/ram13: No label detected
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram14
#filters/filter-composite.c:31         Using /dev/ram14
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#label/label.c:180       /dev/ram14: No label detected
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram15
#filters/filter-composite.c:31         Using /dev/ram15
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#label/label.c:180       /dev/ram15: No label detected
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdc
#label/label.c:266         Using cached label for /dev/sdc
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdd
#label/label.c:266         Using cached label for /dev/sdd
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sde
#label/label.c:266         Using cached label for /dev/sde
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdf
#label/label.c:266         Using cached label for /dev/sdf
#device/dev-io.c:480         /dev/sdg: open failed: No such device or add=
ress
#filters/filter.c:158         /dev/sdg: Skipping: open failed
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdh
#label/label.c:266         Using cached label for /dev/sdh
#format_text/import_vsn1.c:205     Couldn't find device with uuid Bf4qAN-=
KznA-qunU-2Xj4-y33X-QK7U-4TG24l.
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rmeta_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_0
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rimage_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_0=

#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rmeta_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_1
#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rimage_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_1=

#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rmeta_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_2
#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rimage_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_2=

#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rmeta_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_3
#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rimage_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_3=

#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rmeta_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_4
#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rimage_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_4=

#format_text/format-text.c:524         Read test metadata (10) from /dev/=
sde at 49664 size 5056
#metadata/vg.c:74         Freeing VG test at 0x2d56ba0.
#metadata/vg.c:59         Allocated VG test at 0x2d56ba0.
#label/label.c:266         Using cached label for /dev/sdh
#label/label.c:266         Using cached label for /dev/sdc
#label/label.c:266         Using cached label for /dev/sdd
#label/label.c:266         Using cached label for /dev/sde
#label/label.c:266         Using cached label for /dev/sdf
#libdm-config.c:789       Setting devices/ignore_suspended_devices to 0
#libdm-config.c:758       Setting devices/cache_dir to /etc/lvm/cache
#libdm-config.c:789       Setting devices/write_cache_state to 1
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram0
#filters/filter-composite.c:31         Using /dev/ram0
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#label/label.c:180       /dev/ram0: No label detected
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:524         Opened /dev/loop0 RO O_DIRECT
#device/dev-io.c:271       /dev/loop0: size is 0 sectors
#filters/filter.c:169         /dev/loop0: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop0
#device/dev-io.c:524         Opened /dev/sda RO O_DIRECT
#device/dev-io.c:271       /dev/sda: size is 16777216 sectors
#device/dev-io.c:137         /dev/sda: block size is 4096 bytes
#filters/filter.c:175         /dev/sda: Skipping: Partition table signatu=
re found
#device/dev-io.c:577         Closed /dev/sda
#filters/filter.c:152         /dev/cdrom: Skipping: Unrecognised LVM devi=
ce type 11
#ioctl/libdm-iface.c:1687         dm status   (253:0) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/root
#filters/filter-composite.c:31         Using /dev/root
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#label/label.c:180       /dev/root: No label detected
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram1
#filters/filter-composite.c:31         Using /dev/ram1
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#label/label.c:180       /dev/ram1: No label detected
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:524         Opened /dev/loop1 RO O_DIRECT
#device/dev-io.c:271       /dev/loop1: size is 0 sectors
#filters/filter.c:169         /dev/loop1: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:577         Closed /dev/sda1
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#device/dev-io.c:577         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#label/label.c:180       /dev/sda1: No label detected
#device/dev-io.c:577         Closed /dev/sda1
#ioctl/libdm-iface.c:1687         dm status   (253:1) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#filters/filter-composite.c:31         Using /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#label/label.c:180       /dev/vg_lvm/lv_swap: No label detected
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram2
#filters/filter-composite.c:31         Using /dev/ram2
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#label/label.c:180       /dev/ram2: No label detected
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:524         Opened /dev/loop2 RO O_DIRECT
#device/dev-io.c:271       /dev/loop2: size is 0 sectors
#filters/filter.c:169         /dev/loop2: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop2
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:577         Closed /dev/sda2
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:137         /dev/sda2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sda2
#filters/filter-composite.c:31         Using /dev/sda2
#label/label.c:266         Using cached label for /dev/sda2
#ioctl/libdm-iface.c:1687         dm status   (253:2) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_0: Reser=
ved internal LV device test/raid6_rmeta_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_0: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram3
#filters/filter-composite.c:31         Using /dev/ram3
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#label/label.c:180       /dev/ram3: No label detected
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:524         Opened /dev/loop3 RO O_DIRECT
#device/dev-io.c:271       /dev/loop3: size is 0 sectors
#filters/filter.c:169         /dev/loop3: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop3
#ioctl/libdm-iface.c:1687         dm status   (253:3) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_0: Rese=
rved internal LV device test/raid6_rimage_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_0:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram4
#filters/filter-composite.c:31         Using /dev/ram4
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#label/label.c:180       /dev/ram4: No label detected
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:524         Opened /dev/loop4 RO O_DIRECT
#device/dev-io.c:271       /dev/loop4: size is 0 sectors
#filters/filter.c:169         /dev/loop4: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop4
#ioctl/libdm-iface.c:1687         dm status   (253:4) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_1: Reser=
ved internal LV device test/raid6_rmeta_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_1: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram5
#filters/filter-composite.c:31         Using /dev/ram5
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#label/label.c:180       /dev/ram5: No label detected
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:524         Opened /dev/loop5 RO O_DIRECT
#device/dev-io.c:271       /dev/loop5: size is 0 sectors
#filters/filter.c:169         /dev/loop5: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop5
#ioctl/libdm-iface.c:1687         dm status   (253:5) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_1: Rese=
rved internal LV device test/raid6_rimage_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_1:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram6
#filters/filter-composite.c:31         Using /dev/ram6
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#label/label.c:180       /dev/ram6: No label detected
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:524         Opened /dev/loop6 RO O_DIRECT
#device/dev-io.c:271       /dev/loop6: size is 0 sectors
#filters/filter.c:169         /dev/loop6: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop6
#ioctl/libdm-iface.c:1687         dm status   (253:6) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_2: Reser=
ved internal LV device test/raid6_rmeta_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_2: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram7
#filters/filter-composite.c:31         Using /dev/ram7
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#label/label.c:180       /dev/ram7: No label detected
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:524         Opened /dev/loop7 RO O_DIRECT
#device/dev-io.c:271       /dev/loop7: size is 0 sectors
#filters/filter.c:169         /dev/loop7: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop7
#ioctl/libdm-iface.c:1687         dm status   (253:7) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_2: Rese=
rved internal LV device test/raid6_rimage_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_2:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram8
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram8
#filters/filter-composite.c:31         Using /dev/ram8
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#label/label.c:180       /dev/ram8: No label detected
#device/dev-io.c:577         Closed /dev/ram8
#ioctl/libdm-iface.c:1687         dm status   (253:8) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_3: Reser=
ved internal LV device test/raid6_rmeta_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_3: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram9
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram9
#filters/filter-composite.c:31         Using /dev/ram9
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#label/label.c:180       /dev/ram9: No label detected
#device/dev-io.c:577         Closed /dev/ram9
#ioctl/libdm-iface.c:1687         dm status   (253:9) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_3: Rese=
rved internal LV device test/raid6_rimage_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_3:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram10
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram10
#filters/filter-composite.c:31         Using /dev/ram10
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#label/label.c:180       /dev/ram10: No label detected
#device/dev-io.c:577         Closed /dev/ram10
#ioctl/libdm-iface.c:1687         dm status   (253:10) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_4: Reser=
ved internal LV device test/raid6_rmeta_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_4: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram11
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram11
#filters/filter-composite.c:31         Using /dev/ram11
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#label/label.c:180       /dev/ram11: No label detected
#device/dev-io.c:577         Closed /dev/ram11
#ioctl/libdm-iface.c:1687         dm status   (253:11) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_4: Rese=
rved internal LV device test/raid6_rimage_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_4:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram12
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram12
#filters/filter-composite.c:31         Using /dev/ram12
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#label/label.c:180       /dev/ram12: No label detected
#device/dev-io.c:577         Closed /dev/ram12
#ioctl/libdm-iface.c:1687         dm status   (253:12) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/test/raid6
#filters/filter-composite.c:31         Using /dev/test/raid6
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#label/label.c:180       /dev/test/raid6: No label detected
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram13
#filters/filter-composite.c:31         Using /dev/ram13
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#label/label.c:180       /dev/ram13: No label detected
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram14
#filters/filter-composite.c:31         Using /dev/ram14
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#label/label.c:180       /dev/ram14: No label detected
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram15
#filters/filter-composite.c:31         Using /dev/ram15
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#label/label.c:180       /dev/ram15: No label detected
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdc
#label/label.c:266         Using cached label for /dev/sdc
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdd
#label/label.c:266         Using cached label for /dev/sdd
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sde
#label/label.c:266         Using cached label for /dev/sde
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdf
#label/label.c:266         Using cached label for /dev/sdf
#device/dev-io.c:480         /dev/sdg: open failed: No such device or add=
ress
#filters/filter.c:158         /dev/sdg: Skipping: open failed
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdh
#label/label.c:266         Using cached label for /dev/sdh
#format_text/import_vsn1.c:205     Couldn't find device with uuid Bf4qAN-=
KznA-qunU-2Xj4-y33X-QK7U-4TG24l.
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rmeta_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_0
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rimage_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_0=

#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rmeta_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_1
#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rimage_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_1=

#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rmeta_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_2
#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rimage_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_2=

#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rmeta_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_3
#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rimage_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_3=

#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rmeta_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_4
#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rimage_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_4=

#format_text/format-text.c:524         Read test metadata (10) from /dev/=
sdf at 49664 size 5056
#metadata/vg.c:74         Freeing VG test at 0x2d56ba0.
#metadata/vg.c:59         Allocated VG test at 0x2d56ba0.
#label/label.c:266         Using cached label for /dev/sdh
#label/label.c:266         Using cached label for /dev/sdc
#label/label.c:266         Using cached label for /dev/sdd
#label/label.c:266         Using cached label for /dev/sde
#label/label.c:266         Using cached label for /dev/sdf
#libdm-config.c:789       Setting devices/ignore_suspended_devices to 0
#libdm-config.c:758       Setting devices/cache_dir to /etc/lvm/cache
#libdm-config.c:789       Setting devices/write_cache_state to 1
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:271       /dev/ram0: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram0
#filters/filter-composite.c:31         Using /dev/ram0
#device/dev-io.c:524         Opened /dev/ram0 RO O_DIRECT
#device/dev-io.c:137         /dev/ram0: block size is 4096 bytes
#label/label.c:180       /dev/ram0: No label detected
#device/dev-io.c:577         Closed /dev/ram0
#device/dev-io.c:524         Opened /dev/loop0 RO O_DIRECT
#device/dev-io.c:271       /dev/loop0: size is 0 sectors
#filters/filter.c:169         /dev/loop0: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop0
#device/dev-io.c:524         Opened /dev/sda RO O_DIRECT
#device/dev-io.c:271       /dev/sda: size is 16777216 sectors
#device/dev-io.c:137         /dev/sda: block size is 4096 bytes
#filters/filter.c:175         /dev/sda: Skipping: Partition table signatu=
re found
#device/dev-io.c:577         Closed /dev/sda
#filters/filter.c:152         /dev/cdrom: Skipping: Unrecognised LVM devi=
ce type 11
#ioctl/libdm-iface.c:1687         dm status   (253:0) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:271       /dev/root: size is 7487488 sectors
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/root
#filters/filter-composite.c:31         Using /dev/root
#device/dev-io.c:524         Opened /dev/root RO O_DIRECT
#device/dev-io.c:137         /dev/root: block size is 4096 bytes
#label/label.c:180       /dev/root: No label detected
#device/dev-io.c:577         Closed /dev/root
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:271       /dev/ram1: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram1
#filters/filter-composite.c:31         Using /dev/ram1
#device/dev-io.c:524         Opened /dev/ram1 RO O_DIRECT
#device/dev-io.c:137         /dev/ram1: block size is 4096 bytes
#label/label.c:180       /dev/ram1: No label detected
#device/dev-io.c:577         Closed /dev/ram1
#device/dev-io.c:524         Opened /dev/loop1 RO O_DIRECT
#device/dev-io.c:271       /dev/loop1: size is 0 sectors
#filters/filter.c:169         /dev/loop1: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:577         Closed /dev/sda1
#device/dev-io.c:271       /dev/sda1: size is 1024000 sectors
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#device/dev-io.c:577         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:524         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:137         /dev/sda1: block size is 1024 bytes
#label/label.c:180       /dev/sda1: No label detected
#device/dev-io.c:577         Closed /dev/sda1
#ioctl/libdm-iface.c:1687         dm status   (253:1) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:271       /dev/vg_lvm/lv_swap: size is 8257536 sectors
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#filters/filter-composite.c:31         Using /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/vg_lvm/lv_swap RO O_DIRECT
#device/dev-io.c:137         /dev/vg_lvm/lv_swap: block size is 4096 byte=
s
#label/label.c:180       /dev/vg_lvm/lv_swap: No label detected
#device/dev-io.c:577         Closed /dev/vg_lvm/lv_swap
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:271       /dev/ram2: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram2
#filters/filter-composite.c:31         Using /dev/ram2
#device/dev-io.c:524         Opened /dev/ram2 RO O_DIRECT
#device/dev-io.c:137         /dev/ram2: block size is 4096 bytes
#label/label.c:180       /dev/ram2: No label detected
#device/dev-io.c:577         Closed /dev/ram2
#device/dev-io.c:524         Opened /dev/loop2 RO O_DIRECT
#device/dev-io.c:271       /dev/loop2: size is 0 sectors
#filters/filter.c:169         /dev/loop2: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop2
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:577         Closed /dev/sda2
#device/dev-io.c:271       /dev/sda2: size is 15751168 sectors
#device/dev-io.c:524         Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:137         /dev/sda2: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/sda2
#filters/filter-composite.c:31         Using /dev/sda2
#label/label.c:266         Using cached label for /dev/sda2
#ioctl/libdm-iface.c:1687         dm status   (253:2) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_0: Reser=
ved internal LV device test/raid6_rmeta_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_0: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:271       /dev/ram3: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram3
#filters/filter-composite.c:31         Using /dev/ram3
#device/dev-io.c:524         Opened /dev/ram3 RO O_DIRECT
#device/dev-io.c:137         /dev/ram3: block size is 4096 bytes
#label/label.c:180       /dev/ram3: No label detected
#device/dev-io.c:577         Closed /dev/ram3
#device/dev-io.c:524         Opened /dev/loop3 RO O_DIRECT
#device/dev-io.c:271       /dev/loop3: size is 0 sectors
#filters/filter.c:169         /dev/loop3: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop3
#ioctl/libdm-iface.c:1687         dm status   (253:3) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_0: Rese=
rved internal LV device test/raid6_rimage_0 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_0:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:271       /dev/ram4: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram4
#filters/filter-composite.c:31         Using /dev/ram4
#device/dev-io.c:524         Opened /dev/ram4 RO O_DIRECT
#device/dev-io.c:137         /dev/ram4: block size is 4096 bytes
#label/label.c:180       /dev/ram4: No label detected
#device/dev-io.c:577         Closed /dev/ram4
#device/dev-io.c:524         Opened /dev/loop4 RO O_DIRECT
#device/dev-io.c:271       /dev/loop4: size is 0 sectors
#filters/filter.c:169         /dev/loop4: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop4
#ioctl/libdm-iface.c:1687         dm status   (253:4) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_1: Reser=
ved internal LV device test/raid6_rmeta_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_1: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:271       /dev/ram5: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram5
#filters/filter-composite.c:31         Using /dev/ram5
#device/dev-io.c:524         Opened /dev/ram5 RO O_DIRECT
#device/dev-io.c:137         /dev/ram5: block size is 4096 bytes
#label/label.c:180       /dev/ram5: No label detected
#device/dev-io.c:577         Closed /dev/ram5
#device/dev-io.c:524         Opened /dev/loop5 RO O_DIRECT
#device/dev-io.c:271       /dev/loop5: size is 0 sectors
#filters/filter.c:169         /dev/loop5: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop5
#ioctl/libdm-iface.c:1687         dm status   (253:5) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_1: Rese=
rved internal LV device test/raid6_rimage_1 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_1:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:271       /dev/ram6: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram6
#filters/filter-composite.c:31         Using /dev/ram6
#device/dev-io.c:524         Opened /dev/ram6 RO O_DIRECT
#device/dev-io.c:137         /dev/ram6: block size is 4096 bytes
#label/label.c:180       /dev/ram6: No label detected
#device/dev-io.c:577         Closed /dev/ram6
#device/dev-io.c:524         Opened /dev/loop6 RO O_DIRECT
#device/dev-io.c:271       /dev/loop6: size is 0 sectors
#filters/filter.c:169         /dev/loop6: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop6
#ioctl/libdm-iface.c:1687         dm status   (253:6) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_2: Reser=
ved internal LV device test/raid6_rmeta_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_2: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:271       /dev/ram7: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram7
#filters/filter-composite.c:31         Using /dev/ram7
#device/dev-io.c:524         Opened /dev/ram7 RO O_DIRECT
#device/dev-io.c:137         /dev/ram7: block size is 4096 bytes
#label/label.c:180       /dev/ram7: No label detected
#device/dev-io.c:577         Closed /dev/ram7
#device/dev-io.c:524         Opened /dev/loop7 RO O_DIRECT
#device/dev-io.c:271       /dev/loop7: size is 0 sectors
#filters/filter.c:169         /dev/loop7: Skipping: Too small to hold a P=
V
#device/dev-io.c:577         Closed /dev/loop7
#ioctl/libdm-iface.c:1687         dm status   (253:7) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_2: Rese=
rved internal LV device test/raid6_rimage_2 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_2:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram8
#device/dev-io.c:271       /dev/ram8: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram8
#filters/filter-composite.c:31         Using /dev/ram8
#device/dev-io.c:524         Opened /dev/ram8 RO O_DIRECT
#device/dev-io.c:137         /dev/ram8: block size is 4096 bytes
#label/label.c:180       /dev/ram8: No label detected
#device/dev-io.c:577         Closed /dev/ram8
#ioctl/libdm-iface.c:1687         dm status   (253:8) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_3: Reser=
ved internal LV device test/raid6_rmeta_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_3: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram9
#device/dev-io.c:271       /dev/ram9: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram9
#filters/filter-composite.c:31         Using /dev/ram9
#device/dev-io.c:524         Opened /dev/ram9 RO O_DIRECT
#device/dev-io.c:137         /dev/ram9: block size is 4096 bytes
#label/label.c:180       /dev/ram9: No label detected
#device/dev-io.c:577         Closed /dev/ram9
#ioctl/libdm-iface.c:1687         dm status   (253:9) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_3: Rese=
rved internal LV device test/raid6_rimage_3 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_3:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram10
#device/dev-io.c:271       /dev/ram10: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram10
#filters/filter-composite.c:31         Using /dev/ram10
#device/dev-io.c:524         Opened /dev/ram10 RO O_DIRECT
#device/dev-io.c:137         /dev/ram10: block size is 4096 bytes
#label/label.c:180       /dev/ram10: No label detected
#device/dev-io.c:577         Closed /dev/ram10
#ioctl/libdm-iface.c:1687         dm status   (253:10) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rmeta_4: Reser=
ved internal LV device test/raid6_rmeta_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rmeta_4: =
Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram11
#device/dev-io.c:271       /dev/ram11: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram11
#filters/filter-composite.c:31         Using /dev/ram11
#device/dev-io.c:524         Opened /dev/ram11 RO O_DIRECT
#device/dev-io.c:137         /dev/ram11: block size is 4096 bytes
#label/label.c:180       /dev/ram11: No label detected
#device/dev-io.c:577         Closed /dev/ram11
#ioctl/libdm-iface.c:1687         dm status   (253:11) OF   [16384] (*1)
#activate/dev_manager.c:233         /dev/mapper/test-raid6_rimage_4: Rese=
rved internal LV device test/raid6_rimage_4 not usable.
#filters/filter-persistent.c:300         /dev/mapper/test-raid6_rimage_4:=
 Skipping unusable device
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram12
#device/dev-io.c:271       /dev/ram12: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram12
#filters/filter-composite.c:31         Using /dev/ram12
#device/dev-io.c:524         Opened /dev/ram12 RO O_DIRECT
#device/dev-io.c:137         /dev/ram12: block size is 4096 bytes
#label/label.c:180       /dev/ram12: No label detected
#device/dev-io.c:577         Closed /dev/ram12
#ioctl/libdm-iface.c:1687         dm status   (253:12) OF   [16384] (*1)
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:271       /dev/test/raid6: size is 2113536 sectors
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/test/raid6
#filters/filter-composite.c:31         Using /dev/test/raid6
#device/dev-io.c:524         Opened /dev/test/raid6 RO O_DIRECT
#device/dev-io.c:137         /dev/test/raid6: block size is 4096 bytes
#label/label.c:180       /dev/test/raid6: No label detected
#device/dev-io.c:577         Closed /dev/test/raid6
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:271       /dev/ram13: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram13
#filters/filter-composite.c:31         Using /dev/ram13
#device/dev-io.c:524         Opened /dev/ram13 RO O_DIRECT
#device/dev-io.c:137         /dev/ram13: block size is 4096 bytes
#label/label.c:180       /dev/ram13: No label detected
#device/dev-io.c:577         Closed /dev/ram13
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:271       /dev/ram14: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram14
#filters/filter-composite.c:31         Using /dev/ram14
#device/dev-io.c:524         Opened /dev/ram14 RO O_DIRECT
#device/dev-io.c:137         /dev/ram14: block size is 4096 bytes
#label/label.c:180       /dev/ram14: No label detected
#device/dev-io.c:577         Closed /dev/ram14
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/ram15: size is 32768 sectors
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#device/dev-io.c:577         Closed /dev/ram15
#filters/filter-composite.c:31         Using /dev/ram15
#device/dev-io.c:524         Opened /dev/ram15 RO O_DIRECT
#device/dev-io.c:137         /dev/ram15: block size is 4096 bytes
#label/label.c:180       /dev/ram15: No label detected
#device/dev-io.c:577         Closed /dev/ram15
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdc: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdc
#label/label.c:266         Using cached label for /dev/sdc
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdd: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdd
#label/label.c:266         Using cached label for /dev/sdd
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#device/dev-io.c:271       /dev/sde: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sde
#label/label.c:266         Using cached label for /dev/sde
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdf: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdf
#label/label.c:266         Using cached label for /dev/sdf
#device/dev-io.c:480         /dev/sdg: open failed: No such device or add=
ress
#filters/filter.c:158         /dev/sdg: Skipping: open failed
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#device/dev-io.c:271       /dev/sdh: size is 2097152 sectors
#filters/filter-composite.c:31         Using /dev/sdh
#label/label.c:266         Using cached label for /dev/sdh
#format_text/import_vsn1.c:205     Couldn't find device with uuid Bf4qAN-=
KznA-qunU-2Xj4-y33X-QK7U-4TG24l.
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rmeta_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_0
#metadata/lv_manip.c:432       Stack raid6:0[0] on LV raid6_rimage_0:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_0=

#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rmeta_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_1
#metadata/lv_manip.c:432       Stack raid6:0[1] on LV raid6_rimage_1:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_1=

#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rmeta_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_2
#metadata/lv_manip.c:432       Stack raid6:0[2] on LV raid6_rimage_2:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_2=

#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rmeta_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_3
#metadata/lv_manip.c:432       Stack raid6:0[3] on LV raid6_rimage_3:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_3=

#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rmeta_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rmeta_4
#metadata/lv_manip.c:432       Stack raid6:0[4] on LV raid6_rimage_4:0
#metadata/lv_manip.c:86       Adding raid6:0 as an user of raid6_rimage_4=

#format_text/format-text.c:524         Read test metadata (10) from /dev/=
sdh at 49664 size 5056
#metadata/vg.c:74         Freeing VG test at 0x2d56ba0.
#metadata/metadata.c:3371     There are 1 physical volumes missing.
#metadata/pv_manip.c:327         /dev/sdh 0:      0      1: raid6_rmeta_0=
(0:0)
#metadata/pv_manip.c:327         /dev/sdh 1:      1     86: raid6_rimage_=
0(0:0)
#metadata/pv_manip.c:327         /dev/sdh 2:     87    168: NULL(0:0)
#metadata/pv_manip.c:327         /dev/sdc 0:      0      1: raid6_rmeta_1=
(0:0)
#metadata/pv_manip.c:327         /dev/sdc 1:      1     86: raid6_rimage_=
1(0:0)
#metadata/pv_manip.c:327         /dev/sdc 2:     87    168: NULL(0:0)
#metadata/pv_manip.c:327         /dev/sdd 0:      0      1: raid6_rmeta_2=
(0:0)
#metadata/pv_manip.c:327         /dev/sdd 1:      1     86: raid6_rimage_=
2(0:0)
#metadata/pv_manip.c:327         /dev/sdd 2:     87    168: NULL(0:0)
#metadata/pv_manip.c:327         /dev/sde 0:      0      1: raid6_rmeta_3=
(0:0)
#metadata/pv_manip.c:327         /dev/sde 1:      1     86: raid6_rimage_=
3(0:0)
#metadata/pv_manip.c:327         /dev/sde 2:     87    168: NULL(0:0)
#metadata/pv_manip.c:327         /dev/sdf 0:      0      1: raid6_rmeta_4=
(0:0)
#metadata/pv_manip.c:327         /dev/sdf 1:      1     86: raid6_rimage_=
4(0:0)
#metadata/pv_manip.c:327         /dev/sdf 2:     87    168: NULL(0:0)
#metadata/pv_manip.c:327         unknown device 0:      0    255: NULL(0:=
0)
#format_text/archiver.c:131     Archiving volume group "test" metadata (s=
eqno 10).
Attempt to replace failed RAID images (requires full device resync)? [y/n=
]: #metadata/raid_manip.c:1614     test/raid6 does not contain devices sp=
ecified for replacement
  Faulty devices in test/raid6 successfully replaced.
#mm/memlock.c:389         Unlock: Memlock counters: locked:0 critical:0 d=
aemon:0 suspended:0
#activate/fs.c:489         Syncing device names
#locking/file_locking.c:74       Unlocking /var/lock/lvm/V_test
#locking/file_locking.c:51         _undo_flock /var/lock/lvm/V_test
#device/dev-io.c:577         Closed /dev/sdc
#device/dev-io.c:577         Closed /dev/sdd
#device/dev-io.c:577         Closed /dev/sde
#device/dev-io.c:577         Closed /dev/sdf
#device/dev-io.c:577         Closed /dev/sdh
#metadata/vg.c:74         Freeing VG test at 0x2d5ff90.

--------------010109010208040309000008
Content-Type: text/plain;
 name="dmsetup-status.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="dmsetup-status.txt"

test-raid6_rmeta_4: 0 8192 linear=20
test-raid6_rmeta_3: 0 8192 linear=20
test-raid6_rimage_4: 0 704512 linear=20
vg_lvm-lv_swap: 0 8257536 linear=20
vg_lvm-lv_root: 0 7487488 linear=20
test-raid6_rmeta_2: 0 8192 linear=20
test-raid6_rimage_3: 0 704512 linear=20
test-raid6_rmeta_1: 0 8192 linear=20
test-raid6_rimage_2: 0 704512 linear=20
test-raid6_rmeta_0: 0 8192 linear=20
test-raid6_rimage_1: 0 704512 linear=20
test-raid6_rimage_0: 0 704512 linear=20
test-raid6: 0 2113536 raid raid6_zr 5 DAAAA 704512/704512

--------------010109010208040309000008--

--------------enig032E1DAF2AD841D771F35CBB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iEYEARECAAYFAlAIVCEACgkQKa3WijwxZE1ObgCfU/qLUdsNtmKweKkr8Tqdilwb
BoMAoJMXwWGA6fbqn4yiigYNQMHf0ojp
=MdC1
-----END PGP SIGNATURE-----

--------------enig032E1DAF2AD841D771F35CBB--
