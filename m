From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Keep snapshots active for 24 hours?
Message-ID: <NBBBKLKHMJHIJLHOGAOJKELJJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-reply-to: <20011214153614.A855@lynx.no>
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
Date: Fri Dec 14 17:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Andreas Dilger
> 
> On Dec 15, 2001  10:52 +1300, Steve Wray wrote:
> > I'd been wondering if snapshotting could be used for;
> > 
> > - providing 'virtual journalling' any filesystem that happens to
> > be on a logical volume.
> 
> It could, but you would have to make a _lot_ of snapshots for it to
> be worthwhile (i.e. one every 10-30 seconds or so).  If you want this
> for "non-journaled" filesystems, you can use the ext3 journaling code
> to add this to most any block based filesystem.  It isn't trivial,
> but at least possible.

Fair enough for snapshotting as it is today,
but maybe the underlying technology could be adapted?

 
> > - take a snapshot, install something or try something out
> > that might break something, then restore *directly* from
> > the snapshot if anything goes wrong; without having to actually
> > back it up to media and restore it.
> 
> Yes, this would be clever.  I'd rather that RPM/DEB package tools just
> become smarter (like AIX LPP) where it allows you arbitrary amounts of
> back-out from updated packages (as long as you have enough disk space).
> After you have "applied" a package, you can test it out, and either
> commit it or revert to the old version.  The rpm and dpkg tools could
> just do this by checksumming any existing files from the previous install
> and only backing up those that had changed between versions.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
