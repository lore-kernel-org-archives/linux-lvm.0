Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102272025.f1RKPg727605@webber.adilger.net>
Subject: Re: [linux-lvm] q: BLOCK_SIZE
In-Reply-To: <3A9BF392.2E4C3DA5@tls.msk.ru> from Michael Tokarev at "Feb 27,
 2001 09:36:02 pm"
Date: Tue, 27 Feb 2001 13:25:42 -0700 (MST)
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

Michael writes:
> Little question that I already posted here a long time ago.
> What drawbacks can suffer if one changes BLOCK_SIZE in
> include/linux/lvm.h from 1024 (or 4096 on S/390) to 512?

On S/390 it would appear that the DASD block devices have a 4096
byte sector size.  However, on most other systems there is only
a 512 byte sector size, so I don't see any reason there would
be problems with BLOCK_SIZE = 512.

I think Andrea Arcangeli was complaining about this as well.

> This is about using lvm with rawio -- on 2.2, rawio wan't
> work with i/o size be not a multiple of blocksize, while
> on 2.4 it works.  Or at least this was on Dec-2000.
> Oh yes, this is about 2.2 kernel and lvm-0.9.

If it works for you at 512 bytes, leave it then.  Maybe Heinz
will let us know why it is set to 1024 bytes.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
