Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8OKVEV25182
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 16:31:14 -0400
Received: from mx-out-02.forthnet.gr (mx-out.forthnet.gr [193.92.150.104])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8OKVB3W022481
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 16:31:12 -0400
Received: from mx-av-01.forthnet.gr (mx-av.forthnet.gr [193.92.150.27])
	by mx-out-02.forthnet.gr (8.12.11/8.12.11) with ESMTP id j8OKV6Cr030917
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 23:31:06 +0300
Received: from forthnet.gr (athmta03.forthnet.gr [193.92.150.22])
	by mx-av-01.forthnet.gr (8.12.11/8.12.11) with ESMTP id j8OKV6QX032624
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 23:31:06 +0300
Received: from [192.168.1.2] (ppp15-adsl-73.ath.forthnet.gr [62.1.238.73])
	by forthnet.gr (8.12.11/8.12.11) with ESMTP id j8OKV5Gg003866
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 23:31:05 +0300
From: Nikos Charonitakis <charosn@her.forthnet.gr>
Date: Sat, 24 Sep 2005 23:31:05 +0300
Message-Id: <1127593865.6094.28.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Moving to a new disk in FC4
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
To: linux-lvm@redhat.com

Hi 
i m trying to move my FC4 installation to a new disk and i m a bit
confused...
I ve managed to do some things:
I made two partitions on new disk /dev/hdb1 and /dev/hdb2 in order to
move there /dev/hdc1 and /dev/hdc2.
Second step was to make them use ext3 file system.
Then with pvcreate /dev/hdb2 initialized for use with lvm.
I didnt initialize /dev/hdb1 because /dev/hdc1 is also out of the lvm
thing.
After that i ve done: vgextend VolGroup00 /dev/hdb2
and pvmove /dev/hdc2 /dev/hdb2

My system seems to work yet :) but what i have to do now?
i ve missed something essential?
what to do with the /boot partition?
can i remove now the old partition /dev/hdc2 ? 
why /dev/hdb2 transfered data has taken so much space (about,38 GB on
new disk - they were less than 30 GB in the old partition /dev/hdc2),
do i have to extend LogVol00 that remain 37GB (the size of the old
partition) and how?


Now i have

  PV /dev/hdc2   VG VolGroup00   lvm2 [38,19 GB / 38,19 GB free]
  PV /dev/hdb2   VG VolGroup00   lvm2 [74,41 GB / 36,25 GB free]
  PV /dev/hdb1                   lvm2 [99,70 MB]

Total: 3 [112,69 GB] / in use: 2 [112,59 GB] / in no VG: 1 [99,70 MB]

  --- Physical volume ---
  PV Name               /dev/hdc2
  VG Name               VolGroup00
  PV Size               38,19 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              1222
  Free PE               1222
  Allocated PE          0
  PV UUID               b8E1VI-sqsw-LZTF-BEyq-Yox0-5h6r-4i4NH8

  --- Physical volume ---
  PV Name               /dev/hdb2
  VG Name               VolGroup00
  PV Size               74,41 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              2381
  Free PE               1160
  Allocated PE          1221
  PV UUID               D6PNGh-JwPb-J8Ij-zbIg-UMYx-gVU9-bQ4xCQ

Thanks in advance
Nikos
