From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] FW: LVM
Message-ID: <20020626123951.E18125@sistina.com>
References: <Pine.LNX.4.44.0206251009190.13871-100000@dragon.inside.ntisys.com> <Pine.LNX.4.44.0206251408300.962-100000@pzat.meep.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0206251408300.962-100000@pzat.meep.org>; from oolon@ankh.org on Tue, Jun 25, 2002 at 02:11:39PM +0000
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
Date: Wed Jun 26 05:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 25, 2002 at 02:11:39PM +0000, James Hawtin wrote:
> On Tue, 25 Jun 2002 bscott@ntisys.com wrote:
> 
> > On Tue, 25 Jun 2002, at 8:58am, Montgomery Mouw wrote:
> > > I was just wondering if I mount 5 drives using LVM and say the forth drive
> > > dies, do I lose the data only on that forth drive or do I lose the data on
> > > the whole mount (all 5 drives data)?
> >
> >   In general, you will lose everything.
> >
> >   Technically: A drive is used to create a PV (Physical Volume).  One or
> > more PVs is used to create an LV (Logical Volume).  If the drive containing
> > a PV fails, that PV becomes unavailable.  If an LV needs a PV, and that PV
> > is unavailable, the LV will become unavailable as well.
> >
> 
> I thought changes were planned or done so that if a PV failed the vg could
> be force mounted and only the lvs on the unavailable PV would not be
> available....

As Alasdair said that support will show up later in LVM2.
It is in unstable LVM1.1 already.

See the other RAID > 0 thread on this list if you want to have disk redundancy
in order to avoid such SPOFs.

BTW: LVM2 will support mirroring directly later this year.

> 
> James
> 
> 
> 
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
