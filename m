From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020103095435.U12868@lynx.no>
References: <E16LcO0-0006VI-00@hermes.sistina.com>
    <20020102110538.K12868@lynx.no> <E16Lwsc-0000Oy-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16Lwsc-0000Oy-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Thu, Jan 03, 2002 at 11:44:21AM +1000
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
Date: Thu Jan  3 10:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

On Jan 03, 2002  11:44 +1000, Adrian Head wrote:
> On Thu, 3 Jan 2002 04:05, Andreas Dilger wrote:
> > You should try ext3 from 2.4.18, or get it from the ext3 CVS (at
> > cvs.gkernel.sourceforge.net:/cvsroot/gkernel ext3).  It has fixes
> > for a number of problems caused by error conditions while running.
> > If there is still a problem with ext3 oopsing with a full snapshot
> > (which is essentially an oops because of an I/O error on the disk)
> > then please file a separate bug report to the ext3 developers
> > (ext2-devel@lists.sourceforge.net).
> 
> Let me see if I understand this correctly:
> The problem of the kernel Oops when a snapshot overflows is actually a 
> filesystem maintainer's/developer's problem because.  The reason is that when 
> a snapshot overflows it generates a disk full and it is up to the filesystem 
> to deal with that and pass that error up the stack?

Close.  When a snapshot overflows, it actually generates an "I/O error" (i.e.
read or write error, just like if the disk had a bad sector on it) and if
the filesystem doesn't handle that properly then it will oops.

> Therefore, if there was an Oops on an:
> * ext3 snapshot I would have to tell the ext3 developer's/maintainer's
> * resierfs snapshot I would have to tell the resierfs developer's/maintainer's
> * xfs snapshot I would have to tell the xfs developer's/maintainer's

Probably - you have to see where the oops is happening, but generally it will
be the filesystem that is having problems with the I/O error.  It may be in
some cases that the oops is "on purpose" because it is catching some situation
that was never expected to happen, and it is safer to "blow up" than to write
garbage onto the disk, and potentially corrupt data there.

> All I'm trying to do here is understand this a little more so that I can 
> follow up with the correct people about these problems.

Note that you also need to send "real" oops messages for them to be useful
to the developers, so they can find exactly what is going wrong.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
