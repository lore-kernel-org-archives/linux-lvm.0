Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012220138.eBM1cAb17191@webber.adilger.net>
Subject: Re: [linux-lvm] IOP selection scripts (was: '/etc/init.d/lvm' script
 in debian package)
In-Reply-To: <Pine.LNX.4.21.0012212101510.15611-100000@scuzzlebutt.helllabs>
 "from Claudio Matsuoka at Dec 21, 2000 09:06:33 pm"
Date: Thu, 21 Dec 2000 18:38:10 -0700 (MST)
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Gergely Tamas <dice@mfa.kfki.hu>

Claudio writes:
> On Thu, 21 Dec 2000, Andreas Dilger wrote:
> > Why not simply install it as one of the commands (e.g. vgscan) and make
> > hard links to it.  Hard links don't even take up inodes - only directory
> > entries.
> 
> Uhm.. yes, why not?

If you have a symlink with a short path (e.g. vgscan -> lvm-wrapper)
the string "lvm-wrapper" gets stored directly in the inode (for ext2 at
least), and is called a "fast symlink".  For longer targets (> 56 bytes I
think), the inode allocates a filesystem block to store the new string.
There is a directory entry for the symlink (in this case "vgscan")
which points to the symlink inode.

If you have a hard link to a file, what happens is that there is a
directory entry created (same as with any file), but it only points to the
inode of the existing file, and the refcount on the inode is increased.
That's why hard links always have the same owner/permissions/contents -
because it is reall only one "file" (inode) and just multiple directory
entries pointing to it.  This is also the reason why you can't have hard
links across filesystem boundaries.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
