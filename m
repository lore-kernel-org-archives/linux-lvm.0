From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010232337.e9NNbSg23447@webber.adilger.net>
Subject: Re: [linux-lvm] Is LVM dead ?
In-Reply-To: <20001021112147.A1131@gondor.com> "from Jan Niehusmann at Oct 21,
 2000 11:21:47 am"
Date: Mon, 23 Oct 2000 17:37:28 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Andi Kleen <ak@suse.de>, Heinz Mauelshagen <mauelshagen@sistina.com>, Michael Tokarev <mjt@tls.msk.ru>, linux-lvm@msede.com

Jan Niehusmann writes:
> On Sat, Oct 21, 2000 at 05:49:24AM +0200, Andi Kleen wrote:
> > Perhaps it would be useful if you could do an interim 0.8 mainteance
> > release, with e.g. all the simple bugfixes Andreas Dilger has collected
> > (segfaults etc.) There are unfortunately a few annoying bugs in the stock 
> > 0.8 userland, which people rediscover and rereport all the time.
> 
> Actually I think Andreas could do the interim releases (if he wants to).
> There is nothing wrong with having one maintainer for the development tree
> and one for the stable tree. Andreas already has a .rpm with all the known
> bugfixes, all we need now, is a tarball of that stuff.

If you don't have the rpm tool (which can also be installed on a Debian
system), you could also use alien to get the .tgz out of the .rpm file.
If Heinz agrees to link my archives from the LVM site, then I will even
make a separate patched .tgz available along with the .rpm.

> And the 0.8 userlevel tools will be important: The 0.9 kernel changes are 
> probably fairly huge, so Linus may not include them in 2.4. That means we
> need stable 0.8 tools for 2.4.

The one thing that needs to happen for my userland tools to work is to
patch the 2.4 kernel lvm.h to allow being used from kernel and user space.
I doubt that Linus would accept a patch from me on this, so it would need
to go through Heinz.  The total number of real changes is very small compared
to the 2.4 kernel header, but there are a lot of variable types that change
to be compatible with both user and kernel includes, and a bunch of format
changes.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
