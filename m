From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: re[2]: [linux-lvm] System Suggestions
References: <Pine.BSI.4.10.10203070728480.16043-100000@xs3.xs4all.nl>
In-Reply-To: <Pine.BSI.4.10.10203070728480.16043-100000@xs3.xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000021554843@front2.mail.megapathdsl.net>
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
Date: Thu Mar  7 04:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Seth Mos <knuffie@xs4all.nl>
Cc: Greg Freemyer <freemyer@NorcrossGroup.com>, Petro <petro@auctionwatch.com>, linux-lvm@sistina.com, linux-xfs@oss.sgi.com, mysql@lists.mysql.com

On Thursday 07 March 2002 01:32 am, Seth Mos wrote:
> On Wed, 6 Mar 2002, Anthony W. Marino wrote:
> > > If you are looking into using the 3Ware controllers watch the
> > > following: The 64xx controllers are underpowered and should better not
> > > be used in raid 5 mode.
> > > The 74xx controllers seem to be good and should be fine with raid5 but
> > > note that raid5 will always have slow write speeds.
> >
> > Is there a way to minimize the write penalty using both XFS and LVM with
> > RAID 5?
>
> Don't use raid5. I always use a combination of raid 1 and 10 for a
> database server. If you have a database that frequently updates records
> you don't want the extra write overhead.
>
> Software raid 1 or 10 will do fine in that case.
> If you have 4 disks you make 2 raid 1 arrays and then stripe those in a
> raid 0. You then have optimum speed at the lowest possible overhead.
>
> Generally that is what you want for a database server.
>
> Cheers
> Seth

I caught a few emails on linux-lvm list where an external log is being used 
as well to better write performance.

Thanks Alot,
Anthony
