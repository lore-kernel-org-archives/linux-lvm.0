Date: Fri, 7 Sep 2001 12:46:49 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010907124649.B31313@sistina.com>
References: <E15f13v-0003bs-00@hermes.sistina.com> <20010906220514.A1537@vestdata.no> <E15f8l7-0008Di-00@hermes.sistina.com>
Mime-Version: 1.0
In-Reply-To: <E15f8l7-0008Di-00@hermes.sistina.com>; from fejf@gmx.de on Fri, Sep 07, 2001 at 01:41:22AM +0200
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Sep 07, 2001 at 01:41:22AM +0200, FEJF wrote:
> Ragnar Kj=F8rstad, on Donnerstag, 6. September 2001 22:05 wrote:
> > On Thu, Sep 06, 2001 at 05:28:04PM +0200, FEJF wrote:
> > > hi,
> > > i search through the mailing list and found this question few times=
...
> > > and i have also this problem atm and i didn't find a solution, i wa=
nt to
> > > ask if there is one now ? or perhaps will installing of lvm1.0.1-rc=
2 help
> > > (currently using 0.9.1_beta7) ?
> > >
> > > root@bolm:[/x] # pvmove /dev/hdh1
> > > pvmove -- moving physical extents in active volume group "vg01"
> > > pvmove -- WARNING: if you lose power during the move you may need t=
o
> > > restore your LVM metadata from backup!
> > > pvmove -- do you want to continue? [y/n] y
> > > pvmove -- ERROR reading input physical volume "/dev/hdh1" (still 65=
536
> > > bytes to read)
> > >
> > > pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
> > >
> > > pvmove -- ERROR "pv_move_pe(): read input PV" moving physical exten=
ts
> >
> > This could be because of a disk-error. Do you have io-errors in
> > /var/log/messages?
>=20
> there are no io-errors... but as the hd makes really scary noise when p=
vmove=20
> tries to move the remaining bytes. so i think the hd is damaged.
> but all i want is to remove the damaged hd.
> but pvreduce says i have to use pvmove to get rid of the remaining data=
 and=20
> pvmove gives the errors...
> so i can't remove it :/ - is there a way to get rid of the hd without=20
> destroying the rest of the data ? sth. like pvreduce --force ?
>=20
> > If so, you will have to modify pvmove to not give up after read-error=
s.
>=20
> how can i do this ? i'm not a coder but if someone has too much time...=
 ;)
>=20
> > Maybe a '--ignore-read-errors' option should be added?
>=20
> if there's no other way to get rid of the damaged hd... that would be a=
lso a=20
> way to solve my problem.
> btw: could there be a problem with using reiserfs on the lvm ?

Well, assuming your disk has a flaw, the only way to work around your pro=
blem
is patching pv_move_pe() in order to ignore read errors (this takes place
around line 520 in LVM 1.0) which will cause a copy of the data to some o=
ther
device with probably flaky data in it.

In case you've got some filesystem data in there, fsck will complain acco=
rdingly
and some file or metadata of the filesystem will be gone which will cause
more or less filesystem data loss.

> =20
> mfg, Florian E.J. Fruth
>=20
> ps: at the moment i try a "dd if=3D/dev/hdh1 of=3D/dev/null" to see if =
it also=20
> complains about errors...
>=20
> --=20
> Backups are usefull. Most often when you don't have one ;)
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
