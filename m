Message-ID: <3A1AB871.FA498F57@cup.hp.com>
Date: Tue, 21 Nov 2000 10:01:21 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM in shared parallel SCSI environment
References: <20001114093855.A21984@kevorkian.evcom.net> <Pine.LNX.4.30.0011141608080.21566-100000@rossi.itg.ie> <20001114142902.A25706@kevorkian.evcom.net> <20001115080414.G370@jadzia.josv.com> <20001121074452.A181821@brule.borg>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Matthew O'Keefe <okeefe@brule.borg.umn.edu>
Cc: Jesse Sipprell <jss@evcom.net>, Paul Jakma <paulj@itg.ie>, linux-lvm@msede.com, mauelshagen@sistina.com

Hi,

So when is the 1.0 release tentatively scheduled for?

Matthew O'Keefe wrote:
> 
> Hi,
> 
> Heinz and his LVM team (we've hired two new LVM developers)
> as well as the GFS team have worked
> out a preliminary design for cluster LVM.  The plan is too
> include it in the 1.0 release.
> 
> I totally agree with Jos:  a cluster volume manager is very
> useful, and should stand alone (but also be compatible with)
> a cluster file system like GFS.  There is a tremendous amount
> of commercial activity in the area of volume management
> software for shared SAN storage.  Imagine you have 2
> $3 million dollar EMC symmetrix disk arrays, each attached
> to independent servers.  If one of these symmetrix fills up,
> you have to buy another for just that server alone, even if
> the other server's symmetrix has lots of free space.
> 
> If instead you share these 2 symmetrix boxen across a san,
> then you can expand the PV for one machine into the other
> the symmetrix with free space, and there is no need to buy
> another array.  This is a key reason why shared SAN storage is
> taking off.
> 
> Matt O'Keefe
> Sistina Software, Inc.
> 
> On Wed, Nov 15, 2000 at 08:04:14AM +0100, Jos Visser wrote:
> > Hi,
> >
> > Though most has already been said in this thread, just a small followup
> > with some notes and thoughts.
> >
> > The traditional volume managers on HP-UX, Solaris (VxVM) and AIX do not
> > usually support shared access to a volume group from two or more nodes,
> > even if the nodes access different logical volumes. This is done
> > explicitly to prevent the kind of problems that have been pointed out in
> > this thread (the chance that two nodes have different in-core metadata
> > about the VG). HP's LVM supports a read-only vgchange that allows only
> > read-only access to the VG and its LV's, but I've never used it.
> >
> > In these traditional environment, the clustering software exports and
> > imports the VG's as necessary, and run some clusterwide resource manager
> > that takes care of who currently "owns" the VG. Veritas has a special
> > Cluster Volume Manager (CVM) that allows shared access to volume groups,
> > but AFAIK it is only used with parallel databases such as Oracle
> > Parallel Server.
> >
> > For myself, I would not choose a solution like Jesse's. However, the fun
> > and power of Unix is that everyone can handcraft his/her own optimal
> > environment. As long as you're aware of the consequences what you're
> > doing: please be my guest :-)
> >
> > I must admit that I have not looked at what LVM 0.9 will bring to the
> > table, but some added features in the clustering arena would be very
> > welcome.
> >
> > ++Jos
> >
> > And thus it came to pass that Jesse Sipprell wrote:
> > (on Tue, Nov 14, 2000 at 02:29:02PM -0500 to be exact)
> >
> > > On Tue, Nov 14, 2000 at 04:09:47PM +0000, Paul Jakma wrote:
> > > > On Tue, 14 Nov 2000, Jesse Sipprell wrote:
> > > >
> > > > > In the mean time, I'll just have to do things the old fashioned
> > > > > way.  I'll put a procedure in place that any LVM changes done from
> > > > > a particular node require the bouncing of VGs on all other
> > > > > attached nodes.  Fortunately, after initial cluster setup,
> > > > > manipulation of LVs won't really be performed on a routine basis.
> > > >
> > > > and so what do you do with these LV's? The filesystem/application you
> > > > run on them has to be aware of the shared-access nature of the
> > > > device.. so that rules out all but GFS - which IIRC already has some
> > > > LVM like features.
> > >
> > > Actually, it's entirely possible to run a non-shared-media-aware filesystem as
> > > long as no more than one cluster node has a given file system mounted at a
> > > time.
> > >
> > > To illustrate:
> > >
> > > |-------- VG --------|
> > > ||====== LV0 =======||
> > > || (ext2)           || --> Mounted on Cluster Node 1
> > > ||==================||
> > > ||====== LV1 =======||
> > > || (ext2)           || --> Mounted on Cluster Node 2
> > > ||==================||
> > > ||====== LV2 =======||
> > > || (ext2)           || --> Mounted on Cluster Node 3
> > > ||==================||
> > > ||====== LV3 =======||
> > > || (ext2)           || --> Mounted on Cluster Node 4
> > > ||==================||
> > > |                    |
> > > |  Free Space in VG  |
> > > |                    |
> > > |====================|
> > >
> > > Because none of the cluster nodes are attempting to share access to the actual
> > > blocks where each filesystem is stored, there are no concurrency issues.
> > >
> > > One can use the benefits of LVM to unmount LV0's fs on Cluster Node 1, resize
> > > the LV, resize the fs and remount.  Now, Cluster Node's 2, 3 and 4 need to
> > > have their in-core LVM metadata updated in order to see the new size of LV0.
> > > Once this is done via the vgchange bounce, everything is consistant.
> > >
> > > --
> > > Jesse Sipprell
> > > Technical Operations Director
> > > Evolution Communications, Inc.
> > > 800.496.4736
> > >
> > > * Finger jss@evcom.net for my PGP Public Key *
> >
> > --
> > Success and happiness can not be pursued; it must ensue as the
> > unintended side-effect of one's personal dedication to a course greater
> > than oneself.

-- 
==========
John DeFranco
408-447-7543

Hewlett-Packard Company 
19111 Pruneridge Avenue, MS 44UB 
Cupertino, CA 95014
