Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 11:43:55 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] ORACLE OPS and Fibre channel
Message-ID: <20010528114355.L26710@sistina.com>
References: <85256A55.0061ED1B.00@IBJS06DS.ibjs.com> <200105232355.f4NNtQ7q030802@webber.adilger.int>
Mime-Version: 1.0
In-Reply-To: <200105232355.f4NNtQ7q030802@webber.adilger.int>; from adilger@turbolinux.com on Wed, May 23, 2001 at 05:55:26PM -0600
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

On Wed, May 23, 2001 at 05:55:26PM -0600, Andreas Dilger wrote:
> Slava Tulchinsky writes:
> > After successfully installing Oracle 8.1.7.0.1 OPS on Redhat 6.2 with
> > 2.2.19-6.2.1 using Compaq fibre channel card RA4000 to connect to Compaq
> > external drive enclosure RA4100 (kernel driver cpqfc), We decided see if OPS
> > will work with lvm 0.9.1-Beta7.
> 
> > LVM part seems to work fine, but when booting with the newly
> > compiled kernel no longer able to use raw partitions with OPS
> > with or without LVM.
> 
> Two things.  You need the raw-io patch for 2.2 kernels, and you also need
> to change the SECTOR_SIZE in the lvm.h header to be 512 bytes (the latter
> may have been fixed in recent LVM code releases).

Yes it has been fixed.

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
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
