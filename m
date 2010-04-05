Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o35E4W13032491
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 10:04:32 -0400
Received: from EXHUB016-4.exch016.msoutlookonline.net
	(exhub016-4.exch016.msoutlookonline.net [207.5.72.225])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o35E4Jqx013094
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 10:04:20 -0400
Message-ID: <4BB9EDDF.8020003@cfl.rr.com>
Date: Mon, 5 Apr 2010 10:04:15 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Strange errors trying to mirror
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm trying to mirror my root fs and get errors that make no sense.  What
am I missing?

  PV         VG   Fmt  Attr PSize   PFree
  /dev/sda1  vg0  lvm2 a-   111.79G  61.79G
  /dev/sdb1  vg0  lvm2 a-   111.79G 111.79G

lvconvert -m1 -i 5 vg0/root
  Insufficient suitable allocatable extents for logical volume : 7680
more required
  Unable to allocate extents for mirror(s).

Then I tried explicitly telling it to allocate from sdb1:

lvconvert -m1 -i 5 vg0/root /dev/sdb1
  Not enough PVs with free space available for parallel allocation.
  Consider --alloc anywhere if desperate.
  Unable to allocate extents for mirror(s).

There are two PVs so why does it complain?
