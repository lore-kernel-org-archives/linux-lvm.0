From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010231800.e9NI01U21435@webber.adilger.net>
Subject: [linux-lvm] Re: more LVM 0.8 patches
In-Reply-To: <20001022162253.C24630@colombina.comedia.it> "from Luca Berra at
 Oct 22, 2000 04:22:53 pm"
Date: Mon, 23 Oct 2000 12:00:01 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bluca@comedia.it
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

Luca Berra writes:
> hello here are more lvm patches.
> they apply over patches in lvm-0.8final-3.3.src.rpm
> 1st chunk is needed to compile on my system

Actually, this is a bit of a problem.  In my 2.2 kernel patch, I include an
lvm.h that can be used for both user and kernel compiles, so that you are
sure you have the same IOP version, struct sizes, etc.  However, this lvm.h
doesn't exist on 2.4.

I have never tried using my 2.2 lvm.h header to compile the 2.4 kernel.  It
is mosly correct (I preserved _most_ of the 2.4 definitions and such), but
that wasn't my real goal (I was interested in a 2.2 header) so I doubt it
has everything.

If you are interested to do a bit of work, it would be good to take my 2.2
lvm.h and add the few missing "#if kernel 2.2 use this, #else use that"
checks and I will add it into my lvm.h so it can be used by everyone.

> 2nd chunk is nice for devfs
> 3rd chunk is NEEDED for lvm over raid

These look OK.  I will add them into my patch.

> I am still missing something on the vgchange front, the binary version i
> saved before trashing my whole system this summer works, the one built from
> these sources doesn't.

What sort of symptoms are you having (sorry if you already posted them)?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
