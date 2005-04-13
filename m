Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3DEIbO00928
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 10:18:37 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3DEIUjN013533
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 10:18:31 -0400
Received: from 73.red-83-45-99.pooles.rima-tde.net ([83.45.99.73]
	helo=servidor1.pk25.com)
	by servidor.isea-ing.com with asmtp (Exim 3.35 #1 (Debian))
	id 1DLih9-00074D-00
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 16:18:20 +0200
Received: from servidor1.pk25.com ([192.168.0.3] helo=pk25.com)
	by servidor1.pk25.com with esmtp (sendmail 9.99 #1 (Solaris))
	id 1DLigr-00087x-00
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 16:18:01 +0200
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Re: [linux-lvm] Can not write to volume
Date: Wed, 13 Apr 2005 16:18:00 +0200
Message-Id: <20050413141447.M54665@pk25.com>
In-Reply-To: <200504130057.22236.t-rigby@shaw.ca>
References: <200504130057.22236.t-rigby@shaw.ca>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Terry, Are this a production system?, If you can stop it, umount the
filesystem an run a:

1� Reiserfsck

2� You can use badblocks for check (in read only ) the status of the data.


regards!

On Wed, 13 Apr 2005 00:57:22 -0700, Terry Rigby wrote
> Tonight I noticed an inability to write to my LVM volume.  I see the 
> following errors in syslog
> 
> Apr 13 00:45:18 localhost kernel: ReiserFS: warning: is_tree_node: 
> node level 65535 does not match to the expected one 1
> Apr 13 00:45:18 localhost kernel: ReiserFS: dm-0: warning: vs-5150: 
> search_by_key: invalid format found in block 43843584. Fsck?
> 
> I am unsure as to what info might be relevant here so I will paste 
> some hopefully without being too long winded.  Is it recommended to 
> run a fsck on this?  How might I fix the issue?
> 
> fileserver:/storage/tv/recordings# df -h |grep storage
> /dev/mapper/4474-storage
>                       242G  210G   33G  87% /storage
> 
> fileserver:/storage/tv/recordings# pvscan
>   PV /dev/hda2   VG 4474   lvm2 [18.18 GB / 0    free]
>   PV /dev/hdc    VG 4474   lvm2 [74.53 GB / 0    free]
>   PV /dev/hdb    VG 4474   lvm2 [74.53 GB / 0    free]
>   PV /dev/hdd    VG 4474   lvm2 [74.53 GB / 0    free]
>   Total: 4 [241.77 GB] / in use: 4 [241.77 GB] / in no VG: 0 [0   ]
> 
> fileserver:/storage/tv/recordings# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/hda2
>   VG Name               4474
>   PV Size               18.18 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              4655
>   Free PE               0
>   Allocated PE          4655
>   PV UUID               hxeJjE-AgPR-letG-U0rH-FlDP-hOu9-o7UH7e
> 
>   --- Physical volume ---
>   PV Name               /dev/hdc
>   VG Name               4474
>   PV Size               74.53 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              19079
>   Free PE               0
>   Allocated PE          19079
>   PV UUID               KMzdEO-aigL-KoHL-2ZED-SgWf-CsoW-7qEWQP
> 
>   --- Physical volume ---
>   PV Name               /dev/hdb
>   VG Name               4474
>   PV Size               74.53 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              19079
>   Free PE               0
>   Allocated PE          19079
>   PV UUID               2MKTrn-jv8Y-hUPU-8W6m-Uur1-ItpE-Abq3w4
> 
>   --- Physical volume ---
>   PV Name               /dev/hdd
>   VG Name               4474
>   PV Size               74.53 GB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              19079
>   Free PE               0
>   Allocated PE          19079
>   PV UUID               ISBKAD-7SQt-B9Bo-ppng-G5Q6-Iu3D-uABjz7
> 
> fileserver:/storage/tv/recordings# vgscan
>   Reading all physical volumes.  This may take a while...
>   Found volume group "4474" using metadata type lvm2
> 
> fileserver:/storage/tv/recordings# vgdisplay
>   --- Volume group ---
>   VG Name               4474
>   System ID
>   Format                lvm2
>   Metadata Areas        4
>   Metadata Sequence No  3
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                4
>   Act PV                4
>   VG Size               241.77 GB
>   PE Size               4.00 MB
>   Total PE              61892
>   Alloc PE / Size       61892 / 241.77 GB
>   Free  PE / Size       0 / 0
>   VG UUID               lIoGSW-jLzj-HDN6-1mdY-0yqV-bily-BU9xzF
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=======================================================================================
Es una locura amar, a menos que se ame con locura.
		-- Proverbio latino. 
=======================================================================================
