From: James Mello <kingjamm@colltech.com>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
In-Reply-To: <3C61E0A2.79974741@bellsouth.net>
Message-Id: <Pine.GSO.4.21.0202062006560.17353-100000@psasolar.private.psa.pencom.com>
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
Date: Wed Feb  6 20:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> > Petabytes are another matter entirely. If you must absolutely have that
> > much data backed up, you start looking at more exotic solutions. Backing
> > up solely to disk is *way* to expensive, hence the wonderful, but of
> > poorly implemented idea of HSM.... Disk and tape :)
> 
> Yes, HSM has never panned out the way it was supposed to.
> However, try backing up Petabytes with tape in a reasonable
> amount of time. While I've never configure such a system,
> the numbers from systems I have seen indicate that disk is
> much cheaper than tape (even if tape is a feasible solution
> because of speed).

HSM systems that I've seen work generally used some form of nearline disk
storage and an *HUGE* array of tape drives to write too (100+ tape
drives). The data went to near line storage (which they only held for
like 24 hours) and was then written to the tape. The deal is, the more
data you *must* save, the more money you *must* spend.
