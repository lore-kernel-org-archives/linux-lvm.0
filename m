Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r99LTYGj004071
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 17:29:35 -0400
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0251.outbound.messaging.microsoft.com [213.199.154.251])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r99LTUof010689
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 17:29:31 -0400
Received: from mail157-db9 (localhost [127.0.0.1])	by
	mail157-db9-R.bigfish.com (Postfix) with ESMTP id E82DE420110	for
	<linux-lvm@redhat.com>; Wed,  9 Oct 2013 21:29:29 +0000 (UTC)
Received: from DB9EHSMHS032.bigfish.com (unknown [10.174.16.251])	by
	mail157-db9.bigfish.com (Postfix) with ESMTP id 672C51E0095	for
	<linux-lvm@redhat.com>; Wed,  9 Oct 2013 21:29:27 +0000 (UTC)
Message-ID: <5255CAB1.5050606@tekcomms.com>
Date: Wed, 9 Oct 2013 16:29:21 -0500
From: Joe Harvell <joe.harvell@tekcomms.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvs complains of missing PVs that are not missing
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

As part of moving disks from one system to another, somehow LVM thinks 
PVS are missing in the new system but they are not.  Before I explain 
the relevant chain of events related to moving the disks, here is the 
problem as it manifests in the new system:

joey@akita ~ $ sudo pvs -v
     Scanning for physical volume names
     There are 9 physical volumes missing.
     There are 9 physical volumes missing.
     There are 9 physical volumes missing.
   PV                   VG       Fmt  Attr PSize   PFree DevSize PV UUID
   /dev/md/saluki:r10_0 bayeux   lvm2 a-m   40,00g      0 40,00g 
C4V6YY-1bA1-Clg9-f45q-ffma-BH07-K7ex1w
   /dev/md/saluki:r10_1 bayeux   lvm2 --m   74,97g      0 75,00g 
d3LmqC-1GnU-LPjb-uYqH-Z2jG-lQrp-31JOXo
   /dev/md/saluki:r10_2 bayeux   lvm2 a-m  224,78g 154,78g 224,81g 
JQsXS2-XfhA-zucx-Xetf-HHI0-aGFp-Ibz2We
   /dev/md/saluki:r5_0  bayeux   lvm2 a-m  360,00g   2,00g 360,00g 
UcdCOb-RqEK-0ofL-ql90-viLC-ssri-eopnTg
   /dev/md/saluki:r5_1  bayeux   lvm2 a-m  279,09g 145,09g 279,11g 
FLFUQW-PZHK-uY19-Zblf-s3RU-QPZK-0Pc3vC
   /dev/sda11           bayeux   lvm2 a--   93,31g  93,31g 93,32g 
KSVeZ5-DUI8-XCK4-NfiF-WB2r-6RGe-GymTuF
   /dev/sda5            bayeux   lvm2 a--  150,00g      0 150,00g 
FhGyS2-yKGw-pfxE-EyY4-yGi3-3Hoa-JCRCk1
   /dev/sda7            bayeux   lvm2 a--  107,16g  59,59g 107,16g 
lghpEG-bnje-tBY3-1jGJ-suAN-S8g5-ti5Df0
   /dev/sda9            bayeux   lvm2 a--   29,38g  22,34g 29,38g 
8wXKU8-2phP-4NKE-hVMo-8VY2-5Z7D-SVRwmU
   /dev/sdb3            seward   lvm2 a--  234,28g 104,28g 234,28g 
WnNkO0-8709-p5lN-bTGF-KdAJ-X29B-1cM5bv
   /dev/sdc11           bayeux   lvm2 a--   93,31g  86,28g 93,32g 
MoWrvQ-oI3A-OWBT-cwkp-eswH-BkNp-fuhXLI
   /dev/sdc5            bayeux   lvm2 a--  150,00g 150,00g 150,00g 
eeVLsy-DIb3-1w1G-VtIa-S6Bv-w9Li-pVQhLD
   /dev/sdc7            bayeux   lvm2 a--  107,16g 107,16g 107,16g 
K8ibVQ-AABO-islF-imv0-a0wv-ho4w-mxAUBO
   /dev/sdc9            bayeux   lvm2 a--   29,38g  29,38g 29,38g 
