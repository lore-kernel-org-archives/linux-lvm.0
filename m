Message-ID: <383AB288.465073E1@mchp.siemens.de>
Date: Tue, 23 Nov 1999 16:28:08 +0100
From: Gerhard Fuernkranz <gerhard.fuernkranz@mchp.siemens.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Q: active/inactive/imported/exported group ?
References: <199911231356.OAA06052@u9etz.ez-darmstadt.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: mauelsha@u9etz.ez-darmstadt.telekom.de
Cc: mge@u9etz.ez-darmstadt.telekom.de, linux-lvm@msede.com

mauelsha@u9etz.ez-darmstadt.telekom.de wrote:

> If you don't change your IO configuration vgscan will not produce
> different LV minors anyway.

see below.

> > Any comments?
> 
> This is an option.
> 
> I'ld rather prefer to let vgscan deal with 'sticky' minors based
> on existing lvmtab entries and let it only use free minors for new VGs.

The problem is again the cluster. Additionally to shared volumes I
also may have local volumes on each host. Each host will usually
see the same set of shared volumes, but the sets of each host's
local volumes may differ. But I also want, that a shared volume
gets the same minor number on every host in the cluster in order
that NFS server failover from one host to another one works.

So if I add new (shared) volumes on host A, then it is not guaranteed,
that the new minor number host A assigns to the volume is not already
in use on host B. With my sticky volume table I'd use the following
procedure to create a new shared volume:

1. find a free minor number (manually)
2. enter it to the table on every host in the cluster (manually)
3. then craete the volume: vgcreate on 1st host / vgscan on all
   other hosts - vgcreate/vgscan will assign the number from the
   sticky table.

Of course my sticky table can also be integrated in lvmtab.

A different approach could be:

- I've seen in the pvdata output, that the volume descriptor
  already contains a major/minor number.

- So the desired minor number could reside in the volume descriptor
  on the disk together with a sticky flag for the volume.

- such a sticky voulume could e.g. be created with
  "lvcreate ... --sticky=<minor> ...",
  (which only succeeds if the minor number is not already in use -
  either by a currently active volume or another sticky volume).

- vgscan will
  1. go through the currently active volumes
  2. through the sticky volumes and try to assign exactly
     the sticky minor number
  3. all other volumes and assign a free minor number


> If you garanty that you must already have a cluster manager... 8*)

Yes.


Thanks,
Gerhard
