Date: Wed, 20 Oct 1999 08:10:05 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: Re: [linux-lvm] how to remove PV from a VG?
Message-ID: <19991020081005.A26564@cyberhqz.com>
References: <19991019231507.A337@redneck.sk.oracle.com> <199910192313.AA15213@mailgate1b.telekom.de> <19991020123101.A305@redneck.sk.oracle.com>
Mime-Version: 1.0
In-Reply-To: <19991020123101.A305@redneck.sk.oracle.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: freddy@sk.oracle.com
Cc: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>, linux-lvm@msede.com

On Wed, Oct 20, 1999 at 12:31:02PM +0200, Adrien Farkas wrote:
> Heinz Mauelshagen (mauelsha@ez-darmstadt.telekom.de) wrote :
> > > the subject says it (almost) all, I need to remove three PVs that were added to my VG by mistake (namely /dev/sdi, /dev/sdj and /dev/sdk), I guess you see where the error is. I can access data on previous PVs (yet), but don't know how to remove PVs, there is nothing linke 'pvremove'. I can assure you there is no data (perhaps except signature) on those disks.
> > > 
> > 
> > vgreduce YourVG /dev/sd[i-k]
> > 
> > - or, if the 3 partitions hold the only empty PVs of YourVG -
> > 
> > vgreduce -a YourVG
> 
> yes, helped quite enough, just the /dev/sd[ghi] devices are still in
> list of valid PVs and when I run pvscan my partitions get destroyed
> (I suppose because of rewriting LVM marker to the device).  How do I
> really, physically remove the devices from the PV list?

or, if you aren't using partitions, write over the front of the drive
with:

dd if=/dev/zero of=/dev/sdg bs=1024 count=5

I'm not sure how much is actually needed to be overwritten, I normally
just don't put a limit on it and hit ctrl-c after awhile.  (or let it
run to the end of the drive...)

-- 
Ryan Murray (rmurray@cyberhqz.com, rmurray@glenayre.com)
Software Designer, Glenayre Technologies Inc.
The opinions expressed here are my own.