csjMOF-pIO8-o2dP-Vm5l-QRhP-6g5G-UdOSqH
   /dev/sdd1            shanghai lvm2 ---    2,73t      0 2,73t 
IVJKal-Oode-Yn0T-oS9z-tadX-X1cs-1J2ut1
   /dev/sde1            bayeux   lvm2 a-m  372,59g 172,59g 372,61g 
e21dTH-FxZw-P4Ug-f0S1-jIe9-hdYc-MCyH1D
   /dev/sdf11           bayeux   lvm2 a-m   93,31g  76,88g 93,32g 
jPQ6YS-LPTg-N7jA-65CA-F0tP-VSSE-GZ6vX5
   /dev/sdf6            bayeux   lvm2 a-m  150,00g      0 150,00g 
cxcme3-i1US-6MZI-Nx2U-fkSg-gQfz-X0Y468
   /dev/sdf7            bayeux   lvm2 a--  107,16g 107,16g 107,16g 
pTZN6n-sLvt-whyf-rWkJ-bZoP-IkiE-lEe92P
   /dev/sdf9            bayeux   lvm2 a-m   29,38g 128,00m 29,38g 
Qtqo8m-UjUh-Qe4R-VkkN-oJmK-pHG3-lPJVSm

joey@akita ~ $ sudo pvscan
   PV /dev/sdd1              VG shanghai   lvm2 [2,73 TiB / 0 free]
   PV /dev/sdb3              VG seward     lvm2 [234,28 GiB / 104,28 GiB 
free]
   PV /dev/md/saluki:r10_0   VG bayeux     lvm2 [40,00 GiB / 0 free]
   PV /dev/md/saluki:r5_0    VG bayeux     lvm2 [360,00 GiB / 2,00 GiB free]
   PV /dev/sdf6              VG bayeux     lvm2 [150,00 GiB / 0 free]
   PV /dev/sdf7              VG bayeux     lvm2 [107,16 GiB / 107,16 GiB 
free]
   PV /dev/md/saluki:r10_1   VG bayeux     lvm2 [74,97 GiB / 0 free]
   PV /dev/sdf9              VG bayeux     lvm2 [29,38 GiB / 128,00 MiB 
free]
   PV /dev/sdc5              VG bayeux     lvm2 [150,00 GiB / 150,00 GiB 
free]
   PV /dev/sdc7              VG bayeux     lvm2 [107,16 GiB / 107,16 GiB 
free]
   PV /dev/sdc9              VG bayeux     lvm2 [29,38 GiB / 29,38 GiB free]
   PV /dev/sda5              VG bayeux     lvm2 [150,00 GiB / 0 free]
   PV /dev/sda7              VG bayeux     lvm2 [107,16 GiB / 59,59 GiB 
free]
   PV /dev/sda9              VG bayeux     lvm2 [29,38 GiB / 22,34 GiB free]
   PV /dev/sda11             VG bayeux     lvm2 [93,31 GiB / 93,31 GiB free]
   PV /dev/sdc11             VG bayeux     lvm2 [93,31 GiB / 86,28 GiB free]
   PV /dev/sdf11             VG bayeux     lvm2 [93,31 GiB / 76,88 GiB free]
   PV /dev/sde1              VG bayeux     lvm2 [372,59 GiB / 172,59 GiB 
free]
   PV /dev/md/saluki:r5_1    VG bayeux     lvm2 [279,09 GiB / 145,09 GiB 
free]
   PV /dev/md/saluki:r10_2   VG bayeux     lvm2 [224,78 GiB / 154,78 GiB 
free]
   Total: 20 [5,39 TiB] / in use: 20 [5,39 TiB] / in no VG: 0 [0 ]

The problem is that each of the PVs that show up with the "missing" 
attribute are actually present in the new system.

The way I would like to prove that they are in the system is to read the 
PV disk label directly from the devices and show they have the same 
UUID.  But I am unable to find how to do that.  So instead I'll take a 
simple example from the above 9 missing PVs. pvs shows that the PV with 
UUID e21dTH-FxZw-P4Ug-f0S1-jIe9-hdYc-MCyH1D should be found at /dev/sde1 
but it is not found in the system.  I know for a fact that it is in the 
system.  Here's how I know.

