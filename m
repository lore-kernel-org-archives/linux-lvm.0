Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3C6bvj18924
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2004 02:37:57 -0400
Received: from kingfisher.iss.nus.edu.sg (webmail.iss.nus.edu.sg
	[137.132.244.144])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3C6btMC021760
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2004 02:37:56 -0400
Message-ID: <OF16C58B11.B593D6A5-ON48256E74.001B7422@iss.nus.edu.sg>
From: zhimin@iss.nus.edu.sg
Date: Mon, 12 Apr 2004 14:37:10 +0800
MIME-Version: 1.0
Subject: [linux-lvm] vgscan error after resizing lv; can't boot now
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

I have a 72GB SCSI in RAID mirror. Using LVM version 1.0.3, Redhat 9.

Before resizing, the partitions are (snip from lvmdiskscan):

/dev/sda1  [      31.35 MB] Primary   [0xDE]  (Dell Utility)
/dev/sda2  [      19.53 GB] NTFS
/dev/sda3  [     298.08 MB] Primary  LINUX native partition [0x83]  (/boot)
/dev/sda4  [      48.51 GB] Primary  Windows98 extended partition [0x0F]
/dev/sda5  [       1.95 GB] Extended LINUX swap partition [0x82]
/dev/sda6  [       5.86 GB] Extended LVM partition [0x8E] (VG "Volume00")
/dev/sda7  [      40.69 GB] Extended LVM partition [0x8E] (VG "Volume00")

The vg "Volume00" contains PV /dev/sda6 and /dev/sda7, and the LVs (all
ext3) are:
/dev/Volume00/root        (/)
/dev/Volume00/home      (/home)
/dev/Volume00/opt         (/opt)
/dev/Volume00/tmp        (/tmp)
/dev/Volume00/usr         (/usr)
/dev/Volume00/usrlocal   (/usr/local)
/dev/Volume00/var         (/var)


I wanted to remove the NTFS partition, make /dev/sda2 as LVM partition, and
add it to "/dev/Volume00/opt". Here's what I did:

   boot to linux rescue mode
   # vgscan
   # vgchange -a y
   use fdisk to remove /dev/sda2, recreate /dev/sda2
   # mke2fs -j /dev/sda2
   use parted to set the partition type to LVM partition (0x8e)
   # vgextend Volume00 /dev/sda2
   Get the partition size (19.53GB) from # pvdisplay /dev/sda2
   # e2fsadm -L+19.53G /dev/Volume00/opt
   Still have 532MB as shown from # pvdisplay /dev/sda2
   # e2fsadm -L+532M /dev/Volume00/opt
   Step 11 produced error, showed many inode numbers, and asked if I wanted
   to fix for each inode number. I pressed a few 'y' and Ctrl-C to
   terminate.
   # e2fsck -y /dev/sda2  (to answer 'y' to all questions regarding fixing
   inode)
   reboot and got a kernel panic with the following msg:
   vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
   vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
   vgscan -- reading all physical volumes (this may take a while...)
   vgscan -- scanning for all active volume group(s) first
   vgscan -- reading data of volume group "Volume00" from physical
   volume(s)
   vgscan -- only found 6816 of 7424 LEs for LV /dev/Volume00/opt (2)
   vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
   data of volume group "Volume00" from physical volume(s)
   vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
   vgscan -- WARNING: This program does not do a VGDA backup of your volume
   group

I rebooted into rescue mode, and vgscan also gave the same error as above.
And "/etc/lvmtab" and "/etc/lvmtab.d" are blank.

How can I recover the VG? Is /dev/sda2 oversized by e2fsadm and therefore
mess up the vg?

Below is the selected output from pvdata for /dev/sda[2|6|7].

Thanks and regards,
zhimin



