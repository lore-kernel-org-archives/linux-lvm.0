Subject: Re: [linux-lvm] Re: [PATCH] 2.4.25--pre4 VFS lvm_snapshots
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20040107161251.A30329@infradead.org>
References: <3FFC2B15.4000803@wanadoo.es>
	 <20040107161251.A30329@infradead.org>
Message-Id: <1073586677.19559.25.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
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
Date: Thu Jan  8 13:42:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM <linux-lvm@sistina.com>

On Wed, 2004-01-07 at 11:12, Christoph Hellwig wrote:
> On Wed, Jan 07, 2004 at 04:51:49PM +0100, Xose Vazquez Perez wrote:
> > hi,
> > 
> > This patch is necessary to be able to mount snapshots of journalling
> > filesystems. It was flying around lvm for long time, years!!.
> > And LiNUX distributions bring it, Red Hat at least since 7.x.
> > So, it should be sure.
> 
> The patch still doesn't get better by that.  And even if it was this
> would clearly be a feature for 2.6, not 2.4.
> 
I have not started looking at 2.6 yet, but somehow I assumed it would
already have the automatic freeze invocation logic in it.

Too bad that it doesn't, but with 2.4 and XFS I initiate the freeze from
user space and don't depend on the patch being installed.  

I assume all of the various filesystems have a way to invoke the freeze
from userspace.  If so, this patch is a nicety, not a neccesity.

Greg
-- 
Greg Freemyer
