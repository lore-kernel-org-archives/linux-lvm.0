Subject: Re: [linux-lvm] LVM 2
Message-ID: <20020529141823.GC4655@fib011235813.fsnet.co.uk>
References: <15347980890.20020529141644@tnonline.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15347980890.20020529141644@tnonline.net>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Wed May 29 09:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 29, 2002 at 02:16:44PM +0200, Anders Widman wrote:
> 
>    How  stable  is LVM 2

The releases tend to be very stable, cvs obviously is a little less
so.  The core functionality (ie. simple LVs) hasn't changed for months
- current development is focusing on pvmove and the new metadata
format.

The snapshot facility was completed recently (including writeable
snapshots).  Judging from the bug reports on the list they seem to be
more stable than 1.1rc2, as well as being faster (see
http://people.sistina.com/~thornber/snap_performance.html for a pretty
graph).

Personally I've had all my data on LVM2 since November without mishap.

> and is it possible to convert a LVM 1 system
>    to LVM 2 without loosing data?

LVM2 by default uses the same metadata format as LVM1, so there really
isn't any conversion procedure.  So try LVM2 for a bit, if you don't
like it (unlikely) revert to LVM1.  Please note that metadata backups
and archives are held in a very different form.

>    Also,  is  it  possible to convert (with and LVM version) a spanded
>    volume to a striped volume?

Not until we get the new pvmove infrastructure.


If you do try LVM2 please give us feedback on how easy the transition
was and what extra documentation you would like to see.  Also if you get
into trouble the team is normally on irc.openprojects.net #lvm.

- Joe
