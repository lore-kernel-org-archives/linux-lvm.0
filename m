From: "Steffers" <stef@chronozon.dyndns.org>
Reply-To: stef@chronozon.dyndns.org
Subject: Re: [linux-lvm] Protection of used scsi disks by LVM
Message-Id: <20000427162923.F40D21F473@chronozon.dyndns.org>
Date: Thu, 27 Apr 2000 11:29:23 -0500 (CDT)
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello everyone..

> > I can easily go to /dev/sda1 for example, and erase everything on it.
>
> These are the UNIX/Linux semantics.
> 
> If one has the file/device special permission one can do every kind
> of stupid things which come to ones mind.
>

cat /dev/null > /dev/ttyS0 comes rapidly to mind ;)
 
> > Of course it is a stupid thing to do, but there is a minimal requirement
on
> > protection, isn't it ?
> Yes, you are right.
> but IMHO there's no way today with the existing kernel implementation.

this (afiak) isnt a 'kernel' problem but more a problem that could
be fixed in the userspace. All it would take is a quick diff to 
the 'mkfs' tools and fdisk (or whatever you use cfdisk, gdisk etc)
so that it would recognise the partition type of '8e' as a LV
and then not allow, or at least strenously warn, the user
as to what they are doing. this would seem to make more sense
and (to be honest) i would _hate_ it if Linux by default queried
my every command, so that suggest to me that it +is+ a per
user thing, and not a kernel issue.

also remember, that this isnt like 'certain other operating systems'.
*nix's in general are kind of like theism, with a 'god hands on
the machine' approach. If you want to do anything to the system 
then you have the power to do so at any point. If your 'god'
in an idiot, well, *shrug*.
 
regards,
Stefs
