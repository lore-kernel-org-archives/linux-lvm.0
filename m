Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j43IUskk014315
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 19:30:54 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DT2AY-0001KD-LV
	for linux-lvm@redhat.com; Tue, 03 May 2005 19:30:54 +0100
Date: Tue, 3 May 2005 19:30:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20050503183054.GG9049@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 development release 2.01.10
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is the first in a series of a development releases, version 2.01.10.

NB If you want stability, stick with version 2.01.09 until all
these changes have settled down.


As well as a few minor bug fixes, there are a few new features and 
some significant internal code changes.  Please use this mailing 
list to report any bugs you find.


Changelog:
  Don't create backup and archive dirs till needed.
  Reinstate full PV size when removing from VG.
  Support loopfiles for testing.
  Tidy lv_segment interface.
  pv_segment support.
  vgchange --physicalextentsize
  Internal snapshot restructuring.
  Remove unused internal non-persistent snapshot option.
  Allow offline extension of snapshot volumes.
  Move from 2-step to 3-step on-disk metadata commit.
  Scan ramdisks too and allow non-O_DIRECT fallback.
  Annotate, tidy and extend list.h.
  Alignment tidying.
  Make clvmd work around some "bugs" in gulm's node state notifications.
  Tidy clvmd's SIGHUP handler


New features:
  vgchange --physicalextentsize 
    - changes the PE size in a VG
    - only works if everything is already aligned so no data needs moving

  pvs --segments 
    (cf. the existing 'lvs -o +devices' )

  lvm.conf device/loopfiles
    - a list of existing files to use as if they were block devices
    - the list is in addition to the filtered list of block devices
    - only meant for testing purposes - avoids reconfiguring block devices

Alasdair
-- 
agk@redhat.com
