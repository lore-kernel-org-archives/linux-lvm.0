Return-Path: <root@srv.sistina.com>
Date: Wed, 30 May 2001 11:24:23 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problem extending a LV
Message-ID: <20010530112423.B30938@sistina.com>
References: <20010529120104.C29771@sistina.com> <Pine.LNX.4.33.0105291333520.8330-100000@UberGeek.coremetrics.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0105291333520.8330-100000@UberGeek.coremetrics.com>; from austin@coremetrics.com on Tue, May 29, 2001 at 01:35:07PM -0500
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

On Tue, May 29, 2001 at 01:35:07PM -0500, Austin Gonyou wrote:
> Are there plans to have this functionality?

Yes, as mentioned in my other related mail.

> As in, I have a 2 disk striped
> set, and now I'm running out of space, so I add a third pv, and now I want
> to restripe and extend onto the third disk? I ask because Veritas has this
> ability, and it could be a deal breaker for some choosing which to use.

All right, that's one reason why we want to have it.
A post 1.0 feature though :-(

Regards,
Heinz    -- The LVM Guy --

> 
> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com
> 
> On Tue, 29 May 2001, AJ Lewis wrote:
> 
> > On Tue, May 29, 2001 at 11:33:54AM +0200, Carsten Balzer wrote:
> > > If I try to extend the LV with:
> > > lvextend -L+78164M /dev/NVolGroup/nVol
> > > then I get:
> > > lvextend -- rounding size 240119808 KB to stripe boundary size
> > 240123904
> > > KB
> > > lvextend -- only 19541 free physical extents in volume group
> > "NVolGroup"
> > >
> > > Next try with: lvextend -l+19541 /dev/NVolGroup/nVol
> > > lvextend -- rounding size 240119808 KB to stripe boundary size
> > 240123904
> > > KB
> > > lvextend -- only 19541 free physical extents in volume group
> > "NVolGroup"
> >
> > You cannot currently extend a striped LV onto a new disk.  It would
> > involve
> > completely rearranging the data to account for the new striping
> > configuration.  The reason you get the error is because the tools know
> > this
> > and are trying to extend on the two original PVs.  If you want to have
> > the
> > ability to extend the LV onto new disks, you must use linear LVs.
> >
> > Regards,
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
