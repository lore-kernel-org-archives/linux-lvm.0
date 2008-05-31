Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4V73e6x012725
	for <linux-lvm@redhat.com>; Sat, 31 May 2008 03:03:40 -0400
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4V73UZN001044
	for <linux-lvm@redhat.com>; Sat, 31 May 2008 03:03:30 -0400
Date: Sat, 31 May 2008 09:03:29 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
Message-ID: <20080531070328.GD19431@lug-owl.de>
References: <20080529231213.GY19431@lug-owl.de>
	<A78DB34D00374344A0AB65B6523C05DC0304E8E1@marsden.win.datacash.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l21Zc9uzwusa2dXo"
Content-Disposition: inline
In-Reply-To: <A78DB34D00374344A0AB65B6523C05DC0304E8E1@marsden.win.datacash.com>
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


--l21Zc9uzwusa2dXo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-05-30 09:03:35 +0100, Gerrard Geldenhuis <Gerrard.Geldenhuis@d=
atacash.com> wrote:
> On Behalf Of Jan-Benedict Glaw
> > I'm just thinking about using my friend's overly empty harddisks for a
> > common large filesystem by merging them all together into a single,
> > large storage pool accessible by everybody.
[...]
> > It would be nice to see if anybody of you did the same before (merging
> > the free space from a lot computers into one commonly used large
> > filesystem), if it was successful and what techniques
> > (LVM/NBD/DM/MD/iSCSI/Tahoe/Freenet/Other P2P/...) you used to get there,
> > and how well that worked out in the end.
>
> Maybe have a look at GFS.

GFS (or GFS2 fwiw) imposes a single, shared storage as its backend. At
least I get that from reading the documentation. This would result in
merging all the single disks via NBD/LVM to one machine first and
export that merged volume back via NBD/iSCSI to the nodes. In case the
actual data is local to a client, it would still be first send to the
central machine (running LVM) and loaded back from there. Not as
distributed as I hoped, or are there other configuration possibilities
to not go that route?

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:         Alles wird gut! ...und heute wirds schon ein bi=C3=9F=
chen besser.
the second  :

--l21Zc9uzwusa2dXo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIQPhAHb1edYOZ4bsRAsmNAJ0TcNrAsLAfjqTWj7a7Rcm+Z36UYgCfeHpl
MA6PoO++YVaqflL+eOf0N3k=
=j/YS
-----END PGP SIGNATURE-----

--l21Zc9uzwusa2dXo--
