Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i78LI2a26007
	for <linux-lvm@redhat.com>; Sun, 8 Aug 2004 17:18:02 -0400
Received: from mailbox.openface.ca (mailbox.openface.ca [216.46.1.7])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i78LI0e1013790
	for <linux-lvm@redhat.com>; Sun, 8 Aug 2004 17:18:01 -0400
Received: from abnormal.openface.ca (IDENT:root@abnormal.openface.ca
	[216.46.1.19])
	by mailbox.openface.ca (8.12.11/8.12.9) with ESMTP id i78LHxF6029799
	for <linux-lvm@redhat.com>; Sun, 8 Aug 2004 17:18:00 -0400 (EDT)
Message-ID: <20040808171759.B6463@cs.mcgill.ca>
Date: Sun, 8 Aug 2004 17:17:59 -0400
From: Navindra Umanee <navindra@cs.mcgill.ca>
Mime-Version: 1.0
Subject: [linux-lvm] overallocation of physical volume
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

  --- Volume group ---
  VG Name               bytepool
  System ID             localhost.localdomain1073237462
  Format                lvm1
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                6
  Open LV               6
  Max PV                256
  Cur PV                5
  Act PV                5
  VG Size               46.41 GB
  PE Size               32.00 MB
  Total PE              1485
  Alloc PE / Size       1392 / 43.50 GB
  Free  PE / Size       93 / 2.91 GB
  VG UUID               deadbe-efde-adbe-efde-adbe-efde-adbeef


  --- Physical volume ---
  PV Name               /dev/hda7
  VG Name               bytepool
  PV Size               10.00 GB / not usable 60.70 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              318				 <-------------
  Free PE               4294967262                       <-------------
  Allocated PE          352                              <-------------
  PV UUID               sahdgd-gasj-g21h-xjn4-5jxJ-J45a-asdc3d

  --- Physical volume ---
  PV Name               /dev/hda8
  VG Name               bytepool
  PV Size               10.00 GB / not usable 60.70 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              318                               <-------------
  Free PE               4294967279                        <-------------
  Allocated PE          335                               <-------------
  PV UUID               sahdgd-gasj-g21h-xjn4-5jxJ-J45a-asdc4d

LVM seems to be claiming to use 352 (or 335 in the second case)
physical extents when there are only 318 total...  Should I be
worried?

Any ideas on how to fix this?

Thanks!
Navin.
