From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] what happes to VG when disks are added/removed?
Message-Id: <20020312143058.A18690@sistina.com>
References: <200203120704.g2C740v00414@mailgate5.cinetic.de>
MIME-Version: 1.0
In-Reply-To: <200203120704.g2C740v00414@mailgate5.cinetic.de>;
    from gunther.kuhlmann@web.de on Tue, Mar 12, 2002 at 08:04:01AM +0100
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
Date: Tue Mar 12 07:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Mar 12, 2002 at 08:04:01AM +0100, gunther.kuhlmann@web.de wrote:
> On Mon, Mar 11, 2002, Heinz J . Mauelshagen wrote:
> =20
> > > I had two hard disks, the first with three VG's, the second
> > > with one VG (vg2). When the second hard disk started to fail, I
> > > installed a third with VG vg4 and copied the data over. Then,
> > > without deleting vg2, I unplugged hd 2. After reboot, the=20
> volume
> > > on vg2 mounted cleanly, although the disk was not available. It
> > > correctly accessed the LV on vg4 on the new disk. Is that=20
> correct?
> > > Can I now use either of the two vg2/vg4 to access the LV on the
> > > new disk? How do I get rid of one (and which) without risking=20
> my
> > > data? Can I just vgremove vg2 away?
> >
> > Gunther,
> >
> > the result depends on *how* you copied vg2 over to your new hard=20
> drive.
> >
> > If you used for eg. dd to do an image copy of the partitions,=20
> which contained
> > vg2 on the flaky drive or a whole disk copy keeping sizes,=20
> you've got
> +duplicated
> > content and can unplug the flaky device.
> > If you ran vgscan, you saw your 'old' vg2 in the new drive,=20
> which is
> > perfectly fine.
> =20
> No, I used pvcreate, vgcreate, lvcreate to create vg4 and a LV on=20
> it. And than
> rsync to copy the data. That is why I am a bit confused by this=20
> behaviour.
> Should I reconnect hd2, then delete vg2 and disconnect hd2 again?

No need to.
You still have /dev/vg2/ device nodes and the new vg4 got the same
internal number so that you can access it through /dev/vg2/*.

Either rename inactive vg4 to vg2 if you want to keep it by
"rm -r /dev/vg2;vgrename vg4 vg2"

or change your fstab to use the /dev/vg4 nodes and remove /dev/vg2/.

/dev/vg2/* is left over, because you didn't remove vg2.

Regards,
Heinz    -- The LVM Guy --

> =20
> > BTW: your configuration is a little bit extraordinary in terms=20
> of how to use
> > drives as PVs. Typically you shouldn't have multiple VG's on a=20
> single drive
> > as you seem to have it.
> > Much rather you should have multiple drives in one VG.
>=20
> Yes, I have one HD with two VG's. It might be unusual, but I can't=20
> see anything
> wrong with it. I do not intend to span a VG over more than one=20
> physical disk,
> because I don't want to have _part_ of a VG to fail. That's when=20
> it gets messy.
> I'm not saying it's impossible to recover, I just don't want to=20
> try.
> Besides, my HD size is large compared to my LV sizes, that's why I=20
> needn't
> bother.
> =20
> Gunther
> =20
> --=20
> Dipl.-Ing. Gunther Kuhlmann
> gunther_kuhlmann@mentorg.com
> gunther-kuhlmann@easy-call.net
> Tel.: +49 (0)40 / 75 11 84 40
> PGP: E6 BC 78 6B E6 09 C7 16  AB 5D 9A 9A D7 1C 01 FB
> --=20
>=20
>=20
> _______________________________________________________________________=
_______
> Ohne Risiko spielend zum B=F6rsenguru werden. Haben Sie schon eine
> Strategie? Spekulieren und tolle Preis gewinnen http://boersenspiel.web=
.de
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
