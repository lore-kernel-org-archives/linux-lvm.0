From: Frank Benkstein <benkstein@math.tu-dresden.de>
Message-Id: <20031026170332.4e6679b2.benkstein@math.tu-dresden.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with pvmove and linux 2.6.0-test8, lvm2
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Oct 26 10:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

I'm having some problems with a newly created volume group.
I got 3 harddisks and I want to remove one of them so I just
use pvmove like with lvm version 1.

Here is the output from pvmove:

thriller ~ # pvmove -i 5 -v /dev/hda12
    Finding volume group "data"
    Archiving volume group "data" metadata.
    Creating logical volume pvmove0
    Moving 274 extents of logical volume data/lvol1
    Found volume group "data"
    Found volume group "data"
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/data"
    Found volume group "data"
    Found volume group "data"
    Loading data-pvmove0
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'data-pvmove0'.
  ABORTING: Temporary mirror activation failed.
    Found volume group "data"
    Loading data-lvol1
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'data-lvol1'.

Now any access on the device blocks until I do "pvmove --abort" which I
think is very bad. "pvmove --abort" says:

thriller ~ # pvmove --abort
  Unable to unlock logical volume "pvmove0"

"lvm version" says:

  LVM version:     2.00.07 (2003-09-16)
  Library version: 1.00.05-ioctl-cvs (2003-09-01)
  Driver version:  4.0.0

Finally "vgdisplay -v" says:

thriller ~ # vgdisplay -v
    Finding all volume groups
    Finding volume group "data"
  --- Volume group ---
  VG Name               data
  System ID
  Format                lvm2
  Metadata Areas        25
  Metadata Sequence No  30
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Open LV               0
  Max PV                256
  Cur PV                25
  Act PV                25
  VG Size               235.44 GB
  PE Size               32.00 MB
  Total PE              7534
  Alloc PE / Size       5399 / 168.72 GB
  Free  PE / Size       2135 / 66.72 GB
  VG UUID               uxxCUu-7LkL-dnPb-OgxY-rXXa-N75i-YDi8dM

  --- Logical volume ---
  LV Name                /dev/data/lvol1
  VG Name                data
  LV UUID                BmlFlW-5UHo-zsMp-01fY-I7kL-6ve7-eHGC7U
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                168.72 GB
  Current LE             5399
  Segments               18
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:0

  --- Physical volumes ---
  PV Name               /dev/hdc9
  PV UUID               waZaU5-0Oui-ZTsT-upUq-FDmk-iIQb-h1xxTM
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc10
  PV UUID               7PvjC2-j1le-Oj0z-L01d-p8Ot-9Erv-FPwoSE
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc11
  PV UUID               4EtKur-Ya21-MQeP-jtWD-2f7P-aMUf-aXAH6s
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc12
  PV UUID               hCj4YJ-BuwB-Fu2i-7ZW2-mYc7-2OPv-9lchLA
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc13
  PV UUID               vXhcMs-2oIN-qZvx-uG8t-L0ZV-Aiwd-hJBfiW
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc14
  PV UUID               fQ3Lyh-34x8-4yNk-yKvs-9nlG-Lc4k-6f9jm4
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc15
  PV UUID               I512OV-W7OL-8X7e-LCxc-6VQ2-GOax-mtFcqo
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc16
  PV UUID               Vd65BG-zK4K-S86B-2tWN-KB7e-gk18-reD6w3
  PV Status             allocatable
  Total PE / Free PE    306 / 0

  PV Name               /dev/hdc6
  PV UUID               9HO3jv-JCEt-gaCz-89HZ-STOt-BuBM-yXqL3p
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc7
  PV UUID               MK5WTc-tKJg-3wxR-F7NG-wYGr-cfR7-ZLGQqe
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdd16
  PV UUID               YVU22m-AKxJ-Uxut-mKa6-4oCb-DqLW-wT3aW6
  PV Status             allocatable
  Total PE / Free PE    306 / 0

  PV Name               /dev/hda12
  PV UUID               Pz5Gr1-t7bZ-EDBL-0IB7-G2p4-XPrh-shBjz5
  PV Status             NOT allocatable
  Total PE / Free PE    274 / 0

  PV Name               /dev/hda13
  PV UUID               atxcfU-VP2K-HnLw-Olrd-EuiF-EuWn-7eFaDz
  PV Status             NOT allocatable
  Total PE / Free PE    243 / 0

  PV Name               /dev/hdd10
  PV UUID               FFvVPn-dJry-uEvQ-SuvK-3246-K7VA-o08L6n
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdd11
  PV UUID               2Ew4mp-BFoY-i4Md-oRP3-hr6W-0PTo-Ga6fKj
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdd12
  PV UUID               es2HMH-mvUB-3BJF-T4PK-vZTq-8Csk-wht77p
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdd13
  PV UUID               vZ7FO6-0PoC-Y53O-LZTz-gJWq-wVe5-2j9K4S
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdd14
  PV UUID               MrKuVR-VksZ-DgRX-yS3d-Qwhx-gqHd-S05tPu
  PV Status             allocatable
  Total PE / Free PE    305 / 0

  PV Name               /dev/hdc8
  PV UUID               QysxPp-6OLy-Nojy-FUPE-yFzW-HSbI-1Zf9xb
  PV Status             allocatable
  Total PE / Free PE    305 / 305

  PV Name               /dev/hdd5
  PV UUID               GMEynu-r6a6-LsNN-E8ne-36GG-Fmqy-fZLsNZ
  PV Status             allocatable
  Total PE / Free PE    305 / 305

  PV Name               /dev/hdd6
  PV UUID               oj4UnV-PZV2-K454-WjtL-Nqr9-d6YH-I6BlxK
  PV Status             allocatable
  Total PE / Free PE    305 / 305

  PV Name               /dev/hdd7
  PV UUID               mKIqwS-q2YQ-KgUA-1HDs-5I5E-cyT1-8nEcE7
  PV Status             allocatable
  Total PE / Free PE    305 / 305

  PV Name               /dev/hdd8
  PV UUID               t4dgxB-qm81-H8MK-FYhd-Pukf-OgIj-1GLivd
  PV Status             allocatable
  Total PE / Free PE    305 / 305

  PV Name               /dev/hdd9
  PV UUID               1uDaGG-plfm-5v34-945e-cWex-ZhHO-yJ3LCC
  PV Status             allocatable
  Total PE / Free PE    305 / 305

  PV Name               /dev/hdd15
  PV UUID               QkdcqL-B53G-JbSW-w9Rd-1n0i-qGWO-0KMxSa
  PV Status             allocatable
  Total PE / Free PE    305 / 305

Is this a bug in lvm2 or devicemapper or a kernel bug? Or am I doing
something wrong?

TIA and bye

Frank Benkstein.
