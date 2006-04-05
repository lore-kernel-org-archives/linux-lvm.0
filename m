Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k35JYWcH027473
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 15:34:32 -0400
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k35JYQEV021211
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 15:34:26 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id E25D81B7F
	for <linux-lvm@redhat.com>; Wed,  5 Apr 2006 14:41:11 -0400 (EDT)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 10658-12 for <linux-lvm@redhat.com>;
	Wed,  5 Apr 2006 14:41:09 -0400 (EDT)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id 0CC1C1B7E
	for <linux-lvm@redhat.com>; Wed,  5 Apr 2006 14:41:09 -0400 (EDT)
Message-ID: <44340F46.5040000@volved.com>
Date: Wed, 05 Apr 2006 14:41:10 -0400
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Bad disk removal
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hey all,

So after lots of scans and log review, turns out 1 of the 8 IDE disks in 
my LVM is bad. (I know, IDE, yeahyeah...)

I currently have the affected volume group online, and it's mounted in 
XFS readonly,norecovery mode. XFS can't attempt repair because one of 
the bad sectors is the superblock so xfs_repair bombs.

Unfortunately I don't have 1.2TB of free space available to try and pull 
all the data off the VG before rebuilding it and replacing the failed 
drive. If I get a replacement for the bad drive and extend the VG, my 
question would be:

How fault tolerant is pvmove if it encounters unreadable/bad sectors on 
a disk? Will I hose the entire VG if pvmove bombs? Will pvmove skip the 
bad sectors after a few attempts and move on? Will pvmove refuse to even 
try?

I'm sure someone's had experience with this before. :) (Obviously I 
don't have RAID underneath the LVM, otherwise I'm sure this would be 
moot... lesson learned.)

Thanks all,
-Barnaby
