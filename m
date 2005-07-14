Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6E7vAV29869
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2005 03:57:10 -0400
Received: from styx.nll.se (styx.nll.se [81.216.21.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6E7v7N0006063
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2005 03:57:08 -0400
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id JAA19999
	for linux-lvm@redhat.com; Thu, 14 Jul 2005 09:56:56 +0200
From: fredrik.backman@nll.se
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id JAA19801
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2005 09:56:53 +0200
Received: from fsu50.nll.se (fsu50.nll.se [128.45.193.79])
	by flff0.nll.se (8.8.6 (PHNE_17135)/8.8.6) with ESMTP id JAA17895
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2005 09:53:09 +0200 (METDST)
Received: from localhost (openmail@localhost)
	by fsu50.nll.se (8.11.6/8.11.6) with ESMTP id j6E7r9c09277
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2005 09:53:09 +0200
Date: Thu, 14 Jul 2005 09:53:09 +0200
Message-Id: <H000007200508521.1121327588.fsu50.nll.se@MHS>
MIME-Version: 1.0
Content-Disposition: inline
	;Creation-Date="Thu, 14 Jul 2005 09:53:09 +0200"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] (no subject)
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

I'm testing the experimental mirroring support and this doesn't add upp 
for me?


 pvs
  PV         VG      Fmt  Attr PSize    PFree
  /dev/sdb   test_vg lvm2 a-   1020.00M 1020.00M
  /dev/sdc   test_vg lvm2 a-   1020.00M 1020.00M

 vgs
  VG      #PV #LV #SN Attr  VSize VFree
  test_vg   2   0   0 wz--n 1.99G 1.99G


lvcreate -m1 -L 100M -v -ntest test_vg
    Finding volume group "test_vg"
    Archiving volume group "test_vg" metadata (seqno 8).
    Creating logical volume test_mlog
  Not enough PVs with free space available for parallel allocation.
  Consider --alloc anywhere if desperate.


However, if I add another PV into my volume group, the lvcreate above 
succeeds.

Regards Fredrik
