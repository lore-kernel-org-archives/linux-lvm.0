From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: [linux-lvm] LVM System
References: <NBBBKLKHMJHIJLHOGAOJIEFNJFAA.steve.wray@paradise.net.nz>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJIEFNJFAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000020002756@front1.mail.megapathdsl.net>
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
Date: Mon Mar  4 17:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Steve Wray <steve.wray@paradise.net.nz>

On Monday 04 March 2002 06:39 pm, Steve Wray wrote:
> I'd recommend ext3 with data journalling for sensitive
> filesystems. Its slower than XFS but (seems to) scale better with
> striping and large files. XFS performance (seems to) fall off
> very rapidly as file size exceeds buffer size.
>
> XFS only journals metadata. So on event of a crash,
> the filesystem structure will (likely) be sound, but theres
> no guarantee that the data blocks will be uncorrupted!!!
>
> XFS is very nice tho, in that volumes and filesystems can
> be grown with no downtime at all (without even unmounting).
>
> You might want to do some benchmarking before committing
> to a build (thats recently saved my butt actually).

It was recommended to me that all large file systems have best performance 
with XFS.

> > -----Original Message-----
> > From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> > Behalf Of Anthony W. Marino
> > Sent: Tuesday, 5 March 2002 10:39 a.m.
> > To: linux-lvm@sistina.com
> > Subject: [linux-lvm] LVM System
> >
> >
> > Any thoughts or articles that would be usefull in determining the quality
> > on the following combination would be greatly appreciated:
> >
> > LVM 1.x
> > 3Ware 7800 Raid Controller
> > Maxtor 40GB harddrives
> > XFS Journalling FS
> > SuSE 2.4.18+ Linux
> >
> >
> > Thank You,
> > Anthony
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
