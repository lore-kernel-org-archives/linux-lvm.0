Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Wed, 18 Jul 2001 02:00:51 +0200
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010718020051.D5976@tiger.bigcats.invalid>
References: <85063BBE668FD411944400D0B744267A643448@AUSMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A643448@AUSMAIL>; from austin@coremetrics.com on Tue, Jul 17, 2001 at 04:52:21PM -0500
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Gonyou, Austin (austin@coremetrics.com) wrote 53 lines:

> Is there a how-to or cookbook type doc which tells how/why you should setup
> your LE/PE's? Outter tracks/inner tracks, speed areas, etc?

Just use it, unless your disk is a definite bottleneck, don't
worry about that.  That's the whole idea of LVM: don't worry;
just adjust the sizes as you need.

On the other hand I'd put a small(ish) /boot (or the complete /
) close to the front of the disk (lilo might still not like
high cylinders on all computers), put swap not on LVM and
close to the front of the HD[1].  You can always add swap
files/partitions on the fly, if you need them.

If you need to plan something, put the data/programs which are
small and heavily accessed close to the front, where swap is.
Slower data can have the rest.  But again, unless you have
*good* data, you are probably not only guessing wrong, but
also optimising at the completely wrong place.

[1] LVM is a tad slower than non-LVM[2].  And you want your
    primary swap to be FAST.  If you have multible fast disks,
    give each of them a swapspace.  By giving them all the same
    priority (see man swapon for more info) the kernel will use
    them just like a stripped volume, speeding it up further.

[2] it has to calculate the PE from the LE, which takes some
    small time

> Theory around this is a good thing with relation to LVM and using it. Any
> ideas on that?

Yes: Cluster the PEs of your most accessed LEs (minimize head
movement and thus seek time), spread them out evenly over all
your _fast_ disks (independent reading, independent -- thus
faster -- seeking, smaller 'most accessed' PE clusters == less
head movement == faster seeking) and move the PEs of your most
accessed LEs to the front of the disks (faster reading/writing).

And most important: Don't fix/tune it unless it's broken/a
proven and measured bottleneck.

-Wolfgang
