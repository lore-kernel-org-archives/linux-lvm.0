Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBBBgSr13409
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 06:42:28 -0500
Received: from web52508.mail.yahoo.com (web52508.mail.yahoo.com
	[206.190.39.133])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iBBBgMl9005505
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 06:42:27 -0500
Message-ID: <20041211114213.76916.qmail@web52508.mail.yahoo.com>
Date: Sat, 11 Dec 2004 03:42:13 -0800 (PST)
From: johon Doe <johond@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] duplicate pv.
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

Hi, I have a 2.6.9 kernel and I have problems to
create an vg device over a raid1 array.
Look:
sole:/usr/src/linux# cat /proc/mdstat 
Personalities : [raid1] 
md7 : active raid1 sdb2[1] sda2[0]
      244147712 blocks [2/2] [UU]
      
md1 : active raid1 sdb6[0] sda6[1]
      1951744 blocks [2/2] [UU]
      
md2 : active raid1 sdb7[0] sda7[1]
      1951744 blocks [2/2] [UU]
      
md3 : active raid1 sdb8[0] sda8[1]
      979840 blocks [2/2] [UU]
      
md4 : active raid1 sdb9[0] sda9[1]
      9767424 blocks [2/2] [UU]
      
md5 : active raid1 sdb10[0] sda10[1]
      9767424 blocks [2/2] [UU]
      
md6 : active raid1 sdb11[0] sda11[1]
      7815488 blocks [2/2] [UU]
      
md0 : active raid1 sdb5[0] sda5[1]
      96256 blocks [2/2] [UU]
      
unused devices: <none>

sole:/usr/src/linux# pvcreate /dev/md7
  Physical volume "/dev/md7" successfully created

sole:/usr/src/linux# pvdisplay 
  Found duplicate PV lvryBmVRK5xL8QmQRmqnXI707cYMc2z1:
using /dev/sdb2 not /dev/sda2
  Found duplicate PV lvryBmVRK5xL8QmQRmqnXI707cYMc2z1:
using /dev/sdb2 not /dev/sda2
  --- NEW Physical volume ---
  PV Name               /dev/sda2
  VG Name               
  PV Size               232,84 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID              
lvryBm-VRK5-xL8Q-mQRm-qnXI-707c-YMc2z1

sole:/usr/src/linux# vgcreate vg00 /dev/md7
  Found duplicate PV lvryBmVRK5xL8QmQRmqnXI707cYMc2z1:
using /dev/sdb2 not /dev/sda2
  Found duplicate PV lvryBmVRK5xL8QmQRmqnXI707cYMc2z1:
using /dev/sdb2 not /dev/sda2
  Found duplicate PV lvryBmVRK5xL8QmQRmqnXI707cYMc2z1:
using /dev/sdb2 not /dev/sda2
  Volume group "vg00" successfully created

sole:/usr/src/linux# lvcreate -L 240000M -n lv00 vg00
  Found duplicate PV lvryBmVRK5xL8QmQRmqnXI707cYMc2z1:
using /dev/sdb2 not /dev/sda2
  Found duplicate PV lvryBmVRK5xL8QmQRmqnXI707cYMc2z1:
using /dev/sdb2 not /dev/sda2
  Volume group "vg00" doesn't exist
sole:/usr/src/linux# 

thx for any help
Luigi.



		
__________________________________ 
Do you Yahoo!? 
Send a seasonal email greeting and help others. Do good. 
http://celebrity.mail.yahoo.com
