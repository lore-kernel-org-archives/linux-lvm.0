Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j23LaUK18055
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 16:36:30 -0500
Received: from c2bsmtp01.btconnect.com (c2bsmtp01.btconnect.com
	[193.113.154.37])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j23LaNx1027298
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 16:36:24 -0500
From: Robert Buick <robert.buick@btconnect.com>
Date: Thu, 03 Mar 2005 21:35:55 +0000
Message-Id: <1109885756.6400.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] df doesn't display increased available disk space
Reply-To: robert.buick@btconnect.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

I'm running Fedora Core 3 with LVM2, and have added /dev/hda4 (13.09GB)
to the VG, however this increase is not reflected if I do a df -h. Have
I missed something?

Thanks for your time,

Rob Buick

[root@stemme mapper]# lvscan
  ACTIVE            '/dev/VolGroup00/LogVol00' [34.53 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit
[root@stemme mapper]# pvscan
  PV /dev/hda2   VG VolGroup00   lvm2 [23.41 GB / 32.00 MB free]
  PV /dev/hda4   VG VolGroup00   lvm2 [13.09 GB / 0    free]
  Total: 2 [36.50 GB] / in use: 2 [36.50 GB] / in no VG: 0 [0   ]
[root@stemme mapper]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "VolGroup00" using metadata type lvm2
[root@stemme mapper]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                       22G  9.0G   12G  45% /
/dev/hda1              99M   22M   73M  23% /boot
none                  760M     0  760M   0% /dev/shm
