Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0VLv6O00348
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2005 16:57:06 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.206])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0VLv0ic020228
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2005 16:57:00 -0500
Received: by wproxy.gmail.com with SMTP id 71so850472wra
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2005 13:56:55 -0800 (PST)
Message-ID: <2e06c5c205013113562f2cd2ff@mail.gmail.com>
Date: Mon, 31 Jan 2005 15:56:54 -0600
From: Rajesh Akula <rajesh.akula@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM help
Reply-To: Rajesh Akula <rajesh.akula@gmail.com>,
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

I have 154 disks.
136 of them are 36GB
18 are 73Gb
I made two partitions on all these disks. First partitions is 31Gb
rest of the space is second partition.
I am trying to create one big logical volume group of 1.1TB on the
second partition on all the disks.
Here is the script I used to create volume group
vgcreate volgroup1 /dev/sdb2......................./dev/sdey (154 disks)
lvcreate -i 154 -I 16 -L 1100G -n lv01 volgroup18
Failed and the got the following message.
Number of stripes (154) must be between 1 and 128.
The I changed number of stripes to 128 ran the script like this
lvcreate -i 154 -I 16 -L 1100G -n lv01 volgroup18
Rounding size (17600 extents) up to stripe boundary size (17664 extents)
Insufficient allocatable extents suitable for parallel use for
logical volume lv01: 17664 required

Here is how vgdisplay shows. Somebody please help. I am new to LINUX.
BTW this is Suse Linux Enterprize edition 9.
le576p2:~ # vgdisplay
--- Volume group ---
VG Name               volgroup18
System ID
Format                lvm2
Metadata Areas        128
Metadata Sequence No  1
VG Access             read/write
VG Status             resizable
MAX LV                255
Cur LV                0
Open LV               0
Max PV                255
Cur PV                128
Act PV                128
VG Size               1.22 TB
PE Size               64.00 MB
Total PE              19923
Alloc PE / Size       0 / 0
Free  PE / Size       19923 / 1.22 TB
VG UUID               zdkjo6-8jtQ-PHUU-bUfa-ysor-jAM4-QTOWqn
