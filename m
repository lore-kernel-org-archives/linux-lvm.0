From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002120018.BAA24120@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Mirroring
In-Reply-To: <Pine.BSO.4.21.0002111344460.4652-100000@rincewind.lugh.net> from Chris McKinley at "Feb 11, 2000  1:50:34 pm"
Date: Sat, 12 Feb 2000 01:18:49 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris McKinley <lamfada@lugh.net>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Hi, I am relatively new to this list, and to Linux LVM, but when Heinz was
> at the U of MN last month, I asked this very question, and Heinz's
> response was that there are not currently plans for mirroring LEs to PEs
> precisely because this functionality is provided by md or RAID hardware.

Yes.
The LVM covers the dynamic allocation of storage.
Either RAID soft- or hardware covers the redundancy.

IMO you get a much simpler systemarchitecture this way which is much
more reliable for day to day production.

IOW: it saves your money.

> 
> MD is the kernel RAID facility, and provides mirroring (RAID 1) in kernel
> software.  It provides several other RAID versions as well.

Exactly. RAID4+5 are the other ones.

> 
> Heinz, habe ich es richtig verstanden?

Ja 8)

Heinz

> 
> -Chris McKinley
> 
> On Fri, 11 Feb 2000, A James Lewis wrote:
> 
> > 
> > What you're asking is can LVM be used in conjunction with MD, and is this
> > the correct solution or is LVM/MD going to merge or LVM duplicate MD's
> > work??
> > 
> > I'd like those answers too!!!!

No merge activities so far.

> > 
> > 
> > On Fri, 11 Feb 2000, Chris Anderson wrote:
> > 
> > > Harald Milz wrote:
> > > 
> > > > Chris Anderson <chris@alwan.com> wrote:
> > > > > I have looked through the doc and I see that LVM stripes but how do you
> > > > > setup a true mirror?  One hard dive mirrored to another hard drive (1 to
> > > > > 1).
> > > >
> > > > It's more like one partition or logical volume mirrored against another
> > > > one (not necessarily disks - you seem to be familiar with Novell). LVM
> > > > can't do this. Use MD.
> > > 
> > > I know veritas.  It has a SubDisk, Plex Volume setup.  A subdisk is part of a
> > > disk and one or more subdisk make a Plex and one or more plexes make a
> > > volume.  And a volume can be used as a mount point or whatever.
> > > 
> > > So if a disk goes bad only plexes with use a subdisk from that disk are
> > > down.  And if a volume has two plex only one need to be up to run.  Later the
> > > plex can be re-joined back to the volume and the data is synched back to the
> > > other plex.
> > > 
> > > In a nut shell what happens when one disk goes down with LVM?  Can it be
> > > setup to keep the volume up and alive and run and if so what is the best way?
> > > 
> > > >
> > > >
> > > > --
> > > > If you sit down at a poker game and don't see a sucker, get up.  You're
> > > > the sucker.
> > > 
> > 
> > 
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
