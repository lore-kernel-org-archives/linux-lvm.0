Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5TF88022793
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2004 11:08:08 -0400
Received: from alpha.xerox.com (alpha.Xerox.COM [13.1.64.93])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i5TF82Xn014383
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2004 11:08:02 -0400
Message-ID: <40E185C7.8060606@parc.com>
Date: Tue, 29 Jun 2004 08:07:51 PDT
From: John Uhlig <juhlig@parc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem creating lvm2 snapshot volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: sunsa@parc.com

Hi.

We are trying to install lvm2 volumes on our fedora core 2 (kernel 
2.6.6-1.435smp)
Dell 2650 poweredge fileservers. Following the instructions at:
    http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html
...do not work and the following error occurs:

[juhlig@aragami ~]$ lvcreate -L592M -s -n dbbackup /dev/VG_aragami_1/LV_1
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'VG_aragami_1-dbbackup'.
  Problem reactivating origin LV_1

This error causes the LV Status to go to "suspended" and the snapshot 
volume cannot
be removed without rebooting the system. If anyone can help us resolve 
this problem
it would be greatly appreciated as we are under pressure to bring these 
servers on-line
ASAP.

thanks, John Uhlig

------------------------------------------
test config volume details below:
-----------------------------------------

BEFORE snapshot lvcreate.
------------------------------------
[juhlig@aragami ~]$ vgdisplay
  --- Volume group ---
  VG Name               VG_aragami_1
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  39
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
  Open LV               0
  Max PV                255
  Cur PV                1
  Act PV                1
  VG Size               273.43 GB
  PE Size               4.00 MB
  Total PE              69999
  Alloc PE / Size       25600 / 100.00 GB
  Free  PE / Size       44399 / 173.43 GB
  VG UUID               J7Z9Fw-oool-q9tk-Dzqy-LOwu-Hv8N-MWv6vH
                                                                                                       

[juhlig@aragami ~]$ lvdisplay
  --- Logical volume ---
  LV Name                /dev/VG_aragami_1/LV_1
  VG Name                VG_aragami_1
  LV UUID                t4Xi36-MIe2-zYIM-BN6F-gpwC-1Umr-xeMEtE
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                100.00 GB
  Current LE             25600
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           253:1
---------------------------------------
AFTER snapshot create error:
---------------------------------------
[juhlig@aragami ~]$ lvdisplay
  --- Logical volume ---
  LV Name                /dev/VG_aragami_1/LV_1
  VG Name                VG_aragami_1
  LV UUID                t4Xi36-MIe2-zYIM-BN6F-gpwC-1Umr-xeMEtE
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/VG_aragami_1/dbbackup [INACTIVE]
  LV Status              suspended
  # open                 0
  LV Size                100.00 GB
  Current LE             25600
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           253:1
   
  --- Logical volume ---
  LV Name                /dev/VG_aragami_1/dbbackup
  VG Name                VG_aragami_1
  LV UUID                vDdYvc-Kfo0-au04-n4k2-c2UY-ikSC-3CEzwv
  LV Write Access        read/write
  LV snapshot status     INACTIVE destination for /dev/VG_aragami_1/LV_1
  LV Status              available
  # open                 0
  LV Size                100.00 GB
  Current LE             25600
  Segments               1
  Snapshot chunk size    8.00 KB
  Allocated to snapshot  100.00%
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           253:3
