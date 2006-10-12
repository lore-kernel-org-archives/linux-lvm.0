Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CLpA6A016404
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 17:51:10 -0400
Received: from java-cup.de (h7339.serverkompetenz.net [81.169.183.84])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CLp5BI010131
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 17:51:05 -0400
From: Martin Wilmes <martin.wilmes@java-cup.de>
Date: Thu, 12 Oct 2006 23:50:44 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200610122350.46609.martin.wilmes@java-cup.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Broken hard disk
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I had a standard Fedora Core 4 installation with the root fs and swap 
on LVM. I upgraded to Core 5. Everything worked fine. No need to be an LVM 
guru so far.

Then I added a new hard disk to the computer and a partition of this new disk 
to the root volume. The "new" hard disk then broke down so that I am unable 
to access the data on the root volume.

Now I installed the old, hopefully still working disk in a different computer 
and booted with Knoppix 5.0.1 to get some of my data back but vgscan -v comes 
back with nothing at all.

fdisk says

Disk /dev/hda: 20.5 GB, 20525137920 bytes
255 heads, 63 sectors/track, 2495 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1          13      104391   83  Linux
/dev/hda2              14        2495    19936665   8e  Linux LVM

Any suggestions how to recover that volume?

Thanks
Martin
