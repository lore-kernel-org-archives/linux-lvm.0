From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020104163939.C12868@lynx.no>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <1010173926.1414.12.camel@stout.americas.sgi.com>
    <E16Md6L-0007pY-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16Md6L-0007pY-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Sat, Jan 05, 2002 at 08:49:22AM +1000
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
Date: Fri Jan  4 17:37:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Eric Sandeen <sandeen@sgi.com>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Jan 05, 2002  08:49 +1000, Adrian Head wrote:
> Well this seems consistant with what I'm seeing:
> 2.4.17-xfs
> While source volume mounted:
>  + lvm-1.0.1 upgrade
>  + VFS-lock
>  (In that order)
> * Can create ext3 snapshot?			| yes
> * Can mount a ext3 snapshot?			| yes
> * Can create resierfs snapshot?			| yes
> * Can mount a resierfs snapshot?		| yes
> * Can create xfs snapshot?			| Oops
>  btp 1234 (lvcreate)
>  journal_start
>  ext3_dirty_inode
>  __mark_inode_dirty
>  update_atime
>  do_generic_file_read
>  generic_file_read
>  sys_read
>  system_call

Can you repeat this test, but skip the ext3 snapshot creation part of it
entirely (i.e. create a reiserfs snapshot and an XFS snapshot, without
changing the kernel)?  I'm wondering if XFS is getting an old inode that
ext3 was using, but either ext3 or XFS is not clearing it, so that is why
it is calling into ext3.  Also, are you using ext3 on other filesystems in
this computer?

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
