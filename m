Date: Wed, 20 Oct 1999 12:31:02 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] how to remove PV from a VG?
Message-ID: <19991020123101.A305@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <19991019231507.A337@redneck.sk.oracle.com> <199910192313.AA15213@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199910192313.AA15213@mailgate1b.telekom.de>; from mauelsha@ez-darmstadt.telekom.de on Wed, Oct 20, 1999 at 01:12:41AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com

Heinz Mauelshagen (mauelsha@ez-darmstadt.telekom.de) wrote :

> > 
> > Hey folks,
> > 
> 
> Hi Freddy.
> 
> > the subject says it (almost) all, I need to remove three PVs that were added to my VG by mistake (namely /dev/sdi, /dev/sdj and /dev/sdk), I guess you see where the error is. I can access data on previous PVs (yet), but don't know how to remove PVs, there is nothing linke 'pvremove'. I can assure you there is no data (perhaps except signature) on those disks.
> > 
> 
> vgreduce YourVG /dev/sd[i-k]
> 
> - or, if the 3 partitions hold the only empty PVs of YourVG -
> 
> vgreduce -a YourVG

yes, helped quite enough, just the /dev/sd[ghi] devices are still in list of valid PVs and when I run pvscan my partitions get destroyed (I suppose because of rewriting LVM marker to the device). How do I really, physically remove the devices from the PV list?

Thanks in advance,
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\___/ /_/\_\  does infinite loops in 5 seconds
