Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0J7ud105435
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 02:56:39 -0500
Received: from rarr.org.uk (213-228-241-254.dsl.prodigynet.co.uk
	[213.228.241.254])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0J7ubDR011993
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 02:56:38 -0500
Received: from host217-46-230-193.in-addr.btopenworld.com ([217.46.230.193]
	helo=[192.168.0.2])
	by rarr.org.uk with esmtpsa (SSLv3:AES256-SHA:256) (Exim 4.54)
	id 1EzUeq-0005wN-6l
	for linux-lvm@redhat.com; Thu, 19 Jan 2006 07:56:36 +0000
Message-ID: <43CF4607.70703@rarr.org.uk>
Date: Thu, 19 Jan 2006 07:55:51 +0000
From: Chris bolton <cbolton@rarr.org.uk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk space reporting inconsistencies
References: <43CE271C.4090308@rarr.org.uk>
In-Reply-To: <43CE271C.4090308@rarr.org.uk>
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

nevermind got it sussed, lvm is using 10^9 for a gigabyte while df is 
using 1024^3

well it would appear that way anyway.
> Hi,
>
> just added a new PV to my VG but to me there seems to be an 
> inconsistency between what lvm says is the disk space and what df says.
>
> pvscan
>  PV /dev/sda2   VG VolGroup00   lvm2 [68.38 GB / 0    free]
>  PV /dev/sdb    VG VolGroup00   lvm2 [68.50 GB / 0    free]
>  PV /dev/hdc2   VG VolGroup00   lvm2 [37.12 GB / 0    free]
>  PV /dev/hdb1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
>  PV /dev/hdd1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
>  PV /dev/hde1   VG VolGroup00   lvm2 [37.25 GB / 0    free]
>  Total: 6 [285.69 GB] / in use: 6 [285.69 GB] / in no VG: 0 [0   ]
>
> df -h
> /dev/mapper/VolGroup00-LogVol00   265G  227G   28G  90% /
>
> I tried resizing the filesystem but it just says this..
>
> ext2online  /dev/VolGroup00/LogVol00
>    ext2online v1.1.18 - 2001/03/18 for EXT2FS 0.5b
>    ext2online: ext2_ioctl: No space left on device
>
> ext2online: unable to resize /dev/mapper/VolGroup00-LogVol00
>
> Am I missing something obvious here? or have I ballsed it up along the 
> way?
>
> Cheers,
> Chris.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
