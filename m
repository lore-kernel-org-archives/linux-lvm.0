Message-ID: <38099ABD.48D49AEF@msede.com>
Date: Sun, 17 Oct 1999 11:45:33 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] [Fwd: Re: ext2 online resizer available]
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

[admin: I've added Stephen to the list of valid posters]

-------- Original Message --------
Subject: Re: ext2 online resizer available
Date: Sun, 17 Oct 1999 06:39:06 -0400 (EDT)
From: Stephen Frost <sfrost@ns.snowman.net>
To: Andreas Dilger <adilger@enel.ucalgary.ca>
CC: Linux FS development list <linux-fsdevel@vger.rutgers.edu>,Linux
LVM mailing list <linux-lvm@msede.com>,Linux kernel development list
<linux-kernel@vger.rutgers.edu>

On Sat, 16 Oct 1999, Andreas Dilger wrote:

> Hello all,
> my online ext2 resizer is now available in a fully functional state.  If
> the underlying partition supports it, it is possible to resize an ext2
> filesystem while it is mounted and in use by applications.

	Have you looked at all into how well it works on RAID partitions?
Ideally I'd love to be able to stick a pair of disks into a system,
rescan
the SCSI bus to pick them up, add them onto the end of my RAID 0+1
(striped/
mirrored) raid, and then increase the ext2 partition on the RAID.  All
without having to drop the system.  I'm fairly sure it can't be done
with
the current set of tools and whatnot, but that's one thing I'd love to
see.
	Don't get me wrong, ext2 resizing is very nice, just would be nice
to be able to resize RAID things to go along with it...

		Stephen


-
To unsubscribe from this list: send the line "unsubscribe
linux-kernel" in
the body of a message to majordomo@vger.rutgers.edu
Please read the FAQ at http://www.tux.org/lkml/
