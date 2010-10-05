Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95CIQHa020643
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 08:18:26 -0400
Received: from mail-yx0-f174.google.com (mail-yx0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95CIBks000497
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 08:18:12 -0400
Received: by yxp4 with SMTP id 4so2431030yxp.33
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2010 05:18:11 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 Oct 2010 17:48:11 +0530
Message-ID: <AANLkTikruA=C7O-uNbf-8VqNHycg751Q55Qi=tZQVHXP@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Subject: [linux-lvm] partition 2 different type of filesystem in an LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Step 1) pvcreate /dev/sdb
Step 2) vgcreate nintendo /dev/sbd
  Volume group "nintendo" successfully created

Step 3) lvcreate --name lvm1 --size 10G nintendo

Step 4) vgscan
Reading all physical volumes.  This may take a while...
  Found volume group "nintendo" using metadata type lvm2

Step 5) lvdisplay

--- Logical volume ---
  LV Name                /dev/nintendo/lvm1
  VG Name                nintendo
  LV UUID                280Mup-H9aa-sn0S-AXH3-04cP-V6p9-lfoGgJ
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                10.00 GB

Step 6) cfdisk /dev/nintendo/lvm1

Step 7) kpartx -av /dev/nintendo/lvm1
lvscan
ACTIVE            '/dev/nintendo/lvm1' [10.00 GiB] inherit

vgscan
Reading all physical volumes.  This may take a while...
  Found volume group "nintendo" using metadata type lvm2


Step 8) Create two partitions on /dev/nintendolvm1
now how do I convert them to filesystem

as in lvscan it does not come as two different blocks I see them as
only one block device

ACTIVE            '/dev/nintendo/lvm1' [10.00 GiB] inherit

What I am doing manually in step 8 is some thing done when using
virt-manager to install guest OS.
If some  one can point me to script that is doing this I will be able
to understand.
