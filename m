From: Bradley M Alexander <storm@tux.org>
Subject: Re: [linux-lvm] LVM performance
Message-ID: <20011123002611.N5393@sonsofthunder.yi.org>
References: <20011122231706.M5393@sonsofthunder.yi.org> <NBBBKLKHMJHIJLHOGAOJIEACJCAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJIEACJCAA.steve.wray@the.net.nz>
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
Date: Thu Nov 22 23:24:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 23, 2001 at 05:32:07PM +1300, Steve Wray wrote:
> 
> thats dead right; ide can't simultaneously write to the master and slave
> on the same controller. Also, the pair of drives uses the controller
> circuitry
> of the master, so it always pays to make the master the most modern one.

Since both controllers have a drive master and a cd slave, this shouldn't
matter, per se.

> 
> > Can anyone give me any ideas as to why the machine gets beaten about so
> > much during IO operations and more importantly how can I minimize the
> > impact.
> 
> Dunno, if it was because the fs is striped across those drives then
> splitting them across controllers would have made it go away.

Nothing should be striped across the drives. I have two PVs and made two
VGs, one on each drive. The way it works out, the data I am mastering is on
vg01 (hdc), and the ISO is being created there as well. the CD write actually
happens from hdc -> hdd.

> I've seen no performance problems at all and really thrashed an LVM-root
> machine for test purposes while working on a movie. It took it well,
> performance-wise. (reliability is another issue; never go LVM-root...
> but thats just my 2 cents, YMMV).

Yeah, I wasn't brave enough to go all out...And with the problems I was
having, I'm glad I made that decision. :)

> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
You start with a bag full of luck and an empty bag of
experience. The trick is to fill the bag of experience before you
empty the bag of luck.
					--Rules of the Air, #16
