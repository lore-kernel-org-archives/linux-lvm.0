From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: [linux-lvm] LVM System
References: <NBBBKLKHMJHIJLHOGAOJIEFNJFAA.steve.wray@paradise.net.nz>
    <1015285989.24367.7.camel@UberGeek>
In-Reply-To: <1015285989.24367.7.camel@UberGeek>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000020005385@front1.mail.megapathdsl.net>
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
Date: Mon Mar  4 18:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Austin Gonyou <austin@coremetrics.com>

On Monday 04 March 2002 06:53 pm, Austin Gonyou wrote:
> On Mon, 2002-03-04 at 17:39, Steve Wray wrote:
> > I'd recommend ext3 with data journalling for sensitive
> > filesystems. Its slower than XFS but (seems to) scale better with
> > striping and large files. XFS performance (seems to) fall off
> > very rapidly as file size exceeds buffer size.
> >
> > XFS only journals metadata. So on event of a crash,
> > the filesystem structure will (likely) be sound, but theres
> > no guarantee that the data blocks will be uncorrupted!!!
> >
> > XFS is very nice tho, in that volumes and filesystems can
> > be grown with no downtime at all (without even unmounting).
> >
> > You might want to do some benchmarking before committing
> > to a build (thats recently saved my butt actually).
>
> I've only got a couple of things to say in the regard about XFS and
> performance Falling off.
>
> XFS's performance doesn't fall off in the respects you've spoken about.
> It's a misconception when using LVM, or evms, etc along with XFS.
>
> I ran into a similar issue, and was convinced it was XFS or LVM, etc.
> This is in the relation of using XFS and LVM, vs. XFS with no LVM, and
> then testing increasing filesizes with iozone.
>
> What I found was that dbench, and iozone both did not perform very well
> with respect to software raid or striping, but that in fact the
> filesystems themselves performed about 100% faster than without LVM
> striping or LVM Concat.
>
> So much faster that my database guys noticed the enourmous increase in
> speed on a test setup I created for them. One was using LVM, one was
> not, with XFS. The one which was NOT using LVM had a hardware stripe
> setup with write-back caching and adaptive read-ahead. The controller
> has 128MB pc100Dimm. Using a 3 drive RAID 0 hardware, vs 3 drives
> striped with LVM was an enourmous downgrade when benchmarking..but
> actual use, db inserts, file create, etc, ran >100% faster than with
> Hardware striping.
>
> I did the same test with Reiser and Ext2/3, none fared as well, but they
> all did better with LVM and striping than without.
>

What kernel release and XFS version are you using?
Anthony

> > > -----Original Message-----
> > > From: linux-lvm-admin@sistina.com
> >
> > [mailto:linux-lvm-admin@sistina.com]On
> >
> > > Behalf Of Anthony W. Marino
> > > Sent: Tuesday, 5 March 2002 10:39 a.m.
> > > To: linux-lvm@sistina.com
> > > Subject: [linux-lvm] LVM System
> > >
> > >
> > > Any thoughts or articles that would be usefull in determining the
> >
> > quality
> >
> > > on the following combination would be greatly appreciated:
> > >
> > > LVM 1.x
> > > 3Ware 7800 Raid Controller
> > > Maxtor 40GB harddrives
> > > XFS Journalling FS
> > > SuSE 2.4.18+ Linux
> > >
> > >
> > > Thank You,
> > > Anthony
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
