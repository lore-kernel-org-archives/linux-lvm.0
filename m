Date: Wed, 15 Nov 2000 08:04:14 +0100
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] LVM in shared parallel SCSI environment
Message-ID: <20001115080414.G370@jadzia.josv.com>
References: <20001114093855.A21984@kevorkian.evcom.net> <Pine.LNX.4.30.0011141608080.21566-100000@rossi.itg.ie> <20001114142902.A25706@kevorkian.evcom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001114142902.A25706@kevorkian.evcom.net>; from jss@evcom.net on Tue, Nov 14, 2000 at 02:29:02PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Sipprell <jss@evcom.net>
Cc: Paul Jakma <paulj@itg.ie>, linux-lvm@msede.com

Hi,

Though most has already been said in this thread, just a small followup
with some notes and thoughts.

The traditional volume managers on HP-UX, Solaris (VxVM) and AIX do not
usually support shared access to a volume group from two or more nodes,
even if the nodes access different logical volumes. This is done
explicitly to prevent the kind of problems that have been pointed out in
this thread (the chance that two nodes have different in-core metadata
about the VG). HP's LVM supports a read-only vgchange that allows only
read-only access to the VG and its LV's, but I've never used it.

In these traditional environment, the clustering software exports and
imports the VG's as necessary, and run some clusterwide resource manager
that takes care of who currently "owns" the VG. Veritas has a special
Cluster Volume Manager (CVM) that allows shared access to volume groups,
but AFAIK it is only used with parallel databases such as Oracle
Parallel Server.

For myself, I would not choose a solution like Jesse's. However, the fun
and power of Unix is that everyone can handcraft his/her own optimal
environment. As long as you're aware of the consequences what you're
doing: please be my guest :-)

I must admit that I have not looked at what LVM 0.9 will bring to the
table, but some added features in the clustering arena would be very
welcome.

++Jos

And thus it came to pass that Jesse Sipprell wrote:
(on Tue, Nov 14, 2000 at 02:29:02PM -0500 to be exact)

> On Tue, Nov 14, 2000 at 04:09:47PM +0000, Paul Jakma wrote:
> > On Tue, 14 Nov 2000, Jesse Sipprell wrote:
> > 
> > > In the mean time, I'll just have to do things the old fashioned
> > > way.  I'll put a procedure in place that any LVM changes done from
> > > a particular node require the bouncing of VGs on all other
> > > attached nodes.  Fortunately, after initial cluster setup,
> > > manipulation of LVs won't really be performed on a routine basis.
> > 
> > and so what do you do with these LV's? The filesystem/application you
> > run on them has to be aware of the shared-access nature of the
> > device.. so that rules out all but GFS - which IIRC already has some
> > LVM like features.
> 
> Actually, it's entirely possible to run a non-shared-media-aware filesystem as
> long as no more than one cluster node has a given file system mounted at a
> time.
> 
> To illustrate:
> 
> |-------- VG --------|
> ||====== LV0 =======||
> || (ext2)           || --> Mounted on Cluster Node 1
> ||==================||
> ||====== LV1 =======||
> || (ext2)           || --> Mounted on Cluster Node 2
> ||==================||
> ||====== LV2 =======||
> || (ext2)           || --> Mounted on Cluster Node 3
> ||==================||
> ||====== LV3 =======||
> || (ext2)           || --> Mounted on Cluster Node 4
> ||==================||
> |                    |
> |  Free Space in VG  |
> |                    |
> |====================|
> 
> Because none of the cluster nodes are attempting to share access to the actual
> blocks where each filesystem is stored, there are no concurrency issues.
> 
> One can use the benefits of LVM to unmount LV0's fs on Cluster Node 1, resize
> the LV, resize the fs and remount.  Now, Cluster Node's 2, 3 and 4 need to
> have their in-core LVM metadata updated in order to see the new size of LV0.
> Once this is done via the vgchange bounce, everything is consistant.
> 
> -- 
> Jesse Sipprell
> Technical Operations Director
> Evolution Communications, Inc.
> 800.496.4736
> 
> * Finger jss@evcom.net for my PGP Public Key *

-- 
Success and happiness can not be pursued; it must ensue as the 
unintended side-effect of one's personal dedication to a course greater 
than oneself.
