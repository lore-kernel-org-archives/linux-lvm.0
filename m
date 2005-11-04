Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA41KuV23697
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 20:20:56 -0500
Received: from dcs.nac.uci.edu (dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA41KnAJ024020
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 20:20:49 -0500
Subject: Re: [linux-lvm] Snapshot weirdness
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <436AA2DF.8030002@tsss.org>
References: <436AA2DF.8030002@tsss.org>
Date: Thu, 03 Nov 2005 17:20:35 -0800
Message-Id: <1131067235.4032.175.camel@seki.nac.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Is disk to disk to tape cost effective compared to disk to disk?

I don't mean to assert that disk to disk to tape is more or less
expensive than disk to disk, but it seems worth comparing.

I'm thinking disk to disk to tape'd be faster in some sense than disk to
tape, in fact that's what we use here at UCI for a lot of our backups,
but if you're starting over from scratch, how about comparing the cost
of something like:

1) A bunch of opterons with RAID 5 volumes built via md, tacked together
with Ibrix, or perhaps just a bunch of gnbd's md'd together into a huge
xfs

2) One of those many rsync front-ends that stores only one copy of a
given file?  backuppc seems to have the most sophisticated user
interface, but honorable mention goes to rdiff-backup for using rdiff
(binary diff based on the rsync algorithm) and reverse deltas (which
ISTR was the big plus of CVS over prior source code control systems, so
the diff'ing gets deeper as you go back in time, not forward in time,
and since you're more likely to need contemporary files...).

Before you decide that the hashing involved in rsync would cause too
many collisions, bear in mind that with a sufficiently strong hash, you
can have a lower probability of a collision than the probability of a
tape failure...

On Thu, 2005-11-03 at 15:53 -0800, kelsey hudson wrote:
> Hello.
> 
> I'm building a disk-to-disk-to-tape backup appliance here, and decided 
> that for maximum flexibility I'd use LVM2 (mainly because of its 
> snapshot feature and the ability to hot-add disks and extend volumes 
> seamlessly. Good stuff.)
> 
> Anyhow, I have a 600GB primary physical volume configured with a single 
> logical volume utilizing 99% of the extents. I have the system set to 
> take a snapshot every night so there's always a live copy of the data 
> available for backup. Three such snapshots are used in rotation (the 
> oldest snapshot is deleted and recreated as the newest); each occupy 25 
> extents. The problem is, after some time, I'll have a bunch of errors 
> regarding the snapshot volumes spewed to the system logs and console. If 
> I subsequently try and read from the filesystem, the kernel shuts the 
> filesystem down (XFS feature).
> 
> This makes it rather inconvenient to back up a snapshot -- if I can't 
> read it, it doesn't do me much good to have it. I'm basically using the 
> snapshots read-only, and the filesystems are mounted as such, as well.
> 
> So, can anyone shed some insight on why I have self-corrupting 
> filesystems on my snapshot volumes?
> 
> Thanks in advance.
> -Kelsey
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
