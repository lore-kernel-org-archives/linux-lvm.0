Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u11H7LD9003532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 1 Feb 2016 12:07:21 -0500
Received: from nm21-vm4.bullet.mail.gq1.yahoo.com
	(nm21-vm4.bullet.mail.gq1.yahoo.com [98.136.217.51])
	by mx1.redhat.com (Postfix) with ESMTPS id E547CE1B6B
	for <linux-lvm@redhat.com>; Mon,  1 Feb 2016 17:07:19 +0000 (UTC)
Date: Mon, 1 Feb 2016 17:06:42 +0000 (UTC)
From: Pavlik Kirilov <pavllik@yahoo.ca>
Message-ID: <211175712.3220799.1454346402372.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <CAE7pJ3CLeCEVOw1R2qb3k9T9rQ8t=q28tBDpxbzUQ1=z7nGveg@mail.gmail.com>
References: <CAE7pJ3CLeCEVOw1R2qb3k9T9rQ8t=q28tBDpxbzUQ1=z7nGveg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Raid 10 - recovery after a disk failure
Reply-To: Pavlik Kirilov <pavllik@yahoo.ca>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>



The method for restoring raid 10, which I posted in my previous email, works very well for raid 5 on 4 PVs. I tried many times the "--uuid" method from the link you sent me and I always end up with destroyed data. Here comes the output of the tests I performed:

## Ubuntu VM with 4 new disks (qcow files) vda,vdb,vdc,vdd, one physical partition per disk.

vgcreate vg_data /dev/vda1 /dev/vdb1 /dev/vdc1 /dev/vdd1
Volume group "vg_data" successfully created

lvcreate --type raid10 -L3g -i 2 -I 256 -n lv_r10 vg_data /dev/vda1:1-900 /dev/vdb1:1-900 /dev/vdc1:1-900 /dev/vdd1:1-900
Logical volume "lv_r10" created

mkfs.ext4 /dev/vg_data/lv_r10

mount /dev/vg_data/lv_r10 /mnt/r10/

mount | grep vg_data
/dev/mapper/vg_data-lv_r10 on /mnt/r10 type ext4 (rw)

echo "some data" > /mnt/r10/testr10.txt

dmesg -T | tail -n 70

------------------

[ 3822.367551] EXT4-fs (dm-8): mounted filesystem with ordered data mode. Opts: (null)
[ 3851.317428] md: mdX: resync done.
[ 3851.440927] RAID10 conf printout:
[ 3851.440935]  --- wd:4 rd:4
[ 3851.440941]  disk 0, wo:0, o:1, dev:dm-1
[ 3851.440945]  disk 1, wo:0, o:1, dev:dm-3
[ 3851.440949]  disk 2, wo:0, o:1, dev:dm-5
[ 3851.440953]  disk 3, wo:0, o:1, dev:dm-7


lvs -a -o +devices
LV                VG      Attr      LSize Pool Origin Data%  Move Log Copy%  Convert Devices 
lv_r10            vg_data rwi-aor-- 3.00g                             100.00         lv_r10_rimage_0(0),lv_r10_rimage_1(0),lv_r10_rimage_2(0),lv_r10_rimage_3(0)
[lv_r10_rimage_0] vg_data iwi-aor-- 1.50g                                            /dev/vda1(2) 
[lv_r10_rimage_1] vg_data iwi-aor-- 1.50g                                            /dev/vdb1(2) 
[lv_r10_rimage_2] vg_data iwi-aor-- 1.50g                                            /dev/vdc1(2) 
[lv_r10_rimage_3] vg_data iwi-aor-- 1.50g                                            /dev/vdd1(2) 
[lv_r10_rmeta_0]  vg_data ewi-aor-- 4.00m                                            /dev/vda1(1) 
[lv_r10_rmeta_1]  vg_data ewi-aor-- 4.00m                                            /dev/vdb1(1) 
[lv_r10_rmeta_2]  vg_data ewi-aor-- 4.00m                                            /dev/vdc1(1) 
[lv_r10_rmeta_3]  vg_data ewi-aor-- 4.00m                                            /dev/vdd1(1)
###

### Shutting down, replacing vdb with a new disk, starting the system ###

