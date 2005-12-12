Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBCIL4116047
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 13:21:05 -0500
Received: from mail1.merlins.org (Debian-exim@magic.merlins.org
	[209.81.13.136])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBCIKoTd006635
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 13:20:57 -0500
Date: Mon, 12 Dec 2005 10:20:45 -0800
From: Marc MERLIN <marc_lvm@merlins.org>
Message-ID: <20051212182045.GA30998@merlins.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm1 to lvm2 upgrade failed: confused on pv between
	sda1 and md5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

The VG is seen, but not the one LV in there

kernel: 2.6.14
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.4.0

My PV for /dev/dshelf3 is /dev/md5
The VG is found, but not the LV within it, apparently because LVM
selects /dev/sda1 instead of /dev/md5.

Sure enough, that drive is part of the raid set:
gargamel:~# cat /proc/mdstat | grep sda1
md5 : active raid5 sdg1[6] sdf1[5] sde1[4] sdd1[3] sdc1[2] sdb1[1] sda1[0]

vgdisplay -vv (abbridged) gives:
      /dev/sda1: lvm1 label detected
      /dev/md2: lvm1 label detected
      /dev/md4: lvm2 label detected
      /dev/md5: lvm1 label detected
      Duplicate PV 9O6xt9OyES075HwBQHdtmGRb7vD4EOy8 on /dev/sda1 - using md /dev/md5
      /dev/sdt1: lvm2 label detected
      Ignoring duplicate PV ROSSavso6qtpjO7fw93bO7cMntbJ09xz on /dev/sdt1 - using md /dev/md4
      /dev/sdh3: lvm1 label detected
      Ignoring duplicate PV LpvPCRIdjGlQuX4FCWWArPhv7Vv3Cv08 on /dev/sdh3 - using md /dev/md2
      /dev/sdl3: lvm1 label detected
      Ignoring duplicate PV LpvPCRIdjGlQuX4FCWWArPhv7Vv3Cv08 on /dev/sdl3 - using md /dev/md2

      Found /dev/sda1 in VG dshelf3
      Unlocking /var/lock/lvm/V_dshelf3
  --- Volume group ---
  VG Name               dshelf3
  System ID             gargamel.svh.merlins.org1013790828
  Format                lvm1
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                0
  Open LV               0
  Max PV                255
  Cur PV                1
  Act PV                1
  VG Size               410.06 GB
  PE Size               64.00 MB
  Total PE              6561
  Alloc PE / Size       6400 / 400.00 GB
  Free  PE / Size       161 / 10.06 GB
  VG UUID               6j8wL4-3n1y-WHL3-HM61-IyuS-6vJW-pubTQo
   
  --- Physical volumes ---
  PV Name               /dev/sda1     
  PV UUID               9O6xt9-OyES-075H-wBQH-dtmG-Rb7v-D4EOy8
  PV Status             allocatable
  Total PE / Free PE    6561 / 161

gargamel:~# vgchange -a y dshelf3
  0 logical volume(s) in volume group "dshelf3" now active

Can I help LVM2 find the LV in there somehow?

BTW, note that LVM2 did say "using md /dev/md5 (instead of /dev/sda1) and 
still showed /dev/sda1 as a PV for dshelf3 instead

Thanks
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
