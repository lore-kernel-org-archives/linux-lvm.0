From: "Stefan Monnier" <monnier+lists/linux/lvm/news/@tequila.cs.yale.edu>
Subject: Re: [linux-lvm] Alpha testers rqd for ext2 fs extend utility.
References: <3779A456.15F5@erols.com> <199906300435.WAA17970@webber.adilger.net>
Date: 30 Jun 1999 13:42:43 -0400
Message-ID: <5lu2rppoto.fsf@tequila.cs.yale.edu>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

>>>>> "Andreas" == Andreas Dilger <adilger@enel.ucalgary.ca> writes:
> all of the space on your disks.  It is easy to grow a filesystem, but
> lots of work to shrink it (ie backup, rebuild, restore).

That's exactly why I don't like this pre-allocation idea.
It will end up with a grow2fs utility and no way to shrink a filesystem.
I'd rather see the work be out in a real ext2resize that can both grow and
shrink a filesystem, as can AdvFS.
Problem is:  shrinking will necessarily mean heavy disk reorganization
(most importantly: some files will have to be reassigned to other inodes
which means `stale filehandle' across NFS).  So I must admit that it is indeed
desirable to at least try to avoid moving things around when possible,
via (f.ex.) pre-allocation.

All in all, it just goes to show that a static inode->block mapping
as is used in ext2 (and ufs) is not flexible enough.


	Stefan