### 
lvs -a -o +devices
Couldn't find device with uuid GjkgzF-18Ls-321G-SaDW-4vp0-d04y-Gd4xRp.
LV                VG      Attr      LSize Pool Origin Data%  Move Log Copy%  Convert Devices 
lv_r10            vg_data rwi---r-p 3.00g                                            lv_r10_rimage_0(0),lv_r10_rimage_1(0),lv_r10_rimage_2(0),lv_r10_rimage_3(0)
[lv_r10_rimage_0] vg_data Iwi---r-- 1.50g                                            /dev/vda1(2) 
[lv_r10_rimage_1] vg_data Iwi---r-p 1.50g                                            unknown device(2) 
[lv_r10_rimage_2] vg_data Iwi---r-- 1.50g                                            /dev/vdc1(2) 
[lv_r10_rimage_3] vg_data Iwi---r-- 1.50g                                            /dev/vdd1(2) 
[lv_r10_rmeta_0]  vg_data ewi---r-- 4.00m                                            /dev/vda1(1) 
[lv_r10_rmeta_1]  vg_data ewi---r-p 4.00m                                            unknown device(1) 
[lv_r10_rmeta_2]  vg_data ewi---r-- 4.00m                                            /dev/vdc1(1) 
[lv_r10_rmeta_3]  vg_data ewi---r-- 4.00m                                            /dev/vdd1(1)

grep description /etc/lvm/backup/vg_data
description = "Created *after* executing 'lvcreate --type raid10 -L3g -i 2 -I 256 -n lv_r10 vg_data /dev/vda1:1-900 /dev/vdb1:1-900 /dev/vdc1:1-900 /dev/vdd1:1-900'"

pvcreate --uuid  GjkgzF-18Ls-321G-SaDW-4vp0-d04y-Gd4xRp  --restorefile /etc/lvm/backup/vg_data /dev/vdb1
Couldn't find device with uuid GjkgzF-18Ls-321G-SaDW-4vp0-d04y-Gd4xRp.
Physical volume "/dev/vdb1" successfully created

vgcfgrestore vg_data
Restored volume group vg_data

lvs -a -o +devices
LV                VG      Attr      LSize Pool Origin Data%  Move Log Copy%  Convert Devices 
lv_r10            vg_data rwi-d-r-- 3.00g                               0.00         lv_r10_rimage_0(0),lv_r10_rimage_1(0),lv_r10_rimage_2(0),lv_r10_rimage_3(0)
[lv_r10_rimage_0] vg_data iwi-a-r-- 1.50g                                            /dev/vda1(2) 
[lv_r10_rimage_1] vg_data iwi-a-r-- 1.50g                                            /dev/vdb1(2) 
[lv_r10_rimage_2] vg_data iwi-a-r-- 1.50g                                            /dev/vdc1(2) 
[lv_r10_rimage_3] vg_data iwi-a-r-- 1.50g                                            /dev/vdd1(2) 
[lv_r10_rmeta_0]  vg_data ewi-a-r-- 4.00m                                            /dev/vda1(1) 
[lv_r10_rmeta_1]  vg_data ewi-a-r-- 4.00m                                            /dev/vdb1(1) 
[lv_r10_rmeta_2]  vg_data ewi-a-r-- 4.00m                                            /dev/vdc1(1) 
[lv_r10_rmeta_3]  vg_data ewi-a-r-- 4.00m                                            /dev/vdd1(1)

lvchange --resync vg_data/lv_r10
Do you really want to deactivate logical volume lv_r10 to resync it? [y/n]: y

lvs -a -o +devices
LV                VG      Attr      LSize Pool Origin Data%  Move Log Copy%  Convert Devices 
lv_r10            vg_data rwi-a-r-- 3.00g              100.00
---------

dmesg | tail
------------
[  708.691297] md: mdX: resync done.
[  708.765376] RAID10 conf printout:
[  708.765379]  --- wd:4 rd:4
[  708.765381]  disk 0, wo:0, o:1, dev:dm-1
[  708.765382]  disk 1, wo:0, o:1, dev:dm-3
[  708.765383]  disk 2, wo:0, o:1, dev:dm-5
[  708.765384]  disk 3, wo:0, o:1, dev:dm-7

mount /dev/vg_data/lv_r10 /mnt/r10/
cat /mnt/r10/testr10.txt 
some data

### Suppose now that vda must be replaced too. 
### Shutting down again, replacing vda with a new disk, starting the system ###

