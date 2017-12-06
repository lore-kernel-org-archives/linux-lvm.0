Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B21C85D6AE
	for <linux-lvm@redhat.com>; Wed,  6 Dec 2017 16:38:35 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A24E94901A
	for <linux-lvm@redhat.com>; Wed,  6 Dec 2017 16:38:33 +0000 (UTC)
Received: from [10.20.121.64] ([194.95.66.1]) by mail.gmx.com (mrgmx102
	[212.227.17.168]) with ESMTPSA (Nemesis) id 0MNf1y-1ePLkD2ite-007EAO
	for <linux-lvm@redhat.com>; Wed, 06 Dec 2017 17:38:31 +0100
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
References: <970a1f8b-fe0f-c078-2062-8436d19df1a7@gmx.net>
Message-ID: <3198217f-e968-4b64-c27a-f37e67e45335@gmx.net>
Date: Wed, 6 Dec 2017 17:38:30 +0100
MIME-Version: 1.0
In-Reply-To: <970a1f8b-fe0f-c078-2062-8436d19df1a7@gmx.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvreduce ignores --test for implicit BLKDISCARD?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

just a quick followup: If I don't run lvreduce --test before the actual
reduce, everything works fine:

# lvreduce --verbose --size 40G --resizefs /dev/mapper/kubuntu--vg-root
    Finding volume group kubuntu-vg
    Executing: fsadm --verbose check /dev/kubuntu-vg/root
fsadm: "ext4" filesystem found on "/dev/mapper/kubuntu--vg-root"
fsadm: Executing fsck -p /dev/mapper/kubuntu--vg-root
fsck from util-linux 2.27.1
/dev/mapper/kubuntu--vg-root: clean, 211747/30212096 files, 3291346/120836096 blocks
    Executing: fsadm --verbose resize /dev/kubuntu-vg/root 41943040K
fsadm: "ext4" filesystem found on "/dev/mapper/kubuntu--vg-root"
fsadm: Device "/dev/mapper/kubuntu--vg-root" size is 494944649216 bytes
fsadm: Parsing tune2fs -l "/dev/mapper/kubuntu--vg-root"
fsadm: Resizing filesystem on device "/dev/mapper/kubuntu--vg-root" to 42949672960 bytes (120836096 -> 10485760 blocks of 4096 bytes)
fsadm: Executing resize2fs /dev/mapper/kubuntu--vg-root 10485760
resize2fs 1.42.13 (17-May-2015)
Resizing the filesystem on /dev/mapper/kubuntu--vg-root to 10485760 (4k) blocks.
The filesystem on /dev/mapper/kubuntu--vg-root is now 10485760 (4k) blocks long.

    Archiving volume group "kubuntu-vg" metadata (seqno 3).
    Reducing logical volume kubuntu-vg/root to 40.00 GiB
  Size of logical volume kubuntu-vg/root changed from 460.95 GiB (118004 extents) to 40.00 GiB (10240 extents).
    Loading kubuntu--vg-root table (253:1)
    Suspending kubuntu--vg-root (253:1) with device flush
    Resuming kubuntu--vg-root (253:1)
    Creating volume group backup "/etc/lvm/backup/kubuntu-vg" (seqno 4).
  Logical volume root successfully resized.


Obviously, this new run was done after reinstalling the corrupted system.


Regards,
Carl-Daniel