--- Physical volume ---
PV Name               /dev/sda2
VG Name               Volume00
PV Size               19.53 GB [40949685 secs] / NOT usable 4.19 MB [LVM:
147 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              4997
Free PE               133
Allocated PE          4864
PV UUID               yE0dbB-u9IA-lLE0-nxEb-Y65M-quqE-enahmK
pv_dev                   0:8
system_id                localhost.localdomain1081448932
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32896
lv_on_disk.base          45056
lv_on_disk.size          84296
pe_on_disk.base          131072
pe_on_disk.size          4259840


--- Physical volume ---
PV Name               /dev/sda6
VG Name               Volume00
PV Size               5.86 GB [12289662 secs] / NOT usable 4.19 MB [LVM:
133 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              1499
Free PE               0
Allocated PE          1499
PV UUID               lLUrL6-mDmn-rn0p-p2Tj-KOnH-RoQl-m03p8r
pv_dev                   0:8
system_id                kpapp11064550336
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32896
lv_on_disk.base          45056
lv_on_disk.size          84296
pe_on_disk.base          131072
pe_on_disk.size          4259840


--- Physical volume ---
PV Name               /dev/sda7
VG Name               Volume00
PV Size               40.69 GB [85337217 secs] / NOT usable 4.19 MB [LVM:
168 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                7
PE Size (KByte)       4096
Total PE              10416
Free PE               0
Allocated PE          10416
PV UUID               lG5j0E-Whql-dSsu-n2gV-rqRB-7dCc-rLE28Q
pv_dev                   0:8
system_id                localhost.localdomain1064490821
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32896
lv_on_disk.base          45056
lv_on_disk.size          84296
pe_on_disk.base          131072
pe_on_disk.size          4259840

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                7
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               66.06 GB
PE Size               4 MB
Total PE              16912
Alloc PE / Size       16779 / 65.54 GB
Free  PE / Size       133 / 532 MB
VG UUID               js4UPn-4GPE-I68L-Qjgb-88zN-4e7h-2PmoMC


--- List of logical volumes ---

pvdata -- logical volume "/dev/Volume00/root" at offset   0
pvdata -- logical volume "/dev/Volume00/home" at offset   1
pvdata -- logical volume "/dev/Volume00/opt" at offset   2
pvdata -- logical volume "/dev/Volume00/tmp" at offset   3
pvdata -- logical volume "/dev/Volume00/usr" at offset   4
pvdata -- logical volume "/dev/Volume00/usrlocal" at offset   5
pvdata -- logical volume "/dev/Volume00/var" at offset   6
pvdata -- logical volume struct at offset   7 is empty
pvdata -- logical volume struct at offset   8 is empty
...
...
pvdata -- logical volume struct at offset 254 is empty
pvdata -- logical volume struct at offset 255 is empty


--- List of physical extents --- (for /dev/sda2)

PE: 00000  LV: 003  LE: 02560
PE: 00001  LV: ---  LE: -----
PE: 00002  LV: 003  LE: 02562
PE: 00003  LV: 003  LE: 02563
PE: 00004  LV: 003  LE: 02564
PE: 00005  LV: 39914  LE: 16501
PE: 00006  LV: 003  LE: 00000
PE: 00007  LV: ---  LE: -----
PE: 00008  LV: 003  LE: 02568
...
...
PE: 00026  LV: 003  LE: 02586
PE: 00027  LV: ---  LE: -----
PE: 00028  LV: 003  LE: 02588
PE: 00029  LV: 003  LE: 02589
PE: 00030  LV: 003  LE: 02590
PE: 00031  LV: 003  LE: 02591
PE: 00032  LV: 003  LE: 02592
PE: 00033  LV: ---  LE: -----
PE: 00034  LV: 003  LE: 02594
PE: 00035  LV: 003  LE: 02595
PE: 00036  LV: 003  LE: 02596
PE: 00037  LV: 39914  LE: 16501
PE: 00038  LV: 003  LE: 00000
PE: 00039  LV: ---  LE: -----
PE: 00040  LV: 003  LE: 02600
...
...
PE: 00058  LV: 003  LE: 02618
PE: 00059  LV: ---  LE: -----
PE: 00060  LV: 003  LE: 02620
PE: 00061  LV: 003  LE: 02621
PE: 00062  LV: 003  LE: 02622
PE: 00063  LV: 003  LE: 02623
PE: 00064  LV: 003  LE: 02624
PE: 00065  LV: ---  LE: -----
PE: 00066  LV: 003  LE: 02626
PE: 00067  LV: 003  LE: 02627
PE: 00068  LV: 003  LE: 02628
PE: 00069  LV: 39914  LE: 16501
PE: 00070  LV: 003  LE: 00000
PE: 00071  LV: ---  LE: -----
PE: 00072  LV: 003  LE: 02632
PE: 00073  LV: 003  LE: 02633
...
...
PE: 04826  LV: 003  LE: 07386
PE: 04827  LV: ---  LE: -----
PE: 04828  LV: 003  LE: 07388
PE: 04829  LV: 003  LE: 07389
PE: 04830  LV: 003  LE: 07390
PE: 04831  LV: 003  LE: 07391
PE: 04832  LV: 003  LE: 07392
PE: 04833  LV: ---  LE: -----
PE: 04834  LV: 003  LE: 07394
PE: 04835  LV: 003  LE: 07395
PE: 04836  LV: 003  LE: 07396
PE: 04837  LV: 39915  LE: 16501
PE: 04838  LV: 003  LE: 00000
PE: 04839  LV: ---  LE: -----
PE: 04840  LV: 003  LE: 07400
PE: 04841  LV: 003  LE: 07401
PE: 04842  LV: 003  LE: 07402
PE: 04843  LV: 003  LE: 07403
PE: 04844  LV: 003  LE: 07404
PE: 04845  LV: 003  LE: 07405
PE: 04846  LV: 003  LE: 07406
PE: 04847  LV: 003  LE: 07407
PE: 04848  LV: 003  LE: 07408
PE: 04849  LV: 003  LE: 07409
PE: 04850  LV: 003  LE: 07410
PE: 04851  LV: 003  LE: 07411
PE: 04852  LV: 003  LE: 07412
PE: 04853  LV: 003  LE: 07413
PE: 04854  LV: 003  LE: 07414
PE: 04855  LV: 003  LE: 07415
PE: 04856  LV: 003  LE: 07416
PE: 04857  LV: 003  LE: 07417
PE: 04858  LV: 003  LE: 07418
PE: 04859  LV: ---  LE: -----
PE: 04860  LV: 003  LE: 07420
PE: 04861  LV: 003  LE: 07421
PE: 04862  LV: 003  LE: 07422
PE: 04863  LV: 003  LE: 07423
PE: 04864  LV: ---  LE: -----
PE: 04865  LV: ---  LE: -----
PE: 04866  LV: ---  LE: -----
PE: 04867  LV: ---  LE: -----
PE: 04868  LV: ---  LE: -----
PE: 04869  LV: ---  LE: -----
PE: 04870  LV: ---  LE: -----
PE: 04871  LV: ---  LE: -----
PE: 04872  LV: ---  LE: -----
PE: 04873  LV: ---  LE: -----
PE: 04874  LV: ---  LE: -----
PE: 04875  LV: ---  LE: -----
PE: 04876  LV: ---  LE: -----
PE: 04877  LV: ---  LE: -----
PE: 04878  LV: ---  LE: -----
PE: 04879  LV: ---  LE: -----
PE: 04880  LV: ---  LE: -----
PE: 04881  LV: ---  LE: -----
PE: 04882  LV: ---  LE: -----
PE: 04883  LV: ---  LE: -----
PE: 04884  LV: ---  LE: -----
PE: 04885  LV: ---  LE: -----
PE: 04886  LV: ---  LE: -----
PE: 04887  LV: ---  LE: -----
PE: 04888  LV: ---  LE: -----
PE: 04889  LV: ---  LE: -----
PE: 04890  LV: ---  LE: -----
PE: 04891  LV: ---  LE: -----
PE: 04892  LV: ---  LE: -----
PE: 04893  LV: ---  LE: -----
PE: 04894  LV: ---  LE: -----
PE: 04895  LV: ---  LE: -----
PE: 04896  LV: ---  LE: -----
PE: 04897  LV: ---  LE: -----
PE: 04898  LV: ---  LE: -----
PE: 04899  LV: ---  LE: -----
PE: 04900  LV: ---  LE: -----
PE: 04901  LV: ---  LE: -----
PE: 04902  LV: ---  LE: -----
PE: 04903  LV: ---  LE: -----
PE: 04904  LV: ---  LE: -----
PE: 04905  LV: ---  LE: -----
PE: 04906  LV: ---  LE: -----
PE: 04907  LV: ---  LE: -----
PE: 04908  LV: ---  LE: -----
PE: 04909  LV: ---  LE: -----
PE: 04910  LV: ---  LE: -----
PE: 04911  LV: ---  LE: -----
PE: 04912  LV: ---  LE: -----
PE: 04913  LV: ---  LE: -----
PE: 04914  LV: ---  LE: -----
PE: 04915  LV: ---  LE: -----
PE: 04916  LV: ---  LE: -----
PE: 04917  LV: ---  LE: -----
PE: 04918  LV: ---  LE: -----
PE: 04919  LV: ---  LE: -----
PE: 04920  LV: ---  LE: -----
PE: 04921  LV: ---  LE: -----
PE: 04922  LV: ---  LE: -----
PE: 04923  LV: ---  LE: -----
PE: 04924  LV: ---  LE: -----
PE: 04925  LV: ---  LE: -----
PE: 04926  LV: ---  LE: -----
PE: 04927  LV: ---  LE: -----
PE: 04928  LV: ---  LE: -----
PE: 04929  LV: ---  LE: -----
PE: 04930  LV: ---  LE: -----
PE: 04931  LV: ---  LE: -----
PE: 04932  LV: ---  LE: -----
PE: 04933  LV: ---  LE: -----
PE: 04934  LV: ---  LE: -----
PE: 04935  LV: ---  LE: -----
PE: 04936  LV: ---  LE: -----
PE: 04937  LV: ---  LE: -----
PE: 04938  LV: ---  LE: -----
PE: 04939  LV: ---  LE: -----
PE: 04940  LV: ---  LE: -----
PE: 04941  LV: ---  LE: -----
PE: 04942  LV: ---  LE: -----
PE: 04943  LV: ---  LE: -----
PE: 04944  LV: ---  LE: -----
PE: 04945  LV: ---  LE: -----
PE: 04946  LV: ---  LE: -----
PE: 04947  LV: ---  LE: -----
PE: 04948  LV: ---  LE: -----
PE: 04949  LV: ---  LE: -----
PE: 04950  LV: ---  LE: -----
PE: 04951  LV: ---  LE: -----
PE: 04952  LV: ---  LE: -----
PE: 04953  LV: ---  LE: -----
PE: 04954  LV: ---  LE: -----
PE: 04955  LV: ---  LE: -----
PE: 04956  LV: ---  LE: -----
PE: 04957  LV: ---  LE: -----
PE: 04958  LV: ---  LE: -----
PE: 04959  LV: ---  LE: -----
PE: 04960  LV: ---  LE: -----
PE: 04961  LV: ---  LE: -----
PE: 04962  LV: ---  LE: -----
PE: 04963  LV: ---  LE: -----
PE: 04964  LV: ---  LE: -----
PE: 04965  LV: ---  LE: -----
PE: 04966  LV: ---  LE: -----
PE: 04967  LV: ---  LE: -----
PE: 04968  LV: ---  LE: -----
PE: 04969  LV: ---  LE: -----
PE: 04970  LV: ---  LE: -----
PE: 04971  LV: ---  LE: -----
PE: 04972  LV: ---  LE: -----
PE: 04973  LV: ---  LE: -----
PE: 04974  LV: ---  LE: -----
PE: 04975  LV: ---  LE: -----
PE: 04976  LV: ---  LE: -----
PE: 04977  LV: ---  LE: -----
PE: 04978  LV: ---  LE: -----
PE: 04979  LV: ---  LE: -----
PE: 04980  LV: ---  LE: -----
PE: 04981  LV: ---  LE: -----
PE: 04982  LV: ---  LE: -----
PE: 04983  LV: ---  LE: -----
PE: 04984  LV: ---  LE: -----
PE: 04985  LV: ---  LE: -----
PE: 04986  LV: ---  LE: -----
PE: 04987  LV: ---  LE: -----
PE: 04988  LV: ---  LE: -----
PE: 04989  LV: ---  LE: -----
PE: 04990  LV: ---  LE: -----
PE: 04991  LV: ---  LE: -----
PE: 04992  LV: ---  LE: -----
PE: 04993  LV: ---  LE: -----
PE: 04994  LV: ---  LE: -----
PE: 04995  LV: ---  LE: -----
PE: 04996  LV: ---  LE: -----
