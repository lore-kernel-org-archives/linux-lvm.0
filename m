From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] snapshot questions
Message-ID: <20011105132224.D3957@lynx.no>
References: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net> <0111021621181I.08803@khayes-lin> <3BE66C5A.C5BA896C@promofinarsa.es> <01110508512502.30934@khayes-lin>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01110508512502.30934@khayes-lin>; from khayes@quicknet.net on Mon, Nov 05, 2001 at 08:51:25AM -0800
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
Date: Mon Nov  5 14:21:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyle Hayes <khayes@quicknet.net>
Cc: linux-lvm@sistina.com, Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>

On Nov 05, 2001  08:51 -0800, Kyle Hayes wrote:
> We can insure 1 with no problem.  2 seems to require either patches or
> new versions of various code.  I have not yet seen a full reply as to
> what patches are necessary for which kernels.

You need LVM-VFS patch on all kernels, you need ext3 or reiserfs or XFS
to get "real" VFS lock usage.  For non-journaled fs (like ext2) it just
syncs, and you mount the snapshot - it will complain that it is dirty,
but fsck will verify that there are no errors.

> I have seen that the AC kernels are being patched nearly up to the level
> of what is in CVS.  But, this is for 2.4.x.  What about 2.2.x?  Is 2.2.20
> going to have the latest LVM patches?

No, LVM was never part of 2.2, so you always need to patch.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
