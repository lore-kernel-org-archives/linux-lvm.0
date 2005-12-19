Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBJDYP115939
	for <linux-lvm@redhat.com>; Mon, 19 Dec 2005 08:34:25 -0500
Received: from s1.ckr-solutions.com (s1.ckr-solutions.com [82.97.10.19])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBJDYNp7002387
	for <linux-lvm@redhat.com>; Mon, 19 Dec 2005 08:34:23 -0500
Received: from localhost (s1.ckr-solutions.com [82.97.10.19])
	by s1.ckr-solutions.com (Postfix) with ESMTP id 44D4C4118
	for <linux-lvm@redhat.com>; Mon, 19 Dec 2005 14:33:55 +0100 (CET)
Date: Mon, 19 Dec 2005 14:33:55 +0100 (CET)
From: Olivier Kaloudoff <kalou@kalou.net>
Message-ID: <Pine.LNX.4.63.0512191419400.23209@s1.ckr-solutions.com>
MIME-Version: 1.0
Subject: [linux-lvm] meaning of -L for snapshots ?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

 	I'm playing with lvm snapshots for the first time,
and wondering the meaning of -L when creating a snapshot. Indeed,
the following example shows a snapshot done with -L10M, on a
volume that's already 156M used for a total of 2G;


[root@shinwey root]# df /vservers/skel/ -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/nr_180/skel      2.0G  156M  1.8G   9% /vservers/skel

[root@shinwey root]# lvcreate  -L10M --snapshot --name snaptest 
/dev/nr_180/skel
lvcreate -- rounding size up to physical extent boundary
lvcreate -- WARNING: the snapshot will be automatically disabled once it 
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for 
"/dev/nr_180/snaptest"
lvcreate -- doing automatic backup of "nr_180"
lvcreate -- logical volume "/dev/nr_180/snaptest" successfully created

[root@shinwey root]# mount /dev/nr_180/snaptest  /mnt/snaptest/
mount: block device /dev/nr_180/snaptest is write-protected, mounting 
read-only

[root@shinwey root]# df -h /mnt/snaptest/
Filesystem            Size  Used Avail Use% Mounted on
/dev/nr_180/snaptest  2.0G  156M  1.8G   9% /mnt/snaptest



 	Who can explain the usage of -L10M for my snapshot ?


Best Regards,


Olivier Kaloudoff