lvs -a -o +devices
Couldn't find device with uuid KGf6QK-1LrJ-JDaA-bJJY-pmLb-l9eV-LEXgT2.
LV                VG      Attr      LSize Pool Origin Data%  Move Log Copy%  Convert Devices 
lv_r10            vg_data rwi---r-p 3.00g                                            lv_r10_rimage_0(0),lv_r10_rimage_1(0),lv_r10_rimage_2(0),lv_r10_rimage_3(0)
[lv_r10_rimage_0] vg_data Iwi---r-p 1.50g                                            unknown device(2) 
[lv_r10_rimage_1] vg_data Iwi---r-- 1.50g                                            /dev/vdb1(2) 
[lv_r10_rimage_2] vg_data Iwi---r-- 1.50g                                            /dev/vdc1(2) 
[lv_r10_rimage_3] vg_data Iwi---r-- 1.50g                                            /dev/vdd1(2) 
[lv_r10_rmeta_0]  vg_data ewi---r-p 4.00m                                            unknown device(1) 
[lv_r10_rmeta_1]  vg_data ewi---r-- 4.00m                                            /dev/vdb1(1) 
[lv_r10_rmeta_2]  vg_data ewi---r-- 4.00m                                            /dev/vdc1(1) 
[lv_r10_rmeta_3]  vg_data ewi---r-- 4.00m                                            /dev/vdd1(1)


grep description /etc/lvm/backup/vg_data
description = "Created *after* executing 'vgscan'"
pvcreate --uuid  KGf6QK-1LrJ-JDaA-bJJY-pmLb-l9eV-LEXgT2  --restorefile /etc/lvm/backup/vg_data /dev/vda1
Couldn't find device with uuid KGf6QK-1LrJ-JDaA-bJJY-pmLb-l9eV-LEXgT2.
Physical volume "/dev/vda1" successfully created

vgcfgrestore vg_data
Restored volume group vg_data

lvchange --resync vg_data/lv_r10
Do you really want to deactivate logical volume lv_r10 to resync it? [y/n]: y

lvs -a -o +devices
LV                VG      Attr      LSize Pool Origin Data%  Move Log Copy%  Convert Devices 
lv_r10            vg_data rwi-a-r-- 3.00g                             100.00         lv_r10_rimage_0(0),lv_r10_rimage_1(0),lv_r10_rimage_2(0),lv_r10_rimage_3(0)
[lv_r10_rimage_0] vg_data iwi-aor-- 1.50g                                            /dev/vda1(2) 
[lv_r10_rimage_1] vg_data iwi-aor-- 1.50g                                            /dev/vdb1(2) 
[lv_r10_rimage_2] vg_data iwi-aor-- 1.50g                                            /dev/vdc1(2) 
[lv_r10_rimage_3] vg_data iwi-aor-- 1.50g                                            /dev/vdd1(2) 
[lv_r10_rmeta_0]  vg_data ewi-aor-- 4.00m                                            /dev/vda1(1) 
[lv_r10_rmeta_1]  vg_data ewi-aor-- 4.00m                                            /dev/vdb1(1) 
[lv_r10_rmeta_2]  vg_data ewi-aor-- 4.00m                                            /dev/vdc1(1) 
[lv_r10_rmeta_3]  vg_data ewi-aor-- 4.00m                                            /dev/vdd1(1)

mount -t ext4 /dev/vg_data/lv_r10 /mnt/r10/
mount: wrong fs type, bad option, bad superblock on /dev/mapper/vg_data-lv_r10,
missing codepage or helper program, or other error
In some cases useful info is found in syslog - try
dmesg | tail  or so

dmesg | tail
-------------
[  715.361985] EXT4-fs (dm-8): VFS: Can't find ext4 filesystem
[  715.362248] EXT4-fs (dm-8): VFS: Can't find ext4 filesystem
[  715.362548] EXT4-fs (dm-8): VFS: Can't find ext4 filesystem
[  715.362846] FAT-fs (dm-8): bogus number of reserved sectors
[  715.362933] FAT-fs (dm-8): Can't find a valid FAT filesystem
[  729.843473] EXT4-fs (dm-8): VFS: Can't find ext4 filesystem

As you can see, after more then one disk failure and raid repair , I lost the file system on the raid 10 volume. Please, suggest what I am doing wrong.Thanks.

Pavlik 
