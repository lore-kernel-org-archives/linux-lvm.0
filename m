Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBLFwfYj006732
	for <linux-lvm@redhat.com>; Fri, 21 Dec 2007 10:58:41 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBLFw7Tx015646
	for <linux-lvm@redhat.com>; Fri, 21 Dec 2007 10:58:08 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 8705761D1C
	for <linux-lvm@redhat.com>; Fri, 21 Dec 2007 16:58:01 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 414169456
	for <linux-lvm@redhat.com>; Fri, 21 Dec 2007 16:58:01 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id qJ-Uep76+Yvu for <linux-lvm@redhat.com>;
	Fri, 21 Dec 2007 16:57:57 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-78-253-212.netcologne.de
	[87.78.253.212]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri, 21 Dec 2007 16:57:57 +0100 (CET)
Message-ID: <476BE284.8060800@wpkg.org>
Date: Fri, 21 Dec 2007 16:57:56 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to access partitioned logical volumes?
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

I have a server which uses LVM2 and "exports" these volume using iSCSI.

On iSCSI initiators, I can use those "exported" volumes, including 
partitions, just fine:

# ls -l
total 0
lrwxrwxrwx 1 root root 10 Aug 31 19:06 part -> ../../sdaa
lrwxrwxrwx 1 root root 11 Aug 31 19:06 part1 -> ../../sdaa1


On the server with LVM I also see that the disk is partitioned, but 
that's about it:

# fdisk /dev/mapper/san1-sample -l

Disk /dev/mapper/san1-mibeg--sql1: 8589 MB, 8589934592 bytes
64 heads, 32 sectors/track, 8192 cylinders
Units = cylinders of 2048 * 512 = 1048576 bytes

                         Device Boot      Start         End      Blocks 
   Id  System
/dev/mapper/san1-samplep1        *           1        8191     8387568 
  7  HPFS/NTFS


However, I've no idea how to access that partition (i.e., mount it) on 
the server with LVM. Perhaps I have to create some nodes, but what nodes?



-- 
Tomasz Chmielewski
http://wpkg.org
