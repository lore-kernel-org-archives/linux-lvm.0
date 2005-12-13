Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBDCPjBM026834
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:25:45 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Em9E1-0004KK-I1
	for linux-lvm@redhat.com; Tue, 13 Dec 2005 12:25:45 +0000
Date: Tue, 13 Dec 2005 12:25:45 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] multiple lvm2-snapshots on the same origin ->
	device-mapper error
Message-ID: <20051213122545.GF25866@agk.surrey.redhat.com>
References: <439EB4BB.2070009@web.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <439EB4BB.2070009@web.de>
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

On Tue, Dec 13, 2005 at 12:47:07PM +0100, Patrick Reinhardt wrote:
> Hi!
> I'm running in trouble creating more than 16 snapshots of the same origin:
 
We don't have a solution for that particular problem yet, but we do have code 
changes that should avoid the risk of the system locking up when it happens.

This needs the latest development packages for LVM2 (2.02.*) and 
device-mapper (1.02.*).

And a kernel containing the patches:

  dm-rename-frozen_bdev.patch
  dm-skip-lockfs.patch
  dm-ioctl-skip-lockfs.patch
  dm-snapshot-metadata-reading-separation.patch
  dm-snapshot-load-metadata-on-creation.patch
  dm-ioctl-reduce-pf-memalloc-usage.patch

from http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/

There are still some snapshot problems that have shown up while
testing the RHEL4 kernel (with all the above patches applied) that we 
haven't got to the bottom of yet:

  https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=174636
  https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=174742
  https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=174753

Alasdair
-- 
agk@redhat.com
