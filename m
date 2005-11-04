Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA477vV18832
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 02:07:57 -0500
Received: from fed1rmmtao08.cox.net (fed1rmmtao08.cox.net [68.230.241.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA477nlQ010800
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 02:07:49 -0500
Received: from [70.181.66.125] by fed1rmmtao08.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051104070658.RQLR776.fed1rmmtao08.cox.net@[70.181.66.125]>
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 02:06:58 -0500
Message-ID: <436B08BF.5080903@tsss.org>
Date: Thu, 03 Nov 2005 23:07:43 -0800
From: kelsey hudson <khudson@tsss.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot weirdness
References: <436AA2DF.8030002@tsss.org>
	<1131067235.4032.175.camel@seki.nac.uci.edu>
In-Reply-To: <1131067235.4032.175.camel@seki.nac.uci.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dan Stromberg wrote:
> Is disk to disk to tape cost effective compared to disk to disk?

It is. We have need for both online and archival backups. The online 
backups in case we need to hot-restore a file or to quickly go back to 
an old snapshot of a database or something, and an archive in case 
things go terribly wrong, and for (as the name implies) an archive.

> I don't mean to assert that disk to disk to tape is more or less
> expensive than disk to disk, but it seems worth comparing.

It's always important to weigh the options. :)

> I'm thinking disk to disk to tape'd be faster in some sense than disk to
> tape, in fact that's what we use here at UCI for a lot of our backups,
> but if you're starting over from scratch, how about comparing the cost
> of something like:

Funny you mention that -- I work on the UCI campus, in the research park 
near the corner of Bison and California. Small world ...

Anyhow, yes. Disk to disk to tape is much faster. Most everything I'm 
backing up is over the network, mainly on large NAS volumes mounted over 
100MBit ethernet (yes, our network admin needs his head examined). So, 
in order to keep the tape buffer from under-running and causing the tape 
head to back up and retrain (costly), I cache the information locally. 
But, in the case that a sync is still in progress, I take a snapshot 
when the sync is over. The tape process goes and backs up that snapshot, 
while the original volume is (again) being synchronized.

At least, this is how it works in *concept*. Then again, Itanium looked 
good on paper, too :)

> 1) A bunch of opterons with RAID 5 volumes built via md, tacked together
> with Ibrix, or perhaps just a bunch of gnbd's md'd together into a huge
> xfs

If only money were no object. :) I had a $500 budget, and some old 
hardware to munge together in order to achieve a working solution. You'd 
absolutely cringe if you found out what I ended up doing. Fortunately, 
the LTO autoloader is new, though.

> 2) One of those many rsync front-ends that stores only one copy of a
> given file?  backuppc seems to have the most sophisticated user
> interface, but honorable mention goes to rdiff-backup for using rdiff
> (binary diff based on the rsync algorithm) and reverse deltas (which
> ISTR was the big plus of CVS over prior source code control systems, so
> the diff'ing gets deeper as you go back in time, not forward in time,
> and since you're more likely to need contemporary files...).

I'm in the process of writing my own front-ends and processes to do most 
of this; what I need to do is largely custom (but when I'm done you can 
bet I'll release what I've done in case someone else may find it useful)
:D

> Before you decide that the hashing involved in rsync would cause too
> many collisions, bear in mind that with a sufficiently strong hash, you
> can have a lower probability of a collision than the probability of a
> tape failure...

eh, rsync is great, I use it all over the place. And, for sufficiently 
different files, the hashing doesn't cause too many collisions, 
especially when using a strong hash like MD5 (which is what IIRC rsync 
uses). I actually use rsync internally to do most of the network (and 
local!) copying.


Anyways, I managed to get the kernel to panic twice today when removing 
snapshot volumes which had been corrupted by the phantom metadata eater. 
I'll see what I can do about reproducing it tomorrow.

Anyhow, off to sleep for me.

Cheers,
-Kelsey
