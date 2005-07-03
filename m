Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j63KfTV26180
	for <linux-lvm@redhat.com>; Sun, 3 Jul 2005 16:41:29 -0400
Received: from mx1.netapp.com (mx1.netapp.com [216.240.18.38])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j63KfJKq030662
	for <linux-lvm@redhat.com>; Sun, 3 Jul 2005 16:41:19 -0400
Received: from [192.168.1.5] ([192.168.224.147])
	by smtp2.corp.netapp.com (8.13.1/8.13.1/NTAP-1.6) with ESMTP id
	j63Kf8Ig006649
	for <linux-lvm@redhat.com>; Sun, 3 Jul 2005 13:41:08 -0700 (PDT)
From: Igor Feoktistov <igorf@netapp.com>
Date: Sun, 03 Jul 2005 13:45:58 -0700
Message-Id: <1120423559.31478.3.camel@mybaby.netapp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend on iSCSI lun
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

Hi,

Has anybody succeeded in fs resizing on iscsi lun?
I've created vg on iscsi disk /dev/sdb and lv using
all available space.
When I resized the lun on iscsi target and did "echo 1
>
sys/devices/platform/host0/target0:0:0/0:0:0:1/rescan",
I could see the message from kernel showing correct
new size:
--
Jul  2 14:28:42 iscsi-rh4u1 kernel: SCSI device sdb:
73400320 512-byte hdwr sectors (37581 MB)
Jul  2 14:28:42 iscsi-rh4u1 kernel: SCSI device sdb:
drive cache: write through
--
However, it's not visible from lvm. 
fdisk and parted also show old disk geometry.
When I tried "blockdev --rereadpt /dev/sdb, I got next
error:
--
BLKRRPART: Device or resource busy
--
Is there any way to make a new space visible for lvm?
Also is there any plans to implement pvresize in
RH4/lvm2?
I understand that vgcfgbackup/restore with editing pe_count
can do the trick.
However, I don't think it's safe to extend volume if
pe_count is not calculated right.

The platform is x86 RHEL4U1, kernel 2.6.9-11.ELsmp,
linux-iscsi-4.0.2

PS: I really hoped on using ext2online. Any help how
to make it work on iscsi disks will be very
appreciated.
