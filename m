Subject: Re: [linux-lvm] Automatic snapshot system?
References: <ufasnayrr4e.fsf@epithumia.math.uh.edu>
	<20011129004736.A14092@auctionwatch.com>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Petro's message of "Thu, 29 Nov 2001 00:47:36 -0800"
Message-ID: <ufa667ts3zh.fsf@epithumia.math.uh.edu>
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
Date: Thu Nov 29 14:41:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "p" == petro  <petro@auctionwatch.com> writes:

p> We have a home-brewed perl script called from cron that does a
p> snap, rsync's out the data, then releases the snapshot.

Interesting, but not quite what I'm trying to do.  Essentially I'd
like to use snapshots as a sort of quick online backup to guard
against users nuking their files.  Of course we do backups nightly,
but restoring from a snapshot is much quicker than messing with tapes.

So, depending on how snapshots actually work and the performance
penalty they incur and various other bits, I was thinking of doing a
daily or twice-daily snapshot, keeping them around for a few days,
then deleting them.  But that entails having around 100 snapshots
sitting around, and I don't know if there are performance problems
with doing that.

 - J<
