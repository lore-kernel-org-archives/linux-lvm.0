Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBDBlX131231
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 06:47:33 -0500
Received: from pr.selfip.biz (pr.selfip.biz [80.72.255.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBDBlRbl004956
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 06:47:27 -0500
Received: from localhost (localhost [127.0.0.1])
	by pr.selfip.biz (Postfix) with ESMTP id E77248B8096
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:47:16 +0100 (CET)
Received: from pr.selfip.biz ([127.0.0.1])
	by localhost (delta [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27813-08 for <linux-lvm@redhat.com>;
	Tue, 13 Dec 2005 12:47:14 +0100 (CET)
Received: from [192.168.1.6] (unknown [192.168.1.6])
	by pr.selfip.biz (Postfix) with ESMTP id 0D89E8B8095
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:47:14 +0100 (CET)
Message-ID: <439EB4BB.2070009@web.de>
Date: Tue, 13 Dec 2005 12:47:07 +0100
From: Patrick Reinhardt <patrick-reinhardt@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] multiple lvm2-snapshots on the same origin ->
	device-mapper error
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

Hi!
I'm running in trouble creating more than 16 snapshots of the same origin:

--

# /sbin/lvcreate  -s -L150M -n rootfs_node17 /dev/vg/ro_rootfs
File descriptor 5 left open
File descriptor 6 left open
  Rounding up size to full physical extent 152.00 MB
  device-mapper ioctl cmd 9 failed: Cannot allocate memory
  Couldn't load device 'vg-rootfs_node8'.
  Problem reactivating origin ro_rootfs

# lvm version
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.4.0

# uname -a
  Linux hostname 2.6.11.12-xen0 #1 Thu Aug 4 00:45:12 BST 2005 i686
GNU/Linux

--

Browsing the mailing list archives I didn't find a suitable solution
although the problem was mentioned before, e.g. on
http://lists.xensource.com/archives/html/xen-devel/2004-09/msg00426.html

Any ideas?

Thank you in advance.

Patrick Reinhardt
