From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [Ext2-devel] [ahead@bigpond.net.au: [linux-lvm] Re: Unable to
    get XFS, ext3, reiserfs & LVM to coexist happily]
Message-Id: <20020107163907.J20581@redhat.com>
References: <20020105161447.K12868@lynx.no>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020105161447.K12868@lynx.no>; from adilger@turbolabs.com
    on Sat, Jan 05, 2002 at 04:14:47PM -0700
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
Date: Mon Jan  7 10:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>, Eric Sandeen <sandeen@sgi.com>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com, ext2-devel@lists.sourceforge.net
Cc: Stephen Tweedie <sct@redhat.com>

Hi,

On Sat, Jan 05, 2002 at 04:14:47PM -0700, Andreas Dilger wrote:
> Adrian Head <ahead@bigpond.net.au> wrote:
> > This is the full output from kdb when trying to create a snapshot on an XFS 
> > volume for me.
> 
> The system is running 2.4.17 + LVM patch (relatively minor) + VFS-lock
> (needed for snapshots) + 2.4.17 XFS patch, IIRC.  This has been discussed
> on linux-lvm and linux-xfs for a couple of days.  What is strange is that
> this is happening while doing an XFS snapshot, but the oops is consistently
> in ext3.  There are several other ext3 filesystems on the system in
> question.

Is XFS or LVM using current->journal_info for anything, and if so, is
it being left non-zero by anyone?

--Stephen
