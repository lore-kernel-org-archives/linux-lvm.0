From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] LVM performance
Message-ID: <NBBBKLKHMJHIJLHOGAOJIEADJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011123002611.N5393@sonsofthunder.yi.org>
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
Date: Fri Nov 23 06:33:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Bradley M Alexander
> On Fri, Nov 23, 2001 at 05:32:07PM +1300, Steve Wray wrote:
> >
> > thats dead right; ide can't simultaneously write to the master and slave
> > on the same controller. Also, the pair of drives uses the controller
> > circuitry
> > of the master, so it always pays to make the master the most modern one.
>
> Since both controllers have a drive master and a cd slave, this shouldn't
> matter, per se.

yeah but I thought I'd mention it, for completeness
:)


> > > Can anyone give me any ideas as to why the machine gets
> beaten about so
> > > much during IO operations and more importantly how can I minimize the
> > > impact.
> >
> > Dunno, if it was because the fs is striped across those drives then
> > splitting them across controllers would have made it go away.
>
> Nothing should be striped across the drives. I have two PVs and made two
> VGs, one on each drive. The way it works out, the data I am
> mastering is on

yup you have to tell it to stripe, as I recall. Never used that feature
tho.

> > I've seen no performance problems at all and really thrashed an LVM-root
> > machine for test purposes while working on a movie. It took it well,
> > performance-wise. (reliability is another issue; never go LVM-root...
> > but thats just my 2 cents, YMMV).
>
> Yeah, I wasn't brave enough to go all out...And with the problems I was
> having, I'm glad I made that decision. :)

I think the worst part is the lack of backward compatibility
at some stages of LVM. With root on LVM it can be a bit dangerous
to upgrade! Or at least it was...
