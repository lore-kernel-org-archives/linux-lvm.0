Return-Path: <acahalan@saturn.cs.uml.edu>
From: "Albert D. Cahalan" <acahalan@cs.uml.edu>
Message-Id: <200107131820.f6DIKvg190902@saturn.cs.uml.edu>
Date: Fri, 13 Jul 2001 14:20:57 -0400 (EDT)
In-Reply-To: <Pine.LNX.4.33.0107050310570.1063-100000@toomuch.toronto.redhat.com> from "Ben LaHaise" at Jul 05, 2001 03:35:31 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Ben LaHaise <bcrl@redhat.com>
Cc: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

Ben LaHaise writes:
> On Thu, 5 Jul 2001, Ragnar Kj\370rstad wrote:

>> What do you mean?
>> Is it not feasible to fix this in LVM as well, or do you just not know
>> what needs to be done to LVM?
>
> Fixing LVM is not on the radar of my priorities.  The code is sorely in
> need of a rewrite and violates several of the basic planning tenents that
> any good code in the block layer should follow.  Namely, it should have 1)
> planned on supporting 64 bit offsets, 2) never used multiplication,
> division or modulus on block numbers, and 3) don't allocate memory
> structures that are indexed by block numbers.  LVM failed on all three of
> these -- and this si just what I noticed in a quick 5 minute glance
> through the code.  Sorry, but LVM is obsolete by design.  It will continue
> to work on 32 bit block devices, but if you try to use it beyond that, it
> will fail.  That said, we'll have to make sure these failures are graceful
> and occur prior to the user having a chance at loosing any data.
> 
> Now, thankfully there are alternatives like ELVM, which are working on
> getting the details right from the lessons learned.  Given that, I think
> we'll be in good shape during the 2.5 cycle.

How does can any of this even work?

Say I have N disks, mirrored, or maybe with parity. I'm trying
to have a reliable system. I change a file. The write goes out
to my disks, and power is lost. Some number M, such that 0<M<N,
of the disks are written before the power loss. The rest of the
disks don't complete the write. Maybe worse, this is more than
one sector, and some disks have partial writes.

Doesn't RAID need a journal or the phase-tree algorithm?
How does one tell what data is old and what data is new?
