From: "Peter Wuestefeld" <Peter.Wuestefeld@resnova.de>
Message-ID: <C125679F.002ED3A9.00@silicon.resnova.de>
Date: Tue, 29 Jun 1999 09:49:29 +0200
Subject: Re: [linux-lvm] Alpha testers rqd for ext2 fs extend utility.
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi Andreas,

sorry, but I have to comment on this:

> Another possibility (if the ext2 kernel code can handle it) is to build
> the ext2 filesystem "pre-enlarged" with enough group descriptors and
> inode blocks for a much larger filesystem, and then we don't have the
> issue of moving blocks around on a (un)mounted filesystem.  I think that
> this is what AIX does, since when you create a new JFS filesystem (selecting
> bytes/inode and cluster size) it replies with:

> Based on the parameters chosen, the new /tt JFS file system
> is limited to a maximum size of 134217728 (512 byte blocks)

> so there is a pre-determined JFS size limit as well, it's just a very
> large one.  That would be the equivalent of ext2's 256MB resize limit,
> and AIX JFS doesn't allow you to expand past the size which is determined
> at JFS creation time.

What you see there is not related to the "newly created" JFS. It is the effect
of a parameter set on the LV - in smitty the "MAXIMUM NUMBER of LOGICAL
PARTITIONS" when you create an new LV (on the command line, it is the "-x"
parameter to mklv). This parameter can be changed later and is only a soft stop,
preventing you from accidentially creating LVs too large. AIX allocates place
for structures (inodes, superblocks) in a filesystem in 8MB chunks (by default
if you are using 4MB PEs), known as Allocation Group size. This means that if
you extend a LV by, say, 4MB, the place for holding inodes for 2*4MB is
allocated in that group. Extendig that FS by another 4MB would then not lead to
additional allocation of space for structures in this Allocation Group.

So this leads to the idea that, instead of allocate already space in the
filesystem for holding all structures of a 256M FS when creating a FS even
smaller, to allocate that in  steps say, related to the PE/LE size of that VG.
By that we would gain even more flexibility I think.

Just my 2P worth ...

Greetings,

Peter

Mit freundlichem Gruss/Best Regards

Peter Wuestefeld
IBM Certified Support Professional AIX 4.3
==================================
res nova Unternehmensberatung GmbH
                   ...aktiv in AIX
MAIL:  Ruppmannstrasse 41
       D-70565 Stuttgart, Germany
FON:   +49 711 78888 0
FAX:   +49 711 78888 99
WWW:   http://www.resnova.de
SMTP: mailto: Peter.Wuestefeld@resnova.de

The idea that an arbitrary naive human should be able to properly use a given
tool without training or understanding is even more wrong for computing than
it is for other tools (e.g. automobiles, airplanes, guns, power saws).
                -- Doug Gwyn
