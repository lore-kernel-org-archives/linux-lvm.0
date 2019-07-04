Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 306C1176D5
	for <linux-lvm@redhat.com>; Thu,  4 Jul 2019 18:52:35 +0000 (UTC)
Received: from ms11p00im-qufo17291301.me.com (ms11p00im-qufo17291301.me.com
	[17.58.38.42])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E66352F8BE2
	for <linux-lvm@redhat.com>; Thu,  4 Jul 2019 18:52:23 +0000 (UTC)
Received: from [192.168.1.19] (ip70-162-238-48.ph.ph.cox.net [70.162.238.48])
	by ms11p00im-qufo17291301.me.com (Postfix) with ESMTPSA id
	43981100645
	for <linux-lvm@redhat.com>; Thu,  4 Jul 2019 18:52:23 +0000 (UTC)
From: Adam Puleo <adam.puleo@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3564\))
Message-Id: <4A4D8121-1458-4E48-B162-C5FBCCEC9BD1@icloud.com>
Date: Thu, 4 Jul 2019 11:52:22 -0700
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Snapshot of RAID 6 Volume
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

Hello,

I=E2=80=99m trying to create a LVM snapshot of a RAID 6 volume. From the er=
ror messages it appears that I do not have enough space in the volume group=
 and / or on the physical volumes. How do I calculate the amount of space r=
equired?

Thank you,
-Adam

[root@nas scripts]# lvcreate --size 1G --snapshot --name lv_data_snapshot /=
dev/vg_data/lv_data=20
  device-mapper: resume ioctl on  (253:24) failed: Invalid argument
  Unable to resume vg_data-lv_data_snapshot (253:24).
  device-mapper: resume ioctl on  (253:5) failed: Invalid argument
  Unable to resume vg_data-lv_data (253:5).
  Problem reactivating logical volume vg_data/lv_data.
  Aborting. Manual intervention required.
  Releasing activation in critical section.
  libdevmapper exiting with 1 device(s) still suspended.

/var/log/messages:
Jul  4 10:54:56 nas kernel: md/raid:mdX: not clean -- starting background r=
econstruction
Jul  4 10:54:56 nas kernel: md/raid:mdX: device dm-10 operational as raid d=
isk 0
Jul  4 10:54:56 nas kernel: md/raid:mdX: device dm-12 operational as raid d=
isk 1
Jul  4 10:54:56 nas kernel: md/raid:mdX: device dm-16 operational as raid d=
isk 2
Jul  4 10:54:56 nas kernel: md/raid:mdX: device dm-18 operational as raid d=
isk 3
Jul  4 10:54:56 nas kernel: md/raid:mdX: device dm-22 operational as raid d=
isk 4
Jul  4 10:54:56 nas kernel: md/raid:mdX: raid level 6 active with 5 out of =
5 devices, algorithm 8
Jul  4 10:54:56 nas lvm[16521]: No longer monitoring RAID device vg_data-lv=
_data for events.
Jul  4 10:54:57 nas kernel: device-mapper: table: 253:24: dm-20 too small f=
or target: start=3D0, len=3D5788164096, dev_size=3D5788139520
Jul  4 10:54:57 nas kernel: device-mapper: table: 253:5: dm-20 too small fo=
r target: start=3D0, len=3D5788164096, dev_size=3D5788139520
Jul  4 10:54:57 nas kernel: md: resync of RAID array mdX
Jul  4 10:54:57 nas kernel: md: mdX: resync done.

