Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k69IFRRv009527
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 14:15:27 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k69IFP3g026833
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 14:15:25 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Fzdo6-0004nC-DM
	for linux-lvm@redhat.com; Sun, 09 Jul 2006 20:15:02 +0200
Received: from 216-15-125-177.c3-0.smr-ubr3.sbo-smr.ma.cable.rcn.com
	([216.15.125.177]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 09 Jul 2006 20:15:02 +0200
Received: from dave by 216-15-125-177.c3-0.smr-ubr3.sbo-smr.ma.cable.rcn.com
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 09 Jul 2006 20:15:02 +0200
From: David Abrahams <dave@boost-consulting.com>
Message-ID: <uu05q3b1r.fsf@boost-consulting.com>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] LVM2 on dmraid -- can't boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Sun, 09 Jul 2006 18:15:27 -0000
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


When building the new system installation from a liveCD, I can easily
create an LVM2 filesystem on top of a dmraid (FakeRaid) 1 array, and
the filesystem works great.  However, when booting from a primary
physical (non-LVM) partition on the dmraid array, only that partition
seems to mount properly; When I try to mount any of the LVM
partitions, all I see in them is "lost+found."  Naturally, the boot
process fails at that point.

http://article.gmane.org/gmane.linux.ataraid/1989
illustrates my situation.

The two details not mentioned there:

1. When mounting any partition (LVM or not), I get 'cramfs: wrong magic'

2. I see the following when I do dmraid -ay

    [ 2881.836361] attempt to access beyond end of device
    [ 2881.836406] sda: rw=0, want=9767777280, limit=876773168
    [ 2881.836361] attempt to access beyond end of device
    [ 2881.836406] sdb: rw=0, want=9767777280, limit=876773168

Can anyone offer help?
Thanks!

-- 
Dave Abrahams
Boost Consulting
www.boost-consulting.com
