Subject: RE: [linux-lvm] LVM System
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJOEGAJFAA.steve.wray@paradise.net.nz>
References: <NBBBKLKHMJHIJLHOGAOJOEGAJFAA.steve.wray@paradise.net.nz>
Content-Transfer-Encoding: 7bit
Message-Id: <1015288323.24628.9.camel@UberGeek>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Mar  4 18:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Wooohoo!! That's for sure.

BTW..are you using IDE or SCSI?

That is an ENOURMOUS difference, I've found, to LVM/XFS performance
Benchmarking.

On Mon, 2002-03-04 at 18:23, Steve Wray wrote:
> Fair enough; I have to admit that I did *no* benchmarking
> of a simple partitioned filesystem, only LVM.
> Its so *easy* to just make a new volume for benchmarking
> :)
> I was lazy... my bad!
> 
> > -----Original Message-----
> > From: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]On
> > Behalf Of Austin Gonyou
> > Sent: Tuesday, 5 March 2002 1:12 p.m.
> > To: linux-lvm@sistina.com
> > Subject: RE: [linux-lvm] LVM System
> >
> >
> > Hmm..that could be so, but I'm not sure if it's JUST xfs or if it's
> > XFS/LVM. My largefile performance is excellent, as is my small file
> > perfromance.
> >
> > On Mon, 2002-03-04 at 18:01, Steve Wray wrote:
> > > Well, thats possible. The best thing to do is run
> > > benchmarks (I like iozone) on the proposed
> > > system and see what works best.
> > > The tests I did were just on small filesystems (1G volumes,
> > > 64M, 128M and 196M RAM). Filesizes I tested were only
> > > up to 500M or so.
> > > I found that while most tested filesystems (reiser, XFS,
> > > ext3 and vfat) did drop off in performance as filesize
> > > increased, XFS dropped off the most rapidly in that
> > > dimension. ext3 was the most stable (in performance as filesize
> > > increased), though its small filesize performance was the worst.
> > > XFS looked like kinda the opposite!
> > > :)
> > > Reiser had the worst write performance of all of them,
> > > but admirable read.
> > >
> > > YMMV.
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: linux-lvm-admin@sistina.com
> > > [mailto:linux-lvm-admin@sistina.com]On
> > > > Behalf Of Anthony W. Marino
> > > > Sent: Tuesday, 5 March 2002 12:50 p.m.
> > > > To: linux-lvm@sistina.com; Steve Wray
> > > > Subject: Re: [linux-lvm] LVM System
> > > >
> > > >
> > > > On Monday 04 March 2002 06:39 pm, Steve Wray wrote:
> > > > > I'd recommend ext3 with data journalling for sensitive
> > > > > filesystems. Its slower than XFS but (seems to) scale better
> with
> > > > > striping and large files. XFS performance (seems to) fall off
> > > > > very rapidly as file size exceeds buffer size.
> > > > >
> > > > > XFS only journals metadata. So on event of a crash,
> > > > > the filesystem structure will (likely) be sound, but theres
> > > > > no guarantee that the data blocks will be uncorrupted!!!
> > > > >
> > > > > XFS is very nice tho, in that volumes and filesystems can
> > > > > be grown with no downtime at all (without even unmounting).
> > > > >
> > > > > You might want to do some benchmarking before committing
> > > > > to a build (thats recently saved my butt actually).
> > > >
> > > > It was recommended to me that all large file systems have best
> > > > performance
> > > > with XFS.
> > > >
> > > > > > -----Original Message-----
> > > > > > From: linux-lvm-admin@sistina.com
> > > > [mailto:linux-lvm-admin@sistina.com]On
> > > > > > Behalf Of Anthony W. Marino
> > > > > > Sent: Tuesday, 5 March 2002 10:39 a.m.
> > > > > > To: linux-lvm@sistina.com
> > > > > > Subject: [linux-lvm] LVM System
> > > > > >
> > > > > >
> > > > > > Any thoughts or articles that would be usefull in determining
> > > > the quality
> > > > > > on the following combination would be greatly appreciated:
> > > > > >
> > > > > > LVM 1.x
> > > > > > 3Ware 7800 Raid Controller
> > > > > > Maxtor 40GB harddrives
> > > > > > XFS Journalling FS
> > > > > > SuSE 2.4.18+ Linux
> > > > > >
> > > > > >
> > > > > > Thank You,
> > > > > > Anthony
> > > > > >
> > > > > > _______________________________________________
> > > > > > linux-lvm mailing list
> > > > > > linux-lvm@sistina.com
> > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > read the LVM HOW-TO at
> http://www.sistina.com/lvm/Pages/howto.html
> > > > >
> > > > > _______________________________________________
> > > > > linux-lvm mailing list
> > > > > linux-lvm@sistina.com
> > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > read the LVM HOW-TO at
> http://www.sistina.com/lvm/Pages/howto.html
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > --
> > Austin Gonyou
> > Systems Architect, CCNA
> > Coremetrics, Inc.
> > Phone: 512-698-7250
> > email: austin@coremetrics.com
> >
> > "It is the part of a good shepherd to shear his flock, not to skin
> it."
> > Latin Proverb
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"It is the part of a good shepherd to shear his flock, not to skin it."
Latin Proverb
