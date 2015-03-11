Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2BI2xNM005960
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 14:03:00 -0400
Received: from mail.webx.cz (mail.webx.cz [109.123.222.201])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2BI2rd8027157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 14:02:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.webx.cz (Postfix) with ESMTP id 3B5623FF97
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 19:02:52 +0100 (CET)
Received: from mail.webx.cz ([127.0.0.1])
	by localhost (mail1.webx.cz [127.0.0.1]) (amavisd-new, port 10042)
	with LMTP id Of975Ez8qz-9 for <linux-lvm@redhat.com>;
	Wed, 11 Mar 2015 19:02:52 +0100 (CET)
Received: from libor-nb.localnet (remote.bcom.cz [88.208.120.34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.webx.cz (Postfix) with ESMTPSA id B36F43FF60
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 19:02:51 +0100 (CET)
From: Libor =?utf-8?B?S2xlcMOhxI0=?= <libor.klepac@bcom.cz>
Date: Wed, 11 Mar 2015 19:02:50 +0100
Message-ID: <1745753.WN3NrQid4L@libor-nb>
In-Reply-To: <21760.26103.886193.529742@quad.stoffel.home>
References: <2134825.VZEVSUbKJK@libor-nb> <1586988.am8mh8BZtm@libor-nb>
	<21760.26103.886193.529742@quad.stoffel.home>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart7558436.vHAPFn1hbS"
Content-Transfer-Encoding: 7Bit
Subject: Re: [linux-lvm] Removing disk from raid LVM
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

This is a multi-part message in MIME format.

--nextPart7558436.vHAPFn1hbS
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello John,
here it comes.
I think i have all PV not on top of raw partitions. System is on mdraid and backup PVs are directly on disks, without partitions.

I think that LVs:
lvAmandaDaily01old
lvBackupPc
lvBackupRsync
are old damaged LVs, i left for experimenting on.

These LVs are some broken parts of old raid?
lvAmandaDailyAuS01_rimage_2_extracted
lvAmandaDailyAuS01_rmeta_2_extracted

LV lvAmandaDailyBlS01 is also from before crash, but i didn't try to repair it (i think)

Libor


---------------
cat /proc/mdstat (mdraid used only for OS)
Personalities : [raid1] [raid10] [raid6] [raid5] [raid4] 
md1 : active raid1 sde3[0] sdf3[1]
      487504704 blocks super 1.2 [2/2] [UU]
      bitmap: 1/4 pages [4KB], 65536KB chunk

md0 : active raid1 sde2[0] sdf2[1]
      249664 blocks super 1.2 [2/2] [UU]
      bitmap: 0/1 pages [0KB], 65536KB chunk
-----------------

cat /proc/partitions       
major minor  #blocks  name

   8       80  488386584 sdf
   8       81     498688 sdf1
   8       82     249856 sdf2
   8       83  487635968 sdf3
   8       48 2930266584 sdd
   8       64  488386584 sde
   8       65     498688 sde1
   8       66     249856 sde2
   8       67  487635968 sde3
   8        0 2930266584 sda
   8       16 2930266584 sdb
   9        0     249664 md0
   9        1  487504704 md1
 253        0   67108864 dm-0
 253        1    3903488 dm-1
   8       96 2930266584 sdg
 253      121       4096 dm-121
 253      122   34955264 dm-122
 253      123       4096 dm-123
 253      124   34955264 dm-124
 253      125       4096 dm-125
 253      126   34955264 dm-126
 253      127       4096 dm-127
 253      128   34955264 dm-128
 253      129  104865792 dm-129
 253       11       4096 dm-11
 253       12  209715200 dm-12
 253       13       4096 dm-13
 253       14  209715200 dm-14
 253       15       4096 dm-15
 253       16  209715200 dm-16
 253       17       4096 dm-17
 253       18  209715200 dm-18
 253       19  629145600 dm-19
 253       38       4096 dm-38
 253       39  122335232 dm-39
 253       40       4096 dm-40
 253       41  122335232 dm-41
 253       42       4096 dm-42
 253       43  122335232 dm-43
 253       44       4096 dm-44
 253       45  122335232 dm-45
 253       46  367005696 dm-46
 253       47       4096 dm-47
 253       48   16777216 dm-48
 253       49       4096 dm-49
 253       50   16777216 dm-50
 253       51   16777216 dm-51
 253       52       4096 dm-52
 253       53    4194304 dm-53
 253       54       4096 dm-54
 253       55    4194304 dm-55
 253       56    4194304 dm-56
 253       57       4096 dm-57
 253       58   11186176 dm-58
 253       59       4096 dm-59
 253       60   11186176 dm-60
 253       61       4096 dm-61
 253       62   11186176 dm-62
 253       63       4096 dm-63
 253       64   11186176 dm-64
 253       65   33558528 dm-65
 253        2       4096 dm-2
 253        3  125829120 dm-3
 253        4       4096 dm-4
 253        5  125829120 dm-5
 253        6       4096 dm-6
 253        7  125829120 dm-7
 253        8       4096 dm-8
 253        9  125829120 dm-9
 253       10  377487360 dm-10
 253       20       4096 dm-20
 253       21   12582912 dm-21
 253       22       4096 dm-22
 253       23   12582912 dm-23
 253       24       4096 dm-24
 253       25   12582912 dm-25
 253       26       4096 dm-26
 253       27   12582912 dm-27
 253       28   37748736 dm-28
 253       66       4096 dm-66
 253       67  122335232 dm-67
 253       68       4096 dm-68
 253       69  122335232 dm-69
 253       70       4096 dm-70
 253       71  122335232 dm-71
 253       72       4096 dm-72
 253       73  122335232 dm-73
 253       74  367005696 dm-74
 253       31  416489472 dm-31
 253       32       4096 dm-32
 253       75   34955264 dm-75
 253       78       4096 dm-78
 253       79   34955264 dm-79
 253       80       4096 dm-80
 253       81   34955264 dm-81
 253       82  104865792 dm-82
 253       92       4096 dm-92
 253       93   17477632 dm-93
 253       94       4096 dm-94
 253       95   17477632 dm-95
 253       96       4096 dm-96
 253       97   17477632 dm-97
 253       98       4096 dm-98
 253       99   17477632 dm-99
 253      100   52432896 dm-100
 253       76       4096 dm-76
 253       77   50331648 dm-77
 253       83       4096 dm-83
 253       84   50331648 dm-84
 253       85       4096 dm-85
 253       86   50331648 dm-86
 253       87       4096 dm-87
 253       88   50331648 dm-88
 253       89  150994944 dm-89
 253       90       4096 dm-90
 253       91   44740608 dm-91
 253      101       4096 dm-101
 253      102   44740608 dm-102
 253      103       4096 dm-103
 253      104   44740608 dm-104
 253      105       4096 dm-105
 253      106   44740608 dm-106
 253      107  134221824 dm-107

-------------------------------
pvs -v 
    Scanning for physical volume names
  PV         VG         Fmt  Attr PSize   PFree DevSize PV UUID                               
  /dev/md1   vgPecDisk1 lvm2 a--  464.92g    0  464.92g MLqS2b-iuvt-7ES8-rPHo-SPwm-Liiz-TUtHLI
  /dev/sda   vgPecDisk2 lvm2 a--    2.73t 1.20t   2.73t 0vECyp-EndR-oD66-va0g-0ORd-cS7E-7rMylw
  /dev/sdb   vgPecDisk2 lvm2 a--    2.73t 1.20t   2.73t 5ZhwR7-AClb-oEsi-s2Zi-xouM-en0Z-ZQ0fwr
  /dev/sdd   vgPecDisk2 lvm2 a--    2.73t 2.03t   2.73t RI3dhw-Ns0t-BLyN-BQd5-vDx0-ucHb-X8ntkO
  /dev/sdg   vgPecDisk2 lvm2 a--    2.73t 1.23t   2.73t yaohhB-dkF6-rQRk-dBsL-JHS7-8KOo-eYSqOj

-------------------------------

pvdisplay
  --- Physical volume ---
  PV Name               /dev/md1
  VG Name               vgPecDisk1
  PV Size               464.92 GiB / not usable 1.81 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              119019
  Free PE               0
  Allocated PE          119019
  PV UUID               MLqS2b-iuvt-7ES8-rPHo-SPwm-Liiz-TUtHLI
   
  --- Physical volume ---
  PV Name               /dev/sdd
  VG Name               vgPecDisk2
  PV Size               2.73 TiB / not usable 2.00 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              715396
  Free PE               531917
  Allocated PE          183479
  PV UUID               RI3dhw-Ns0t-BLyN-BQd5-vDx0-ucHb-X8ntkO
   
  --- Physical volume ---
  PV Name               /dev/sda
  VG Name               vgPecDisk2
  PV Size               2.73 TiB / not usable 1022.00 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              714884
  Free PE               315671
  Allocated PE          399213
  PV UUID               0vECyp-EndR-oD66-va0g-0ORd-cS7E-7rMylw
   
  --- Physical volume ---
  PV Name               /dev/sdb
  VG Name               vgPecDisk2
  PV Size               2.73 TiB / not usable 1022.00 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              714884
  Free PE               315671
  Allocated PE          399213
  PV UUID               5ZhwR7-AClb-oEsi-s2Zi-xouM-en0Z-ZQ0fwr
   
  --- Physical volume ---
  PV Name               /dev/sdg
  VG Name               vgPecDisk2
  PV Size               2.73 TiB / not usable 2.00 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              715396
  Free PE               321305
  Allocated PE          394091
  PV UUID               yaohhB-dkF6-rQRk-dBsL-JHS7-8KOo-eYSqOj

-----------------------------

vgs -v 
 VG         Attr   Ext   #PV #LV #SN VSize   VFree VG UUID                               
  vgPecDisk1 wz--n- 4.00m   1   3   0 464.92g    0  Dtbxaa-KySR-R1VY-Wliy-Lqba-HQyt-7PYmnv
  vgPecDisk2 wz--n- 4.00m   4  20   0  10.91t 5.66t 0Ok7sE-Eo1O-pbuT-LX3D-dluI-25dw-cr9DY8

--------------------------------

vgdisplay
  --- Volume group ---
  VG Name               vgPecDisk1
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  9
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               464.92 GiB
  PE Size               4.00 MiB
  Total PE              119019
  Alloc PE / Size       119019 / 464.92 GiB
  Free  PE / Size       0 / 0   
  VG UUID               Dtbxaa-KySR-R1VY-Wliy-Lqba-HQyt-7PYmnv
   
  --- Volume group ---
  VG Name               vgPecDisk2
  System ID             
  Format                lvm2
  Metadata Areas        8
  Metadata Sequence No  476
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                20
  Open LV               13
  Max PV                0
  Cur PV                4
  Act PV                4
  VG Size               10.91 TiB
  PE Size               4.00 MiB
  Total PE              2860560
  Alloc PE / Size       1375996 / 5.25 TiB
  Free  PE / Size       1484564 / 5.66 TiB
  VG UUID               0Ok7sE-Eo1O-pbuT-LX3D-dluI-25dw-cr9DY8

------------------------------

lvs -v
    Finding all logical volumes
  LV                                           VG         #Seg Attr     LSize   Maj Min KMaj KMin Pool Origin Data%  Meta%  Move Copy%  Log Convert LV UUID                               
  lvSwap                                       vgPecDisk1    1 -wi-ao--   3.72g  -1  -1 253  1                                                      Jo9ie0-jKfo-Ks6Q-TsgK-skvM-qJio-Ar5WWe
  lvSystem                                     vgPecDisk1    1 -wi-ao--  64.00g  -1  -1 253  0                                                      ZEdPxL-Wn5s-QapH-BzdZ-4Os7-eV0g-SVwNoD
  lvTmp                                        vgPecDisk1    1 -wi-ao-- 397.20g  -1  -1 253  31                                                     JjgNKC-ctgq-VDz3-BJbn-HZHd-W3s2-XWxUT9
  lvAmandaDaily01                              vgPecDisk2    1 rwi-aor- 100.01g  -1  -1 253  82                                                     lrBae6-Yj5V-OZUT-Z4Qz-umsu-6SGe-35SJfK
  lvAmandaDaily01old                           vgPecDisk2    1 rwi---r-   1.09t  -1  -1 -1   -1                                                     nofmj3-ntya-cbDi-ZjZH-zBKV-K1PA-Sw0Pvq
  lvAmandaDailyAuS01                    vgPecDisk2    1 rwi-aor- 360.00g  -1  -1 253  10                                                     fW0QrZ-sa2J-21nM-0qDv-nTUx-Eomx-3KTocB
  lvAmandaDailyAuS01_rimage_2_extracted vgPecDisk2    1 vwi---v- 120.00g  -1  -1 -1   -1                                                     Ii0Hyk-A2d3-PUC3-CMZL-CqDY-qFLs-yuDKwq
  lvAmandaDailyAuS01_rmeta_2_extracted  vgPecDisk2    1 vwi---v-   4.00m  -1  -1 -1   -1                                                     WNq913-IM82-Cnh0-dmPb-BzWE-KJNP-H84dmS
  lvAmandaDailyBlS01                    vgPecDisk2    1 rwi---r- 320.00g  -1  -1 -1   -1                                                     fJTCsr-MF1S-jAXo-7SHc-Beyf-ICMV-LJQpnt
  lvAmandaDailyElme01                          vgPecDisk2    1 rwi-aor- 144.00g  -1  -1 253  89                                                     1Q0Sre-CnV1-wqPZ-9bf0-qnW6-6nqt-NOlxyp
  lvAmandaDailyEl01                          vgPecDisk2    1 rwi-aor- 350.00g  -1  -1 253  74                                                     Sni0fy-Bf1V-AKXS-Qfd1-qmFC-MUwY-xgCw22
  lvAmandaHoldingDisk                          vgPecDisk2    1 rwi-aor-  36.00g  -1  -1 253  28                                                     e5pr0g-cH2I-dMHd-lwsi-JRR0-0D0P-67eXLY
  lvBackupElme2                                vgPecDisk2    1 rwi-aor- 350.00g  -1  -1 253  46                                                     Ee9RAX-ycZ8-PNzl-MUvg-VjPl-8vfW-BjfaQ9
  lvBackupPc                                   vgPecDisk2    1 rwi---r- 640.01g  -1  -1 -1   -1                                                     KaX4sX-CJsU-L5Ac-85OA-74HT-JX3L-nFxFTZ
  lvBackupPc2                                  vgPecDisk2    1 rwi-aor- 600.00g  -1  -1 253  19                                                     2o9JWs-2hZT-4uMO-WJTd-ByMH-ugd9-3iGfke
  lvBackupRsync                                vgPecDisk2    1 rwi---r- 256.01g  -1  -1 -1   -1                                                     cQOavD-85Pj-yu6X-yTpS-qxxT-XBWV-WIISKQ
  lvBackupRsync2                               vgPecDisk2    1 rwi-aor- 100.01g  -1  -1 253  129                                                    S4frRu-dVgG-Pomd-5niY-bLzd-S2wq-KxMPhM
  lvBackupRsyncCCCrossserver                   vgPecDisk2    1 rwi-aor-  50.00g  -1  -1 253  100                                                    ytiis9-T1Pq-FAjT-MGhn-2nKd-zHFk-ROzeUf
  lvBackupVokapo                               vgPecDisk2    1 rwi-aor- 128.00g  -1  -1 253  107                                                    pq67wa-NjPs-PwEx-rs1G-cZxf-s5xI-wkB9Ag
  lvLXCElMysqlSlave                          vgPecDisk2    1 rwi-aor-  32.00g  -1  -1 253  65                                                     2fh6ch-2y5s-N3Ua-1Q1u-XSfx-JViq-x6dwut
  lvLXCIcinga                                  vgPecDisk2    1 rwi---r-  32.00g  -1  -1 -1   -1                                                     2kYSPl-HONv-zuf0-dhQn-1xI3-YVuU-brbumU
  lvLXCJabber                                  vgPecDisk2    1 rwi-aom-   4.00g  -1  -1 253  56                                  100.00             AAWI1f-fYFO-2ewM-YvfP-AdC4-bXd8-k2NiZZ
  lvLXCWebxMysqlSlave                          vgPecDisk2    1 rwi-aom-  16.00g  -1  -1 253  51                                  100.00             m2dzFv-axwm-2Ne6-kJkN-a3zo-E8Ai-qViTae

-----------------------------
lvdisplay
  --- Logical volume ---
  LV Path                /dev/vgPecDisk1/lvSwap
  LV Name                lvSwap
  VG Name                vgPecDisk1
  LV UUID                Jo9ie0-jKfo-Ks6Q-TsgK-skvM-qJio-Ar5WWe
  LV Write Access        read/write
  LV Creation host, time pec, 2014-02-20 12:22:52 +0100
  LV Status              available
  # open                 2
  LV Size                3.72 GiB
  Current LE             953
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk1/lvSystem
  LV Name                lvSystem
  VG Name                vgPecDisk1
  LV UUID                ZEdPxL-Wn5s-QapH-BzdZ-4Os7-eV0g-SVwNoD
  LV Write Access        read/write
  LV Creation host, time pec, 2014-02-20 12:23:03 +0100
  LV Status              available
  # open                 1
  LV Size                64.00 GiB
  Current LE             16384
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk1/lvTmp
  LV Name                lvTmp
  VG Name                vgPecDisk1
  LV UUID                JjgNKC-ctgq-VDz3-BJbn-HZHd-W3s2-XWxUT9
  LV Write Access        read/write
  LV Creation host, time pec, 2014-06-10 06:47:09 +0200
  LV Status              available
  # open                 1
  LV Size                397.20 GiB
  Current LE             101682
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:31
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvLXCWebxMysqlSlave
  LV Name                lvLXCWebxMysqlSlave
  VG Name                vgPecDisk2
  LV UUID                m2dzFv-axwm-2Ne6-kJkN-a3zo-E8Ai-qViTae
  LV Write Access        read/write
  LV Creation host, time pec, 2014-02-21 18:15:22 +0100
  LV Status              available
  # open                 1
  LV Size                16.00 GiB
  Current LE             4096
  Mirrored volumes       2
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:51
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDaily01old
  LV Name                lvAmandaDaily01old
  VG Name                vgPecDisk2
  LV UUID                nofmj3-ntya-cbDi-ZjZH-zBKV-K1PA-Sw0Pvq
  LV Write Access        read/write
  LV Creation host, time pec, 2014-02-24 21:03:49 +0100
  LV Status              NOT available
  LV Size                1.09 TiB
  Current LE             286722
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDailyBlS01
  LV Name                lvAmandaDailyBlS01
  VG Name                vgPecDisk2
  LV UUID                fJTCsr-MF1S-jAXo-7SHc-Beyf-ICMV-LJQpnt
  LV Write Access        read/write
  LV Creation host, time pec, 2014-03-18 08:50:38 +0100
  LV Status              NOT available
  LV Size                320.00 GiB
  Current LE             81921
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvLXCJabber
  LV Name                lvLXCJabber
  VG Name                vgPecDisk2
  LV UUID                AAWI1f-fYFO-2ewM-YvfP-AdC4-bXd8-k2NiZZ
  LV Write Access        read/write
  LV Creation host, time pec, 2014-03-20 15:19:54 +0100
  LV Status              available
  # open                 1
  LV Size                4.00 GiB
  Current LE             1024
  Mirrored volumes       2
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:56
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvBackupPc
  LV Name                lvBackupPc
  VG Name                vgPecDisk2
  LV UUID                KaX4sX-CJsU-L5Ac-85OA-74HT-JX3L-nFxFTZ
  LV Write Access        read/write
  LV Creation host, time pec, 2014-07-01 13:22:50 +0200
  LV Status              NOT available
  LV Size                640.01 GiB
  Current LE             163842
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvLXCIcinga
  LV Name                lvLXCIcinga
  VG Name                vgPecDisk2
  LV UUID                2kYSPl-HONv-zuf0-dhQn-1xI3-YVuU-brbumU
  LV Write Access        read/write
  LV Creation host, time pec, 2014-08-13 19:04:28 +0200
  LV Status              NOT available
  LV Size                32.00 GiB
  Current LE             8193
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvBackupRsync
  LV Name                lvBackupRsync
  VG Name                vgPecDisk2
  LV UUID                cQOavD-85Pj-yu6X-yTpS-qxxT-XBWV-WIISKQ
  LV Write Access        read/write
  LV Creation host, time pec, 2014-09-17 14:49:57 +0200
  LV Status              NOT available
  LV Size                256.01 GiB
  Current LE             65538
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDaily01
  LV Name                lvAmandaDaily01
  VG Name                vgPecDisk2
  LV UUID                lrBae6-Yj5V-OZUT-Z4Qz-umsu-6SGe-35SJfK
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-04 08:26:46 +0100
  LV Status              available
  # open                 1
  LV Size                100.01 GiB
  Current LE             25602
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:82
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvBackupRsync2
  LV Name                lvBackupRsync2
  VG Name                vgPecDisk2
  LV UUID                S4frRu-dVgG-Pomd-5niY-bLzd-S2wq-KxMPhM
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-04 19:17:17 +0100
  LV Status              available
  # open                 1
  LV Size                100.01 GiB
  Current LE             25602
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:129
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvBackupPc2
  LV Name                lvBackupPc2
  VG Name                vgPecDisk2
  LV UUID                2o9JWs-2hZT-4uMO-WJTd-ByMH-ugd9-3iGfke
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-04 23:13:51 +0100
  LV Status              available
  # open                 1
  LV Size                600.00 GiB
  Current LE             153600
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:19
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvBackupElme2
  LV Name                lvBackupElme2
  VG Name                vgPecDisk2
  LV UUID                Ee9RAX-ycZ8-PNzl-MUvg-VjPl-8vfW-BjfaQ9
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-04 23:21:44 +0100
  LV Status              available
  # open                 1
  LV Size                350.00 GiB
  Current LE             89601
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:46
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvLXCElMysqlSlave
  LV Name                lvLXCElMysqlSlave
  VG Name                vgPecDisk2
  LV UUID                2fh6ch-2y5s-N3Ua-1Q1u-XSfx-JViq-x6dwut
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-05 16:36:42 +0100
  LV Status              available
  # open                 1
  LV Size                32.00 GiB
  Current LE             8193
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:65
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDailyAuS01_rimage_2_extracted
  LV Name                lvAmandaDailyAuS01_rimage_2_extracted
  VG Name                vgPecDisk2
  LV UUID                Ii0Hyk-A2d3-PUC3-CMZL-CqDY-qFLs-yuDKwq
  LV Write Access        read/write
  LV Creation host, time pec, 2014-02-25 09:55:03 +0100
  LV Status              NOT available
  LV Size                120.00 GiB
  Current LE             30721
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDailyAuS01_rmeta_2_extracted
  LV Name                lvAmandaDailyAuS01_rmeta_2_extracted
  VG Name                vgPecDisk2
  LV UUID                WNq913-IM82-Cnh0-dmPb-BzWE-KJNP-H84dmS
  LV Write Access        read/write
  LV Creation host, time pec, 2014-02-25 09:55:03 +0100
  LV Status              NOT available
  LV Size                4.00 MiB
  Current LE             1
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDailyAuS01
  LV Name                lvAmandaDailyAuS01
  VG Name                vgPecDisk2
  LV UUID                fW0QrZ-sa2J-21nM-0qDv-nTUx-Eomx-3KTocB
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-05 17:49:47 +0100
  LV Status              available
  # open                 1
  LV Size                360.00 GiB
  Current LE             92160
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:10
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaHoldingDisk
  LV Name                lvAmandaHoldingDisk
  VG Name                vgPecDisk2
  LV UUID                e5pr0g-cH2I-dMHd-lwsi-JRR0-0D0P-67eXLY
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-05 18:48:36 +0100
  LV Status              available
  # open                 1
  LV Size                36.00 GiB
  Current LE             9216
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:28
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDailyEl01
  LV Name                lvAmandaDailyEl01
  VG Name                vgPecDisk2
  LV UUID                Sni0fy-Bf1V-AKXS-Qfd1-qmFC-MUwY-xgCw22
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-05 19:00:26 +0100
  LV Status              available
  # open                 1
  LV Size                350.00 GiB
  Current LE             89601
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:74
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvBackupRsyncCCCrossserver
  LV Name                lvBackupRsyncCCCrossserver
  VG Name                vgPecDisk2
  LV UUID                ytiis9-T1Pq-FAjT-MGhn-2nKd-zHFk-ROzeUf
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-05 22:39:09 +0100
  LV Status              available
  # open                 1
  LV Size                50.00 GiB
  Current LE             12801
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:100
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvAmandaDailyElme01
  LV Name                lvAmandaDailyElme01
  VG Name                vgPecDisk2
  LV UUID                1Q0Sre-CnV1-wqPZ-9bf0-qnW6-6nqt-NOlxyp
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-05 22:49:05 +0100
  LV Status              available
  # open                 1
  LV Size                144.00 GiB
  Current LE             36864
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:89
   
  --- Logical volume ---
  LV Path                /dev/vgPecDisk2/lvBackupVokapo
  LV Name                lvBackupVokapo
  VG Name                vgPecDisk2
  LV UUID                pq67wa-NjPs-PwEx-rs1G-cZxf-s5xI-wkB9Ag
  LV Write Access        read/write
  LV Creation host, time pec, 2015-03-05 22:54:23 +0100
  LV Status              available
  # open                 1
  LV Size                128.00 GiB
  Current LE             32769
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:107

-----------------------






> Libor,
> 
> Can you please post the output of the following commands, so that we
> can understand your setup and see what's really going on here.  More
> info is better than less!
> 
>   cat /proc/partitions
>   pvs -v
>   pvdisplay
>   vgs -v
>   vgdisplay
>   lvs -v
>   lvdisplay
> 
> and if you have PVs which are NOT on top of raw partitions, then
> include cat /proc/mdstat as well, or whatever device tool you have.
> 
> Basically, we're trying to understand how you configured your setup
> from the physical disks, to the volumes on them.  I don't care much
> about the filesystems, they're going to be inside individual LVs I
> assume.
> 
> John
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--nextPart7558436.vHAPFn1hbS
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/=
REC-html40/strict.dtd">
<html><head><meta name=3D"qrichtext" content=3D"1" /><style type=3D"tex=
t/css">
p, li { white-space: pre-wrap; }
</style></head><body style=3D" font-family:'DejaVu Sans'; font-size:9pt=
; font-weight:400; font-style:normal;">
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Hel=
lo John,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">her=
e it comes.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I t=
hink i have all PV not on top of raw partitions. System is on mdraid an=
d backup PVs are directly on disks, without partitions.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I t=
hink that LVs:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvA=
mandaDaily01old</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvB=
ackupPc</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvB=
ackupRsync</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">are=
 old damaged LVs, i left for experimenting on.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">The=
se LVs are some broken parts of old raid?</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvA=
mandaDailyAuS01_rimage_2_extracted</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvA=
mandaDailyAuS01_rmeta_2_extracted</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">LV =
lvAmandaDailyBlS01 is also from before crash, but i didn't try to repai=
r it (i think)</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Lib=
or</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
------------</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">cat=
 /proc/mdstat (mdraid used only for OS)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Per=
sonalities : [raid1] [raid10] [raid6] [raid5] [raid4] </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">md1=
 : active raid1 sde3[0] sdf3[1]</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
   487504704 blocks super 1.2 [2/2] [UU]</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
   bitmap: 1/4 pages [4KB], 65536KB chunk</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">md0=
 : active raid1 sde2[0] sdf2[1]</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
   249664 blocks super 1.2 [2/2] [UU]</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
   bitmap: 0/1 pages [0KB], 65536KB chunk</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
--------------</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">cat=
 /proc/partitions       </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">maj=
or minor  #blocks  name</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       80  488386584 sdf</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       81     498688 sdf1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       82     249856 sdf2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       83  487635968 sdf3</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       48 2930266584 sdd</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       64  488386584 sde</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       65     498688 sde1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       66     249856 sde2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       67  487635968 sde3</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8        0 2930266584 sda</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       16 2930266584 sdb</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
9        0     249664 md0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
9        1  487504704 md1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        0   67108864 dm-0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        1    3903488 dm-1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
8       96 2930266584 sdg</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      121       4096 dm-121</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      122   34955264 dm-122</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      123       4096 dm-123</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      124   34955264 dm-124</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      125       4096 dm-125</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      126   34955264 dm-126</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      127       4096 dm-127</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      128   34955264 dm-128</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      129  104865792 dm-129</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       11       4096 dm-11</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       12  209715200 dm-12</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       13       4096 dm-13</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       14  209715200 dm-14</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       15       4096 dm-15</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       16  209715200 dm-16</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       17       4096 dm-17</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       18  209715200 dm-18</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       19  629145600 dm-19</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       38       4096 dm-38</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       39  122335232 dm-39</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       40       4096 dm-40</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       41  122335232 dm-41</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       42       4096 dm-42</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       43  122335232 dm-43</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       44       4096 dm-44</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       45  122335232 dm-45</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       46  367005696 dm-46</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       47       4096 dm-47</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       48   16777216 dm-48</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       49       4096 dm-49</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       50   16777216 dm-50</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       51   16777216 dm-51</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       52       4096 dm-52</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       53    4194304 dm-53</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       54       4096 dm-54</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       55    4194304 dm-55</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       56    4194304 dm-56</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       57       4096 dm-57</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       58   11186176 dm-58</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       59       4096 dm-59</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       60   11186176 dm-60</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       61       4096 dm-61</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       62   11186176 dm-62</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       63       4096 dm-63</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       64   11186176 dm-64</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       65   33558528 dm-65</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        2       4096 dm-2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        3  125829120 dm-3</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        4       4096 dm-4</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        5  125829120 dm-5</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        6       4096 dm-6</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        7  125829120 dm-7</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        8       4096 dm-8</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3        9  125829120 dm-9</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       10  377487360 dm-10</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       20       4096 dm-20</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       21   12582912 dm-21</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       22       4096 dm-22</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       23   12582912 dm-23</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       24       4096 dm-24</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       25   12582912 dm-25</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       26       4096 dm-26</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       27   12582912 dm-27</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       28   37748736 dm-28</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       66       4096 dm-66</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       67  122335232 dm-67</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       68       4096 dm-68</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       69  122335232 dm-69</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       70       4096 dm-70</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       71  122335232 dm-71</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       72       4096 dm-72</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       73  122335232 dm-73</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       74  367005696 dm-74</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       31  416489472 dm-31</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       32       4096 dm-32</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       75   34955264 dm-75</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       78       4096 dm-78</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       79   34955264 dm-79</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       80       4096 dm-80</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       81   34955264 dm-81</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       82  104865792 dm-82</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       92       4096 dm-92</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       93   17477632 dm-93</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       94       4096 dm-94</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       95   17477632 dm-95</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       96       4096 dm-96</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       97   17477632 dm-97</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       98       4096 dm-98</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       99   17477632 dm-99</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      100   52432896 dm-100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       76       4096 dm-76</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       77   50331648 dm-77</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       83       4096 dm-83</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       84   50331648 dm-84</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       85       4096 dm-85</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       86   50331648 dm-86</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       87       4096 dm-87</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       88   50331648 dm-88</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       89  150994944 dm-89</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       90       4096 dm-90</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3       91   44740608 dm-91</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      101       4096 dm-101</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      102   44740608 dm-102</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      103       4096 dm-103</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      104   44740608 dm-104</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      105       4096 dm-105</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      106   44740608 dm-106</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> 25=
3      107  134221824 dm-107</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
----------------------------</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">pvs=
 -v </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
 Scanning for physical volume names</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V         VG         Fmt  Attr PSize   PFree DevSize PV UUID           =
                    </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  /=
dev/md1   vgPecDisk1 lvm2 a--  464.92g    0  464.92g MLqS2b-iuvt-7ES8-r=
PHo-SPwm-Liiz-TUtHLI</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  /=
dev/sda   vgPecDisk2 lvm2 a--    2.73t 1.20t   2.73t 0vECyp-EndR-oD66-v=
a0g-0ORd-cS7E-7rMylw</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  /=
dev/sdb   vgPecDisk2 lvm2 a--    2.73t 1.20t   2.73t 5ZhwR7-AClb-oEsi-s=
2Zi-xouM-en0Z-ZQ0fwr</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  /=
dev/sdd   vgPecDisk2 lvm2 a--    2.73t 2.03t   2.73t RI3dhw-Ns0t-BLyN-B=
Qd5-vDx0-ucHb-X8ntkO</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  /=
dev/sdg   vgPecDisk2 lvm2 a--    2.73t 1.23t   2.73t yaohhB-dkF6-rQRk-d=
BsL-JHS7-8KOo-eYSqOj</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
----------------------------</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">pvd=
isplay</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Physical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Name               /dev/md1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name               vgPecDisk1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Size               464.92 GiB / not usable 1.81 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocatable           yes (but full)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
E Size               4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  T=
otal PE              119019</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ree PE               0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocated PE          119019</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V UUID               MLqS2b-iuvt-7ES8-rPHo-SPwm-Liiz-TUtHLI</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Physical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Name               /dev/sdd</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name               vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Size               2.73 TiB / not usable 2.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocatable           yes </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
E Size               4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  T=
otal PE              715396</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ree PE               531917</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocated PE          183479</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V UUID               RI3dhw-Ns0t-BLyN-BQd5-vDx0-ucHb-X8ntkO</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Physical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Name               /dev/sda</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name               vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Size               2.73 TiB / not usable 1022.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocatable           yes </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
E Size               4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  T=
otal PE              714884</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ree PE               315671</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocated PE          399213</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V UUID               0vECyp-EndR-oD66-va0g-0ORd-cS7E-7rMylw</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Physical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Name               /dev/sdb</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name               vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Size               2.73 TiB / not usable 1022.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocatable           yes </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
E Size               4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  T=
otal PE              714884</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ree PE               315671</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocated PE          399213</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V UUID               5ZhwR7-AClb-oEsi-s2Zi-xouM-en0Z-ZQ0fwr</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Physical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Name               /dev/sdg</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name               vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V Size               2.73 TiB / not usable 2.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocatable           yes </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
E Size               4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  T=
otal PE              715396</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ree PE               321305</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocated PE          394091</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
V UUID               yaohhB-dkF6-rQRk-dBsL-JHS7-8KOo-eYSqOj</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
--------------------------</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">vgs=
 -v </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> VG=
         Attr   Ext   #PV #LV #SN VSize   VFree VG UUID                =
               </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  v=
gPecDisk1 wz--n- 4.00m   1   3   0 464.92g    0  Dtbxaa-KySR-R1VY-Wliy-=
Lqba-HQyt-7PYmnv</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  v=
gPecDisk2 wz--n- 4.00m   4  20   0  10.91t 5.66t 0Ok7sE-Eo1O-pbuT-LX3D-=
dluI-25dw-cr9DY8</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
-----------------------------</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">vgd=
isplay</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Volume group ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name               vgPecDisk1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
ystem ID             </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ormat                lvm2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
etadata Areas        1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
etadata Sequence No  9</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Access             read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Status             resizable</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
AX LV                0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
ur LV                3</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  O=
pen LV               3</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
ax PV                0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
ur PV                1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
ct PV                1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Size               464.92 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
E Size               4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  T=
otal PE              119019</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
lloc PE / Size       119019 / 464.92 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ree  PE / Size       0 / 0   </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G UUID               Dtbxaa-KySR-R1VY-Wliy-Lqba-HQyt-7PYmnv</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Volume group ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name               vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
ystem ID             </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ormat                lvm2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
etadata Areas        8</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
etadata Sequence No  476</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Access             read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Status             resizable</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
AX LV                0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
ur LV                20</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  O=
pen LV               13</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
ax PV                0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
ur PV                4</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
ct PV                4</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Size               10.91 TiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  P=
E Size               4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  T=
otal PE              2860560</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
lloc PE / Size       1375996 / 5.25 TiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  F=
ree  PE / Size       1484564 / 5.66 TiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G UUID               0Ok7sE-Eo1O-pbuT-LX3D-dluI-25dw-cr9DY8</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
---------------------------</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvs=
 -v</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
 Finding all logical volumes</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V                                           VG         #Seg Attr     LS=
ize   Maj Min KMaj KMin Pool Origin Data%  Meta%  Move Copy%  Log Conve=
rt LV UUID                               </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vSwap                                       vgPecDisk1    1 -wi-ao--   =
3.72g  -1  -1 253  1                                                   =
   Jo9ie0-jKfo-Ks6Q-TsgK-skvM-qJio-Ar5WWe</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vSystem                                     vgPecDisk1    1 -wi-ao--  6=
4.00g  -1  -1 253  0                                                   =
   ZEdPxL-Wn5s-QapH-BzdZ-4Os7-eV0g-SVwNoD</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vTmp                                        vgPecDisk1    1 -wi-ao-- 39=
7.20g  -1  -1 253  31                                                  =
   JjgNKC-ctgq-VDz3-BJbn-HZHd-W3s2-XWxUT9</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDaily01                              vgPecDisk2    1 rwi-aor- 10=
0.01g  -1  -1 253  82                                                  =
   lrBae6-Yj5V-OZUT-Z4Qz-umsu-6SGe-35SJfK</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDaily01old                           vgPecDisk2    1 rwi---r-   =
1.09t  -1  -1 -1   -1                                                  =
   nofmj3-ntya-cbDi-ZjZH-zBKV-K1PA-Sw0Pvq</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDailyAuS01                    vgPecDisk2    1 rwi-aor- 360.00g  =
-1  -1 253  10                                                     fW0Q=
rZ-sa2J-21nM-0qDv-nTUx-Eomx-3KTocB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDailyAuS01_rimage_2_extracted vgPecDisk2    1 vwi---v- 120.00g  =
-1  -1 -1   -1                                                     Ii0H=
yk-A2d3-PUC3-CMZL-CqDY-qFLs-yuDKwq</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDailyAuS01_rmeta_2_extracted  vgPecDisk2    1 vwi---v-   4.00m  =
-1  -1 -1   -1                                                     WNq9=
13-IM82-Cnh0-dmPb-BzWE-KJNP-H84dmS</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDailyBlS01                    vgPecDisk2    1 rwi---r- 320.00g  =
-1  -1 -1   -1                                                     fJTC=
sr-MF1S-jAXo-7SHc-Beyf-ICMV-LJQpnt</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDailyElme01                          vgPecDisk2    1 rwi-aor- 14=
4.00g  -1  -1 253  89                                                  =
   1Q0Sre-CnV1-wqPZ-9bf0-qnW6-6nqt-NOlxyp</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaDailyEl01                          vgPecDisk2    1 rwi-aor- 350.=
00g  -1  -1 253  74                                                    =
 Sni0fy-Bf1V-AKXS-Qfd1-qmFC-MUwY-xgCw22</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vAmandaHoldingDisk                          vgPecDisk2    1 rwi-aor-  3=
6.00g  -1  -1 253  28                                                  =
   e5pr0g-cH2I-dMHd-lwsi-JRR0-0D0P-67eXLY</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vBackupElme2                                vgPecDisk2    1 rwi-aor- 35=
0.00g  -1  -1 253  46                                                  =
   Ee9RAX-ycZ8-PNzl-MUvg-VjPl-8vfW-BjfaQ9</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vBackupPc                                   vgPecDisk2    1 rwi---r- 64=
0.01g  -1  -1 -1   -1                                                  =
   KaX4sX-CJsU-L5Ac-85OA-74HT-JX3L-nFxFTZ</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vBackupPc2                                  vgPecDisk2    1 rwi-aor- 60=
0.00g  -1  -1 253  19                                                  =
   2o9JWs-2hZT-4uMO-WJTd-ByMH-ugd9-3iGfke</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vBackupRsync                                vgPecDisk2    1 rwi---r- 25=
6.01g  -1  -1 -1   -1                                                  =
   cQOavD-85Pj-yu6X-yTpS-qxxT-XBWV-WIISKQ</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vBackupRsync2                               vgPecDisk2    1 rwi-aor- 10=
0.01g  -1  -1 253  129                                                 =
   S4frRu-dVgG-Pomd-5niY-bLzd-S2wq-KxMPhM</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vBackupRsyncCCCrossserver                   vgPecDisk2    1 rwi-aor-  5=
0.00g  -1  -1 253  100                                                 =
   ytiis9-T1Pq-FAjT-MGhn-2nKd-zHFk-ROzeUf</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vBackupVokapo                               vgPecDisk2    1 rwi-aor- 12=
8.00g  -1  -1 253  107                                                 =
   pq67wa-NjPs-PwEx-rs1G-cZxf-s5xI-wkB9Ag</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vLXCElMysqlSlave                          vgPecDisk2    1 rwi-aor-  32.=
00g  -1  -1 253  65                                                    =
 2fh6ch-2y5s-N3Ua-1Q1u-XSfx-JViq-x6dwut</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vLXCIcinga                                  vgPecDisk2    1 rwi---r-  3=
2.00g  -1  -1 -1   -1                                                  =
   2kYSPl-HONv-zuf0-dhQn-1xI3-YVuU-brbumU</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vLXCJabber                                  vgPecDisk2    1 rwi-aom-   =
4.00g  -1  -1 253  56                                  100.00          =
   AAWI1f-fYFO-2ewM-YvfP-AdC4-bXd8-k2NiZZ</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  l=
vLXCWebxMysqlSlave                          vgPecDisk2    1 rwi-aom-  1=
6.00g  -1  -1 253  51                                  100.00          =
   m2dzFv-axwm-2Ne6-kJkN-a3zo-E8Ai-qViTae</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
--------------------------</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvd=
isplay</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk1/lvSwap</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvSwap</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                Jo9ie0-jKfo-Ks6Q-TsgK-skvM-qJio-Ar5WWe</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-02-20 12:22:52 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                3.72 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             953</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     256</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk1/lvSystem</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvSystem</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                ZEdPxL-Wn5s-QapH-BzdZ-4Os7-eV0g-SVwNoD</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-02-20 12:23:03 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                64.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             16384</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     256</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk1/lvTmp</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvTmp</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                JjgNKC-ctgq-VDz3-BJbn-HZHd-W3s2-XWxUT9</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-06-10 06:47:09 +0200</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                397.20 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             101682</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     256</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:31</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvLXCWebxMysqlSlave</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvLXCWebxMysqlSlave</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                m2dzFv-axwm-2Ne6-kJkN-a3zo-E8Ai-qViTae</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-02-21 18:15:22 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                16.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             4096</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
irrored volumes       2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     256</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:51</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDaily01old</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDaily01old</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                nofmj3-ntya-cbDi-ZjZH-zBKV-K1PA-Sw0Pvq</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-02-24 21:03:49 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              NOT available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                1.09 TiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             286722</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDailyBlS01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDailyBlS01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                fJTCsr-MF1S-jAXo-7SHc-Beyf-ICMV-LJQpnt</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-03-18 08:50:38 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              NOT available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                320.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             81921</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvLXCJabber</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvLXCJabber</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                AAWI1f-fYFO-2ewM-YvfP-AdC4-bXd8-k2NiZZ</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-03-20 15:19:54 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                4.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  M=
irrored volumes       2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     256</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:56</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvBackupPc</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvBackupPc</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                KaX4sX-CJsU-L5Ac-85OA-74HT-JX3L-nFxFTZ</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-07-01 13:22:50 +0200</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              NOT available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                640.01 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             163842</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvLXCIcinga</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvLXCIcinga</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                2kYSPl-HONv-zuf0-dhQn-1xI3-YVuU-brbumU</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-08-13 19:04:28 +0200</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              NOT available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                32.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             8193</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvBackupRsync</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvBackupRsync</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                cQOavD-85Pj-yu6X-yTpS-qxxT-XBWV-WIISKQ</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-09-17 14:49:57 +0200</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              NOT available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                256.01 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             65538</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDaily01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDaily01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                lrBae6-Yj5V-OZUT-Z4Qz-umsu-6SGe-35SJfK</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-04 08:26:46 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                100.01 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             25602</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:82</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvBackupRsync2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvBackupRsync2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                S4frRu-dVgG-Pomd-5niY-bLzd-S2wq-KxMPhM</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-04 19:17:17 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                100.01 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             25602</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:129</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvBackupPc2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvBackupPc2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                2o9JWs-2hZT-4uMO-WJTd-ByMH-ugd9-3iGfke</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-04 23:13:51 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                600.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             153600</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:19</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvBackupElme2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvBackupElme2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                Ee9RAX-ycZ8-PNzl-MUvg-VjPl-8vfW-BjfaQ9</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-04 23:21:44 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                350.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             89601</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:46</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvLXCElMysqlSlave</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvLXCElMysqlSlave</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                2fh6ch-2y5s-N3Ua-1Q1u-XSfx-JViq-x6dwut</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-05 16:36:42 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                32.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             8193</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:65</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDailyAuS01_rimage_2_extra=
cted</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDailyAuS01_rimage_2_extracted</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                Ii0Hyk-A2d3-PUC3-CMZL-CqDY-qFLs-yuDKwq</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-02-25 09:55:03 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              NOT available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                120.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             30721</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDailyAuS01_rmeta_2_extrac=
ted</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDailyAuS01_rmeta_2_extracted</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                WNq913-IM82-Cnh0-dmPb-BzWE-KJNP-H84dmS</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2014-02-25 09:55:03 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              NOT available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                4.00 MiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDailyAuS01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDailyAuS01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                fW0QrZ-sa2J-21nM-0qDv-nTUx-Eomx-3KTocB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-05 17:49:47 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                360.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             92160</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:10</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaHoldingDisk</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaHoldingDisk</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                e5pr0g-cH2I-dMHd-lwsi-JRR0-0D0P-67eXLY</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-05 18:48:36 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                36.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             9216</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:28</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDailyEl01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDailyEl01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                Sni0fy-Bf1V-AKXS-Qfd1-qmFC-MUwY-xgCw22</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-05 19:00:26 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                350.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             89601</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:74</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvBackupRsyncCCCrossserver</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvBackupRsyncCCCrossserver</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                ytiis9-T1Pq-FAjT-MGhn-2nKd-zHFk-ROzeUf</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-05 22:39:09 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                50.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             12801</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvAmandaDailyElme01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvAmandaDailyElme01</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                1Q0Sre-CnV1-wqPZ-9bf0-qnW6-6nqt-NOlxyp</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-05 22:49:05 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                144.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             36864</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:89</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">   =
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
-- Logical volume ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Path                /dev/vgPecDisk2/lvBackupVokapo</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Name                lvBackupVokapo</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  V=
G Name                vgPecDisk2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V UUID                pq67wa-NjPs-PwEx-rs1G-cZxf-s5xI-wkB9Ag</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Write Access        read/write</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Creation host, time pec, 2015-03-05 22:54:23 +0100</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Status              available</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  #=
 open                 1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
V Size                128.00 GiB</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  C=
urrent LE             32769</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  S=
egments               1</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  A=
llocation             inherit</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  R=
ead ahead sectors     auto</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  -=
 currently set to     1024</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  B=
lock device           253:107</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">---=
--------------------</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br=
 /></p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br=
 />Dne St 11.=C2=A0b=C5=99ezna=C2=A02015 11:57:43, John Stoffel napsal(=
a):</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Can you please post the output of the following commands, so that we<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; can understand your setup and see what's really going on here.  More<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; info is better than less!</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
;   cat /proc/partitions</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
;   pvs -v</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
;   pvdisplay</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
;   vgs -v</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
;   vgdisplay</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
;   lvs -v</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
;   lvdisplay</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; and if you have PVs which are NOT on top of raw partitions, then</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; include cat /proc/mdstat as well, or whatever device tool you have.</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Basically, we're trying to understand how you configured your setup</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; from the physical disks, to the volumes on them.  I don't care much</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; about the filesystems, they're going to be inside individual LVs I</p=
>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; assume.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; John</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; _______________________________________________</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; linux-lvm mailing list</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; linux-lvm@redhat.com</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; https://www.redhat.com/mailman/listinfo/linux-lvm</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p></body></html>
--nextPart7558436.vHAPFn1hbS--
