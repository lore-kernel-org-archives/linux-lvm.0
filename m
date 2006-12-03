Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB3527tF003884
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 00:02:07 -0500
Received: from mail-ihug.icp-qv1-irony1.iinet.net.au
	(ihug-mail.icp-qv1-irony1.iinet.net.au [203.59.1.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kB351LjV012337
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 00:01:22 -0500
From: "Tom" <trnews@bigpond.com>
Date: Sun, 3 Dec 2006 16:04:18 +1100
Message-ID: <000001c71698$7d270de0$c801a8c0@Laptop001>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Changed PV - How to Rebuild Linux LVM
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

Hi,

I have done something foolish and would like to know if my error is
recoverable.

I have a locally connected hardware raid controller (Adaptec 2410SA) which
running in Raid 5 with 3 x 500G drives and a total capacity of 935GB. The
array is recognised in the OS [FC5] as /dev/sdd. I have LVM running on
/dev/sdd with a Volume Group "NewVolGroup" and Logical Volume "NewLV"

I intended to do the following:

1. Add another drive to the hardware array expanding its capacity from
~936MB to ~1.36TB
2. In the hardware raid controller keep the existing logical device
[/dev/sdd] at 936MB and create a new logical device [dev/sde] to absorb the
spare capacity. 
3. Add a new PV /dev/sde to NewVolGroup 
4. Expand the capacity of NewVolGroup hopefully all without data loss.

What I actually did (in error) was extend the logical device in the raid
array to a total capacity of 1.36TB instead of adding the new capacity as a
new logical device. Now LVM is all screwed up as it is expecting to find a
PV of 936MB capacity not 1.36TB at /dev/sdd

My question is can I recover this LVM group or have I lost the data and need
to start again (groan). The volume group in question is
/dev/NewVolGroup/NewLV. The physical raid device is /dev/sdd. I am getting
device mapper errors left right and centre. I assume I need to restore the
PV metadata but maybe that is pointless given it is no longer pointing to a
volume of the same size. Failing a solution my next step is to fry the
partition and recreate the LVM.

Some detail follows. I have limited raid and lvm experience so any thoughts
welcome. Tom

##############################

[root ~]# mount /dev/NewVolGroup/NewLV /newdir
mount: you must specify the filesystem type

[root ~]# tail /var/log/messages
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 0
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 1
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 2
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 3
Nov 29 15:59:41 syd001 kernel: scsi 2:0:0:0: rejecting I/O to dead device
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 0
Nov 29 15:59:41 syd001 kernel: scsi 2:0:0:0: rejecting I/O to dead device
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 244173823
Nov 29 15:59:41 syd001 kernel: scsi 2:0:0:0: rejecting I/O to dead device
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 244173823
Nov 29 15:59:41 syd001 kernel: scsi 2:0:0:0: rejecting I/O to dead device
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 0
Nov 29 15:59:41 syd001 kernel: scsi 2:0:0:0: rejecting I/O to dead device
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 1
Nov 29 15:59:41 syd001 kernel: scsi 2:0:0:0: rejecting I/O to dead device
Nov 29 15:59:41 syd001 kernel: Buffer I/O error on device dm-2, logical
block 2
Nov 29 15:59:41 syd001 kernel: scsi 2:0:0:0: rejecting I/O to dead device


[root ~]# pvscan
/dev/dm-2: read failed after 0 of 4096 at 1000135917568: Input/output error
/dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
PV /dev/sdd VG NewVolGroup lvm2 [931.45 GB / 0 free]
PV /dev/hda2 VG VolGroup00 lvm2 [57.16 GB / 32.00 MB free]
Total: 2 [988.61 GB] / in use: 2 [988.61 GB] / in no VG: 0 [0 ]


[root ~]# df
Filesystem 1K-blocks Used Available Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
57008372 3856672 50209136 8% /
/dev/hda1 102454 41016 56148 43% /boot
/dev/shm 257400 0 257400 0% /dev/shm
/dev/md0 153834788 92448004 53572372 64% /home


[root ~]# /etc/fstab
.
/dev/NewVolGroup/NewLV /newdir ext3 rw,nosuid 0 0
.

[root ~]# pvs -a
/dev/dm-2: read failed after 0 of 4096 at 1000135917568: Input/output error
/dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
/dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
PV VG Fmt Attr PSize PFree
/dev/dm-0 -- 0 0
/dev/dm-1 -- 0 0
/dev/dm-2 -- 0 0
/dev/hda1 -- 0 0
/dev/hda2 VolGroup00 lvm2 a- 57.16G 32.00M
/dev/md0 -- 0 0
.
/dev/ramdisk -- 0 0
/dev/sdd NewVolGroup lvm2 a- 931.45G 0


[root ~]# lvs -a
/dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
LV VG Attr LSize Origin Snap% Move Log Copy%
NewLV NewVolGroup -wi-a- 931.45G
LogVol00 VolGroup00 -wi-ao 56.12G
LogVol01 VolGroup00 -wi-ao 1.00G


[root ~]# fdisk /dev/sdd
The number of cylinders for this disk is set to 182390.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/sdd: 1500.2 GB, 1500216557568 bytes
255 heads, 63 sectors/track, 182390 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System

Command (m for help):  

[root ~]# vi /etc/lvm/archive/NewVolGroup-00001.vg
# Generated by LVM2: Mon Mar 13 10:50:27 2006

contents = "Text Format Volume Group"
version = 1

description = "Created *before* executing 'lvcreate -l 238451 NewVolGroup -n
NewLV'"

creation_host = "<removed>"     # Linux <removed> 2.6.15-1.1833_FC4smp #1
SMP Wed Mar 1 23:56:51 EST 2006 i686
creation_time = 1142207427      # Mon Mar 13 10:50:27 2006

NewVolGroup {
        id = "<vol group id string>"
        seqno = 1
        status = ["RESIZEABLE", "READ", "WRITE"]
        extent_size = 8192              # 4 Megabytes
        max_lv = 0
        max_pv = 0

        physical_volumes {

                pv0 {
                        id = "<pv id string>"
                        device = "/dev/sdd"    # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 238451       # 931.449 Gigabytes
                }
        }

        logical_volumes {

                NewLV {
                        id = "<newlv id string>"
                        status = ["READ", "WRITE", "VISIBLE"]
                        segment_count = 1

                        segment1 {
                                start_extent = 0
                                extent_count = 238451   # 931.449 Gigabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv0", 0
                                ]
                        }
                }
        }
}
