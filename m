Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i72L6Ha13022
	for <linux-lvm@redhat.com>; Mon, 2 Aug 2004 17:06:17 -0400
Received: from hotmail.com (bay13-f18.bay13.hotmail.com [64.4.31.18])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i72L6AXn000856
	for <linux-lvm@redhat.com>; Mon, 2 Aug 2004 17:06:11 -0400
From: "Benjamin Runnels" <krav3n@hotmail.com>
Date: Mon, 02 Aug 2004 16:06:05 -0500
Mime-Version: 1.0
Message-ID: <BAY13-F18XEeeBuXayC000154bb@hotmail.com>
Subject: [linux-lvm] Failed volume resize through SuSE 9.1 YAST LVM module,
	need help recovering
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
Content-Type: text/plain; format="flowed"; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@redhat.com

I was using SuSE 9.1 LVM module in YAST to do some changes to my LVM2 setup. 
  I'm trying to get back to a state where I can access my data on either of 
the previous LV's I had.

I started up with a LVM volume consisting of 6 physical drives and 2 logical 
volumes.  One logical volume consisted of 2 non-striped disks.  The second 
volume consisted of 3 disks with 3 stripes.  I had just recently copied all 
data from the one LV to the other so they both have the same data.  I did 
see that the 3 striped disks had no partition created and were just using 
the whole disk.  I then deleted the 3 stripe LV and removed the physical 
volumes from the VG.  Next I created the LVM partitions on the 3 disks and 
added them back in to the VG.  Next I did a resize from 500GB to 1TB to fill 
the 6 physical volumes.  The filesystem being expanded was resiserfs.  At 
this point when I hit apply in the SuSE tool it gave me a failed message and 
then the computer locked soon after.

When I booted back up I get the following when I type pvscan:

p4:/var/log # pvscan
  Couldn't find device with uuid 'nVtBpy-Sz84-VU7C-5MXZ-6Wz5-iWeE-A665LM'.
  Couldn't find device with uuid 'lRHi9H-Ine1-1HIv-IAAP-swCJ-MHqa-ax5FPb'.
  Couldn't find device with uuid 'DeVrOI-LJVZ-YY8e-Bvta-0MoT-1qfY-XEDHED'.
  Warning: Volume Group solar is not consistent
  PV /dev/hde         VG solar   lvm2 [152.67 GB / 0    free]
  PV /dev/hdi         VG solar   lvm2 [152.67 GB / 0    free]
  PV /dev/hdh         VG solar   lvm2 [152.67 GB / 0    free]
  PV /dev/hdb1        VG solar   lvm2 [232.88 GB / 0    free]
  PV /dev/hdd1        VG solar   lvm2 [232.88 GB / 0    free]
  PV unknown device   VG solar   lvm2 [152.65 GB / 52.42 GB free]
  PV unknown device   VG solar   lvm2 [152.65 GB / 152.65 GB free]
  PV unknown device   VG solar   lvm2 [152.65 GB / 152.65 GB free]
  PV /dev/hdg1        VG solar   lvm2 [111.79 GB / 111.79 GB free]
  Total: 9 [1.46 TB] / in use: 9 [1.46 TB] / in no VG: 0 [0   ]

Here is my pvdisplay output:

p4:/var/log # pvdisplay
  Couldn't find device with uuid 'nVtBpy-Sz84-VU7C-5MXZ-6Wz5-iWeE-A665LM'.
  Couldn't find device with uuid 'lRHi9H-Ine1-1HIv-IAAP-swCJ-MHqa-ax5FPb'.
  Couldn't find device with uuid 'DeVrOI-LJVZ-YY8e-Bvta-0MoT-1qfY-XEDHED'.
  Warning: Volume Group solar is not consistent
  --- Physical volume ---
  PV Name               /dev/hde
  VG Name               solar
  PV Size               152.67 GB / not usable 0
  Allocatable           NO
  PE Size (KByte)       4096
  Total PE              39083
  Free PE               0
  Allocated PE          39083
  PV UUID               ttG4MJ-wpb1-PLOZ-gHM2-kFnI-4KtH-ppNmIy

  --- Physical volume ---
  PV Name               /dev/hdi
  VG Name               solar
  PV Size               152.67 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              39083
  Free PE               0
  Allocated PE          39083
  PV UUID               9V9dfp-jHbq-VHgx-pxOc-5QND-tiS0-5mwZ0s

  --- Physical volume ---
  PV Name               /dev/hdh
  VG Name               solar
  PV Size               152.67 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              39083
  Free PE               0
  Allocated PE          39083
  PV UUID               i6XBTt-olrg-Ge0T-0X7C-2O25-4mVc-TVXaQ0

  --- Physical volume ---
  PV Name               /dev/hdb1
  VG Name               solar
  PV Size               232.88 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              59618
  Free PE               0
  Allocated PE          59618
  PV UUID               tPQrLy-mog7-Vv2W-QnFv-NJxe-Aik3-N0HTEW

  --- Physical volume ---
  PV Name               /dev/hdd1
  VG Name               solar
  PV Size               232.88 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              59618
  Free PE               0
  Allocated PE          59618
  PV UUID               C6ng4M-T1fb-R33K-KBXZ-2t6A-XKF2-sjQ2Fs

  --- Physical volume ---
  PV Name               unknown device
  VG Name               solar
  PV Size               152.65 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              39079
  Free PE               13420
  Allocated PE          25659
  PV UUID               nVtBpy-Sz84-VU7C-5MXZ-6Wz5-iWeE-A665LM

  --- Physical volume ---
  PV Name               unknown device
  VG Name               solar
  PV Size               152.65 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              39079
  Free PE               39079
  Allocated PE          0
  PV UUID               lRHi9H-Ine1-1HIv-IAAP-swCJ-MHqa-ax5FPb

  --- Physical volume ---
  PV Name               unknown device
  VG Name               solar
  PV Size               152.65 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              39079
  Free PE               39079
  Allocated PE          0
  PV UUID               DeVrOI-LJVZ-YY8e-Bvta-0MoT-1qfY-XEDHED

  --- Physical volume ---
  PV Name               /dev/hdg1
  VG Name               solar
  PV Size               111.79 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              28618
  Free PE               28618
  Allocated PE          0
  PV UUID               LxzA9U-c7Kz-kGFv-IA6b-CrG9-eor4-VU8gE8

