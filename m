Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m82IDkVB002572
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 14:13:46 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m82IDTOC009412
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 14:13:29 -0400
Received: by yx-out-2324.google.com with SMTP id 31so1152804yxl.81
	for <linux-lvm@redhat.com>; Tue, 02 Sep 2008 11:13:29 -0700 (PDT)
Message-ID: <14bab3630809021113g8805062he133c27bae762501@mail.gmail.com>
Date: Tue, 2 Sep 2008 14:13:29 -0400
From: "qian chen" <qianchen98@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] can't remove /dev/sdd
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
To: linux-lvm@redhat.com

Hello:
I need help getting rid of /dev/sdd.
I have tried vgreduce /dev/VolEmailNew /dev/sdd, vgreduce
/dev/VolGroup00 /dev/sdd, vgreduce /dev/VolShared /dev/sdd.

"
/dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Physical Volume "/dev/sdd" not found in Volume Group "VolGroup00"
"
Thanks for your help.



[root ~]# vgdisplay
  /dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  --- Volume group ---
  VG Name               VolEmailNew
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               1.20 TB
  PE Size               4.00 MB
  Total PE              314572
  Alloc PE / Size       314572 / 1.20 TB
  Free  PE / Size       0 / 0
  VG UUID               WWCRME-oaYL-lJOE-Pdrv-ieSG-TKB3-vVoboR

  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 2199023190016: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 2199023247360: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 4096: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  Couldn't find all physical volumes for volume group VolGroup00.
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  Couldn't find all physical volumes for volume group VolGroup00.
  Volume group "VolGroup00" not found
  --- Volume group ---
  VG Name               VolShared
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               250.00 GB
  PE Size               4.00 MB
  Total PE              63999
  Alloc PE / Size       63999 / 250.00 GB
  Free  PE / Size       0 / 0
  VG UUID               sWB5R2-i7B0-jlZE-ycMf-2xSZ-uj0S-c1ALim

  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               39.88 GB
  PE Size               32.00 MB
  Total PE              1276
  Alloc PE / Size       1274 / 39.81 GB
  Free  PE / Size       2 / 64.00 MB
  VG UUID               CHS2aG-lSql-vTHg-ySw3-EJJS-3Ay5-c4CWBQ

###############################################

# pvdisplay
  /dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 2199023190016: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 2199023247360: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 4096: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  --- Physical volume ---
  PV Name               /dev/sdg
  VG Name               VolEmailNew
  PV Size               1.20 TB / not usable 3.20 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              314572
  Free PE               0
  Allocated PE          314572
  PV UUID               dFy75M-zM83-XZMu-3HVF-Ryic-nYXI-Alvx6G

  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  Couldn't find all physical volumes for volume group VolGroup00.
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  Couldn't find all physical volumes for volume group VolGroup00.
  Volume group "VolGroup00" not found
  Skipping volume group VolGroup00
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  Couldn't find all physical volumes for volume group VolGroup00.
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'xr6ydW-QBUT-bk82-IDRy-CqTb-oAgo-1cJktu'.
  Couldn't find all physical volumes for volume group VolGroup00.
  Volume group "VolGroup00" not found
  Skipping volume group VolGroup00
  --- Physical volume ---
  PV Name               /dev/sde
  VG Name               VolShared
  PV Size               250.00 GB / not usable 4.00 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              63999
  Free PE               0
  Allocated PE          63999
  PV UUID               GdTAKf-lfiJ-K95X-FGPR-Hsle-LLEn-is5IqA

  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               VolGroup00
  PV Size               39.90 GB / not usable 20.79 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              1276
  Free PE               2
  Allocated PE          1274
  PV UUID               ADaA9S-G78u-H6dM-VVZw-8Y1n-ryOW-vawkjO
