Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1S9ctjt030486
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2008 04:38:55 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1S9cKwP023839
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2008 04:38:21 -0500
Message-ID: <47C68101.4020406@wpkg.org>
Date: Thu, 28 Feb 2008 10:38:09 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to use mkfs.ext3 "stride=" on LVM on RAID correctly?
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
To: Linux-Raid <linux-raid@vger.kernel.org>, LVM general discussion and development <linux-lvm@redhat.com>, LKML <linux-fsdevel@vger.kernel.org>

Lately, I had a serious performance problem on a 1.2 TB ext3 filesystem 
placed on LVM, which was placed on Linux RAID-5.

Luckily, it was possible to alleviate much of this problem by removing 
internal bitmap from RAID-5 and by using anticipatory IO scheduler.


As suggested earlier by Theodore Tso in "very poor ext3 write 
performance on big filesystems" thread on linux-fsdevel list, I should 
have used "mke2fs -E stride option to make sure all of the bitmaps
don't get concentrated on one hard drive spindle".


Although the fine mkfs.ext3 manual gives some basic information on how 
to do it if you place the whole filesystem on a RAID array, it is not 
clear to me how it should be done correctly if I want to create a ext3 
filesystem on LVM on RAID-5.

Any helpful hints?


-- 
Tomasz Chmielewski
http://wpkg.org