[root@nas backups]# vgdisplay -v vg_data
  --- Volume group ---
  VG Name               vg_data
  System ID            =20
  Format                lvm2
  Metadata Areas        5
  Metadata Sequence No  65
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                5
  Act PV                5
  VG Size               <4.55 TiB
  PE Size               4.00 MiB
  Total PE              1192139
  Alloc PE / Size       1177610 / 4.49 TiB
  Free  PE / Size       14529 / 56.75 GiB
  VG UUID               zvZJna-UMgX-oWOM-LLy8-En5o-q4sM-PpQA2Q
  =20
  --- Logical volume ---
  LV Path                /dev/vg_data/lv_data
  LV Name                lv_data
  VG Name                vg_data
  LV UUID                KjiDLl-Dk67-LarA-TU3W-UPEK-Z4kH-iKgQnj
  LV Write Access        read/write
  LV Creation host, time nas.local, 2019-06-27 23:24:46 -0700
  LV Status              available
  # open                 1
  LV Size                <2.70 TiB
  Current LE             706563
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1280
  Block device           253:5
  =20
  --- Physical volumes ---
  PV Name               /dev/sdc    =20
  PV UUID               AEYk3P-Ka2X-qCHh-dXPx-R0BZ-lKkI-SSNtIP
  PV Status             allocatable
  Total PE / Free PE    238467 / 2945
  =20
  PV Name               /dev/sdb1    =20
  PV UUID               sTU60I-uJdh-ylgC-Cf4l-JWte-34CN-jpGDq3
  PV Status             allocatable
  Total PE / Free PE    238418 / 2896
  =20
  PV Name               /dev/sda1    =20
  PV UUID               a0Ick4-1nTm-VUJL-Vosl-OEbW-Btr8-I3pv2M
  PV Status             allocatable
  Total PE / Free PE    238418 / 2896
  =20
  PV Name               /dev/sde1    =20
  PV UUID               dgd702-ginH-5vAG-IPUJ-H0fm-6143-Jq8Nco
  PV Status             allocatable
  Total PE / Free PE    238418 / 2896
  =20
  PV Name               /dev/sdd1    =20
  PV UUID               gEpYRx-wJxa-VVMl-fNao-hsfF-QXKp-Z1dpBC
  PV Status             allocatable
  Total PE / Free PE    238418 / 2896

[root@nas backups]# dmsetup status
vg_data-lv_data_rimage_4: 0 1929388032 linear=20
cl_nas-opt: 0 209715200 linear=20
cl_nas-opt: 209715200 8192 linear=20
vg_pc_backups-lv_pc_backups_rimage_1: 0 5583462400 linear=20
vg_data-lv_data_rimage_3: 0 8192 linear=20
vg_data-lv_data_rimage_3: 8192 1929379840 linear=20
vg_pc_backups-lv_pc_backups_rimage_0: 0 5583462400 linear=20
vg_data-lv_data_rimage_2: 0 8192 linear=20
vg_data-lv_data_rimage_2: 8192 1929379840 linear=20
vg_data-lv_data_rimage_1: 0 8192 linear=20
vg_data-lv_data_rimage_1: 8192 1929379840 linear=20
vg_backups-lv_backups: 0 9767911424 linear=20
cl_nas-home: 0 154787840 linear=20
vg_data-lv_data_rimage_0: 0 8192 linear=20
vg_data-lv_data_rimage_0: 8192 1929379840 linear=20
cl_nas-swap: 0 16515072 linear=20
cl_nas-root: 0 104857600 linear=20
vg_data-lv_data_rmeta_4: 0 8192 linear=20
vg_data-lv_data_rmeta_3: 0 8192 linear=20
vg_data-lv_data: 0 5788139520 raid raid6_zr 5 AAAAA 1929379840/1929379840 i=
dle 0 8192 -
vg_pc_backups-lv_pc_backups: 0 5583462400 raid raid1 2 AA 5583462400/558346=
2400 idle 0 0 -
vg_data-lv_data_rmeta_2: 0 8192 linear=20
vg_data-lv_data_rmeta_1: 0 8192 linear=20
vg_slack-lv_slack: 0 3907403776 linear=20
vg_pc_backups-lv_pc_backups_rmeta_1: 0 8192 linear=20
vg_data-lv_data_rmeta_0: 0 8192 linear=20
vg_pc_backups-lv_pc_backups_rmeta_0: 0 8192 linear=20
