Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0I9BAO22180
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 04:11:10 -0500
Received: from mailgate3.cinetic.de (mailgate3.cinetic.de [217.72.192.164])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0I9B4Xv003722
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 04:11:05 -0500
Received: from pcnocjb.int.cinetic.de (pcnocjb.int.cinetic.de [10.1.0.163])
	by mailgate3.cinetic.de (8.11.6p2/8.11.2/SuSE Linux 8.11.0-0.4) with
	ESMTP id j0I9AwK20310
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 10:10:58 +0100
Date: Tue, 18 Jan 2005 10:10:59 +0100
From: Jens Beyer <jbe@webde-ag.de>
Message-ID: <20050118091059.GC27553@pcnocjb.dlan.cinetic.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Data corruption on large, multi-device filesystem
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi,

I get severe data corruption using an logical volume larger 
then 2 TB. Finally I was able to track down device mappper or 
lvm as last suspects.

My first guess where problems with filesystems but recently 
I tried using md / RAID0 - and didnt have any errors of any 
kind. I would prefer using LVM since we want to use snapshots 
to simplify backup, but I have no clue how to further debug.

On a system with 3 devices each larger then 1 TB and a logical 
volume striped over all devices some data gets corrupted while 
written (or read ?) from disk. This shows up as md5 or crc sums 
changes on sequenced reads of files if filecache is not involved 
(by reading a lot data). 
On ext2fs there are error while writing data (kernel: EXT2-fs error 
(device dm-0): ext2_new_block: Allocating block in system zone -
 block = 722239884), on other filesystems successive fsck/repairs 
shows corrupted metadata.  

The system setup is 
- Three 29160B Adaptec scsi-controller each with one 
  ATA-Disk Raid sized 1240 GB, (dual PIII, HP DL360 G2, 2 GB Ram)
- Volume group over all three devices, logical volume stripped 
  full size (3.7 TB)
- Filesystem either ext2fs/ext3fs (1.34), reiserfs (3.6.13) or 
  xfs (2.6.25)  

- host:~ # lvm version
  LVM version:     2.00.33 (2005-01-07)
  Library version: 1.00.21-ioctl (2005-01-07)
  Driver version:  4.3.0
- 2.6.10 vanilla + 2.6.10-udm1 patches

The problems where initially discovered on 2.6.8, tracked on 2.6.9-udm 
and also occurs if only 2 devices (sum 2.4 TB) are used.

For a limited time I will be able to further debug the system though 
it takes some time to generate more then 2 TB of data 
(max seq read/write rate is ~80 MB/s).

Jens

-- 
Nur tote Fische schwimmen mit dem Strom
