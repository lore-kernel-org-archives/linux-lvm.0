From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009052050.OAA19872@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM patch for kernel 2.2.17?
Date: Tue, 5 Sep 2000 14:50:29 -0600 (MDT)
In-Reply-To: <31A612FE6020D2119F6400A0C9B67EBB0381B301@FTHW901E> from "Franken Klaus" at Sep 05, 2000 08:34:14 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Cc: "'daniel@mehrmann.ping-net.de'" <daniel@mehrmann.ping-net.de>, linux-lvm@msede.com

Franken Klaus, you write:
> > Any plans for a lvm-patch for kernel 2.2.17 ??
> > 
> > My lvm patch for 2.2.16 works at 2.2.17 too but it's version 0.8i.
> >  
> > Should we use a newer version ? For example 0.8 final ?
> > Should i do that ?
> 
> Yes, you should.  Thanks!!

I have already made a version of LVM 0.8final available for Linux 2.2.16 +
2.2.17-pre patches, which _should_ work for 2.2.17 as well, although the
snapshot feature depends on some 2.4 code which is only available for 2.2
as a patch.

It is available online at ftp://ftp.stelias.com/pub/adilger/

I even worked a bit on it last week and #ifdef'd out code for the snapshot
feature (which doesn't work with journalled filesystems anyways, AFAIK),
so it should be able to work with a stock 2.2.16 kernel, but I haven't
tested that yet, and this code isn't available yet...

Yes, it _would_ be nice if Heinz made an "official" release of 0.8final
for 2.2, but he hasn't done it any of the previous times someone asked
in the past few months, so I don't expect he will do it now either.

Cheers, Andreas
