From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 5 Sep 2001 16:46:26 -0600
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
Message-ID: <20010905164626.M32553@turbolinux.com>
References: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com> <3B95E36E.6070703@st-peter.stw.uni-erlangen.de> <20010905120549.H32553@turbolinux.com> <3B966C63.7080309@st-peter.stw.uni-erlangen.de> <20010905123211.J32553@turbolinux.com> <3B96757E.9010201@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B96757E.9010201@st-peter.stw.uni-erlangen.de>
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

On Sep 05, 2001  20:57 +0200, svetljo wrote:
> i maked the VG and the LV's under 2.4.9-xfs lvm-1.0.1rc1
> but i had the XFS- mount problem with it and JFS had no problems
> and i upgraded to 2.4.10-pre2-xfs lvm-1.0.1rc2 and had no problems with 
> JFS and XFS

When you say you have no problems, does that mean "mkfs.{jfs,xfs} completed
without errors" or does that mean "I have been using {JFS,XFS} under load
or running dbench/bonnie++ on it without errors".  Since you say that
memtest86 does not show errors on your system, you could also try dbench,
bonnie++, or even cerberus (from VA Linux) to stress test these filesystems.
I'm pretty sure they will also show problems under stress, and this will
convince you it is a kernel or hardware problem.

> i tried with 2.4.9-ac5 lvm-1.0 and vanila 2.4.9 lvm-1.0.1rc1
> with all these kernels it seemd that the LVM is working but i couldn't 
> format the LV with reiserfs and ext2
> mke2fs and mkreiserfs simply segfaults without errors

The fact that mkfs.* is causing a kernel OOPS is a sure sign of problems
in the kernel, because these are just user-space applications, and do
not run in the kernel at all.  I don't think it could possibly be a
problem with these tools.

> >If you have never had this working properly, try some early kernel like
> >2.4.5 and see if it works.  If not then I suspect you have a RAM problem,
> >and you may want to swap/remove SIMM/DIMMs to see if you can isolate it.
> >
> i can not understand why do you think that i could have RAM problems
> if i had RAM problems why would XFS and JFS working without problem and
> mke2fs and mkreiserfs segfaulting

There have been problems with mke2fs in the past (and maybe mkreiserfs too)
where they make a LOT of blocks dirty which exposes problems in the block
I/O layer inside the kernel.  This does not mean that these tools are bad,
it means the kernel is bad, or your system is bad, and these are tools
that show this problem best.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
