Return-Path: <root@srv.sistina.com>
Date: Mon, 16 Jul 2001 16:26:18 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Message-ID: <20010716162618.B12520@sistina.com>
References: <200107151747.f6FHlAU60256@aslan.scsiguy.com> <20010716205633.G11938@weta.f00f.org> <01071615193905.06482@starship>
Mime-Version: 1.0
In-Reply-To: <01071615193905.06482@starship>; from phillips@bonn-fries.net on Mon, Jul 16, 2001 at 03:19:39PM +0200
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

On Mon, Jul 16, 2001 at 03:19:39PM +0200, Daniel Phillips wrote:
> On Monday 16 July 2001 10:56, Chris Wedgwood wrote:
> > On Sun, Jul 15, 2001 at 11:47:10AM -0600, Justin T. Gibbs wrote:
> >
> >     Simply disabling the write cache does not guarantee the order of
> >     writes.  For one, with tagged I/O and the use of the SIMPLE_Q tag
> >     qualifier, commands may be completed in any order.  If you want
> >     some semblance of order, either disable the write cache or use
> > the FUA bit in all writes, and use the ORDERED tag qualifier.  Even
> > when using these options, it is not clear that the drive cannot
> > reorder writes "slightly" to make track writes more efficient (e.g.
> > two separate commands to write sequential sectors on the same track
> > may be written in reverse order).
> >
> > ORDERED sounds like the trick...  I assume this is some kind of
> > write-barrier? If so, then I assume it has some kind of strict
> > temporal ordering, even between command issues to the drive.
> >
> > If so, that would be idea if we can have the fs communicate this all
> > the way down to the device layer, making it work for soft-raid and
> > LVM be a little harder perhaps.
> 
> There was general agreement amongst filesystem developers at San Jose
> that we need some kind of internal interface at the filesystem level
> for this, independent of the type of underlying block device - IDE,
> SCSI or "other".  That's as far as it got.
> 

Daniel,

so there's no document defining the basics of that interface so far?

> --
> Daniel
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
