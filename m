From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Re: 2.5.73-mm2
Message-ID: <20030630152252.GA11643@fib011235813.fsnet.co.uk>
References: <20030627202130.066c183b.akpm@digeo.com> <20030628115033.GA660@gmx.de> <20030628222938.78c16450.akpm@digeo.com> <20030629103226.GA661@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030629103226.GA661@gmx.de>
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
Date: Mon Jun 30 10:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, Andrew Morton <akpm@digeo.com>

On Sun, Jun 29, 2003 at 12:32:26PM +0200, Wiktor Wodecki wrote:
> On Sat, Jun 28, 2003 at 10:29:38PM -0700, Andrew Morton wrote:
> > >  I have problems with lvm2 and the 2.5.73-mm2 patchset.
> > Could be because -mm uses a 64-bit dev_t.
> > Could you please revert 
> > ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.5/2.5.73/2.5.73-mm2/broken-out/64-bit-dev_t-kdev_t.patch
> > and retest?
> 
> yes, reverting this patch fixes the problem. Is it sane to run the -mm2
> without this patch?
> 
> > I think there's a version of devicemapper userspace which works correctly
> > with 64-bit dev_t.  Perhaps the Sistina team can shed some light.
>  
> would be nice if somebody else could comment on this..

Yes, I think it's the 64bit dev_t.  You'll have to wait for the new
ioctl interface + userland tools before dm can make this transition.
We've been having some problems with the tools, which caused this
delay in fixing things.  I *hope* the tools will be released this
week.

- Joe
