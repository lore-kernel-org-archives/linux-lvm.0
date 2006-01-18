Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0IBWiQ27014
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 06:32:44 -0500
Received: from rarr.org.uk (213-228-241-254.dsl.prodigynet.co.uk
	[213.228.241.254])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id k0ICW81U032299
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 07:32:09 -0500
Received: from host217-46-230-193.in-addr.btopenworld.com ([217.46.230.193]
	helo=[192.168.0.2])
	by rarr.org.uk with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.54)
	id 1EzBYF-0006Af-CK
	for linux-lvm@redhat.com; Wed, 18 Jan 2006 11:32:31 +0000
Message-ID: <43CE271C.4090308@rarr.org.uk>
Date: Wed, 18 Jan 2006 11:31:40 +0000
From: Chris bolton <cbolton@rarr.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Disk space reporting inconsistencies
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
To: linux-lvm@redhat.com

Hi,

just added a new PV to my VG but to me there seems to be an 
inconsistency between what lvm says is the disk space and what df says.

pvscan
  PV /dev/sda2   VG VolGroup00   lvm2 [68.38 GB / 0    free]
  PV /dev/sdb    VG VolGroup00   lvm2 [68.50 GB / 0    free]
  PV /dev/hdc2   VG VolGroup00   lvm2 [37.12 GB / 0    free]
  PV /dev/hdb1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
  PV /dev/hdd1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
  PV /dev/hde1   VG VolGroup00   lvm2 [37.25 GB / 0    free]
  Total: 6 [285.69 GB] / in use: 6 [285.69 GB] / in no VG: 0 [0   ]

df -h
/dev/mapper/VolGroup00-LogVol00   265G  227G   28G  90% /

I tried resizing the filesystem but it just says this..

ext2online  /dev/VolGroup00/LogVol00
    ext2online v1.1.18 - 2001/03/18 for EXT2FS 0.5b
    ext2online: ext2_ioctl: No space left on device

ext2online: unable to resize /dev/mapper/VolGroup00-LogVol00

Am I missing something obvious here? or have I ballsed it up along the way?

Cheers,
Chris.
