From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Automatic snapshot system?
Message-ID: <20011129130007.F20807@auctionwatch.com>
References: <ufasnayrr4e.fsf@epithumia.math.uh.edu> <20011129004736.A14092@auctionwatch.com> <ufa667ts3zh.fsf@epithumia.math.uh.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ufa667ts3zh.fsf@epithumia.math.uh.edu>
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
Date: Thu Nov 29 14:58:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 29, 2001 at 02:42:58PM -0600, Jason L Tibbitts III wrote:
> >>>>> "p" == petro  <petro@auctionwatch.com> writes:
> 
> p> We have a home-brewed perl script called from cron that does a
> p> snap, rsync's out the data, then releases the snapshot.
> Interesting, but not quite what I'm trying to do.  Essentially I'd
> like to use snapshots as a sort of quick online backup to guard
> against users nuking their files.  Of course we do backups nightly,
> but restoring from a snapshot is much quicker than messing with tapes.

    Well, I won't get into the debate on whether it's better to protect
    the users or educate them (ie easy to access backups make users
    sloppy kind of argument), but were I tasked with such a thing, I'd
    do it thus: 

    I'm assuming a situation were you have "working hours", but if
    that's not the case, then only the times have to be modified: 

    Establish a cron-job to run at <work-start-time>, <work-start+4> and
    <work-end>. This cron job calls a script that expires the old snap
    and creates a new one. If you want (for whatever reason) to keep
    multiple old snapshots around (and it can be done I believe) you
    would just make the script smarter and have it expire <current-<x>>
    snapshots. 

> So, depending on how snapshots actually work and the performance
> penalty they incur and various other bits, I was thinking of doing a
> daily or twice-daily snapshot, keeping them around for a few days,
> then deleting them.  But that entails having around 100 snapshots
> sitting around, and I don't know if there are performance problems
> with doing that.

    I'd imagine there is, since the snap doesn't "store" all the data,
    but rather it stores the unchanged version of changed data, meaning
    that as long as the snap is active, it's getting writes. You may be
    able to deactivate a snap and keep it around, but I don't know how
    that works. 

-- 
Share and Enjoy. 
