From: Jesse Sipprell <jss@evcom.net>
Date: Tue, 14 Nov 2000 14:29:02 -0500
Subject: Re: [linux-lvm] LVM in shared parallel SCSI environment
Message-ID: <20001114142902.A25706@kevorkian.evcom.net>
References: <20001114093855.A21984@kevorkian.evcom.net> <Pine.LNX.4.30.0011141608080.21566-100000@rossi.itg.ie>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0011141608080.21566-100000@rossi.itg.ie>; from paulj@itg.ie on Tue, Nov 14, 2000 at 04:09:47PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paulj@itg.ie>
Cc: Jos Visser <josv@osp.nl>, linux-lvm@msede.com

On Tue, Nov 14, 2000 at 04:09:47PM +0000, Paul Jakma wrote:
> On Tue, 14 Nov 2000, Jesse Sipprell wrote:
> 
> > In the mean time, I'll just have to do things the old fashioned
> > way.  I'll put a procedure in place that any LVM changes done from
> > a particular node require the bouncing of VGs on all other
> > attached nodes.  Fortunately, after initial cluster setup,
> > manipulation of LVs won't really be performed on a routine basis.
> 
> and so what do you do with these LV's? The filesystem/application you
> run on them has to be aware of the shared-access nature of the
> device.. so that rules out all but GFS - which IIRC already has some
> LVM like features.

Actually, it's entirely possible to run a non-shared-media-aware filesystem as
long as no more than one cluster node has a given file system mounted at a
time.

To illustrate:

|-------- VG --------|
||====== LV0 =======||
|| (ext2)           || --> Mounted on Cluster Node 1
||==================||
||====== LV1 =======||
|| (ext2)           || --> Mounted on Cluster Node 2
||==================||
||====== LV2 =======||
|| (ext2)           || --> Mounted on Cluster Node 3
||==================||
||====== LV3 =======||
|| (ext2)           || --> Mounted on Cluster Node 4
||==================||
|                    |
|  Free Space in VG  |
|                    |
|====================|

Because none of the cluster nodes are attempting to share access to the actual
blocks where each filesystem is stored, there are no concurrency issues.

One can use the benefits of LVM to unmount LV0's fs on Cluster Node 1, resize
the LV, resize the fs and remount.  Now, Cluster Node's 2, 3 and 4 need to
have their in-core LVM metadata updated in order to see the new size of LV0.
Once this is done via the vgchange bounce, everything is consistant.

-- 
Jesse Sipprell
Technical Operations Director
Evolution Communications, Inc.
800.496.4736

* Finger jss@evcom.net for my PGP Public Key *
