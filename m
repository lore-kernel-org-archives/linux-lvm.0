Date: Fri, 8 Sep 2000 19:09:16 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908190916.A25880@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20000908000253.A23165@srv.t-online.de> <200009072329.RAA21600@lynx.turbolabs.com> <20000908130235.C25034@srv.t-online.de> <20000908154706.A15168@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20000908154706.A15168@colombina.comedia.it>; from bluca@comedia.it on Fri, Sep 08, 2000 at 03:47:06PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Berra <bluca@comedia.it>
Cc: mge@sistina.com, linux-lvm@msede.com

On Fri, Sep 08, 2000 at 03:47:06PM +0200, Luca Berra wrote:
> On Fri, Sep 08, 2000 at 01:02:35PM +0000, Heinz J. Mauelshagen wrote:
> > > LILO already handles many of these issues, or at least warns about them.
> > > None of them are specific to LVM, so people are aware of them already
> > > (although LVM may hide a few of the details).  It would be documented
> > > that the /boot LV can reside only on 1 disk, and that it must reside on
> > > a BIOS addressible disk.  Most systems create /boot on the first disk
> > > when they are installed, and even with the number of kernels on my system
> > > it is only a few MB (1 or 2 PEs is enough).
> 
> beware that bios addressable might mean below cylinder 1024 if your bios
> doesn't handle lba32

Damn it.

> 
> > We would need at least an additional "allocation on a single device" or
> contigous should imply this, but then  more than just this
> 
> > "don't pvmove" status flag for the LV to ensure that no wrong pvmove(8)
> > can happen.
> i'd like to be able to pvmove even the boot lv (i.e. i am migrating
> to a larger disk)

Sure.
The attribute would be resetable anyway to allow this.


-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
