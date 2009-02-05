Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n15KsiqH024364
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 15:54:54 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n15KpnuQ022912
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 15:52:26 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LVBCG-0006Vp-Fm
	for linux-lvm@redhat.com; Thu, 05 Feb 2009 20:51:40 +0000
Received: from 69-196-139-226.dsl.teksavvy.com ([69.196.139.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 05 Feb 2009 20:51:40 +0000
Received: from monnier by 69-196-139-226.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 05 Feb 2009 20:51:40 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Thu, 05 Feb 2009 15:51:31 -0500
Message-ID: <jwvfxisobi2.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] LVM skips /dev/hde3 because sysfs tells it not to use it
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


I had to disable sysfs_scan before pvcreate accepted to use /dev/hde3 on
a little MIPS box.

How does LVM decide whether sysfs tells it to use a block device or not?
And why would /dev/hde (an internal IDE drive) be presented by sysfs as
"not to be used by LVM"?


        Stefan
