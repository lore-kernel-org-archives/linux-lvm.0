Date: Fri, 8 Sep 2000 00:14:08 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908001408.A23522@gruyere.muc.suse.de>
References: <200009071825.MAA08578@lynx.turbolabs.com> <20000907234301.B21294@gruyere.muc.suse.de> <20000908001109.A23577@srv.t-online.de>
Mime-Version: 1.0
In-Reply-To: <20000908001109.A23577@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Fri, Sep 08, 2000 at 12:11:09AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@sistina.com
Cc: Andi Kleen <ak@suse.de>, mge@sistina.com, linux-lvm@msede.com

On Fri, Sep 08, 2000 at 12:11:09AM +0000, Heinz J. Mauelshagen wrote:
> On Thu, Sep 07, 2000 at 11:43:01PM +0200, Andi Kleen wrote:
> > On Thu, Sep 07, 2000 at 12:25:07PM -0600, Andreas Dilger wrote:
> > > Heinz,
> > > Michael Kellen and I have been working to add LILO support for booting
> > > from a LV (i.e. have /boot be an LV, and then not have ANY DOS partitions).
> > 
> > [...]
> > 
> > I did some similar work. I implemented an LVM_BMAP ioctl for LVM that
> > simply translates a given block to a (dev_t, blocknr in dev). lilo 
> > simply does a normal FIOBMAP and then calls LVM_BMAP for every block
> > it gets. When the dev_t ever changes it complains loudly. Then it does
> > its normal work with the resulting blocks.
> > 
> > It works ok. The only problem is that a standard PV cannot be used for
> > booting, because it does leave any space for a MBR (it probably needs 
                        ^^^^
                        doesn't of course
> > a PV format revision that simply leaves 4K free) 
> 
> This would be a major change forcing us to move structures around in
> existing installations..

Yes. It may be at least possible to do it compatible though
(let it check for the new PV on the new position or fall back to the old) 

It is probably reasonable to require a backup/restore to boot from LVM
(people who don't want it probably already have other means to boot the
system and can continue to use the old format)

> 
> There should be no problem with a partition based PV though.

With a partition based PV you can as well create /boot in a DOS
partition.


-Andi
