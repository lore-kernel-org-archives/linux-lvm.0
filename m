Message-ID: <000901c26220$d67320e0$ddc67140@nolove>
From: "Matt" <lightning@aci.net>
References: <002001c25fa7$482b2740$ccc67140@ownage> <20020919115935.A32578@sistina.com> <000d01c2615f$7f7d7130$ddc67140@nolove> <1032446901.3d89e3b5b98de@lola.Pin.LU> <001501c261b7$c1f6ed90$ddc67140@nolove> <20020920113750.A5931@sistina.com>
Subject: Re: [linux-lvm] Removing an old disk, and some vgexport/import love..
MIME-Version: 1.0
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
Date: Fri Sep 20 05:23:37 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz, I am using LVM 1.0.5 with Linux kernel 2.4.19..

-- Matt

----- Original Message -----
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: <linux-lvm@sistina.com>
Sent: Friday, September 20, 2002 2:37 AM
Subject: Re: [linux-lvm] Removing an old disk, and some vgexport/import
love..


> On Sat, Sep 21, 2002 at 02:42:18PM -0700, Matt wrote:
> > Chris... I think I love you, that was indeed the problem and your
solution
> > solved it.  I'd like to thank you both for helping me out, have a good
one..
>
> Which LVM version was it again.
> Need to check if that bug still exists...
>
> Regards,
> Heinz    -- The LVM Guy --
>
> >
> > --Matt
> >
> > ----- Original Message -----
> > From: "Christian Limpach"
> > To: <linux-lvm@sistina.com>
> > Sent: Thursday, September 19, 2002 7:48 AM
> > Subject: Re: [linux-lvm] Removing an old disk, and some vgexport/import
> > love..
> >
> >
> > > Quoting Matt <lightning@aci.net>:
> > >
> > > > > > PV Name (#)           /dev/hde1 (1)
> > > > > > PV Name (#)           /dev/hdg1 (3)
> > > > > > PV Name (#)           /dev/hdf1 (4)
> > >
> > > what happened here is that vgreduce doesn't renumber the PVs and if
you
> > > export the VG and try to reimport it, vgimport complains because it
> > expects
> > > the PVs to be numbered contiguously.  I had this same problem a couple
of
> > > weeks ago.  I solved it by patching the VGDA on the new disk,
renumbering
> > the
> > > PV to get the number of the PV I had removed and then everything was
ok
> > again.
> > >
> > > It seems like you'll need to renumber /dev/hdf1 to be PV#2 from being
> > PV#4.
> > > Check with pvdata that the PVs are indeed numbered as above, make a
copy
> > of
> > > the first few sectors of /dev/hdf1 and then try the following:
> > > printf "\0002" | dd of=/dev/hdf1 bs=1 count=1 seek=432 conv=notrunc
> > >
> > > --
> > > Christian Limpach <chris@Pin.LU>
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> > >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
