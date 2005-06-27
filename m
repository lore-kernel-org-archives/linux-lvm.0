Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5RJ0pu14676
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 15:00:51 -0400
Received: from usbb-lacimss1.unisys.com (usbb-lacimss1.unisys.com
	[192.63.108.51])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5RJ0mf2013031
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 15:00:48 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 27 Jun 2005 14:00:23 -0500
Message-ID: <19D0D50E9B1D0A40A9F0323DBFA04ACCE04C16@USRV-EXCH4.na.uis.unisys.com>
From: "Protasevich, Natalie" <Natalie.Protasevich@UNISYS.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Boot failure with roof file system under LVM
	(2.6.12-mm*)
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
To: linux-kernel@vger.kernel.org
Cc: "E.Gryaznova" <grev@namesys.com>, linux-lvm@redhat.com

Hi,
I cannot boot -mm kernel on my system since 2.6.12-rc5-mm1. The system
is a partition on ES7000 and has a dual boot for SuSE/RH, which is set
up using two LVM volumes. 

le020-p2:~ # pvs
PV         VG         Fmt  Attr PSize  PFree
/dev/sda2  stash      lvm2 a-   16.50G  3.50G
/dev/sdb2  rhel4stash lvm2 a-   16.50G 16.00M

The other partition on that system set up for dual boot also, but uses 2
disks directly without LVM, and boots just fine.

Last thing I see on the console during failed boot:
...
device-mapper: 4.4.0-ioctl (2005-01-12) initialised: dm-devel@redhat.com
ReiserFS: dm-0: found reiserfs format "3.6" with standard journal


I put little debug in and it turned out that the boot hangs while
waiting on a buffer in fs/reiserfs/super.c read_bitmaps() routine, on
second iteration of the following loop:

    for (i = 0; i < SB_BMAP_NR(s); i++) {
        wait_on_buffer(SB_AP_BITMAP (s)[i].bh);  <========waiting here
indefinitely
        if (!buffer_uptodate(SB_AP_BITMAP(s)[i].bh)) {
            reiserfs_warning(s,"sh-2029: reiserfs read_bitmaps: "
                         "bitmap block (#%lu) reading failed",
                         SB_AP_BITMAP(s)[i].bh->b_blocknr);
            for (i = 0; i < SB_BMAP_NR(s); i++)
                brelse(SB_AP_BITMAP(s)[i].bh);
            vfree(SB_AP_BITMAP(s));
            SB_AP_BITMAP(s) = NULL;
            return 1;
        }
        load_bitmap_info_data (s, SB_AP_BITMAP (s) + i);
    }

Thanks,
--Natalie 
