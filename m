From: Andres Salomon <dilinger@mp3revolution.net>
Subject: Re: [linux-lvm] LVM 2
Message-ID: <20020529155047.GA32711@chunk.voxel.net>
References: <15347980890.20020529141644@tnonline.net> <20020529141823.GC4655@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020529141823.GC4655@fib011235813.fsnet.co.uk>
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
Date: Wed May 29 10:51:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'll second this.  I've had all my data on LVM2 for months w/out
problems; I've started moving production machines over to lvm2 w/out
mishap (other than redhat's broken init system, but that's not lvm's
fault :).  I only use basic (linear) volume management; no snapshotting,
striping, etc.

Also note that I'm still using beta2 (w/ 2.4.18-ac3).

On Wed, May 29, 2002 at 03:18:23PM +0100, Joe Thornber wrote:
> 
> On Wed, May 29, 2002 at 02:16:44PM +0200, Anders Widman wrote:
> > 
> >    How  stable  is LVM 2
> 
> The releases tend to be very stable, cvs obviously is a little less
> so.  The core functionality (ie. simple LVs) hasn't changed for months
> - current development is focusing on pvmove and the new metadata
> format.
> 
> The snapshot facility was completed recently (including writeable
> snapshots).  Judging from the bug reports on the list they seem to be
> more stable than 1.1rc2, as well as being faster (see
> http://people.sistina.com/~thornber/snap_performance.html for a pretty
> graph).
> 
> Personally I've had all my data on LVM2 since November without mishap.
> 
[...]
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
<dilinger> people fear what they don't understand
<zinx> that is not true
<zinx> most people fear what they don't understand, and the rest get killed
	by those people
