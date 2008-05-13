Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4DHLMqB004685
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 13:21:22 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4DHLBcG025172
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 13:21:11 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m4DHL6Pk011006
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 13:21:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m4DHL6uI029341
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 13:21:06 -0400
Date: Tue, 13 May 2008 13:21:06 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <1c748a490805130716y558520d7i7b2781816bd743e1@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0805131309330.29266-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 13 May 2008, Larry Dickson wrote:

> on the full, unpartitioned lv. Then it mounted, with the entire FAT on
> ramdisk, and wrote very fast because FAT32 (like DOS) lays down data in
> order from the start of a disk and does not skip around (I'd be interested
> if anyone knows any other file systems with that property).

The SysV filesystem put a fixed size inode table at the beginning of a
partition.  More modern filesystems from ext to reiser try to distribute
the meta-data to keep it closer to the data.  This is, of course, counter
productive when the beginning of a disk is significantly faster and seek-free
as in your setup.  

Since ext3 inode placement is table driven (with the table in a magic inode),
there is probably a simple patch to mke2fs to create only one inode table at
the beginning of a drive.  In fact, I wonder if there is already an option...
looks like -g blocks_per_group might do the trick - assuming inodes are 
at the beginning of a block group, rather than the middle.  If not,
a patch to mke2fs is needed to do what you want.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
