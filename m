From: Rupa Schomaker <rupa-list@rupa.com>
Message-ID: <m33cb3n9vp.fsf@shakti.rupa.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM and MD disagree about PV size
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
Date: Mon Dec 29 07:51:36 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----

Kernel: 2.4.20, stock lvm, debian system with xfs patches.

MD shows the right size of around 80G, LVM thinks the PV is much
larger ().

1) How can I fix this without destroying the data?
2) How can I avoid this in the future.

I still have a spare 45G drive in the system, so I can add it as a PV,
pvmove the data, destroy md6, recreate it, pvmove the data back and
see that all is ok.

In fact, I think I'll just go ahead and do so...

mdadm --detail /dev/md/6:

/dev/md/6:
        Version : 00.90.00
  Creation Time : Sun Dec 28 17:33:02 2003
     Raid Level : raid1
     Array Size : 80003584 (76.30 GiB 81.92 GB)
    Device Size : 80003584 (76.30 GiB 81.92 GB)
   Raid Devices : 2
  Total Devices : 2
Preferred Minor : 6
    Persistence : Superblock is persistent

    Update Time : Sun Dec 28 17:33:02 2003
          State : dirty, no-errors
 Active Devices : 2
Working Devices : 2
 Failed Devices : 0
  Spare Devices : 0


    Number   Major   Minor   RaidDevice State
       0      33        3        0      active sync   /dev/ide/host2/bus0/target0/lun0/part3
       1      57        3        1      active sync   /dev/ide/host4/bus1/target0/lun0/part3
           UUID : 8c24286e:6f758b5a:8d6c9575:d22731fa
         Events : 0.1


pvdisplay /dev/md/6:

- --- Physical volume ---
PV Name               /dev/md/6
VG Name               shaktivg
PV Size               148.80 GB [312062464 secs] / NOT usable 4.31 MB [LVM: 272 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                10
PE Size (KByte)       4096
Total PE              38092
Free PE               28645
Allocated PE          9447
PV UUID               jeVyqI-g2RE-xHF6-Nfo5-rT40-rGYK-65iJZp

- -- 
- -rupa

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3ia
Charset: noconv
Comment: Processed by Mailcrypt 3.5.7, an Emacs/PGP interface

iQEVAwUBP/APNXHDM4ucEopdAQGpoQgAsDptX0/pSxJFPDY9R9i2EbVK+D6O0ieY
Rg0436j8STek0AcF/CyvG6B0p8yYWoaubtDOVMNv0EdLU0LzIU72SstgOLIeQWXO
+oLHTgvDcd72gjjSrVJ0tKhubBLSz6EcfjbqM5wpyCDoP52/GyF9YPZllgahpH0p
ayecX1Doi53OOFdSn2T2IIVn0NfXniEhprC17pPzinSfjZsSTsdk6EG70ZTFLkhA
MzzCw/avSp4HphmMZ1j+iJ2QgFQd07ksTwKcqxBuzVIAWN50ox+RepZeUVhKalfz
9R0JRho58HZVRo2OB6B9xnpukE6y28Bl56S4VVD5Zv53rIxUp82vIg==
=s/SN
-----END PGP SIGNATURE-----
