Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB2FSZr24557
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 10:28:35 -0500
Received: from mail.davidb.org (adsl-64-172-240-129.dsl.sndg02.pacbell.net
	[64.172.240.129])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB2FSXlo029518
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 10:28:34 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.42 #1 (Debian))
	id 1CZssZ-0002Xe-TH
	for <linux-lvm@redhat.com>; Thu, 02 Dec 2004 07:28:25 -0800
Date: Thu, 2 Dec 2004 07:28:22 -0800
From: David Brown <lvm@davidb.org>
Message-ID: <20041202152819.GA9248@old.davidb.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Strange errors on LVM2 snapshot create.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM discussion <linux-lvm@redhat.com>

I'm running x86 Linux 2.6.9, with the 2.6.9-udm patches, lvm2-2.00.02,
device-mapper-1.00.17.

Occasionally, when I try creating a snapshot, I get the following out of
lvcreate:

  device-mapper ioctl cmd 9 failed: Cannot allocate memory
  Couldn't load device 'shadowdb-homesnap'.
  Problem reactivating origin home
  device-mapper ioctl cmd 6 failed: Invalid argument
  Couldn't resume device 'shadowdb-homesnap'
  Aborting. Failed to activate snapshot exception store. Remove new LV and retry.

There is also an accompanied kernel message that I'll send once I can get
this to happen again while I'm at the machine.

Is this problem known?  Should I try building a newer version of the lvm2
utilities, and device-mapper library?

Any pointers?

Thanks,
Dave Brown