I know that the Seagate disk (the only Seagate in the system) has 1 
partition that is a PV in VG bayeux, and that it contains exactly one LV 
named backup.  Here's what the system shows now about /dev/sde1:

joey@akita /tmp $ sudo parted /dev/sde print
Mot de passe :
Mod�le: ATA ST3400620AS (scsi)
Disque /dev/sde : 400GB
Taille des secteurs (logiques/physiques): 512B/512B
Table de partitions : gpt
Disk Flags:

Num�ro  D�but   Fin    Taille  Syst�me de fichiers  Nom Fanions
  1      17,4kB  400GB  400GB                        bayeux  lvm 
(gestionnaire de volumes logiques)


So /dev/sde1 is the place where /dev/bayeux/backup should reside.

Here is what the system shows now about that LV and the (supposedly 
missing) /dev/sde1 PV:

joey@akita /tmp $ sudo pvdisplay --maps /dev/sde1
   --- Physical volume ---
   PV Name               /dev/sde1
   VG Name               bayeux
   PV Size               372,61 GiB / not usable 18,05 MiB
   Allocatable           yes
   PE Size               32,00 MiB
   Total PE              11923
   Free PE               5523
   Allocated PE          6400
   PV UUID               e21dTH-FxZw-P4Ug-f0S1-jIe9-hdYc-MCyH1D

   --- Physical Segments ---
   Physical extent 0 to 6399:
     Logical volume      /dev/bayeux/backup
     Logical extents     0 to 6399
   Physical extent 6400 to 11922:
     FREE

joey@akita /tmp $ sudo lvdisplay --maps /dev/bayeux/backup
   --- Logical volume ---
   LV Path                /dev/bayeux/backup
   LV Name                backup
   VG Name                bayeux
   LV UUID                QhTdFi-cGuL-380h-2hIB-wXNx-D57w-pdlPpB
   LV Write Access        read/write
   LV Creation host, time saluki, 2013-05-11 17:14:45 -0500
   LV Status              available
   # open                 0
   LV Size                200,00 GiB
   Current LE             6400
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:32

   --- Segments ---
   Logical extent 0 to 6399:
     Type                linear
     Physical volume     /dev/sde1
     Physical extents    0 to 6399


And to top it off, I can mount the filesystem that lives on /dev/sde1 
and I see the backup data (I activated bayeux with --partial):

joey@akita /tmp $ sudo mkdir -m 000 /tmp/bb
joey@akita /tmp $ sudo mount -o ro /dev/bayeux/backup /tmp/bb
joey@akita /tmp $ sudo find /tmp/bb -maxdepth 3 -ls
      2    4 drwxr-xr-x   4 root     root         4096 mai 12 00:31 /tmp/bb
7585793    4 drwxr-xr-x   4 root     root         4096 mai 12 00:33 
/tmp/bb/to
7585794    4 drwx------   2 root     root         4096 nov. 27 2012 
/tmp/bb/to/lost+found
7585795    4 drwxr-xr-x   3 marta    marta        4096 mai 12 01:11 
/tmp/bb/to/pikawa
262145    8 -rw-r--r--   1 marta    marta        6148 d�c. 10 2012 
/tmp/bb/to/pikawa/.DS_Store
7585796    4 drwx--S---   3 marta    marta        4096 mai 12 01:11 
/tmp/bb/to/pikawa/pikawa.sparsebundle
     11   16 drwx------   2 root     root        16384 mai 11 23:35 
/tmp/bb/lost+found


Ok, I think that shows the PV is in fact not missing from the system!  
Now here's the explanation of the chain of events that I think 
contributed to getting in this state:

1.  Initially, I had 5 disks in host saluki.  Three Western Digital 1TB 
disks, 1 Western Digital 3TB disk, and 1 Seagate 400 GB disk.
2.  I removed all but two of the 1TB WD disks from saluki and rebooted 
it.  I was able to boot due to a combination of Linux raid (not LVM 
RAID)  and non-essential file systems on the disks I removed.
3.  Then I re-added all the disks to saluki except the Seagate.  I 
re-added the partitions on the WD 1TB I had removed to the corresponding 
RAID volumes, and all the RAID volumes re-synced fine.  I re-added all 
the file systems to /etc/fstab except the one on the Seagate and 
continued in that configuration for a while.
4.  Finally, I moved all 5 disks into host akita.  akita is a new 
machine and I installed the entire OS in a new VG (seward) consisting of 
1 disk.

