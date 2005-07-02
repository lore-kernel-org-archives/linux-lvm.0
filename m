Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j62M9wu25655
	for <linux-lvm@redhat.com>; Sat, 2 Jul 2005 18:09:58 -0400
Received: from web51609.mail.yahoo.com (web51609.mail.yahoo.com
	[206.190.38.214])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j62M9vHc008117
	for <linux-lvm@redhat.com>; Sat, 2 Jul 2005 18:09:57 -0400
Message-ID: <20050702220951.93942.qmail@web51609.mail.yahoo.com>
Date: Sat, 2 Jul 2005 15:09:51 -0700 (PDT)
From: Igor Feoktistov <ifeoktistov@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] iSCSI lun resize
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
Is there any way to make new space visible for lvm?
Also is there any plans to implement pvresize in
RH4/lvm2?
I understand that vgcfgbackup/restore with pe_count
editing can do the trick.
However, I don't think it's safe to extend volume if
pe_count is not calculated right.

The platform is x86 RHEL4U1, kernel 2.6.9-11.ELsmp,
linux-iscsi-4.0.2

PS: I really hoped on using ext2online. Any help how
to make it work on iscsi disks will be very
appreciated.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
