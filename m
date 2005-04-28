Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3SJQrO10266
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 15:26:53 -0400
Received: from bristol.phunnypharm.org ([206.246.247.150])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3SJQpcU014615
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 15:26:51 -0400
Received: from bcollins by bristol.phunnypharm.org with local (Exim 4.50)
	id 1DRE9h-0000wr-Gj
	for linux-lvm@redhat.com; Thu, 28 Apr 2005 14:54:33 -0400
Date: Thu, 28 Apr 2005 14:54:33 -0400
From: Ben Collins <bcollins@debian.org>
Message-ID: <20050428185433.GH18051@phunnypharm.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM wedged after stopping some pvmove's
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

I was in the middle of doing pvmove for all my lv's which resided on two
disks, that were being moved to a newly created raid5 pv.

Things got all crappy, and now I get this:

~# pvmove --abort -v
    Finding all volume groups
    Finding volume group "swissdisk_1"
  VG swissdisk_1 metadata too large for circular buffer
  ABORTING: Failed to write new data locations to disk.
  VG swissdisk_1 metadata too large for circular buffer
  ABORTING: Failed to write new data locations to disk.


I'm unable to recover from this. Is there any way to forcefully remove the
failed pv's? Perhaps clean this up? I can do nothing with this vg until
this is resolved, and I cannot lose the data on the volumes.

-- 
Debian     - http://www.debian.org/
Linux 1394 - http://www.linux1394.org/
Subversion - http://subversion.tigris.org/
