From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
Message-ID: <20011214153614.A855@lynx.no>
References: <20011214113804.I940@lynx.no> <NBBBKLKHMJHIJLHOGAOJKELIJCAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJKELIJCAA.steve.wray@the.net.nz>; from steve.wray@the.net.nz on Sat, Dec 15, 2001 at 10:52:17AM +1300
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Dec 14 16:34:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Dec 15, 2001  10:52 +1300, Steve Wray wrote:
> I'd been wondering if snapshotting could be used for;
> 
> - providing 'virtual journalling' any filesystem that happens to
> be on a logical volume.

It could, but you would have to make a _lot_ of snapshots for it to
be worthwhile (i.e. one every 10-30 seconds or so).  If you want this
for "non-journaled" filesystems, you can use the ext3 journaling code
to add this to most any block based filesystem.  It isn't trivial,
but at least possible.

> - take a snapshot, install something or try something out
> that might break something, then restore *directly* from
> the snapshot if anything goes wrong; without having to actually
> back it up to media and restore it.

Yes, this would be clever.  I'd rather that RPM/DEB package tools just
become smarter (like AIX LPP) where it allows you arbitrary amounts of
back-out from updated packages (as long as you have enough disk space).
After you have "applied" a package, you can test it out, and either
commit it or revert to the old version.  The rpm and dpkg tools could
just do this by checksumming any existing files from the previous install
and only backing up those that had changed between versions.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
