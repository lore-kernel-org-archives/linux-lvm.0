Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1OMkiK08685
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 17:46:44 -0500
Received: from crater.wellsfargo.com (crater.wellsfargo.com [151.151.5.58])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1OMkg7e025662
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 17:46:43 -0500
Received: from mojave.wellsfargo.com (mojave.wellsfargo.com [10.30.2.154])
	by crater.wellsfargo.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	j1OMPPn7018322
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 16:25:36 -0600 (CST)
Received: from mojave.wellsfargo.com (localhost [127.0.0.1])
	by mojave.wellsfargo.com (Switch-3.1.5/Switch-3.1.0) with ESMTP id
	j1OMkDHg010643
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 16:46:13 -0600 (CST)
Received: from MSGSPSMNMSP03.ent.wfb.bank.corp (msgspsmnmsp03.wellsfargo.com
	[10.88.230.247])
	by mojave.wellsfargo.com (Switch-3.1.5/Switch-3.1.0) with ESMTP id
	j1OMkCkD010630
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 16:46:13 -0600 (CST)
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 24 Feb 2005 16:46:07 -0600
Message-ID: <603233BDE7A1D2418B1C0411715222853BE996@msgswbiadsm19.wellsfargo.com>
From: <Ben.M.Schuler@wellsfargo.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Missing PV in LG
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


Hi.  I hope this is an appropriate forum to which to post this.

We are running a AMD-64 box with Suse 9.1 and recently has a hard-reboot (plug was pulled).
Upon restart, we got fdisk errors on our Volumes.  Upon some prodding, we find that we are
missing some physical volumes and that LVM doesn't seem to know about a few partitions.
Unfortunately, we back one volume up to another and they were both hit with this problem.
TIA for any hints on how to proceed - the data is a real pain to regenerate.

# vgscan
 Couldn't find device with uuid 'Gu9G0X-wzof-x43j-VVw8-XTZ0-DSai-zCriVl'.
  Couldn't find all physical volumes for volume group system.
  Couldn't find device with uuid 'Gu9G0X-wzof-x43j-VVw8-XTZ0-DSai-zCriVl'.
  Couldn't find all physical volumes for volume group system.
  Volume group "system" not found

# pvscan
 Reading all physical volumes.  This may take a while...
 Couldn't find device with uuid 'Gu9G0X-wzof-x43j-VVw8-XTZ0-DSai-zCriVl'.
 Couldn't find device with uuid 'OpS7Kt-gVKo-nWN0-r37G-cZZs-CMD4-5eENIE'.
 Couldn't find device with uuid 'Gu9G0X-wzof-x43j-VVw8-XTZ0-DSai-zCriVl'.
 Couldn't find device with uuid 'OpS7Kt-gVKo-nWN0-r37G-cZZs-CMD4-5eENIE'.
 PV unknown device   VG system   lvm2 [233.74 GB / 0    free]
 PV unknown device   VG system   lvm2 [233.74 GB / 0    free]
 PV /dev/sdc2        VG system   lvm2 [225.73 GB / 0    free]
 PV /dev/sdd3        VG system   lvm2 [222.73 GB / 40.94 GB free]
 Total: 4 [915.94 GB] / in use: 4 [915.94 GB] / in no VG: 0 [0   ]

# pvcreate --uuid OpS7Kt-gVKo-nWN0-r37G-cZZs-CMD4-5eENIE --restorefile /etc/lvm/backup/foo /dev/sdb1
  Couldn't find device with uuid 'Gu9G0X-wzof-x43j-VVw8-XTZ0-DSai-zCriVl'.
  Couldn't find device with uuid 'OpS7Kt-gVKo-nWN0-r37G-cZZs-CMD4-5eENIE'.
  /dev/sdb1: Couldn't find device.

# lvmdiskscan
  /dev/sda  [      233.76 GB]
  /dev/sdb  [      233.76 GB]
  /dev/sdc  [      233.76 GB]
  /dev/sdc1 [        8.01 GB]
  /dev/sdc2 [      225.74 GB] LVM physical volume
  /dev/sdd  [      233.76 GB]
  /dev/sdd1 [        1.00 GB]
  /dev/sdd2 [       10.00 GB]
  /dev/sdd3 [      222.73 GB] LVM physical volume
  4 disks
  3 partitions
  0 LVM physical volume whole disks
  2 LVM physical volumes

# But....

# fdisk -l 

Disk /dev/sda: 251.0 GB, 251000193024 bytes
255 heads, 63 sectors/track, 30515 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1               1       30513   245095641   8e  Linux LVM

Disk /dev/sdb: 251.0 GB, 251000193024 bytes
255 heads, 63 sectors/track, 30515 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       30513   245095641   8e  Linux LVM

Disk /dev/sdc: 251.0 GB, 251000193024 bytes
255 heads, 63 sectors/track, 30515 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1               1        1045     8393931   82  Linux swap
/dev/sdc2            1046       30513   236701710   8e  Linux LVM

Disk /dev/sdd: 251.0 GB, 251000193024 bytes
255 heads, 63 sectors/track, 30515 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdd1               1         131     1052226   82  Linux swap
/dev/sdd2   *         132        1437    10490445   83  Linux
/dev/sdd3            1438       30513   233552970   8e  Linux LVM

# cat /proc/partitions

major minor  #blocks  name

   8     0  245117376 sda
   8     1  245095641 sda1
   8    16  245117376 sdb
   8    17  245095641 sdb1
   8    32  245117376 sdc
   8    33    8393931 sdc1
   8    34  236701710 sdc2
   8    48  245117376 sdd
   8    49    1052226 sdd1
   8    50   10490445 sdd2
   8    51  233552970 sdd3

It appears that the paritions are there and are of the correct type, but that LVM can't see them and won't allow me
to re-create the UUIDs.

Regards,

Ben
