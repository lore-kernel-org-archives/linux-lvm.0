Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3TH019q012976
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2010 13:00:01 -0400
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3TGxlES005439
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2010 12:59:48 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1O7X5U-0002az-1s
	for linux-lvm@redhat.com; Thu, 29 Apr 2010 18:59:44 +0200
Received: from d67-193-197-208.home3.cgocable.net ([67.193.197.208])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2010 18:59:44 +0200
Received: from brian by d67-193-197-208.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2010 18:59:44 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 29 Apr 2010 16:59:36 +0000 (UTC)
Message-ID: <loom.20100429T185325-182@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] will pvmove'ing (an LV at a time) defragment?
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
To: linux-lvm@redhat.com

If I currently have a volume group consisting of two drives and I add a third 
drive and them pvmove from the two existing drives to the new drive, will that 
defragment my LVs?  i.e.:

# pvmove /dev/sda2 /dev/sdb /dev/sdc

where /dev/sdc is the new empty drive.

Or will it just move the PEs from each source disk (in turn) in the order they 
appear on the source disk, effectively just concatenating the two sources disks 
to the new target disk?

If the answer to the above is yes, if I limit my pvmoves to a single LV at a 
time, will that defragment the LVs or will it simply move the "chunks" of the LV 
from the first source disk to the target disk followed by the chunks from the 
second source disk?  (Although likely that will have the desired effect anyway, 
as the second disk was added subsequent to the first disk getting fullish.)

Cheers,
b.
