From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020102110538.K12868@lynx.no>
References: <E16LcO0-0006VI-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16LcO0-0006VI-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Wed, Jan 02, 2002 at 01:51:01PM +1000
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
Date: Wed Jan  2 12:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Jan 02, 2002  13:51 +1000, Adrian Head wrote:
> 
> 2.4.17-xfs
>  + lvm-1.0.1 upgrade
>  (with LVM_VFS_ENHANCEMENT)
> While source volume mounted:
> * Can create ext3 snapshot?			| Cannot test
> * Can mount a ext3 snapshot?			| Cannot test
> * Can create resierfs snapshot?			| Cannot test
> undefined reference to `fsync_dev_lockfs'
> undefined reference to `unlockfs'

Note that you need to apply the VFS-lock patch AFTER the lvm-1.0.1 upgrade
patch, otherwise that patch will reverse the VFS-lock patch!

> When source & snapshot mounted:
> * Cause oops when snapshot overflows?	|
>  - ext3						| Oops
>  btp 5 (bdflush)

You should try ext3 from 2.4.18, or get it from the ext3 CVS (at
cvs.gkernel.sourceforge.net:/cvsroot/gkernel ext3).  It has fixes
for a number of problems caused by error conditions while running.
If there is still a problem with ext3 oopsing with a full snapshot
(which is essentially an oops because of an I/O error on the disk)
then please file a separate bug report to the ext3 developers
(ext2-devel@lists.sourceforge.net).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
