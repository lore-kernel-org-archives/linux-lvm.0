Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9UJQ4r08718
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 15:26:04 -0400
Received: from smtp3.libero.it (smtp3.libero.it [193.70.192.127])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9UJPrth008904
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 15:25:58 -0400
Received: from localhost (172.16.1.83) by smtp3.libero.it (7.0.027-DD01)
	id 4178F14A001D0D2E for linux-lvm@redhat.com;
	Sat, 30 Oct 2004 21:25:47 +0200
Received: from [192.168.0.2] (151.41.157.110) by smtp0.libero.it (7.0.027-DD01)
	id 40CB280C058F4690 for linux-lvm@redhat.com;
	Sat, 30 Oct 2004 21:25:47 +0200
From: "\"KieZz\"" <kiezz@libero.it>
Date: Sat, 30 Oct 2004 21:22:30 +0200
References: <41801ADE.6030308@monjoin.net> <41814060.4040400@mikebabcock.ca>
	<20041030172738.GF13737@kluge.net>
In-Reply-To: <20041030172738.GF13737@kluge.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410302122.30956.kiezz@libero.it>
Subject: [linux-lvm] LVM DISK DIE
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi
i have a lvm whit 4 disk on a machine whit lvm2 and kernel 2.6.8.1 .
One is dead, i've tried whit pvmove to 2 disk (200 gb -> 120 +80 ) but it die 
before moving 30 Gb.
Now the disk i think is totaly unusable, cfdisk refuse to open it (like 
opening a non exitent device) and i have this:

root@Orange:~# vgscan
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find all physical volumes for volume group orange_vg.
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find all physical volumes for volume group orange_vg.
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find all physical volumes for volume group orange_vg.
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find all physical volumes for volume group orange_vg.

and also this:

root@Orange:~# pvscan
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find device with uuid '9X3e0u-IqHl-B7Eh-CcGa-7Zbp-Awv8-5dfBnj'.
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find device with uuid '9X3e0u-IqHl-B7Eh-CcGa-7Zbp-Awv8-5dfBnj'.
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find device with uuid '9X3e0u-IqHl-B7Eh-CcGa-7Zbp-Awv8-5dfBnj'.
  Couldn't find device with uuid '42cK3V-88Wm-SEMU-1qUb-fAsZ-Fo1V-QFzFvG'.
  Couldn't find device with uuid '9X3e0u-IqHl-B7Eh-CcGa-7Zbp-Awv8-5dfBnj'.
  PV /dev/hdb         VG orange_vg   lvm2 [189.92 GB / 0    free]
  PV /dev/hdc         VG orange_vg   lvm2 [189.92 GB / 0    free]
  PV unknown device   VG orange_vg   lvm2 [189.92 GB / 0    free]
  PV unknown device   VG orange_vg   lvm2 [189.92 GB / 150.89 GB free]
  PV /dev/hdg         VG orange_vg   lvm2 [114.49 GB / 956.00 MB free]
  PV /dev/hdh         VG orange_vg   lvm2 [74.52 GB / 4.00 MB free]
  Total: 6 [948.70 GB] / in use: 6 [948.70 GB] / in no VG: 0 [0   ]

There is a way to save something ?

Thanks 
