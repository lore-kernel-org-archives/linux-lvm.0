Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CD1A2028CCE
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 09:08:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 039F2185A78B
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 09:08:27 +0000 (UTC)
References: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <6b1c4f75-37ee-caa9-623a-363a8e791e4d@suse.com>
Date: Sat, 5 Sep 2020 17:08:08 +0800
In-Reply-To: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH] lvs: add -o lv_usable
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
To: linux-lvm@redhat.com
Cc: teigland@sourceware.org, zkabelac@redhat.com



On 9/5/20 5:06 PM, Zhao Heming wrote:
> report LV is usable for upper layer.
> 
> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> ---
>   lib/activate/activate.h          |   2 +
>   lib/activate/dev_manager.c       |  67 ++++++++++++++++
>   lib/metadata/metadata-exported.h |   1 +
>   lib/metadata/metadata.c          | 130 +++++++++++++++++++++++++++++++
>   lib/report/columns.h             |   1 +
>   lib/report/properties.c          |   2 +
>   lib/report/report.c              |  13 ++++
>   lib/report/values.h              |   1 +
>   8 files changed, 217 insertions(+)
> 

my test result:

## linear

[tb-clustermd2 lvm2.sourceware.git]# vgcreate vg1 /dev/sdg /dev/sdi
  Physical volume "/dev/sdg" successfully created.
  Physical volume "/dev/sdi" successfully created.
  Volume group "vg1" successfully created
[tb-clustermd2 lvm2.sourceware.git]# lvcreate -l 100%FREE -n lv1 vg1
  Logical volume "lv1" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg         8:96   0  100M  0 disk
└─vg1-lv1 254:0    0  192M  0 lvm
sdi         8:128  0  100M  0 disk
└─vg1-lv1 254:0    0  192M  0 lvm
vda       253:0    0   40G  0 disk
├─vda1    253:1    0    8M  0 part
├─vda2    253:2    0   38G  0 part /
└─vda3    253:3    0    2G  0 part [SWAP]

------ remove one disk -----------

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg         8:96   0  100M  0 disk
└─vg1-lv1 254:0    0  192M  0 lvm
vda       253:0    0   40G  0 disk
├─vda1    253:1    0    8M  0 part
├─vda2    253:2    0   38G  0 part /
└─vda3    253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid zOsVRm-ojxU-ZbfR-cLcT-MhxR-pfMh-eVfC42.
  WARNING: VG vg1 is missing PV zOsVRm-ojxU-ZbfR-cLcT-MhxR-pfMh-eVfC42 (last written to /dev/sdi).
  LV   Devices      Usable          Health
  lv1  /dev/sdg(0)  not usable      partial
  lv1  [unknown](0) not usable      partial
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid zOsVRm-ojxU-ZbfR-cLcT-MhxR-pfMh-eVfC42.
  WARNING: VG vg1 is missing PV zOsVRm-ojxU-ZbfR-cLcT-MhxR-pfMh-eVfC42 (last written to /dev/sdi).
  LV   Devices      Usable          Health
  lv1  /dev/sdg(0)  not usable      partial
  lv1  [unknown](0) not usable      partial

----- re-insert disk, but disk major:minor changed -----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg         8:96   0  100M  0 disk
└─vg1-lv1 254:0    0  192M  0 lvm
sdh         8:112  0  100M  0 disk
vda       253:0    0   40G  0 disk
├─vda1    253:1    0    8M  0 part
├─vda2    253:2    0   38G  0 part /
└─vda3    253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV   Devices     Usable          Health
  lv1  /dev/sdg(0) not usable
  lv1  /dev/sdh(0) not usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV   Devices     Usable          Health
  lv1  /dev/sdg(0) not usable
  lv1  /dev/sdh(0) not usable

## mirror

