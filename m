Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88CwctN006313
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 08:58:38 -0400
Received: from arvo.suso.org (mail.suso.org [216.9.132.134])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k88CwTKh026936
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 08:58:30 -0400
Date: Fri, 8 Sep 2006 12:55:06 +0000
From: Mark Krenz <mark@suso.org>
Message-ID: <20060908125506.GA30379@arvo.suso.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Altering a Physical Volume's UUID
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


  Hi,  I'm using LVM with Xen virtual machines by creating sparse image
files with something like 

  dd if=/dev/zero of=diskimage bs=1 count=1 seek=1073741824

 Then I use a loopback device to use the diskimage as a block device and
create a physical volume, volume group and logical volumes on it.

  This all works great, but when I copy the diskimage file to another
file and try to setup a loopback device for it, I get complaints about
there being multiple identifical UUIDs for physical volumes and volume
groups.


  So is there a way to change the UUID of a physical volume and volume
group?


  If you are wondering why I would need to copy the diskimage file, its
because I'm setting up Xen template images for different OSes that I can
then simply copy into place, make a few modifications and then be on my
way.

-- 
Mark S. Krenz
IT Director
Suso Technology Services, Inc.
http://suso.org/
