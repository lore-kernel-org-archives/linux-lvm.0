From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011081908.eA8J8ji02326@webber.adilger.net>
Subject: Re: [linux-lvm] Re: LVM 2.2 snapshot bug
In-Reply-To: <20001108171606.A3650@inspiron.suse.de> "from Andrea Arcangeli at
 Nov 8, 2000 05:16:06 pm"
Date: Wed, 8 Nov 2000 12:08:44 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: Andreas Dilger <adilger@turbolinux.com>, "Stephen C. Tweedie" <sct@redhat.com>, Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br

You write:
> On Tue, Nov 07, 2000 at 01:36:06PM -0700, Andreas Dilger wrote:
> > The problem is that I/O errors during journal recovery would mean a
> > corrupt filesystem.  The ext3 recovery code (now) does the correct thing
> > and aborts the journal recovery [..]
> 
> ext3 oopses the kernel after getting I/O errors during the writes. I don't
> consider that the correct thing.

That was in the older versions.  That's why I put "(now)" in there - the
ext3-0.0.3 and later code handles I/O errors and OOM in a reasonable way.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
