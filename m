From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Can't mke2fs lv
Message-Id: <20020211130701.J9826@lynx.turbolabs.com>
References: <20020211173404.GB23@merlins.org>
    <20020211190928.A31248@sistina.com> <20020211183020.GP21505@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020211183020.GP21505@merlins.org>; from marc@merlins.org
    on Mon, Feb 11, 2002 at 10:30:20AM -0800
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
Date: Mon Feb 11 14:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc MERLIN <marc@merlins.org>
Cc: linux-lvm@sistina.com

On Feb 11, 2002  10:30 -0800, Marc MERLIN wrote:
> On Mon, Feb 11, 2002 at 07:09:28PM +0100, Heinz J . Mauelshagen wrote:
> > No, there's  an OS bug related  to the 2  GB file size limit  which causes
> > both your  problems. You must be  directly logged  in as 'root',  *no* 'su
> > root' in order to run the commands fine.
> 
> Mmmh, interesting.
> 
> Unfortunately, that's  not it,  the machine  doens't have  any users,  and I
> ssh'ed in as root

It could still be that the ssh process inherits the ulimit from its parent.
The real problem with this bug is that "ulimit -f" returns "unlimited", but
in fact it is really 2GB.  The user tools think 2GB is unlimited, but the
kernel thinks 4GB is unlimited.  This assumes you don't have a ulimit set
at some value less than 2GB.

> I've never had this problem before, it's on a 2.4.14 kernel with lvm

The problem existed between 2.4.10 and 2.4.18-pre somthing I think.  It
was a result of 2.4.10 moving block devices into the page cache, which
treated them like regular files, and ulimit applies to regular files.

> mke2fs 1.25 (20-Sep-2001)

If you have e2fsprogs 1.26, it should have a fix for this problem (it
tries to set the ulimit to 4GB instead of 2GB for you).  Please let me
know if this fixes your problem.  Note that this workaround will only
fix programs in e2fsprogs not any other tool which tries to read from
a raw device (dump or dd or pvmove perhaps).

I _thought_ that glibc-2.2 was not affected by this problem, but it
could be that if you have an old shell which uses the old getrlimit
syscall it will still break your system.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
