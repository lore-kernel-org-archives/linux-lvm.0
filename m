Return-Path: <root@srv.sistina.com>
Date: Wed, 28 Feb 2001 12:38:37 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] q: BLOCK_SIZE
Message-ID: <20010228123837.H4361@srv.sistina.com>
References: <3A9BF392.2E4C3DA5@tls.msk.ru> <200102272025.f1RKPg727605@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200102272025.f1RKPg727605@webber.adilger.net>; from adilger@turbolinux.com on Tue, Feb 27, 2001 at 01:25:42PM -0700
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

On Tue, Feb 27, 2001 at 01:25:42PM -0700, Andreas Dilger wrote:
> Michael writes:
> > Little question that I already posted here a long time ago.
> > What drawbacks can suffer if one changes BLOCK_SIZE in
> > include/linux/lvm.h from 1024 (or 4096 on S/390) to 512?
> 
> On S/390 it would appear that the DASD block devices have a 4096
> byte sector size.  However, on most other systems there is only
> a 512 byte sector size, so I don't see any reason there would
> be problems with BLOCK_SIZE = 512.
> 
> I think Andrea Arcangeli was complaining about this as well.
> 
> > This is about using lvm with rawio -- on 2.2, rawio wan't
> > work with i/o size be not a multiple of blocksize, while
> > on 2.4 it works.  Or at least this was on Dec-2000.
> > Oh yes, this is about 2.2 kernel and lvm-0.9.
> 
> If it works for you at 512 bytes, leave it then.

Yep.

> Maybe Heinz
> will let us know why it is set to 1024 bytes.

It is basically an approach to support larger LV sizes than 2T :)

Because the Linux kernel supports 2^32 blocks per block minor up to version 2.4,
this is one approach (with tradeoffs for sure) to raise that limit.

With the 4k block size on S/390 DASD devices this means 16T per LV!

Sure: we won't have a satisfying solution before Linux 2.5.

> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
