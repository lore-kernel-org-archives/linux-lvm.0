From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011090323.eA93N7s02605@webber.adilger.net>
Subject: Re: [linux-lvm] problems compiling andreas' 3.4 userland tools under
 test11-pre1
In-Reply-To: <20001108160703.A31653@pr.es.to> "from Patrick Michael Kane at Nov
 8, 2000 04:07:03 pm"
Date: Wed, 8 Nov 2000 20:23:07 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Michael Kane <modus@pr.es.to>
Cc: linux-lvm@msede.com

Patrick Kane writes:
> I'm trying to get the 0.8final-3.4 to compile under test11-pre1, with no
> luck.  I get all sorts of gcc parse errors in linux/lvm.h and liblvm.h.
> 
> I've tried compiling the tools with and without Andreas' 2.4 patch.  It
> fails both ways.

The 2.4 patch you refer to is lvm-0.8final-2.4-kernel.diff?  Is it
possible you applied it to /usr/src/linux-2.4*/include/linux/lvm.h but
there isn't a symlink /usr/include/linux -> /usr/src/linux/include/linux
(i.e. you are running Debian or something)?

Alternately, you can simply change linux/lvm.h to lib/lvm.h and it should
compile.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
