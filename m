Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o41DQwD9017971
	for <linux-lvm@redhat.com>; Sat, 1 May 2010 09:26:58 -0400
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o41DQmwh014799
	for <linux-lvm@redhat.com>; Sat, 1 May 2010 09:26:48 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1O8CiT-0003gt-A6
	for linux-lvm@redhat.com; Sat, 01 May 2010 15:26:45 +0200
Received: from d67-193-197-208.home3.cgocable.net ([67.193.197.208])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 01 May 2010 15:26:45 +0200
Received: from brian by d67-193-197-208.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 01 May 2010 15:26:45 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Sat, 1 May 2010 13:26:35 +0000 (UTC)
Message-ID: <loom.20100501T152029-422@post.gmane.org>
References: <loom.20100429T185325-182@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] will pvmove'ing (an LV at a time) defragment?
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

Brian J. Murrell <brian <at> interlinx.bc.ca> writes:
> 
> If I currently have a volume group consisting of two drives and I add a third 
> drive and them pvmove from the two existing drives to the new drive, will that 
> defragment my LVs?  i.e.:
> 
> # pvmove /dev/sda2 /dev/sdb /dev/sdc

As was pointed out, this syntax does not even work.

But moving a single LV at a time, first moving the "chunks" off of the first
disk then the second, is resulting in the defragmentation that I was hoping
for.  I guess this works reasonably straighforwardly because the second disk
was added as a result of the first disk being full and there has been no mass 
freeing of volumes on the first disk to cause future volume expansions to be
done on the first disk after expansions were done to the second disk.

That said, it is quite easy to move portions of an LV, so hooking pvmove into
a disk defragmentation algorithm shouldn't be difficult, if one can find a good 
defragmentation algorithm.

TBH, I'm surprised nobody has done such a thing, or if they have, too bad they 
did not contribute it back to the LVM project.  :-(

Cheers,
b.
