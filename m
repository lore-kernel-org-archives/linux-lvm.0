Return-Path: <thornber@btconnect.com>
Date: Wed, 16 May 2001 12:06:22 +0100
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
Message-ID: <20010516120622.A698@66bassett.freeserve.co.uk>
References: <20010516093929.B482@66bassett.freeserve.co.uk> <Pine.LNX.4.30.0105160340450.6579-100000@shells.valinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0105160340450.6579-100000@shells.valinux.com>; from jweber@valinux.com on Wed, May 16, 2001 at 03:50:33AM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 16, 2001 at 03:50:33AM -0700, Jay Weber wrote:
> On Wed, 16 May 2001, Joe Thornber wrote:
> 
> > On Tue, May 15, 2001 at 09:17:06PM -0400, Chris Mason wrote:
> > > You're right though, pv_flush certainly doesn't look like it could cause
> > > any deadlocks.
> >
> > I must admit I'm struggling to understand why PV_FLUSH even exists.
> > It does *exactly* the same thing as a BLKFLSBUF ioctl to the pv device
> > itself.  As such I agree that it's unlikely to be the culprit.
> 
> I don't think it is, I think it just appears as such.  I've actually
> hacked up my LVM here so that lvm_do_pv_flush() just returns 0.  I don't
> get the problem there anymore. :)

Agreed, I don't think we're seeing a bug with LVM.  It's just that LVM
(or software raid in linear mode ?) is the only time you will do a
partial flush, ie. we flush one PV, but not all of them for the LV.

That's an interesting idea; instead of calling PV_FLUSH, you could try
flushing the whole LV, does the problem go away if you do this ?
You'll have to hack quite a bit to try this, probably easiest to get
the user land tools to check to see if the PV is part of an LV, and
then if it is call BLKFLSBUF for the LV, otherwise call BLKFLSBUF for
the PV.

- Joe
