Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j955EYV23655
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2005 01:14:34 -0400
Received: from mi.npn ([206.58.200.39])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j955EWmR017785
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2005 01:14:33 -0400
Received: from [10.32.70.91] (unknown [10.32.70.91])
	by mi.npn (Postfix) with ESMTP id ACF53D415B
	for <linux-lvm@redhat.com>; Tue,  4 Oct 2005 22:14:26 -0700 (PDT)
Message-ID: <4343612C.6050105@neatech.com>
Date: Tue, 04 Oct 2005 22:14:20 -0700
From: Patrick Nelson <pnelson@neatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem making the file system
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

FC4 Updated

Trying to setup a LV on a FC4 setup for home and opts.  Here is the 
process:

pvcreate /dev/hda1

vgcreate homeVG /dev/hda1

lvcreate -L4G -mhomeLV homeVG

mkfs.ext3 /dev/homeVG/homeLV

but when I do the step of mkfs.ext3 I get an error of :
mke2ffs 1.37 (21-Mar-2005)
Could not stat /dev/homeVG/homeLV --- permission denied

ls -la /dev/homeVG/ shows that a link of homeLV -> 
/dev/mapper/homeVG-homeLV which has permissions of:

brw-rw---- root disk 253, 2 Oct 4 17:25

Anyone have an idea on what is going wrong?