On 06.12.2017 17:09, Carl-Daniel Hailfinger wrote:
> Hi,
>
> I just lost some of the contents of a file system by running
>
> lvreduce --test --verbose --size 40G --resizefs /dev/mapper/kubuntu-root
>
> AFAICS this was caused by BLKDISCARD being issued despite --test. No LV
> in the affected VG was mounted at the time of data loss.
>
> Don't worry, this was a test system directly after installation, it
> didn't have any important data on it.
>
> This is a Kubuntu 16.04.3 installation on a 500 GB SSD, during setup
> "whole disk with encrypted LVM" was chosen. The only non-default setting
> was enabling discard support manually in dm-crypt. The exact setup is as
> follows:
>
>
> 500 GB Samsung SSD (/dev/sda)
> sda1: 512.00 MiB FAT32 (EFI System partition)
> sda2: 488.00 MiB ext2 (/boot partition)
> sda3: 464.78 GiB LUKS (encrypted container for LVM PV, BLKDISCARD support enabled)
>
> # pvdisplay 
>   --- Physical volume ---
>   PV Name               /dev/mapper/sda3_crypt
>   VG Name               kubuntu-vg
>   PV Size               464.78 GiB / not usable 4.00 MiB
>   Allocatable           yes (but full)
>   PE Size               4.00 MiB
>   Total PE              118983
>   Free PE               0
>   Allocated PE          118983
>   PV UUID               [...]
>    
> # vgdisplay 
>   --- Volume group ---
>   VG Name               kubuntu-vg
>   System ID             
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  3
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                2
>   Open LV               0
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               464.78 GiB
>   PE Size               4.00 MiB
>   Total PE              118983
>   Alloc PE / Size       118983 / 464.78 GiB
>   Free  PE / Size       0 / 0   
>   VG UUID               [...]
>    
> # lvdisplay 
>   --- Logical volume ---
>   LV Path                /dev/kubuntu-vg/root
>   LV Name                root
>   VG Name                kubuntu-vg
>   LV UUID                [...]
>   LV Write Access        read/write
>   LV Creation host, time kubuntu, 2017-12-06 15:58:07 +0100
>   LV Status              available
>   # open                 0
>   LV Size                460.95 GiB
>   Current LE             118004
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:1
>    
>   --- Logical volume ---
>   LV Path                /dev/kubuntu-vg/swap_1
>   LV Name                swap_1
>   VG Name                kubuntu-vg
>   LV UUID                [...]
>   LV Write Access        read/write
>   LV Creation host, time kubuntu, 2017-12-06 15:58:08 +0100
>   LV Status              available
>   # open                 0
>   LV Size                3.82 GiB
>   Current LE             979
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:2
>
>
> # lvreduce --version
> LVM version:     2.02.133(2) (2015-10-30)
> Library version: 1.02.110 (2015-10-30)
> Driver version:  4.35.0
> # resize2fs --version
> resize2fs 1.42.13 (17-May-2015)
> # cryptsetup --version
> cryptsetup 1.6.6
> # uname -r
> 4.10.0-28-generic
>
> Steps to reproduce:
> # cryptsetup --allow-discards luksOpen /dev/sda3 sda3_crypt
> Enter passphrase for /dev/sda3: 
> # vgchange -a y
>   2 logical volume(s) in volume group "kubuntu-vg" now active
> # lvreduce --test --verbose --size 40G --resizefs /dev/mapper/kubuntu--vg-root 
>   TEST MODE: Metadata will NOT be updated and volumes will not be (de)activated.
>     Finding volume group kubuntu-vg
>     Executing: fsadm --dry-run --verbose check /dev/kubuntu-vg/root
> fsadm: "ext4" filesystem found on "/dev/mapper/kubuntu--vg-root"
> fsadm: Dry execution fsck -p /dev/mapper/kubuntu--vg-root
>     Executing: fsadm --dry-run --verbose resize /dev/kubuntu-vg/root 41943040K
> fsadm: "ext4" filesystem found on "/dev/mapper/kubuntu--vg-root"
> fsadm: Device "/dev/mapper/kubuntu--vg-root" size is 494944649216 bytes
> fsadm: Parsing tune2fs -l "/dev/mapper/kubuntu--vg-root"
> fsadm: Resizing filesystem on device "/dev/mapper/kubuntu--vg-root" to 42949672960 bytes (120836096 -> 10485760 blocks of 4096 bytes)
> fsadm: Dry execution resize2fs /dev/mapper/kubuntu--vg-root 10485760
>     Test mode: Skipping archiving of volume group.
>     Reducing logical volume kubuntu-vg/root to 40.00 GiB
>   Size of logical volume kubuntu-vg/root changed from 460.95 GiB (118004 extents) to 40.00 GiB (10240 extents).
>     Test mode: Skipping backup of volume group.
>   Logical volume root successfully resized.
>     Test mode: Wiping internal cache
>     Wiping internal VG cache
> # lvreduce --verbose --size 40G --resizefs /dev/mapper/kubuntu--vg-root 
>     Finding volume group kubuntu-vg
>     Executing: fsadm --verbose check /dev/kubuntu-vg/root
> fsadm: "ext4" filesystem found on "/dev/mapper/kubuntu--vg-root"
> fsadm: Executing fsck -p /dev/mapper/kubuntu--vg-root
> fsck from util-linux 2.27.1
> /dev/mapper/kubuntu--vg-root: Superblock has an invalid journal (inode 8).
> CLEARED.
> *** ext3 journal has been deleted - filesystem is now ext2 only ***
>
> /dev/mapper/kubuntu--vg-root: Superblock has_journal flag is clear, but a journal is present.
> CLEARED.
> /dev/mapper/kubuntu--vg-root: Journal inode is not in use, but contains data.  CLEARED.
> /dev/mapper/kubuntu--vg-root: Inode 3801089 is in use, but has dtime set.  FIXED.
> /dev/mapper/kubuntu--vg-root: Inode 3801089 has a extra size (8780) which is invalid
> FIXED.
> /dev/mapper/kubuntu--vg-root: Inode 3801089 has compression flag set on filesystem without compression support.  
>
> /dev/mapper/kubuntu--vg-root: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.
>         (i.e., without -a or -p options)
>     fsadm failed: 4
>   Filesystem check failed.
> #
>
>
> Compare this to a test run where BLKDISCARD support in the LUKS volume is disabled:
> # lvreduce --test --verbose --size 40G --resizefs /dev/mapper/kubuntu--vg-root 
>   TEST MODE: Metadata will NOT be updated and volumes will not be (de)activated.
>     Finding volume group kubuntu-vg
>     Executing: fsadm --dry-run --verbose check /dev/kubuntu-vg/root
> fsadm: "ext4" filesystem found on "/dev/mapper/kubuntu--vg-root"
> fsadm: Dry execution fsck -p /dev/mapper/kubuntu--vg-root
>     Executing: fsadm --dry-run --verbose resize /dev/kubuntu-vg/root 41943040K
> fsadm: "ext4" filesystem found on "/dev/mapper/kubuntu--vg-root"
> fsadm: Device "/dev/mapper/kubuntu--vg-root" size is 494944649216 bytes
> fsadm: Parsing tune2fs -l "/dev/mapper/kubuntu--vg-root"
> fsadm: Resizing filesystem on device "/dev/mapper/kubuntu--vg-root" to 42949672960 bytes (120836096 -> 10485760 blocks of 4096 bytes)
> fsadm: Dry execution resize2fs /dev/mapper/kubuntu--vg-root 10485760
>     Test mode: Skipping archiving of volume group.
>     Reducing logical volume kubuntu-vg/root to 40.00 GiB
>   /dev/mapper/sda3_crypt: BLKDISCARD ioctl at offset 42950721536 size 451994976256 failed: Operation not supported.
>   Size of logical volume kubuntu-vg/root changed from 460.95 GiB (118004 extents) to 40.00 GiB (10240 extents).
>     Test mode: Skipping backup of volume group.
>   Logical volume root successfully resized.
>     Test mode: Wiping internal cache
>     Wiping internal VG cache
>
>
> The message "BLKDISCARD [...] failed" in the non-fatal test run seems
> to imply that BLKDISCARD is issued even if --test is specified.
> I do not know whether this is the fault of lvreduce, fsadm or resize2fs.
>
> Any information about the possible reasons for this problem as well as
> potential bugfixes would be appreciated.
>
> Regards,
> Carl-Daniel
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
