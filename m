Return-Path: <phillips@bonn-fries.net>
From: Daniel Phillips <phillips@bonn-fries.net>
Date: Sun, 15 Jul 2001 15:44:14 +0200
References: <E15LL3Y-0000yJ-00@the-village.bc.nu> <0107142211300W.00409@starship> <20010715153607.A7624@weta.f00f.org>
In-Reply-To: <20010715153607.A7624@weta.f00f.org>
MIME-Version: 1.0
Message-Id: <01071515442400.05609@starship>
Content-Transfer-Encoding: 7BIT
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
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
To: Chris Wedgwood <cw@f00f.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

On Sunday 15 July 2001 05:36, Chris Wedgwood wrote:
> On Sat, Jul 14, 2001 at 10:11:30PM +0200, Daniel Phillips wrote:
>
>     Atomic commit.  The superblock, which references the updated
>     version of the filesystem, carries a sequence number and a
>     checksum.  It is written to one of two alternating locations.  On
>     restart, both locations are read and the highest numbered
>     superblock with a correct checksum is chosen as the new
> filesystem root.
>
> Yes... and which ever part of the superblock contains the sequence
> number must be written atomically.

The only requirement here is that the checksum be correct.  And sure,
that's not a hard guarantee because, on average, you will get a good
checksum for bad data once every 4 billion power events that mess up
the final superblock transfer.  Let me see, if that happens once a year,
your data should still be good when the warrantee on the sun expires.
:-)

> The point is, you _NEED_ to be sure that data written before the
> superblock (or indeed anywhere further up the tree, you can make
> changes in theory which don't require super-block updates) are
> written firmly to the platters before any thing which refers to it is
> updated.

Since the updated tree is created non-destructively with respect to
the original tree, the only priority relationship that matters is the
requirement that all blocks of the updated tree be securely committed
before the new superblock is written.

> Alan was saying with IDE you cannot reliably do this, I assume you
> can with SCSI was my point.

Surely it can't be that *all* IDE disks can fail in that way?  And it
seems the jury is still out on SCSI, I'm interested to see where that
discussion goes.

--
Daniel
