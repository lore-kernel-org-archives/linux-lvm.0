Message-ID: <3839495F.5310BE71@mchp.siemens.de>
Date: Mon, 22 Nov 1999 14:47:11 +0100
From: Gerhard Fuernkranz <gerhard.fuernkranz@mchp.siemens.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Q: active/inactive/imported/exported group ?
References: <199911221239.AA12854@mailgate1b.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Heinz,

thanks for the fast answer -
just a few more questions:

Heinz Mauelshagen wrote:
...
> > And one last question:
> > When does LVM assign minor device numbers to a volume?
> 
> At lvcreate time _and_ at vgscan time.

Assume I have a group g1 with volume v1 and a group g2 with
volume v2. Now I turn off the machine, remove g1's physical
disks and power on the machine again. Does this mean, that
vgscan may assign a *different* minor number to v2 after the
reboot?


Concernig my other question (imported/exported/active/inactive)
probably I should explain, what I want to do:

I'd like to use LVM in a cluster with multihosted disks.
Each host *can* access all disks, but I'll guarantee (howsoever),
that only one host *does* access a disk/volume/volume-group
at a time.

My idea was, that all hosts see all groups on the shared disks,
but only *one* host activates a volume group at a time, while
all other hosts don't activate the same group (but probably
different ones). If I want to (logically) switch a volume group
to a different host, then I deactivate it on the source host,
re-"vgscan" on the target host and then activate the group on
the target host.

Do you think, this strategy is ok?
I assume, that LVM does not write anything to a physical disk
belonging to a deactivated group, correct?
Can I just re-"vgscan" a (deactivated) group at any time in order
to see all changes a different host has made to the group while it
was deactivated on the local host?

I did not want to export/import for two reasons:

- import does not search the disks for the group
- if a host with an activated group crashes, then it
  has no chance to export the group anyway.
  Nevertheless in this case I'd like to access the group
  from different host in a cluster.

For operation in a cluster I'd also desire, that
only one host can activate a group at time (-> i.e.
the host claims ownership and e.g. writes its host name
to all disks of the group) in order that no other host
can accidently activate the same group at the same time.
But there should also be a "forced" activation method to override
this security mechanism (-> in case that the owner crashes).
IMHO something like this is NYI?


Thanks,
Gerhard
