Date: Fri, 11 Feb 2000 13:50:34 -0600 (CST)
From: Chris McKinley <lamfada@lugh.net>
Subject: Re: [linux-lvm] Mirroring
In-Reply-To: <Pine.LNX.4.20.0002111805300.18008-100000@vortex1.vrtx.net>
Message-ID: <Pine.BSO.4.21.0002111344460.4652-100000@rincewind.lugh.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: A James Lewis <james@fsck.co.uk>
Cc: Chris Anderson <chris@alwan.com>, h.milz@seneca.muc.de, "linux-lvm@msede.com" <linux-lvm@msede.com>

Hi, I am relatively new to this list, and to Linux LVM, but when Heinz was
at the U of MN last month, I asked this very question, and Heinz's
response was that there are not currently plans for mirroring LEs to PEs
precisely because this functionality is provided by md or RAID hardware.

MD is the kernel RAID facility, and provides mirroring (RAID 1) in kernel
software.  It provides several other RAID versions as well.

Heinz, habe ich es richtig verstanden?

-Chris McKinley

On Fri, 11 Feb 2000, A James Lewis wrote:

> 
> What you're asking is can LVM be used in conjunction with MD, and is this
> the correct solution or is LVM/MD going to merge or LVM duplicate MD's
> work??
> 
> I'd like those answers too!!!!
> 
> 
> On Fri, 11 Feb 2000, Chris Anderson wrote:
> 
> > Harald Milz wrote:
> > 
> > > Chris Anderson <chris@alwan.com> wrote:
> > > > I have looked through the doc and I see that LVM stripes but how do you
> > > > setup a true mirror?  One hard dive mirrored to another hard drive (1 to
> > > > 1).
> > >
> > > It's more like one partition or logical volume mirrored against another
> > > one (not necessarily disks - you seem to be familiar with Novell). LVM
> > > can't do this. Use MD.
> > 
> > I know veritas.  It has a SubDisk, Plex Volume setup.  A subdisk is part of a
> > disk and one or more subdisk make a Plex and one or more plexes make a
> > volume.  And a volume can be used as a mount point or whatever.
> > 
> > So if a disk goes bad only plexes with use a subdisk from that disk are
> > down.  And if a volume has two plex only one need to be up to run.  Later the
> > plex can be re-joined back to the volume and the data is synched back to the
> > other plex.
> > 
> > In a nut shell what happens when one disk goes down with LVM?  Can it be
> > setup to keep the volume up and alive and run and if so what is the best way?
> > 
> > >
> > >
> > > --
> > > If you sit down at a poker game and don't see a sucker, get up.  You're
> > > the sucker.
> > 
> 
> 
