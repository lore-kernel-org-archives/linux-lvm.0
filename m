Date: Wed, 8 Nov 2000 19:32:32 -0800
From: Patrick Michael Kane <modus@pr.es.to>
Subject: Re: [linux-lvm] problems compiling andreas' 3.4 userland tools under test11-pre1
Message-ID: <20001108193232.A4682@pr.es.to>
References: <20001108160703.A31653@pr.es.to> <200011090323.eA93N7s02605@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200011090323.eA93N7s02605@webber.adilger.net>; from adilger@turbolinux.com on Wed, Nov 08, 2000 at 08:23:07PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

* Andreas Dilger (adilger@turbolinux.com) [001108 19:23]:
> Patrick Kane writes:
> > I'm trying to get the 0.8final-3.4 to compile under test11-pre1, with no
> > luck.  I get all sorts of gcc parse errors in linux/lvm.h and liblvm.h.
> > 
> > I've tried compiling the tools with and without Andreas' 2.4 patch.  It
> > fails both ways.
> 
> The 2.4 patch you refer to is lvm-0.8final-2.4-kernel.diff?  Is it
> possible you applied it to /usr/src/linux-2.4*/include/linux/lvm.h but
> there isn't a symlink /usr/include/linux -> /usr/src/linux/include/linux
> (i.e. you are running Debian or something)?

No, test11-1 is definately living in /usr/src/linux and the symlinks from
/usr/include/linux point to the right spot.  All of the other third party
modules I need compile up fine, for what it's worth.

> Alternately, you can simply change linux/lvm.h to lib/lvm.h and it should
> compile.

This fixed it.  It may well be that I'm not fixing the rejection in the
final-2.4-kernel.diff file correctly.

Best,
-- 
Patrick Michael Kane
<modus@pr.es.to>
