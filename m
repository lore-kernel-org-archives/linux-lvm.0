Date: Thu, 8 Jun 2000 00:18:23 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
In-Reply-To: <20000607100145.A6300@gondor.com>
Message-ID: <Pine.LNX.4.21.0006080005180.26807-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Andi Kleen <ak@suse.de>, Linux LVM list <linux-lvm@msede.com>

On Wed, 7 Jun 2000, Jan Niehusmann wrote:

> The snapshot logic simply doesn't know what a filesystem is. It just
> clones the block device.

this i knew.. :)

> So the fs may be in en inconsistent state, if you do the snapshot
> while some write operation is in progress on the cloned
> filesystem.
> 

ok. so the solution is what? a call in the vfs to complete pending
writes, and hold off on modifying any blocks?

(i take it the vfs caches writes somehow before informing LVM of the
dirty blocks, or not?)

> Note that cloning a mounted fs usually works, as well as mounting a 
> unclean filesystem without fsck usually works - but it's not reliably. 
> 

how unreliable? how busy does the fs have to be? 

anyway, for my purposes snapshot does the job. the choice is:

a) backup of a snapshot - inconsistencies hopefully limited to 10**1
order of blocks.

b) backup of a live fs, which is so slow that data inconsistency
might be in the order of 10**3 blocks or more.

also, the fs's that are at risk - heavily written to - are usually
things like mail and news queues, ie scratch space. These i can
afford not to backup. :)

> 
> Jan
> 
> 

regards,
-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
An engineer is someone who does list processing in FORTRAN.
