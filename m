Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2VJXQM29512
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 14:33:26 -0500
Received: from zeus.itg.uiuc.edu (zeus.itg.uiuc.edu [130.126.126.162])
	by mx2.redhat.com (8.11.6/8.11.6) with SMTP id i2VJ75G09246
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 14:07:05 -0500
Received: from zeus.itg.uiuc.edu (localhost.localdomain [127.0.0.1])
	by zeus.itg.uiuc.edu (8.12.8/8.12.8) with ESMTP id i2VJXOvY005247
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 13:33:24 -0600
Received: from localhost (alazarev@localhost)
	by zeus.itg.uiuc.edu (8.12.8/8.12.8/Submit) with ESMTP id
	i2VJXOmZ005243
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 13:33:24 -0600
Date: Wed, 31 Mar 2004 13:33:23 -0600 (CST)
From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
In-Reply-To: <20040331154915.GD27360@tykepenguin.com>
Message-ID: <Pine.LNX.4.44.0403311322580.17946-100000@zeus.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] max LV size
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Using lvm-1.0.3-15 on RHEL3-AS, kernel 2.4.21-9.0.1.ELsmp.

I've got two SCSI devices attached to the system, each one is 1.74TB in 
size. I want to make a single ext3 filesystem out of those devices. So I'm 
using LVM to create a logical volume (3.48TB) out of those devices:

Even though I set the PE size to 512MB ("vgcreate -s512 /dev/sda 
/dev/sdb"), and I can see the VG size is correct (3.18TB), the maximum LV 
size is still 2TB:

#vgdisplay
[root@xxxxxx root]# vgdisplay
--- Volume group ---
VG Name               test-vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               3.18 TB
PE Size               512 MB
Total PE              6510
Alloc PE / Size       0 / 0
Free  PE / Size       6510 / 3.18 TB
VG UUID               dU1Xjg-w0Y4-aeh2-yU4l-Wo7g-Lewx-r6l1cT
 
Later in the man pages, it says something briefly about a 2TB block device 
limit in linux 2.4:

#man vgcreate
"There is also (as of Linux 2.4) a kernel limitation of 2TB per block 
device."

Is an LV a "block device" and is this why I can't seem to create an LV 
bigger than 2TB? If this is the problem, then LVM2 wouldn't even help, 
would it? Is it really true that no one can create a non-softwareRAID 
filesystem bigger than 2TB on linux 2.4? That just can't be true. Can it?

Thanks in advance,

Alex
---                                                               ---
   Alex Lazarevich | Systems Administrator | Imaging Technology Group
    Beckman Institute | University of Illinois | www.itg.uiuc.edu
---                                                               ---
