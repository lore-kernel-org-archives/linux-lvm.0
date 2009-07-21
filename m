Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LJuWX1030036
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:56:32 -0400
Received: from mail-pz0-f172.google.com (mail-pz0-f172.google.com
	[209.85.222.172])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LJuB0q010088
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:56:11 -0400
Received: by pzk2 with SMTP id 2so2290333pzk.23
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 12:56:11 -0700 (PDT)
MIME-Version: 1.0
From: Adam Olsen <arolsen@gmail.com>
Date: Tue, 21 Jul 2009 13:55:50 -0600
Message-ID: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't mount or run fdisk on an existing logical volume,
	help!
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

This pretty much sums it up:

imgserv:/storage/# lvscan
  ACTIVE            '/dev/storage/storage' [3.62 TB] inherit
imgserv:/storage/# fdisk /dev/storage/storage

Unable to read /dev/storage/storage

I can't mount it, access it with fdisk.  Here's the lvdisplay output:

imgserv:/storage/# lvdisplay
  --- Logical volume ---
  LV Name                /dev/storage/storage
  VG Name                storage
  LV UUID                Cw8aAr-YHsR-oVfH-7AAx-2ppa-Zm3M-U9z1eA
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                3.62 TB
  Current LE             948962
  Segments               3
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           254:0

This is on debian etch.   This is what I see at the end of dmesg:

cdrom: open failed.
hdc: packet command error: status=0x51 { DriveReady SeekComplete Error }
hdc: packet command error: error=0x54

Which I don't think has anything to do with this problem, as hdc is
NOT one of the physical volumes... it's a cdrom drive.

Is there anything I can do to debug this?

-- 
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic
