Subject: Re: [Ext2-devel] [ahead@bigpond.net.au: [linux-lvm] Re: Unable to
    get XFS, ext3, reiserfs & LVM to coexist happily]
From: Steve Lord <lord@sgi.com>
In-Reply-To: <20020107163907.J20581@redhat.com>
References: <20020105161447.K12868@lynx.no> <20020107163907.J20581@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1010422319.7148.7.camel@jen.americas.sgi.com>
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
Date: Mon Jan  7 10:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Stephen C. Tweedie" <sct@redhat.com>
Cc: Adrian Head <ahead@bigpond.net.au>, Eric Sandeen <sandeen@sgi.com>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com, ext2-devel@lists.sourceforge.net

On Mon, 2002-01-07 at 10:39, Stephen C. Tweedie wrote:
> Hi,
> 
> On Sat, Jan 05, 2002 at 04:14:47PM -0700, Andreas Dilger wrote:
> > Adrian Head <ahead@bigpond.net.au> wrote:
> > > This is the full output from kdb when trying to create a snapshot on an XFS 
> > > volume for me.
> > 
> > The system is running 2.4.17 + LVM patch (relatively minor) + VFS-lock
> > (needed for snapshots) + 2.4.17 XFS patch, IIRC.  This has been discussed
> > on linux-lvm and linux-xfs for a couple of days.  What is strange is that
> > this is happening while doing an XFS snapshot, but the oops is consistently
> > in ext3.  There are several other ext3 filesystems on the system in
> > question.
> 
> Is XFS or LVM using current->journal_info for anything, and if so, is
> it being left non-zero by anyone?

We do not touch it, there has subsequently been a crash with ext3 removed
from the kernel, so I suspect this is an XFS only issue - probably memory
corruption. It appears we are doing a disk write in the unlockfs callout,
possibly lvm is not in a coherent state at this point and is trampling
on memory it should not be.

Eric is going to remove the offending write and see if this clears it
up, off the top of my head I cannot see why we need it in the unlockfs
path.

Steve

> 
> --Stephen
-- 

Steve Lord                                      voice: +1-651-683-3511
Principal Engineer, Filesystem Software         email: lord@sgi.com
