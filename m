Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3FF5IIo004948
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 11:05:18 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3FF5Icf022734
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 11:05:18 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Jlmik-0007Nk-8B
	for linux-lvm@redhat.com; Tue, 15 Apr 2008 16:05:18 +0100
Date: Tue, 15 Apr 2008 16:05:18 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20080415150518.GP24157@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 release 2.02.35
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

I've uploaded LVM2 2.02.35 to ftp://sources.redhat.com/pub/lvm2/ .
 
Fixes some bugs in 2.02.34, the worst of which was a common segfault when
starting up clvmd, so it's best not to use 2.02.34.  Try 2.02.35 now instead.

Changelog
---------
  Drop cached VG metadata before and after committing changes to it.
  Rename P_global to P_#global.
  Don't attempt remote metadata backups of non-clustered VGs. (2.02.29)
  Don't store fid in VG metadata cache to avoid clvmd segfault. (2.02.34)
  Update vgsplit to only restrict split with active LVs involved in split.
  Add lv_is_active() to determine whether an lv is active.

Alasdair
-- 
agk@redhat.com
