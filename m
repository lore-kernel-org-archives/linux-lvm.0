Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LIEAa03833
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 14:14:10 -0400
Received: from mail.ncsa.uiuc.edu (mail.ncsa.uiuc.edu [141.142.2.28])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6LIE9e1025467
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 14:14:09 -0400
Received: from gship4.ncsa.uiuc.edu (gship4.ncsa.uiuc.edu [141.142.98.127])
	by mail.ncsa.uiuc.edu (8.11.7/8.11.7) with ESMTP id i6LIDLc21225
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 13:13:21 -0500
Message-Id: <5.1.0.14.2.20040721131110.038d67d8@pop.ncsa.uiuc.edu>
Date: Wed, 21 Jul 2004 13:13:25 -0500
From: Guochun Shi <gshi@ncsa.uiuc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] "__you_cannot_kmalloc_that_much" undefined
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

hi,

I got a warning when compiling the patched 2.6.7 kernel:

*** Warning: "__you_cannot_kmalloc_that_much" [fs/gfs_locking/lock_gulm/lock_gulm.ko] undefined!

not a big issue since I can use dlm, but still want to know how I can remove this warning. 

thanks
-Guochun
