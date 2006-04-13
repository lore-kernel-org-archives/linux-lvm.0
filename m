Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3D1o7dX028608
	for <linux-lvm@redhat.com>; Wed, 12 Apr 2006 21:50:07 -0400
Received: from priv-edtnes46.telusplanet.net (defout.telus.net
	[199.185.220.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3D1o3tI007569
	for <linux-lvm@redhat.com>; Wed, 12 Apr 2006 21:50:03 -0400
Received: from localhost ([199.185.220.240]) by priv-edtnes56.telusplanet.net
	(InterMail vM.6.01.05.04 201-2131-123-105-20051025) with ESMTP
	id <20060413012236.DYXF5889.priv-edtnes56.telusplanet.net@localhost>
	for <linux-lvm@redhat.com>; Wed, 12 Apr 2006 19:22:36 -0600
Message-ID: <1144902347.443dd2cb12d49@webmail.telus.net>
Date: Wed, 12 Apr 2006 21:25:47 -0700
From: faryalb@telus.net
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Creating a new partition /dev/hda5 
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



I have Fedora Core4 installed on my machine and trying to make mythtv work for
me. I understand I need to create a new partition /dev/hda5 and mount /video
file system. I've done some reading on LVM and come up with following commands
to install the new partition on my machine. I need to have them verified by
experts as I don't want to risk losing any data on my hard. 

#pvcreate /dev/hda5
#vgcreate VolGroup00 /dev/hda5
#lvcreate -L50G -name video VolGroup00
#mount /dev/hda5/video
#mount -0 remount,resize /video


Below is the information on my machine: 

[root@localhost mytv]# /sbin/lvm.static vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "VolGroup00" using metadata type lvm2
[root@localhost mytv]# /sbin/lvm.static vgdisplay
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               111.69 GB
  PE Size               32.00 MB
  Total PE              3574
  Alloc PE / Size       3573 / 111.66 GB
  Free  PE / Size       1 / 32.00 MB
  VG UUID               xdWgpi-74QQ-jgfK-EAzc-ojid-Geuo-HsyGA4

[root@localhost mytv]# /sbin/fdisk -l

Disk /dev/hda: 120.0 GB, 120034123776 bytes
255 heads, 63 sectors/track, 14593 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1          13      104391   83  Linux
/dev/hda2              14       14593   117113850   8e  Linux LVM



Please let me know if the above commands are correct or not.


Thanks,

Bita
