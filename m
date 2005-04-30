Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3UJVTO07877
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 15:31:29 -0400
Message-ID: <4273DCF5.3030905@ruckusnetwork.com>
Date: Sat, 30 Apr 2005 15:31:01 -0400
From: Lance Reed <lreed@ruckusnetwork.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] will pvcreate destroy lvm data on an already exsiting PV
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
To: Linux-LVM@Sistina.com

I know you guys don't normally respond to direct email about LVM.

But I have a situation that the PV in a VG seems to have lost its 
metadata, and
there is a discrepancy between What the OS thinks the partition for a 
device that uses
LVM is and what LVM thinks it should be (/dev/sde vs /dev/sde1).  A 
vgrestore complains
about pv_read not working.  So my question is, if I run a new pvcreate 
on the disk device,
will it destroy the LVM data on the existing device.  Or will it just 
setup a placeholder for
the metadata, and I can then just do a vgcgrestore and put that back in 
place without
losing data.

Thanks for any suggestions and your time.

Sincerely,

Lance Reed
lreed@ruckusnetwork.com
