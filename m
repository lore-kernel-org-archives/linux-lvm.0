Message-Id: <3C61E289.DD2CFF54@bellsouth.net>
From: Jeff Layton <laytonjb@bellsouth.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
References: <Pine.GSO.4.21.0202062006560.17353-100000@psasolar.private.psa.pencom.com>
Content-Transfer-Encoding: 7bit
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
Date: Wed Feb  6 20:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

James Mello wrote:

> > > Petabytes are another matter entirely. If you must absolutely have that
> > > much data backed up, you start looking at more exotic solutions. Backing
> > > up solely to disk is *way* to expensive, hence the wonderful, but of
> > > poorly implemented idea of HSM.... Disk and tape :)
> >
> > Yes, HSM has never panned out the way it was supposed to.
> > However, try backing up Petabytes with tape in a reasonable
> > amount of time. While I've never configure such a system,
> > the numbers from systems I have seen indicate that disk is
> > much cheaper than tape (even if tape is a feasible solution
> > because of speed).
>
> HSM systems that I've seen work generally used some form of nearline disk
> storage and an *HUGE* array of tape drives to write too (100+ tape
> drives). The data went to near line storage (which they only held for
> like 24 hours) and was then written to the tape. The deal is, the more
> data you *must* save, the more money you *must* spend.

Agreed.

I've never had good luck keeping HSM systems up
for very long. The ones I have experience with liked to lock
up at least once a week and the software never liked to be
restarted - had to reboot the whole box.

Jeff


>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
