Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103202021.f2KKLR902727@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan won't recognize my VG
In-Reply-To: <3AB7B6EF.AFA0AD4C@in.tum.de> from David Vidal Rodriguez at "Mar
 20, 2001 09:00:47 pm"
Date: Tue, 20 Mar 2001 13:21:27 -0700 (MST)
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

David Vidal R. (vidalrod@in.tum.de) writes:
> Andreas Dilger wrote:
> > Patch below.  Only needed if you have < beta6 kernel code.  It probably
> > should be put into the standard tools, however, because a lot of people
> > are still using beta2 kernel code.
> 
> err... is this a patch for generating the kernel patch?

No, the patch is for the user tools only.  You need to use this patch if
you are using beta6 user tools, but have an older kernel version.

> I _do_ have the beta6 sources, compiled the tools and generated the patch,
> but the kernel doesn't compile. It says sth. about unresolved symbols.
> Indeed, if I compile lvm as a module (lvm-mod.o), I can build the kernel
> and the modules, but there seems to be "unresolved symbols".

What symbols are missing?  I assume you applied the resulting kernel patch
to the kernel source tree, and are compiling the LVM module there?

> Hmmm... and I have had to deactivate lines 333-335 in tools/lib/liblvm.h
> because there is a name conflict with this function and the standard one...

Yes, this is OK.  Basename has always been a problem.

> I also have had to add the include dir of the kernel source tree to the
> CFLAGS because of a couple of ENOENTs... I have to say that I don't and
> can't have the source tree in the standard location (/usr/src) because
> I'm not root....

????  If you are not root, then how do you expect to install a new kernel
or run the LVM user tools????

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
