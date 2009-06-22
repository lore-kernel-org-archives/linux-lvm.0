Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5MHNHY7026452
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 13:23:17 -0400
Received: from thor.merit.edu (thor.merit.edu [198.108.1.14])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5MHN2Ca026718
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 13:23:03 -0400
Message-Id: <104D56B6-A5AA-44BC-A1A6-EDCF2FC098A8@merit.edu>
From: Anthony Clark <anthony@merit.edu>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v935.3)
Date: Mon, 22 Jun 2009 13:23:02 -0400
Subject: [linux-lvm] recovering data from inside a partitioned lv
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-lvm@redhat.com

Hi,

The following stupid mistake was made :(  A pv, vg and lv were  
created, and then the documentation was misread, and a partition was  
created inside the lv.  Said partition mounted fine, and allowed fs  
creation along with large amounts of data to be copied.  Partition was  
accessible via /dev/vg1/lv1p1.

Server has been rebooted, and now only /dev/vg1/lv1 is shown.  parted  
can open the lv and shows 1 partition inside, but doesn't understand  
ext3 volumes, so can't copy the partition to another disk.  tune2fs  
can't see /dev/vg1/lv1p1, or I'd use that to change the fs type to ext2.

Is there a way to undo the stupid mistake and get at the partition  
inside the logical volume?  That is to say, mount the partition, copy  
the data out and then create the filesystem correctly.  Is there a way  
to force /dev/vg1/lv1p1 to show up again?

Thanks in advance for helping :)

-a
