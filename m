Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iANIeElZ020174
	for <linux-lvm@redhat.com>; Tue, 23 Nov 2004 18:40:14 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CWfaI-0005in-Hd
	for linux-lvm@redhat.com; Tue, 23 Nov 2004 18:40:14 +0000
Date: Tue, 23 Nov 2004 18:40:14 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20041123184014.GH8857@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Release 2.00.26
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

       ftp://sources.redhat.com/pub/lvm2/LVM2.2.00.26.tgz
       http://sources.redhat.com/lvm2/
 
Bug fixes and more documentation.
Also changes to device recognition affecting partitioned
devices and software raid.  If you've found problems with this
before, please retest.


Version 2.00.26 - 23rd November 2004
====================================
  Improve pool debugging stats.
  Detect partition table signature.
  pvcreate wipes md superblocks. (With --uuid or --restorefile it prompts.)
  Separate out md superblock detection code.
  Prevent snapshot origin resizing.
  Improve a vgremove error message.
  Update some man pages.
  Allow y/n with -ae args (exclusive activation).
  Fixes to lvcreate vgname parsing.
  Fix dm_name string size calculation.
  Improve clvmd error reporting during startup.
  Make clvmd cope with large gaps in node numbers IDs.
  Make clvmd initialisation cope better with debugging output.
  Tidy clvmd socket callbacks so all work happens outside main loop.
  clvmd -V now displays lvm version too.
  Add optional gulm build for clvmd


Alasdair
-- 
agk@redhat.com
