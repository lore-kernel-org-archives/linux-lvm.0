Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8EK80r00922
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:08:00 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.206])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8EK7oYf008862
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:07:55 -0400
Received: by mproxy.gmail.com with SMTP id 73so494468rnk
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 13:07:15 -0700 (PDT)
Message-ID: <ce9f1f9e04091413074c4fbb27@mail.gmail.com>
Date: Tue, 14 Sep 2004 13:07:11 -0700
From: Stanley Yue <stanley.yue@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot volume creation seg fault
Reply-To: Stanley Yue <stanley.yue@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi all:

I have the following questions:

1)  Does LVM1/2 allow creation of striped snapshot volume? Or must
snapshot volume be created using the second lvcreate format (i.e. one
that doesn't allow specifying number of stripes/stripSize)?

lvcreate {-l/--extents LogicalExtentsNumber |
        -L/--size  LogicalVolumeSize[kKmMgGtT]}   [-c/--chunksize   ChunkSize]
       -s/--snapshot  -n/--name  SnapshotLogicalVolumeName OriginalLogicalVol-
       umePath [PhysicalVolumePath...]
 
I tried to create a snapshot volume using the following cmd line
(Notice the seg fault at the end):

[root@DAP-RHLNX1 common]# lvcreate -i2 -I4 -L4M -s -nsyueSnapVol
/dev/vg00-lvm1/syueVol
  device-mapper ioctl cmd 13 failed: Invalid argument
  device-mapper ioctl cmd 13 failed: Invalid argument
  Rounding up size to full physical extent 32.00 MB
  Rounding size (1 extents) up to stripe boundary size (2 extents)
Segmentation fault (core dumped)

This work however, 
[root@DAP-RHLNX1 common]# lvcreate -L4M -s -nsyueSnapVol /dev/vg00-lvm1/syueVol 
  device-mapper ioctl cmd 13 failed: Invalid argument
  device-mapper ioctl cmd 13 failed: Invalid argument
  Rounding up size to full physical extent 32.00 MB
  Logical volume "syueSnapVol" created
[root@DAP-RHLNX1 common]# 

2) I'm still confusesd as to why the device-mapper is returning
invalid argument for some operations:

[root@DAP-RHLNX1 common]# lvremove /dev/vg00-lvm1/syueSnapVol
  device-mapper ioctl cmd 13 failed: Invalid argument
  device-mapper ioctl cmd 13 failed: Invalid argument
  Logical volume "syueSnapVol" successfully removed

Are there any incompatibilites between the LVM/device-mapper version
that I'm using?

[root@DAP-RHLNX1 common]# vgscan --version
  LVM version:     2.00.22 (2004-09-03)
  Library version: 1.00.18-ioctl (2004-06-20)
  Driver version:  4.0.5

Thanks,

Stanley