I have backups of the metadata for where I want to get back to and 
vgcfgrestore is reporting sucessfull but isn't getting me back to where I 
need to be :

p4:/etc/lvm/archive # cat solar_00002.vg
# Generated by LVM2: Mon Aug  2 10:58:52 2004

contents = "Text Format Volume Group"
version = 1

description = "Created *before* executing 'lvremove -f /dev/solar/JUPITER'"

creation_host = "p4"    # Linux p4 2.6.5-7.95-default #1 Thu Jul 1 15:23:45 
UTC 2004 i686
creation_time = 1091462332      # Mon Aug  2 10:58:52 2004

solar {
        id = "nEwuBX-aKsk-gFIb-DrqQ-zREN-33SE-R09Q4b"
        seqno = 10
        status = ["RESIZEABLE", "READ", "WRITE"]
        extent_size = 8192              # 4 Megabytes
        max_lv = 256
        max_pv = 256

        physical_volumes {

                pv0 {
                        id = "ttG4MJ-wpb1-PLOZ-gHM2-kFnI-4KtH-ppNmIy"
                        device = "/dev/hde"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 39083        # 152.668 Gigabytes
                }

                pv1 {
                        id = "9V9dfp-jHbq-VHgx-pxOc-5QND-tiS0-5mwZ0s"
                        device = "/dev/hdi"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 39083        # 152.668 Gigabytes
                }

                pv2 {
                        id = "i6XBTt-olrg-Ge0T-0X7C-2O25-4mVc-TVXaQ0"
                        device = "/dev/hdh"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 39083        # 152.668 Gigabytes
                }

                pv3 {
                        id = "tPQrLy-mog7-Vv2W-QnFv-NJxe-Aik3-N0HTEW"
                        device = "/dev/hdb1"    # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 59618        # 232.883 Gigabytes
                }

                pv4 {
                        id = "C6ng4M-T1fb-R33K-KBXZ-2t6A-XKF2-sjQ2Fs"
                        device = "/dev/hdd1"    # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 59618        # 232.883 Gigabytes
                }
        }

        logical_volumes {

                JUPITER {
                        id = "CiP29r-6DRj-ZlEp-tpml-xHka-7uq0-QArqh3"
                        status = ["READ", "WRITE", "VISIBLE"]
                        segment_count = 1

                        segment1 {
                                start_extent = 0
                                extent_count = 117249   # 458.004 Gigabytes

                                type = "striped"
                                stripe_count = 3
                                stripe_size = 8 # 4 Kilobytes

                                stripes = [
                                        "pv0", 0,
                                        "pv1", 0,
                                        "pv2", 0
                                ]
                        }
                }

                saturn {
                        id = "ypf8t0-ixkW-zkkn-zxV3-czUw-IV4k-YIdCi5"
                        status = ["READ", "WRITE", "VISIBLE"]
                        segment_count = 2

                        segment1 {
                                start_extent = 0
                                extent_count = 59618    # 232.883 Gigabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv3", 0
                                ]
                        }
                        segment2 {
                                start_extent = 59618
                                extent_count = 59618    # 232.883 Gigabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv4", 0
                                ]
                        }
                }
        }
}

_________________________________________________________________
Overwhelmed by debt? Find out how to �Dig Yourself Out of Debt� from MSN 
Money. http://special.msn.com/money/0407debt.armx
