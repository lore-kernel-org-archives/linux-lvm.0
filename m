Subject: Re: [linux-lvm] Automatic snapshot system?
Message-ID: <20011130082244.A379@btconnect.com>
References: <ufasnayrr4e.fsf@epithumia.math.uh.edu> <20011129004736.A14092@auctionwatch.com> <ufa667ts3zh.fsf@epithumia.math.uh.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ufa667ts3zh.fsf@epithumia.math.uh.edu>; from tibbs@math.uh.edu on Thu, Nov 29, 2001 at 02:42:58PM -0600
From: Joe Thornber <thornber@btconnect.com>
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
Date: Fri Nov 30 02:53:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 29, 2001 at 02:42:58PM -0600, Jason L Tibbitts III wrote:
> >>>>> "p" == petro  <petro@auctionwatch.com> writes:
> 
> p> We have a home-brewed perl script called from cron that does a
> p> snap, rsync's out the data, then releases the snapshot.
> 
> Interesting, but not quite what I'm trying to do.  Essentially I'd
> like to use snapshots as a sort of quick online backup to guard
> against users nuking their files.  Of course we do backups nightly,
> but restoring from a snapshot is much quicker than messing with tapes.
> 
> So, depending on how snapshots actually work and the performance
> penalty they incur and various other bits, I was thinking of doing a
> daily or twice-daily snapshot, keeping them around for a few days,
> then deleting them.  But that entails having around 100 snapshots
> sitting around, and I don't know if there are performance problems
> with doing that.

It's a nice idea, but with the current implementation there's no way
I'd want 100 snapshots of the same origin hanging around.

- Joe
