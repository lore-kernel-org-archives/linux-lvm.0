Return-Path: <claudio@conectiva.com>
Date: Fri, 22 Dec 2000 08:13:30 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] IOP selection scripts (was: '/etc/init.d/lvm' script
 in debian package)
In-Reply-To: <200012220138.eBM1cAb17191@webber.adilger.net>
Message-ID: <Pine.LNX.4.21.0012220734080.30559-100000@scuzzlebutt.helllabs>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Gergely Tamas <dice@mfa.kfki.hu>

On Thu, 21 Dec 2000, Andreas Dilger wrote:

> Claudio writes:
> > On Thu, 21 Dec 2000, Andreas Dilger wrote:
> > > Why not simply install it as one of the commands (e.g. vgscan) and make
> > > hard links to it.  Hard links don't even take up inodes - only directory
> > > entries.
> > 
> > Uhm.. yes, why not?
> 
> If you have a symlink with a short path (e.g. vgscan -> lvm-wrapper)
> the string "lvm-wrapper" gets stored directly in the inode (for ext2 at
> least), and is called a "fast symlink".  For longer targets (> 56 bytes I
> think), the inode allocates a filesystem block to store the new string.
> There is a directory entry for the symlink (in this case "vgscan")
> which points to the symlink inode.

Yes, I know, I was just wondering why I didn't use hardlinks at the first
time ;) I believe the size limit is 60 bytes, IIRC.

BTW -- I'm using 0.9's manpages in lvm-base. Is it safe to assume that 
the tools interfaces won't change in future releases?
