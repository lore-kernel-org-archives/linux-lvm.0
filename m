Date: Sun, 1 Jun 2008 17:56:35 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
Message-ID: <20080601155635.GM19431@lug-owl.de>
References: <20080529231213.GY19431@lug-owl.de>
	<A78DB34D00374344A0AB65B6523C05DC0304E8E1@marsden.win.datacash.com>
	<20080531070328.GD19431@lug-owl.de> <484221A5.8040605@gmail.com>
	<20080601070726.GK19431@lug-owl.de> <4842A922.6040102@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ys8nbMVQRzTucb0g"
Content-Disposition: inline
In-Reply-To: <4842A922.6040102@gmail.com>
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


--ys8nbMVQRzTucb0g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2008-06-01 08:50:26 -0500, Wendy Cheng <s.wendy.cheng@gmail.com> wr=
ote:
> Jan-Benedict Glaw wrote:
> > On Sat, 2008-05-31 23:12:21 -0500, Wendy Cheng <s.wendy.cheng@gmail.com=
> wrote:
> > > Jan-Benedict Glaw wrote:
> > > > On Fri, 2008-05-30 09:03:35 +0100, Gerrard Geldenhuis <Gerrard.Geld=
enhuis@datacash.com> wrote:
> > > > > On Behalf Of Jan-Benedict Glaw
> > > > > > I'm just thinking about using my friend's overly empty harddisk=
s for a
> > > > > > common large filesystem by merging them all together into a sin=
gle,
> > > > > > large storage pool accessible by everybody.
> > > > [...]
> > > > > > It would be nice to see if anybody of you did the same before (=
merging
> > > > > > the free space from a lot computers into one commonly used large
> > > > > > filesystem), if it was successful and what techniques
> > > > > > (LVM/NBD/DM/MD/iSCSI/Tahoe/Freenet/Other P2P/...) you used to g=
et=20
> > > > > > there, and how well that worked out in the end.
> > > > >
> > > > > Maybe have a look at GFS.
> >
> > So I'd configure each machine's empty disk/partition as an iSCSI
> > target and let them show up an every "client" machine and run that
> > setup. How good will GFS deal with temporary (or total) outage of
> > single targets? Eg. 24h disconnects with ADSL connectivity etc.?
>=20
> High availability will not work well in this particular setup - it is=20
> more about data and storage sharing between GFS nodes.
>=20
> Note that GFS normally runs on top of CLVM (clustered lvm, in case you=20
> don't know about it). You might want to check current (Linux) CLVM raid=
=20
> level support to see whether it fits your needs.=20

As I expect nodes to come and leave the filesystem and that these
nodes all provide different amounts of disk capacity, reshaping the
RAID stuff several times a week (or even per day) won't be that much
fun at all...

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:                 Friends are relatives you make for yourself.
the second  :

--ys8nbMVQRzTucb0g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIQsazHb1edYOZ4bsRAj/EAJ9MD9YFaVBlLRB0uncghSEBw178agCeN5MB
DAF4Him2AWR3K1lOFi7yPtE=
=jlRG
-----END PGP SIGNATURE-----

--ys8nbMVQRzTucb0g--
