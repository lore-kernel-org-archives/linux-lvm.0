Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105232355.f4NNtQ7q030802@webber.adilger.int>
Subject: Re: [linux-lvm] ORACLE OPS and Fibre channel
In-Reply-To: <85256A55.0061ED1B.00@IBJS06DS.ibjs.com> "from Slava Tulchinsky
 at May 23, 2001 02:16:38 pm"
Date: Wed, 23 May 2001 17:55:26 -0600 (MDT)
MIME-Version: 1.0
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

Slava Tulchinsky writes:
> After successfully installing Oracle 8.1.7.0.1 OPS on Redhat 6.2 with
> 2.2.19-6.2.1 using Compaq fibre channel card RA4000 to connect to Compaq
> external drive enclosure RA4100 (kernel driver cpqfc), We decided see if OPS
> will work with lvm 0.9.1-Beta7.

> LVM part seems to work fine, but when booting with the newly
> compiled kernel no longer able to use raw partitions with OPS
> with or without LVM.

Two things.  You need the raw-io patch for 2.2 kernels, and you also need
to change the SECTOR_SIZE in the lvm.h header to be 512 bytes (the latter
may have been fixed in recent LVM code releases).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
