From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010231803.e9NI3eg21450@webber.adilger.net>
Subject: Re: [linux-lvm] using previously created lvm
In-Reply-To: <yq1puku53kx.fsf@jaguar.mkp.net> "from Martin K. Petersen at Oct
 21, 2000 04:42:06 pm"
Date: Mon, 23 Oct 2000 12:03:40 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <mkp@linuxcare.com>
Cc: bluca@comedia.it, linux-lvm@msede.com

Martin Petersen writes:
> Actually, I implemented HFS support in Linux ufs when we started the
> PA-RISC port.  It's been included in the 2.[34] kernels for quite a
> while now...

With the discussion (at the Linux Storage Workshop in Miami) about making
the on-disk parsing code modular, it would not be too hard to add an
HP/UX module to the LVM, if the on-disk format was known.  However, I
don't think we will be at that stage for many months yet, even if we
could get the HP/UX LVM specs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