I think the 9 PVs that are having the problems are related to the disks 
I removed and later re-added.  I should point out that between steps 3 
and 4 I tried to do an lvextend in VG bayeux, but it told me it would 
not allow this since it had partial PVs.  Of course that makes total 
sense, and I'm glad it stopped me.  So that means I cold not have 
changed any LVM configuration for bayeux while the VG was incomplete.  
So I don't see any reason why LVM is complaining about missing PVs.

FYI, here are the details of the RAID configuration:

joey@akita /tmp $ cat /proc/mdstat
Personalities : [raid1] [raid10] [raid6] [raid5] [raid4]
md121 : active raid10 sda6[0] sdf5[2] sdc6[1]
       235732992 blocks super 1.2 512K chunks 2 near-copies [3/3] [UUU]
       bitmap: 0/2 pages [0KB], 65536KB chunk

md122 : active raid1 sdc1[4] sda1[5] sdf1[1]
       102436 blocks super 1.0 [3/3] [UUU]
       bitmap: 0/7 pages [0KB], 8KB chunk

md123 : active raid10 sdc2[0] sda2[3] sdf2[1]
       8388864 blocks super 1.0 64K chunks 2 near-copies [3/3] [UUU]
       bitmap: 0/9 pages [0KB], 512KB chunk

md124 : active raid10 sdc3[4] sda3[5] sdf3[1]
       41943232 blocks super 1.0 64K chunks 2 near-copies [3/3] [UUU]
       bitmap: 0/161 pages [0KB], 128KB chunk

md125 : active raid5 sdc4[4] sda4[5] sdf4[3]
       377487616 blocks super 1.0 level 5, 128k chunk, algorithm 2 [3/3] 
[UUU]
       bitmap: 0/181 pages [0KB], 512KB chunk

md126 : active raid10 sda8[4] sdf8[2] sdc8[3]
       78643008 blocks super 1.0 64K chunks 2 near-copies [3/3] [UUU]
       bitmap: 0/1 pages [0KB], 65536KB chunk

md127 : active raid5 sda10[0] sdf10[3] sdc10[1]
       292663040 blocks super 1.0 level 5, 128k chunk, algorithm 2 [3/3] 
[UUU]
       bitmap: 0/140 pages [0KB], 512KB chunk

unused devices: <none>
joey@akita /tmp $ ls -l /dev/md/*
lrwxrwxrwx 1 root root 8  8 oct.  23:51 /dev/md/saluki:boot -> ../md122
lrwxrwxrwx 1 root root 8  8 oct.  23:51 /dev/md/saluki:r10_0 -> ../md124
lrwxrwxrwx 1 root root 8  8 oct.  23:51 /dev/md/saluki:r10_1 -> ../md126
lrwxrwxrwx 1 root root 8  8 oct.  23:51 /dev/md/saluki:r10_2 -> ../md121
lrwxrwxrwx 1 root root 8  8 oct.  23:51 /dev/md/saluki:r5_0 -> ../md125
lrwxrwxrwx 1 root root 8  8 oct.  23:51 /dev/md/saluki:r5_1 -> ../md127
lrwxrwxrwx 1 root root 8  8 oct.  23:51 /dev/md/saluki:swap -> ../md123


Note that all of the RAID volumes are on partitions of disks sda, sdc 
and sdf (the three 1 TB WDs):

joey@akita /dev/disk/by-id $ ls -l ata* | egrep 'sd[acf]$'
lrwxrwxrwx 1 root root  9  8 oct.  23:51 
ata-WDC_WD1001FALS-00E8B0_WD-WMATV6936241 -> ../../sdc
lrwxrwxrwx 1 root root  9  9 oct.  15:24 
ata-WDC_WD1001FALS-00J7B0_WD-WMATV0666975 -> ../../sdf
lrwxrwxrwx 1 root root  9  8 oct.  23:51 
ata-WDC_WD1001FALS-00J7B0_WD-WMATV6998349 -> ../../sda
