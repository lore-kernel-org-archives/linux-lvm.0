Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102232104.f1NL4Dd04732@webber.adilger.net>
Subject: Re: [linux-lvm] Patch needed for kernel 2.4.2 ?
In-Reply-To: <Pine.A41.4.21.0102231337280.9104-100000@gigue.dlib.indiana.edu>
 from John Marquart at "Feb 23, 2001 01:40:31 pm"
Date: Fri, 23 Feb 2001 14:04:13 -0700 (MST)
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

John Marquart writes:
> Is there a way to configure / install the tools such that they can fall
> back to handle IOP 10?  I enjoy helping test new beta code (Great job by
> the way - I have yet to have ANY problems w/ the beta versions i have
> tested) - but it becomes quite a bit more stressful when the userspace
> tools are not backwards compatible.  Am I just overlooking something, or
> is there truly no backwards compatibility in IOP11 tools to IOP10 and/or
> IOP6?

It is possible to install the LVM tools such that there are multiple
versions of the tools installed, and the correct ones are chosen based
on the kernel IOP version.  There _really_ is no compatibility between
the tools, which is why I am advocating that the LVM IOP be reverted
to 10, along with a fix in the beta4 bug that caused this issue, rather
than increasing to IOP 11.

You need a wrapper script in /sbin which points to the correct tools
directory (below).  If you are upgrading an existing IOP6 system, move ALL
of the LVM tools from /sbin to /lib/lvm-iop6, put the wrapper script in
/sbin/vgchange, and link to it for EACH LVM tool, like:

ln /sbin/vgchange /sbin/vgcreate

You NEED the lvmiopversion command (from beta4+) in /sbin as well.

If you install the beta3 tools, you get IOP10 (which works with what is
in the official kernel), beta4 and beta5 will only work properly with a
kernel patch.  The problem is in the user tools and not the new kernel
code.  A beta4/beta5 patched kernel will work just fine with IOP 10 tools
(assuming that the IOP checking didn't stop us), but a beta3 or earlier
kernel (i.e. what is currently in Linus' tree) will only allow you to
use a single VG with beta4 tools.

So - I would suggest patching your kernel with the beta5 kernel patch
(to get the latest fixes), and keep the IOP6 tools around in /lib/lvm-iop6
in case you need to go back.  If you want the IOP10 tools (in case you
accidentally build an unpatched Linus kernel), you need to use beta3 for now.

Cheers, Andreas
==========================  wrapper script  ================================
#!/bin/sh
#
# This is a wrapper to call the appropriate LVM userspace tools based
# on the IOP version in use.
#
# 20001221  Claudio Matsuoka <clausio@conectiva.com>
# - using lvmiopversion to get the IOP version
#
# 20001220  Andreas Dilger <adilger@turbolinux.com>
# - fixed return values
# - better error messages
#
# 20001217  Claudio Matsuoka <claudio@conectiva.com>
# - first version

util=`basename $0`
iopver=/sbin/lvmiopversion
IOP=`$iopver`

if [ ! -x $iopver -o -z "$IOP" ]; then
    echo "$util: $iopver not found or can't determine IOP version" 1>&2
    exit 1
fi

lvmpkg=lvm-iop$IOP
liblvm=/lib/$lvmpkg

if [ ! -d $liblvm ]; then
    echo "$util: $liblvm not found.  Is $lvmpkg installed?" 1>&2
    exit 3
fi

exec $liblvm/$util "$@" # this will print out a localized error message for us

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
