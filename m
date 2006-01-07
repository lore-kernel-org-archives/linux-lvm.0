Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k071ne126731
	for <linux-lvm@redhat.com>; Fri, 6 Jan 2006 20:49:40 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k071nYos013764
	for <linux-lvm@redhat.com>; Fri, 6 Jan 2006 20:49:34 -0500
Received: by wproxy.gmail.com with SMTP id 37so3007285wra
	for <linux-lvm@redhat.com>; Fri, 06 Jan 2006 17:49:34 -0800 (PST)
Message-ID: <aa4c40ff0601061743u4fcc16apa4fd801916973a35@mail.gmail.com>
Date: Fri, 6 Jan 2006 17:43:03 -0800
From: James Lamanna <jlamanna@gmail.com>
In-Reply-To: <aa4c40ff0601061728p57d83f29ndbcd40af0b27802@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <aa4c40ff0601061728p57d83f29ndbcd40af0b27802@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Resizing a physical partition used in LVM
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

Lets say I have the following scenario:
I have 4 paritions on a RAID 5 (h/w RAID with 3ware escalade).
1 partition (/dev/sda4) is managed by LVM.
Currently I have 4 disks in the RAID 5.
If, in the future, I want to add disks to the RAID (the controller has
8 ports), is resizing /dev/sda4 in fdisk to accomodate the extra space
problematic?
In other words would the following work:
1) Stop LVM.
2) Extend /dev/sda4 to the end of the RAID with fdisk
3) Start LVM
4) lvextend a logical partition to the end of the physical volume.

Or do I have to create a new partition on the disk for this extra space?

Thanks.

-- James
