Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p22K9X89025985
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 15:09:33 -0500
Received: from a.mx.bartk.us
	(173-10-122-205-BusName-Washington.hfc.comcastbusiness.net
	[173.10.122.205])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p22K9MXV008502
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 15:09:23 -0500
Received: from [131.107.0.85] (tide515.microsoft.com [131.107.0.85])
	by a.mx.bartk.us (Postfix) with ESMTP id 5AB12CE05B6
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2011 12:09:22 -0800 (PST)
Message-ID: <4D6EA3EF.1070401@bartk.us>
Date: Wed, 02 Mar 2011 12:09:19 -0800
From: Bart Kus <me@bartk.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Tracing IO requests?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,

I have the following setup:

md_RAID6(10x2TB) -> LVM2 -> cryptsetup -> XFS

When copying data onto the target XFS, I notice a large number of READs 
occurring on the physical hard drives.  Is there any way of monitoring 
what might be causing these read ops?

I have setup the system to minimize read-modify-write cycles as best I 
can, but I fear I've missed some possible options in LVM2 or 
cryptsetup.  Here are the specifics:

11:43:54          sde    162.00  12040.00  34344.00    286.32      
0.40      2.47      1.67     27.00
11:43:54          sdf    170.00  12008.00  36832.00    287.29      
0.62      3.65      2.12     36.00
11:43:54          sdg    185.00  10552.00  37920.00    262.01      
0.49      2.65      1.84     34.00
11:43:54          sdh    152.00  11824.00  37304.00    323.21      
0.29      1.78      1.71     26.00
11:43:54          sdi    140.00  13016.00  35216.00    344.51      
0.68      4.71      3.21     45.00
11:43:54          sdj    181.00  11784.00  36240.00    265.33      
0.43      2.38      1.55     28.00
11:43:54          sds    162.00  11824.00  34040.00    283.11      
0.46      2.84      1.67     27.00
11:43:54          sdt    157.00  11264.00  35192.00    295.90      
0.65      4.14      2.29     36.00
11:43:54          sdu    154.00  12584.00  35424.00    311.74      
0.46      2.79      1.69     26.00
11:43:54          sdv    131.00  12800.00  33264.00    351.63      
0.39      2.75      1.98     26.00
11:43:54          md5    752.00      0.00 153688.00    204.37      
0.00      0.00      0.00      0.00
11:43:54    DayTar-DayTar    752.00      0.00 153688.00    204.37     
12.42     16.76      1.33    100.00
11:43:54         data      0.00      0.00      0.00      0.00   
7238.71      0.00      0.00    100.00

Where md5 is the RAID6 holding the drives right above it, DayTar-DayTar 
are the VG and LV respectively, and data is the cryptsetup device 
derived from the LV.  Hard drives are set to "blockdev --setra 1024", 
md5 is set for stripe_cache_size of 6553 and preread_bypass_threshold of 
0.  XFS is mounted with the following options:

/dev/mapper/data on /data type xfs 
(rw,noatime,nodiratime,allocsize=256m,nobarrier,noikeep,inode64,logbufs=8,logbsize=256k)

And here are the format options of XFS:

meta-data=/dev/mapper/data       isize=256    agcount=15, 
agsize=268435455 blks
          =                       sectsz=512   attr=2
data     =                       bsize=4096   blocks=3906993152, imaxpct=5
          =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0
log      =internal               bsize=4096   blocks=521728, version=2
          =                       sectsz=512   sunit=0 blks, lazy-count=0
realtime =none                   extsz=4096   blocks=0, rtextents=0

I wasn't sure how to do any kind of stripe alignment with the md RAID6 
given the layers in between.  Here are the LVM2 properties:

   --- Physical volume ---
   PV Name               /dev/md5
   VG Name               DayTar
   PV Size               14.55 TiB / not usable 116.00 MiB
   Allocatable           yes (but full)
   PE Size               256.00 MiB
   Total PE              59616
   Free PE               0
   Allocated PE          59616
   PV UUID               jwcRz9-Yl0k-OHRQ-p5yR-AbAP-j09z-PCgSFo

   --- Volume group ---
   VG Name               DayTar
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  2
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                1
   Open LV               1
   Max PV                0
   Cur PV                1
   Act PV                1
   VG Size               14.55 TiB
   PE Size               256.00 MiB
   Total PE              59616
   Alloc PE / Size       59616 / 14.55 TiB
   Free  PE / Size       0 / 0
   VG UUID               X8gbkZ-BOMq-D6x2-xx6y-r2wF-cePQ-JTKZQs

   --- Logical volume ---
   LV Name                /dev/DayTar/DayTar
   VG Name                DayTar
   LV UUID                cdebg4-EcCR-6QR7-sAhT-EN1h-20Lv-qIFSH8
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                14.55 TiB
   Current LE             59616
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     16384
   Block device           253:0

And finally the cryptsetup properties:

/dev/mapper/data is active:
   cipher:  aes-cbc-essiv:sha256
   keysize: 256 bits
   device:  /dev/mapper/DayTar-DayTar
   offset:  8192 sectors
   size:    31255945216 sectors
   mode:    read/write

Anyone have any suggestions on how to tune this to do better at pure 
writing by eliminating needless reading?

Thanks,

--Bart
