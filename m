Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8GDFrrI027720
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2004 14:15:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C7w77-0005KO-V3
	for linux-lvm@redhat.com; Thu, 16 Sep 2004 14:15:53 +0100
Date: Thu, 16 Sep 2004 14:15:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20040916131553.GM21624@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Release 2.00.23
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
To: linux-lvm@redhat.com

      ftp://sources.redhat.com/pub/lvm2/LVM2.2.00.23.tgz
      http://sources.redhat.com/lvm2/

Version 2.00.23 - 15th September 2004
=====================================
  Export dm name build & split functions.
  Use O_NOATIME on devices if available.
  Write log message when each segtype/format gets initialised.
  New commands 'segtypes' and 'formats'.
  Suppress pvmove abort message in test mode.
  Improve pvcreate/remove device not found error message.
  Allow pvmove to move data within the same PV.
  Describe how pvmove works on man page.
  Test for incompatible format/segtype combinations in lv_extend.
  Fix lvchange example on man page.
                                                                                
Version 2.00.22 - 3rd September 2004
====================================
  Fix /dev/vgname perms.
  Restructure xlate.h.
  Add clvmd man page.

Version 2.00.21 - 19th August 2004
==================================
  Update cnxman-socket.h from cman.
  Recognise iseries/vd devices.
  Use 'make install_cluster' to install cluster extensions only.
  Cope with DT_UNKNOWN in sysfs.
  Fix extents_moved metadata size comment.
  Remove duplicate line in pvremove help text.
  Support variable mirror region size.
  Support PE ranges in pvmove source PV.
  Fixes to as-yet-unused LV segment splitting code.
  Change alloc_areas to pe_ranges and allow suppression of availability checks.
  Add dev_size column to pvs.
  Add report columns for in-kernel device number.
