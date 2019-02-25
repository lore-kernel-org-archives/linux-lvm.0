Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD106C216
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 15:33:46 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CC3B30BC730
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 15:33:45 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1PFODZ6114000
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 10:33:45 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2qvjar2v09-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 10:33:44 -0500
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Mon, 25 Feb 2019 15:33:42 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x1PFXddY26869806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 15:33:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 916414C040
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 15:33:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 742EF4C04E
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 15:33:39 +0000 (GMT)
Received: from [9.152.222.62] (unknown [9.152.222.62])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2019 15:33:39 +0000 (GMT)
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Mon, 25 Feb 2019 16:33:39 +0100
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
Subject: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV with
 a larger physical block size
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi,

we just encountered an error when using LVM's pvmove command to move the data from an un-encrypted LVM physical volume onto an encrypted volume. 
After the pvmove has completed, the file system on the logical volume that resides on the moved physical volumes is corrupted and all data on this LV is lost.

As a special condition, we are using the sector-size option with cryptsetup (LUKS2) to use 4096 byte sectors to increase the crypt performance. 

According to Ondrej Kozina in https://www.saout.de/pipermail/dm-crypt/2019-February/006078.html this is due to the fact that a sector size of 4096 also causes the physical block size to be (at least) 4096. Using the default sector size of 512 does not show the problem. 

The source PV of the pvmove has a physical block size of 512 (SCSI disk in our case). So when moving this to the encrypted volume the physical block size becomes 4096. The file system does not seem to like this....

Please note that this problem can also happen in other cases, such as mixing disks with different block sizes (e.g. SCSI disks with 512 bytes and s390x-DASDs with 4096 block size).

In my opinion this is a general problem that needs to be addressed by LVM. 
Whenever you pvmove data to a PV with a larger physical block size you will corrupt the file system and thus cause data loss.
The same probably happens when using lvextend to enlarge an LV onto a PV with a larger physical block size. 

Bottom line: LVM should reject extending a volume group with a PV that has a larger physical block size than the PVs that belong to the volume group already. There might be a force option to override this check in case the user really knows what he does. But the default behavior should be to protect the user from file system corruptions and thus from data loss.

Yes, having a backup before doing pvmove or similar is of course wise, but I still think that LVM should prevent a user for damaging the file system by using LVM's command line tools. 


Here is how to reproduce this (note the error messages on the very last command): 

# sudo dd if=/dev/zero of=loopbackfile1.img bs=500M count=1
1+0 records in
1+0 records out
524288000 bytes (524 MB, 500 MiB) copied, 2.32777 s, 225 MB/s

# sudo dd if=/dev/zero of=loopbackfile2.img bs=500M count=1
1+0 records in
1+0 records out
524288000 bytes (524 MB, 500 MiB) copied, 1.89992 s, 276 MB/s

# losetup -fP loopbackfile1.img

# losetup -fP loopbackfile2.img

# pvcreate /dev/loop0
  Physical volume "/dev/loop0" successfully created.

# vgcreate LOOP_VG /dev/loop0
  Volume group "LOOP_VG" successfully created

# lvcreate -L 300MB LOOP_VG -n LV /dev/loop0
  Logical volume "LV" created.

# mkfs.ext4 /dev/mapper/LOOP_VG-LV
mke2fs 1.44.1 (24-Mar-2018)
Discarding device blocks: done
Creating filesystem with 307200 1k blocks and 76912 inodes
Filesystem UUID: 344289a3-e251-4d88-b03d-a71a4be2a8ec
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729, 204801, 221185

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done

# mount /dev/mapper/LOOP_VG-LV /mnt

# cryptsetup luksFormat --type luks2 --sector-size 4096 /dev/loop1

WARNING!
========
This will overwrite data on /dev/loop1 irrevocably.

Are you sure? (Type uppercase yes): YES
Enter passphrase for /dev/loop1: loop
Verify passphrase: loop

# cryptsetup luksOpen /dev/loop1 enc-loop
Enter passphrase for /dev/loop1: loop

# pvcreate /dev/mapper/enc-loop
  Physical volume "/dev/mapper/enc-loop" successfully created.

# vgextend LOOP_VG /dev/mapper/enc-loop
  Volume group "LOOP_VG" successfully extended

# pvs
  PV                   VG      Fmt  Attr PSize   PFree
  /dev/loop0           LOOP_VG lvm2 a--  496.00m 196.00m
  /dev/mapper/enc-loop LOOP_VG lvm2 a--  492.00m 492.00m

# pvmove /dev/loop0 /dev/mapper/enc-loop
  /dev/loop0: Moved: 30.67%
  /dev/loop0: Moved: 100.00%

# pvs
  /dev/LOOP_VG/LV: read failed after 0 of 1024 at 0: Invalid argument
  /dev/LOOP_VG/LV: read failed after 0 of 1024 at 314507264: Invalid argument
  /dev/LOOP_VG/LV: read failed after 0 of 1024 at 314564608: Invalid argument
  /dev/LOOP_VG/LV: read failed after 0 of 1024 at 4096: Invalid argument
  PV                   VG      Fmt  Attr PSize   PFree
  /dev/loop0           LOOP_VG lvm2 a--  496.00m 496.00m
  /dev/mapper/enc-loop LOOP_VG lvm2 a--  492.00m 192.00m

In case the filesystem of the logical volume is not mounted at the time of pvmove, it gets corrupted anyway, but you only see errors when trying to mount it.

-- 
Ingo Franzki
eMail: ifranzki@linux.ibm.com  
Tel: ++49 (0)7031-16-4648
Fax: ++49 (0)7031-16-3456
Linux on IBM Z Development, Schoenaicher Str. 220, 71032 Boeblingen, Germany

IBM Deutschland Research & Development GmbH / Vorsitzender des Aufsichtsrats: Matthias Hartmann
Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM DATA Privacy Statement: https://www.ibm.com/privacy/us/en/