[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type mirror -l 100%FREE -n mirrorlv vg1
  Logical volume "mirrorlv" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                       8:96   0  100M  0 disk
└─vg1-mirrorlv_mimage_0 254:1    0   92M  0 lvm
  └─vg1-mirrorlv        254:3    0   92M  0 lvm
sdh                       8:112  0  100M  0 disk
├─vg1-mirrorlv_mlog     254:0    0    4M  0 lvm
│ └─vg1-mirrorlv        254:3    0   92M  0 lvm
└─vg1-mirrorlv_mimage_1 254:2    0   92M  0 lvm
  └─vg1-mirrorlv        254:3    0   92M  0 lvm
vda                     253:0    0   40G  0 disk
├─vda1                  253:1    0    8M  0 part
├─vda2                  253:2    0   38G  0 part /
└─vda3                  253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                  Devices                                   Usable          Health
  mirrorlv            mirrorlv_mimage_0(0),mirrorlv_mimage_1(0) usable
  [mirrorlv_mimage_0] /dev/sdg(0)                               usable
  [mirrorlv_mimage_1] /dev/sdh(0)                               usable
  [mirrorlv_mlog]     /dev/sdh(23)                              usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV       Devices                                   Usable          Health
  mirrorlv mirrorlv_mimage_0(0),mirrorlv_mimage_1(0) usable

---- removed one disk -----

[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut.
  WARNING: VG vg1 is missing PV a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut (last written to /dev/sdg).
  LV                  Devices                                   Usable          Health
  mirrorlv            mirrorlv_mimage_0(0),mirrorlv_mimage_1(0) usable          partial
  [mirrorlv_mimage_0] [unknown](0)                              not usable      partial
  [mirrorlv_mimage_1] /dev/sdh(0)                               usable
  [mirrorlv_mlog]     /dev/sdh(23)                              usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut.
  WARNING: VG vg1 is missing PV a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut (last written to /dev/sdg).
  LV       Devices                                   Usable          Health
  mirrorlv mirrorlv_mimage_0(0),mirrorlv_mimage_1(0) usable          partial

 **** issue io on mirrorlv, mirrorlv will switch to linear lv *****

[tb-clustermd2 lvm2.sourceware.git]# mkfs.ext4 /dev/vg1/mirrorlv
mke2fs 1.45.6 (20-Mar-2020)
Discarding device blocks: done
Creating filesystem with 94208 1k blocks and 23616 inodes
Filesystem UUID: 5a661fc3-8f2a-4c34-86ed-8413aa0ce03c
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME           MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdh              8:112  0  100M  0 disk
└─vg1-mirrorlv 254:3    0   92M  0 lvm
vda            253:0    0   40G  0 disk
├─vda1         253:1    0    8M  0 part
├─vda2         253:2    0   38G  0 part /
└─vda3         253:3    0    2G  0 part [SWAP]

[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut.
  WARNING: VG vg1 is missing PV a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut (last written to [unknown]).
  LV       Devices     Usable          Health
  mirrorlv /dev/sdh(0) usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut.
  WARNING: VG vg1 is missing PV a76Yn3-AaJE-Hv1e-J7Y6-6LeO-W7qG-wB7Sut (last written to [unknown]).
  LV       Devices     Usable          Health
  mirrorlv /dev/sdh(0) usable


---- re-insert disk, but this time mirrorlv had been changed to linear lv ----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME           MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg              8:96   0  100M  0 disk
sdh              8:112  0  100M  0 disk
└─vg1-mirrorlv 254:3    0   92M  0 lvm
vda            253:0    0   40G  0 disk
├─vda1         253:1    0    8M  0 part
├─vda2         253:2    0   38G  0 part /
└─vda3         253:3    0    2G  0 part [SWAP]



## raid0

[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type raid0 -l 100%FREE -n raid0lv vg1
  Using default stripesize 64.00 KiB.
  Logical volume "raid0lv" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
└─vg1-raid0lv_rimage_0 254:0    0   96M  0 lvm
  └─vg1-raid0lv        254:2    0  192M  0 lvm
sdh                      8:112  0  100M  0 disk
└─vg1-raid0lv_rimage_1 254:1    0   96M  0 lvm
  └─vg1-raid0lv        254:2    0  192M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]

[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                 Usable          Health
  raid0lv            raid0lv_rimage_0(0),raid0lv_rimage_1(0) usable
  [raid0lv_rimage_0] /dev/sdg(0)                             usable
  [raid0lv_rimage_1] /dev/sdh(0)                             usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                 Usable          Health
  raid0lv raid0lv_rimage_0(0),raid0lv_rimage_1(0) usable

---- removed one disk -----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
└─vg1-raid0lv_rimage_0 254:0    0   96M  0 lvm
  └─vg1-raid0lv        254:2    0  192M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid lRcHCD-PFYu-XCWZ-GHCM-TFGI-55Mi-5MUzG3.
  WARNING: VG vg1 is missing PV lRcHCD-PFYu-XCWZ-GHCM-TFGI-55Mi-5MUzG3 (last written to /dev/sdh).
  LV                 Devices                                 Usable          Health
  raid0lv            raid0lv_rimage_0(0),raid0lv_rimage_1(0) not usable      partial
  [raid0lv_rimage_0] /dev/sdg(0)                             usable
  [raid0lv_rimage_1] [unknown](0)                            not usable      partial
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid lRcHCD-PFYu-XCWZ-GHCM-TFGI-55Mi-5MUzG3.
  WARNING: VG vg1 is missing PV lRcHCD-PFYu-XCWZ-GHCM-TFGI-55Mi-5MUzG3 (last written to /dev/sdh).
  LV      Devices                                 Usable          Health
  raid0lv raid0lv_rimage_0(0),raid0lv_rimage_1(0) not usable      partial

---- re-insert disk, but major:minor changed ----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
└─vg1-raid0lv_rimage_0 254:0    0   96M  0 lvm
  └─vg1-raid0lv        254:2    0  192M  0 lvm
sdi                      8:128  0  100M  0 disk
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                 Usable          Health
  raid0lv            raid0lv_rimage_0(0),raid0lv_rimage_1(0) not usable
  [raid0lv_rimage_0] /dev/sdg(0)                             usable
  [raid0lv_rimage_1] /dev/sdi(0)                             not usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                 Usable          Health
  raid0lv raid0lv_rimage_0(0),raid0lv_rimage_1(0) not usable

## raid1

[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type raid1 -l 100%FREE -n raid1lv vg1
  Logical volume "raid1lv" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
├─vg1-raid1lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid1lv        254:4    0   92M  0 lvm
└─vg1-raid1lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid1lv        254:4    0   92M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid1lv_rmeta_1  254:2    0    4M  0 lvm
│ └─vg1-raid1lv        254:4    0   92M  0 lvm
└─vg1-raid1lv_rimage_1 254:3    0   92M  0 lvm
  └─vg1-raid1lv        254:4    0   92M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                 Usable          Health
  raid1lv            raid1lv_rimage_0(0),raid1lv_rimage_1(0) usable
  [raid1lv_rimage_0] /dev/sdg(1)                             usable
  [raid1lv_rimage_1] /dev/sdi(1)                             usable
  [raid1lv_rmeta_0]  /dev/sdg(0)                             usable
  [raid1lv_rmeta_1]  /dev/sdi(0)                             usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                 Usable          Health
  raid1lv raid1lv_rimage_0(0),raid1lv_rimage_1(0) usable


---- removed one disk -----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
├─vg1-raid1lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid1lv        254:4    0   92M  0 lvm
└─vg1-raid1lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid1lv        254:4    0   92M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid dLd1d2-Tpt8-iusf-N1lh-R1W6-JOW3-EgOJfA.
  WARNING: VG vg1 is missing PV dLd1d2-Tpt8-iusf-N1lh-R1W6-JOW3-EgOJfA (last written to /dev/sdi).
  LV                 Devices                                 Usable          Health
  raid1lv            raid1lv_rimage_0(0),raid1lv_rimage_1(0) usable          partial
  [raid1lv_rimage_0] /dev/sdg(1)                             usable
  [raid1lv_rimage_1] [unknown](1)                            not usable      partial
  [raid1lv_rmeta_0]  /dev/sdg(0)                             usable
  [raid1lv_rmeta_1]  [unknown](0)                            not usable      partial
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid dLd1d2-Tpt8-iusf-N1lh-R1W6-JOW3-EgOJfA.
  WARNING: VG vg1 is missing PV dLd1d2-Tpt8-iusf-N1lh-R1W6-JOW3-EgOJfA (last written to /dev/sdi).
  LV      Devices                                 Usable          Health
  raid1lv raid1lv_rimage_0(0),raid1lv_rimage_1(0) usable          partial


---- re-insert disk, but disk major:minor changed ----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
├─vg1-raid1lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid1lv        254:4    0   92M  0 lvm
└─vg1-raid1lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid1lv        254:4    0   92M  0 lvm
sdh                      8:112  0  100M  0 disk
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                 Usable          Health
  raid1lv            raid1lv_rimage_0(0),raid1lv_rimage_1(0) usable
  [raid1lv_rimage_0] /dev/sdg(1)                             usable
  [raid1lv_rimage_1] /dev/sdh(1)                             not usable
  [raid1lv_rmeta_0]  /dev/sdg(0)                             usable
  [raid1lv_rmeta_1]  /dev/sdh(0)                             not usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                 Usable          Health
  raid1lv raid1lv_rimage_0(0),raid1lv_rimage_1(0) usable


## raid10

[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type raid10 -l 100%FREE -n raid10lv vg1
  Using default stripesize 64.00 KiB.
  Logical volume "raid10lv" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT

sdg                       8:96   0  100M  0 disk
├─vg1-raid10lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdh                       8:112  0  100M  0 disk
├─vg1-raid10lv_rmeta_1  254:2    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_1 254:3    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdi                       8:128  0  100M  0 disk
├─vg1-raid10lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdj                       8:144  0  100M  0 disk
├─vg1-raid10lv_rmeta_3  254:6    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_3 254:7    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
vda                     253:0    0   40G  0 disk
├─vda1                  253:1    0    8M  0 part
├─vda2                  253:2    0   38G  0 part /
└─vda3                  253:3    0    2G  0 part [SWAP]

[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                  Devices                                                                             Usable          Health
  raid10lv            raid10lv_rimage_0(0),raid10lv_rimage_1(0),raid10lv_rimage_2(0),raid10lv_rimage_3(0) usable
  [raid10lv_rimage_0] /dev/sdg(1)                                                                         usable
  [raid10lv_rimage_1] /dev/sdh(1)                                                                         usable
  [raid10lv_rimage_2] /dev/sdi(1)                                                                         usable
  [raid10lv_rimage_3] /dev/sdj(1)                                                                         usable
  [raid10lv_rmeta_0]  /dev/sdg(0)                                                                         usable
  [raid10lv_rmeta_1]  /dev/sdh(0)                                                                         usable
  [raid10lv_rmeta_2]  /dev/sdi(0)                                                                         usable
  [raid10lv_rmeta_3]  /dev/sdj(0)                                                                         usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV       Devices                                                                             Usable          Health
  raid10lv raid10lv_rimage_0(0),raid10lv_rimage_1(0),raid10lv_rimage_2(0),raid10lv_rimage_3(0) usable

---- removed one disk -----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                       8:0    0  300M  0 disk
sdb                       8:16   0  300M  0 disk
sdc                       8:32   0  300M  0 disk
sdd                       8:48   0  300M  0 disk
sde                       8:64   0  300M  0 disk
sdf                       8:80   0  300M  0 disk
sdg                       8:96   0  100M  0 disk
├─vg1-raid10lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdi                       8:128  0  100M  0 disk
├─vg1-raid10lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdj                       8:144  0  100M  0 disk
├─vg1-raid10lv_rmeta_3  254:6    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_3 254:7    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
vda                     253:0    0   40G  0 disk
├─vda1                  253:1    0    8M  0 part
├─vda2                  253:2    0   38G  0 part /
└─vda3                  253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid Nq84Xp-dfEB-Tso1-wOws-X0PT-WxGT-vB3EbQ.
  WARNING: VG vg1 is missing PV Nq84Xp-dfEB-Tso1-wOws-X0PT-WxGT-vB3EbQ (last written to /dev/sdh).
  LV                  Devices                                                                             Usable          Health
  raid10lv            raid10lv_rimage_0(0),raid10lv_rimage_1(0),raid10lv_rimage_2(0),raid10lv_rimage_3(0) usable          partial
  [raid10lv_rimage_0] /dev/sdg(1)                                                                         usable
  [raid10lv_rimage_1] [unknown](1)                                                                        not usable      partial
  [raid10lv_rimage_2] /dev/sdi(1)                                                                         usable
  [raid10lv_rimage_3] /dev/sdj(1)                                                                         usable
  [raid10lv_rmeta_0]  /dev/sdg(0)                                                                         usable
  [raid10lv_rmeta_1]  [unknown](0)                                                                        not usable      partial
  [raid10lv_rmeta_2]  /dev/sdi(0)                                                                         usable
  [raid10lv_rmeta_3]  /dev/sdj(0)                                                                         usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid Nq84Xp-dfEB-Tso1-wOws-X0PT-WxGT-vB3EbQ.
  WARNING: VG vg1 is missing PV Nq84Xp-dfEB-Tso1-wOws-X0PT-WxGT-vB3EbQ (last written to /dev/sdh).
  LV       Devices                                                                             Usable          Health
  raid10lv raid10lv_rimage_0(0),raid10lv_rimage_1(0),raid10lv_rimage_2(0),raid10lv_rimage_3(0) usable          partial

---- re-insert disk, but disk major:minor changed ----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                       8:96   0  100M  0 disk
├─vg1-raid10lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdi                       8:128  0  100M  0 disk
├─vg1-raid10lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdj                       8:144  0  100M  0 disk
├─vg1-raid10lv_rmeta_3  254:6    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_3 254:7    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdk                       8:160  0  100M  0 disk
vda                     253:0    0   40G  0 disk
├─vda1                  253:1    0    8M  0 part
├─vda2                  253:2    0   38G  0 part /
└─vda3                  253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                  Devices                                                                             Usable          Health
  raid10lv            raid10lv_rimage_0(0),raid10lv_rimage_1(0),raid10lv_rimage_2(0),raid10lv_rimage_3(0) usable
  [raid10lv_rimage_0] /dev/sdg(1)                                                                         usable
  [raid10lv_rimage_1] /dev/sdk(1)                                                                         not usable
  [raid10lv_rimage_2] /dev/sdi(1)                                                                         usable
  [raid10lv_rimage_3] /dev/sdj(1)                                                                         usable
  [raid10lv_rmeta_0]  /dev/sdg(0)                                                                         usable
  [raid10lv_rmeta_1]  /dev/sdk(0)                                                                         not usable
  [raid10lv_rmeta_2]  /dev/sdi(0)                                                                         usable
  [raid10lv_rmeta_3]  /dev/sdj(0)                                                                         usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV       Devices                                                                             Usable          Health
  raid10lv raid10lv_rimage_0(0),raid10lv_rimage_1(0),raid10lv_rimage_2(0),raid10lv_rimage_3(0) usable

------- removed 2 disks from just created raid10 array ------

[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type raid10 -l 100%FREE -n raid10lv vg1
  Using default stripesize 64.00 KiB.
  Logical volume "raid10lv" created.
[tb-clustermd2 lvm2.sourceware.git]#
[tb-clustermd2 lvm2.sourceware.git]#
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                       8:96   0  100M  0 disk
├─vg1-raid10lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdi                       8:128  0  100M  0 disk
├─vg1-raid10lv_rmeta_1  254:2    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_1 254:3    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdj                       8:144  0  100M  0 disk
├─vg1-raid10lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdk                       8:160  0  100M  0 disk
├─vg1-raid10lv_rmeta_3  254:6    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_3 254:7    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
vda                     253:0    0   40G  0 disk
├─vda1                  253:1    0    8M  0 part
├─vda2                  253:2    0   38G  0 part /
└─vda3                  253:3    0    2G  0 part [SWAP]

  ** remove 2 disks **

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdi                       8:128  0  100M  0 disk
├─vg1-raid10lv_rmeta_1  254:2    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_1 254:3    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
sdk                       8:160  0  100M  0 disk
├─vg1-raid10lv_rmeta_3  254:6    0    4M  0 lvm
│ └─vg1-raid10lv        254:8    0  184M  0 lvm
└─vg1-raid10lv_rimage_3 254:7    0   92M  0 lvm
  └─vg1-raid10lv        254:8    0  184M  0 lvm
vda                     253:0    0   40G  0 disk
├─vda1                  253:1    0    8M  0 part
├─vda2                  253:2    0   38G  0 part /
└─vda3                  253:3    0    2G  0 part [SWAP]

[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid bsIGCe-p0co-Yxlw-hRsw-crms-szAH-HpWkBl.
  WARNING: Couldn't find device with uuid tazWyL-kmWh-Ful2-8h81-knsU-8Smg-H7O8n5.
  WARNING: VG vg1 is missing PV bsIGCe-p0co-Yxlw-hRsw-crms-szAH-HpWkBl (last written to /dev/sdg).
  WARNING: VG vg1 is missing PV tazWyL-kmWh-Ful2-8h81-knsU-8Smg-H7O8n5 (last written to /dev/sdj).
  LV                  Devices                                                                             Usable          Health
  raid10lv            raid10lv_rimage_0(0),raid10lv_rimage_1(0),raid10lv_rimage_2(0),raid10lv_rimage_3(0) not usable      partial
  [raid10lv_rimage_0] [unknown](1)                                                                        not usable      partial
  [raid10lv_rimage_1] /dev/sdi(1)                                                                         usable
  [raid10lv_rimage_2] [unknown](1)                                                                        not usable      partial
  [raid10lv_rimage_3] /dev/sdk(1)                                                                         usable
  [raid10lv_rmeta_0]  [unknown](0)                                                                        not usable      partial
  [raid10lv_rmeta_1]  /dev/sdi(0)                                                                         usable
  [raid10lv_rmeta_2]  [unknown](0)                                                                        not usable      partial
  [raid10lv_rmeta_3]  /dev/sdk(0)                                                                         usable

## raid4

[tb-clustermd2 lvm2.sourceware.git]# vgcreate vg1 /dev/sd{g,h,i}
  Physical volume "/dev/sdg" successfully created.
  Physical volume "/dev/sdh" successfully created.
  Physical volume "/dev/sdi" successfully created.
  Volume group "vg1" successfully created
[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type raid4 -l 100%FREE -n raid4lv vg1
  Using default stripesize 64.00 KiB.
  Logical volume "raid4lv" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
├─vg1-raid4lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
sdh                      8:112  0  100M  0 disk
├─vg1-raid4lv_rmeta_1  254:2    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_1 254:3    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid4lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                                     Usable          Health
  raid4lv            raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) usable
  [raid4lv_rimage_0] /dev/sdg(1)                                                 usable
  [raid4lv_rimage_1] /dev/sdh(1)                                                 usable
  [raid4lv_rimage_2] /dev/sdi(1)                                                 usable
  [raid4lv_rmeta_0]  /dev/sdg(0)                                                 usable
  [raid4lv_rmeta_1]  /dev/sdh(0)                                                 usable
  [raid4lv_rmeta_2]  /dev/sdi(0)                                                 usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                                     Usable          Health
  raid4lv raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) usable

---- removed one disk -----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                      8:0    0  300M  0 disk
sdb                      8:16   0  300M  0 disk
sdc                      8:32   0  300M  0 disk
sdd                      8:48   0  300M  0 disk
sde                      8:64   0  300M  0 disk
sdf                      8:80   0  300M  0 disk
sdg                      8:96   0  100M  0 disk
├─vg1-raid4lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid4lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid F2lYBQ-5w7f-HS03-6V8N-ZdNe-7vpc-19wkuY.
  WARNING: VG vg1 is missing PV F2lYBQ-5w7f-HS03-6V8N-ZdNe-7vpc-19wkuY (last written to /dev/sdh).
  LV                 Devices                                                     Usable          Health
  raid4lv            raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) usable          partial
  [raid4lv_rimage_0] /dev/sdg(1)                                                 usable
  [raid4lv_rimage_1] [unknown](1)                                                not usable      partial
  [raid4lv_rimage_2] /dev/sdi(1)                                                 usable
  [raid4lv_rmeta_0]  /dev/sdg(0)                                                 usable
  [raid4lv_rmeta_1]  [unknown](0)                                                not usable      partial
  [raid4lv_rmeta_2]  /dev/sdi(0)                                                 usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid F2lYBQ-5w7f-HS03-6V8N-ZdNe-7vpc-19wkuY.
  WARNING: VG vg1 is missing PV F2lYBQ-5w7f-HS03-6V8N-ZdNe-7vpc-19wkuY (last written to /dev/sdh).
  LV      Devices                                                     Usable          Health
  raid4lv raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) usable          partial



---- re-insert disk, but disk major:minor changed ----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                      8:0    0  300M  0 disk
sdb                      8:16   0  300M  0 disk
sdc                      8:32   0  300M  0 disk
sdd                      8:48   0  300M  0 disk
sde                      8:64   0  300M  0 disk
sdf                      8:80   0  300M  0 disk
sdg                      8:96   0  100M  0 disk
├─vg1-raid4lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid4lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
sdj                      8:144  0  100M  0 disk
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                                     Usable          Health
  raid4lv            raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) usable
  [raid4lv_rimage_0] /dev/sdg(1)                                                 usable
  [raid4lv_rimage_1] /dev/sdj(1)                                                 not usable
  [raid4lv_rimage_2] /dev/sdi(1)                                                 usable
  [raid4lv_rmeta_0]  /dev/sdg(0)                                                 usable
  [raid4lv_rmeta_1]  /dev/sdj(0)                                                 not usable
  [raid4lv_rmeta_2]  /dev/sdi(0)                                                 usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                                     Usable          Health
  raid4lv raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) usable

  ** removed 2 disks ***
[tb-clustermd2 lvm2.sourceware.git]# vgcreate vg1 /dev/sdg /dev/sdi /dev/sdj
  Physical volume "/dev/sdg" successfully created.
  Physical volume "/dev/sdi" successfully created.
  Physical volume "/dev/sdj" successfully created.
  Volume group "vg1" successfully created
[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type raid4 -l 100%FREE -n raid4lv vg1
  Using default stripesize 64.00 KiB.
  Logical volume "raid4lv" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
├─vg1-raid4lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid4lv_rmeta_1  254:2    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_1 254:3    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
sdj                      8:144  0  100M  0 disk
├─vg1-raid4lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                      8:0    0  300M  0 disk
sdb                      8:16   0  300M  0 disk
sdc                      8:32   0  300M  0 disk
sdd                      8:48   0  300M  0 disk
sde                      8:64   0  300M  0 disk
sdf                      8:80   0  300M  0 disk
sdg                      8:96   0  100M  0 disk
├─vg1-raid4lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid4lv        254:6    0  184M  0 lvm
└─vg1-raid4lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid4lv        254:6    0  184M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid QVsbZQ-Cy34-HXZO-fYkk-8kH4-N3Vr-katDI2.
  WARNING: Couldn't find device with uuid Dxd3k6-RwBz-OYKG-ZexP-3yqf-iXVw-cqfWvx.
  WARNING: VG vg1 is missing PV QVsbZQ-Cy34-HXZO-fYkk-8kH4-N3Vr-katDI2 (last written to /dev/sdi).
  WARNING: VG vg1 is missing PV Dxd3k6-RwBz-OYKG-ZexP-3yqf-iXVw-cqfWvx (last written to /dev/sdj).
  LV                 Devices                                                     Usable          Health
  raid4lv            raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) not usable      partial
  [raid4lv_rimage_0] /dev/sdg(1)                                                 usable
  [raid4lv_rimage_1] [unknown](1)                                                not usable      partial
  [raid4lv_rimage_2] [unknown](1)                                                not usable      partial
  [raid4lv_rmeta_0]  /dev/sdg(0)                                                 usable
  [raid4lv_rmeta_1]  [unknown](0)                                                not usable      partial
  [raid4lv_rmeta_2]  [unknown](0)                                                not usable      partial
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid QVsbZQ-Cy34-HXZO-fYkk-8kH4-N3Vr-katDI2.
  WARNING: Couldn't find device with uuid Dxd3k6-RwBz-OYKG-ZexP-3yqf-iXVw-cqfWvx.
  WARNING: VG vg1 is missing PV QVsbZQ-Cy34-HXZO-fYkk-8kH4-N3Vr-katDI2 (last written to /dev/sdi).
  WARNING: VG vg1 is missing PV Dxd3k6-RwBz-OYKG-ZexP-3yqf-iXVw-cqfWvx (last written to /dev/sdj).
  LV      Devices                                                     Usable          Health
  raid4lv raid4lv_rimage_0(0),raid4lv_rimage_1(0),raid4lv_rimage_2(0) not usable      partial

## raid5

[tb-clustermd2 lvm2.sourceware.git]# lvcreate --type raid5 -l 100%FREE -n raid5lv vg1
  Using default stripesize 64.00 KiB.
  Logical volume "raid5lv" created.
[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
├─vg1-raid5lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid5lv        254:6    0  184M  0 lvm
└─vg1-raid5lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid5lv        254:6    0  184M  0 lvm
sdh                      8:112  0  100M  0 disk
├─vg1-raid5lv_rmeta_1  254:2    0    4M  0 lvm
│ └─vg1-raid5lv        254:6    0  184M  0 lvm
└─vg1-raid5lv_rimage_1 254:3    0   92M  0 lvm
  └─vg1-raid5lv        254:6    0  184M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid5lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid5lv        254:6    0  184M  0 lvm
└─vg1-raid5lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid5lv        254:6    0  184M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]


[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                                     Usable          Health
  raid5lv            raid5lv_rimage_0(0),raid5lv_rimage_1(0),raid5lv_rimage_2(0) usable
  [raid5lv_rimage_0] /dev/sdg(1)                                                 usable
  [raid5lv_rimage_1] /dev/sdh(1)                                                 usable
  [raid5lv_rimage_2] /dev/sdi(1)                                                 usable
  [raid5lv_rmeta_0]  /dev/sdg(0)                                                 usable
  [raid5lv_rmeta_1]  /dev/sdh(0)                                                 usable
  [raid5lv_rmeta_2]  /dev/sdi(0)                                                 usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                                     Usable          Health
  raid5lv raid5lv_rimage_0(0),raid5lv_rimage_1(0),raid5lv_rimage_2(0) usable

---- removed one disk -----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                      8:0    0  300M  0 disk
sdb                      8:16   0  300M  0 disk
sdc                      8:32   0  300M  0 disk
sdd                      8:48   0  300M  0 disk
sde                      8:64   0  300M  0 disk
sdf                      8:80   0  300M  0 disk
sdg                      8:96   0  100M  0 disk
├─vg1-raid5lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid5lv        254:6    0  184M  0 lvm
└─vg1-raid5lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid5lv        254:6    0  184M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid5lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid5lv        254:6    0  184M  0 lvm
└─vg1-raid5lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid5lv        254:6    0  184M  0 lvm
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid 9WTdNI-YSLs-yWZm-6dnQ-kbLp-cb1n-gKZLCl.
  WARNING: VG vg1 is missing PV 9WTdNI-YSLs-yWZm-6dnQ-kbLp-cb1n-gKZLCl (last written to /dev/sdh).
  LV                 Devices                                                     Usable          Health
  raid5lv            raid5lv_rimage_0(0),raid5lv_rimage_1(0),raid5lv_rimage_2(0) usable          partial
  [raid5lv_rimage_0] /dev/sdg(1)                                                 usable
  [raid5lv_rimage_1] [unknown](1)                                                not usable      partial
  [raid5lv_rimage_2] /dev/sdi(1)                                                 usable
  [raid5lv_rmeta_0]  /dev/sdg(0)                                                 usable
  [raid5lv_rmeta_1]  [unknown](0)                                                not usable      partial
  [raid5lv_rmeta_2]  /dev/sdi(0)                                                 usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  WARNING: Couldn't find device with uuid 9WTdNI-YSLs-yWZm-6dnQ-kbLp-cb1n-gKZLCl.
  WARNING: VG vg1 is missing PV 9WTdNI-YSLs-yWZm-6dnQ-kbLp-cb1n-gKZLCl (last written to /dev/sdh).
  LV      Devices                                                     Usable          Health
  raid5lv raid5lv_rimage_0(0),raid5lv_rimage_1(0),raid5lv_rimage_2(0) usable          partial

---- re-insert disk, but disk major:minor changed ----

[tb-clustermd2 lvm2.sourceware.git]# lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sdg                      8:96   0  100M  0 disk
├─vg1-raid5lv_rmeta_0  254:0    0    4M  0 lvm
│ └─vg1-raid5lv        254:6    0  184M  0 lvm
└─vg1-raid5lv_rimage_0 254:1    0   92M  0 lvm
  └─vg1-raid5lv        254:6    0  184M  0 lvm
sdi                      8:128  0  100M  0 disk
├─vg1-raid5lv_rmeta_2  254:4    0    4M  0 lvm
│ └─vg1-raid5lv        254:6    0  184M  0 lvm
└─vg1-raid5lv_rimage_2 254:5    0   92M  0 lvm
  └─vg1-raid5lv        254:6    0  184M  0 lvm
sdj                      8:144  0  100M  0 disk
vda                    253:0    0   40G  0 disk
├─vda1                 253:1    0    8M  0 part
├─vda2                 253:2    0   38G  0 part /
└─vda3                 253:3    0    2G  0 part [SWAP]
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -a -o name,devices,lv_usable,lv_health_status
  LV                 Devices                                                     Usable          Health
  raid5lv            raid5lv_rimage_0(0),raid5lv_rimage_1(0),raid5lv_rimage_2(0) usable
  [raid5lv_rimage_0] /dev/sdg(1)                                                 usable
  [raid5lv_rimage_1] /dev/sdj(1)                                                 not usable
  [raid5lv_rimage_2] /dev/sdi(1)                                                 usable
  [raid5lv_rmeta_0]  /dev/sdg(0)                                                 usable
  [raid5lv_rmeta_1]  /dev/sdj(0)                                                 not usable
  [raid5lv_rmeta_2]  /dev/sdi(0)                                                 usable
[tb-clustermd2 lvm2.sourceware.git]# ./tools/lvm lvs -o name,devices,lv_usable,lv_health_status
  LV      Devices                                                     Usable          Health
  raid5lv raid5lv_rimage_0(0),raid5lv_rimage_1(0),raid5lv_rimage_2(0) usable
