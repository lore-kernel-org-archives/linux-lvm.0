Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 17 Jan 2001 10:16:30 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at www.sistina.com
Message-ID: <20010117101630.C511@tykepenguin.com>
References: <20010113114507.D15915@linuxcare.com> <200101130143.f0D1hNF19829@webber.adilger.net> <20010113170616.B22699@caldera.de> <20010116085117.A696@tykepenguin.com> <20010116121046.E2709@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010116121046.E2709@mvista.com>; from cduffy@mvista.com on Tue, Jan 16, 2001 at 12:10:46PM -0800
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 16, 2001 at 12:10:46PM -0800, Charles Duffy wrote:
> On Tue, Jan 16, 2001 at 08:51:18AM +0000, Patrick Caulfield wrote:
> > On Sat, Jan 13, 2001 at 05:06:16PM +0100, Christoph Hellwig wrote:
> > > On Fri, Jan 12, 2001 at 06:43:23PM -0700, Andreas Dilger wrote:
> > > > > Would it be possible to clean up the ioctl interface so we
> > > > > dont need such large hacks for LVM support? I can do the work
> > > > > but I want to be sure you guys will agree to it.
> > 
> > If you're prepared to do the work we'd be glad to accept the patch -
> > please send it to me or the list so I can check over it before
> > committing it. As we don't have an UltraSPARC available for testing
> > it's probably better done by someone who does !
> 
> I have an Ultra-1 available, presently in use as a prototyping system.
> It's not currently using LVM and there's no unpartitioned space on the
> drive, but if one of the core developers (or otherwise someone I have
> reason to trust) wants to try testing LVM over loopback (or something
> of that sort), I can provide access.

I was hoping that Anton would volunteer as per his message in linux-kernel :-)

Having looked in (too much) depth at the code I decided I don't know enough
about Ultra-SPARCs to be able to do this on some else's machine. 

I've worked fairly extensively on Alphas (which are a pure 64 bit machine)
but the sparc seems to have some bizarre 32 bit modes I know nothing about.


patrick
