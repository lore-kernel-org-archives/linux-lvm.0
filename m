Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0KE6oO25752
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 09:06:50 -0500
Received: from svs.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0KE6ooH001922
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 09:06:50 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svs.gsfc.nasa.gov (Postfix) with ESMTP id DFC0C10000A8
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 09:06:44 -0500 (EST)
Message-ID: <41EFBAF4.5030403@svs.gsfc.nasa.gov>
Date: Thu, 20 Jan 2005 09:06:44 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data corruption on large, multi-device filesystem
References: <20050118091059.GC27553@pcnocjb.dlan.cinetic.de>
	<1106172883.41eedbd386498@www.eiler.net>
In-Reply-To: <1106172883.41eedbd386498@www.eiler.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

joe@eiler.net wrote:

>I have recently run into this problem also.  I have seen it happen on SuSe 9.2,
>Fedora Core 2 and 3, and vanilla kernels 2.6.8.1, 2.6.9, and 2.6.10.
>All of my tests were using xfs.
>
>It happens whenever 2 or more devices are striped together with a total volume
>size greater than 2TB.  I have played with a single 4TB raid (12x 400GB RAID5)
>and did not see any corruption (but I did not fill the disk either).
>
>I initially saw the problem running video files over samba. But have recreated
>the problem by simply copying some large (5GB+) files and then checking
>md5sums.
>
>I don't see any corruption on the files unless I specify the -i option to
>lvcreate.  I usually see data corruption within an hour using my current tests.
>
>  
>
To verify, this corruption you are seeing only happens when you have a 
LV larger than 2TB
and when you use striping specifically with lvcreate -i.
Has anyone experienced data corruption with >2TB LV and no striping?

Randall
-

>Let me know if I can be of any assistance.
>Joe
>
>
>Quoting Jens Beyer <jbe@webde-ag.de>:
>
>  
>
>>Hi,
>>
>>I get severe data corruption using an logical volume larger
>>then 2 TB. Finally I was able to track down device mappper or
>>lvm as last suspects.
>>
>>My first guess where problems with filesystems but recently
>>I tried using md / RAID0 - and didnt have any errors of any
>>kind. I would prefer using LVM since we want to use snapshots
>>to simplify backup, but I have no clue how to further debug.
>>
>>On a system with 3 devices each larger then 1 TB and a logical
>>volume striped over all devices some data gets corrupted while
>>written (or read ?) from disk. This shows up as md5 or crc sums
>>changes on sequenced reads of files if filecache is not involved
>>(by reading a lot data).
>>On ext2fs there are error while writing data (kernel: EXT2-fs error
>>(device dm-0): ext2_new_block: Allocating block in system zone -
>> block = 722239884), on other filesystems successive fsck/repairs
>>shows corrupted metadata.
>>
>>The system setup is
>>- Three 29160B Adaptec scsi-controller each with one
>>  ATA-Disk Raid sized 1240 GB, (dual PIII, HP DL360 G2, 2 GB Ram)
>>- Volume group over all three devices, logical volume stripped
>>  full size (3.7 TB)
>>- Filesystem either ext2fs/ext3fs (1.34), reiserfs (3.6.13) or
>>  xfs (2.6.25)
>>
>>- host:~ # lvm version
>>  LVM version:     2.00.33 (2005-01-07)
>>  Library version: 1.00.21-ioctl (2005-01-07)
>>  Driver version:  4.3.0
>>- 2.6.10 vanilla + 2.6.10-udm1 patches
>>
>>The problems where initially discovered on 2.6.8, tracked on 2.6.9-udm
>>and also occurs if only 2 devices (sum 2.4 TB) are used.
>>
>>For a limited time I will be able to further debug the system though
>>it takes some time to generate more then 2 TB of data
>>(max seq read/write rate is ~80 MB/s).
>>
>>Jens
>>
>>--
>>Nur tote Fische schwimmen mit dem Strom
>>
>>    
>>
-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239
