Date: Sun, 1 Jun 2008 09:07:26 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
Message-ID: <20080601070726.GK19431@lug-owl.de>
References: <20080529231213.GY19431@lug-owl.de>
	<A78DB34D00374344A0AB65B6523C05DC0304E8E1@marsden.win.datacash.com>
	<20080531070328.GD19431@lug-owl.de> <484221A5.8040605@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xdAuejbAAr3yyIdQ"
Content-Disposition: inline
In-Reply-To: <484221A5.8040605@gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux clustering <linux-cluster@redhat.com>


--xdAuejbAAr3yyIdQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2008-05-31 23:12:21 -0500, Wendy Cheng <s.wendy.cheng@gmail.com> wr=
ote:
> Jan-Benedict Glaw wrote:
> > On Fri, 2008-05-30 09:03:35 +0100, Gerrard Geldenhuis <Gerrard.Geldenhu=
is@datacash.com> wrote:
> > > On Behalf Of Jan-Benedict Glaw
> > > > I'm just thinking about using my friend's overly empty harddisks fo=
r a
> > > > common large filesystem by merging them all together into a single,
> > > > large storage pool accessible by everybody.
> >
> > [...]
> > =20
> > > > It would be nice to see if anybody of you did the same before (merg=
ing
> > > > the free space from a lot computers into one commonly used large
> > > > filesystem), if it was successful and what techniques
> > > > (LVM/NBD/DM/MD/iSCSI/Tahoe/Freenet/Other P2P/...) you used to get t=
here,
> > > > and how well that worked out in the end.
> > >
> > > Maybe have a look at GFS.
> >
> > GFS (or GFS2 fwiw) imposes a single, shared storage as its backend. At
> > least I get that from reading the documentation. This would result in
> > merging all the single disks via NBD/LVM to one machine first and
> > export that merged volume back via NBD/iSCSI to the nodes. In case the
> > actual data is local to a client, it would still be first send to the
> > central machine (running LVM) and loaded back from there. Not as
> > distributed as I hoped, or are there other configuration possibilities
> > to not go that route?
>=20
>                         However, with its symmetric architecture,=20
> nothing can prevent it running on top of a group of iscsi disks (with=20
> GFS node as initiator), as long as each node can see and access these=20
> disks. It doesn't care where the iscsi targets live, nor how many there=
=20
> are.

So I'd configure each machine's empty disk/partition as an iSCSI
target and let them show up an every "client" machine and run that
setup. How good will GFS deal with temporary (or total) outage of
single targets? Eg. 24h disconnects with ADSL connectivity etc.?

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:                http://catb.org/~esr/faqs/smart-questions.html
the second  :

--xdAuejbAAr3yyIdQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIQkqtHb1edYOZ4bsRAiffAJ9+sHRUKIvL0ltAwb64DBOiOhrwQwCeNaAy
ZHpIb7hYXhOqEcEeeapsDVs=
=FAGE
-----END PGP SIGNATURE-----

--xdAuejbAAr3yyIdQ--
