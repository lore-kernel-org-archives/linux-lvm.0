Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012212206.eBLM6qi00832@webber.adilger.net>
Subject: Re: [linux-lvm] IOP selection scripts (was: '/etc/init.d/lvm' script
 in debian package)
In-Reply-To: <Pine.LNX.4.21.0012210820170.569-100000@scuzzlebutt.helllabs>
 "from Claudio Matsuoka at Dec 21, 2000 08:28:26 am"
Date: Thu, 21 Dec 2000 15:06:52 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Gergely Tamas <dice@mfa.kfki.hu>

Claudio writes:
> On Wed, 20 Dec 2000, Andreas Dilger wrote:
> > Is there ever a reason why you would want to install this program as
> > "lvm-wrapper" anywhere?
> 
> I'm installing it as /sbin/lvm-wrapper and symlinking all utilities to it
> (seems better than using one wrapper per tool).

Why not simply install it as one of the commands (e.g. vgscan) and make
hard links to it.  Hard links don't even take up inodes - only directory
entries.

> Regarding lvmiopversion, is it supposed to be statically linked? Otherwise,
> it wouldn't know what liblvm link to, assuming that we have liblvm-iopX.so.

Yes.  Basically, it is only a single ioctl call, so it is not dependent
on the LVM version at all.  Compiled in tools as:

gcc -I . -I lib -o lvmiopversion lvmiopversion.c lib/lvm_get_iop_version.c
	lib/lvm_check_special.c

and stripped it is only 4408 bytes on my system.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
