Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103161944.f2GJi6d17583@webber.adilger.int>
Subject: Re: [linux-lvm] LVM 0.9.1 Beta6 RPMS
In-Reply-To: <20010316131523.A21757@omnifarious.mn.org> from "Eric M. Hopper"
 at "Mar 16, 2001 01:15:23 pm"
Date: Fri, 16 Mar 2001 12:44:05 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Eric Hopper writes:
> On Fri, Mar 16, 2001 at 12:44:46PM -0600, AJ Lewis wrote:
> > LVM 0.9.1 Beta6 RPMS are up on the Sistina FTP site:
> > ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/binaries/redhat
> 
> 	Would you consider releasing kernel patches against the 2.4.x
> series kernels?
> 
> 	I want to upgrade to 2.4.x someday soon.  I currently use LVM on
> my system, but my confusion over exactly what patches I need to apply
> prevents me from upgrading to 2.4.x.

Actually, the LVM CVS (and I assume tarball as well) is fairly well set
up to handle this.  Since it is a lot of work to maintain patches against
every kernel (consider each pre, ac kernel also).  They rather ship the
whole lvm*.[ch].  If you are compiling as a module, you shuld be able to
compile directly in LVM/kernel (pending a patch that was posted today).

You can also run "make" in PATCHES, and it will build appropriate patches
for your current kernel, to be applied to the kernel source.

Generally, the current LVM kernel code will work properly with the current
tools.  On occasion, the current tools will not work with an older kernel
(or vice versa).  It is my opinion that we should treat that as a bug to
be fixed, until such a time we really need to increase the IOP version,
at which point the kernel/tools will refuse to work with older code.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
