Return-Path: <lewis@sistina.com>
Date: Fri, 8 Jun 2001 10:08:41 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] pvmove failure ...
Message-ID: <20010608100841.A26946@sistina.com>
References: <20010609004002.B3656@knoll.ln>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20010609004002.B3656@knoll.ln>; from timshel@pobox.com on Sat, Jun 09, 2001 at 12:40:02AM +1000
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
To: linux-lvm@sistina.com

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 09, 2001 at 12:40:02AM +1000, Timshel Knoll wrote:
> I am having problems trying to pvmove stuff from one physical volume to
> another. I first experienced this using kernel 2.4.3 with lvm
> 0.9.1beta6 and the 0.9.1beta7 Debian package of the lvm tools. I then
> updated to 2.4.4 with the CVS version of lvm (as of 08/06/2001 +1000),
> and I am still experiencing the same problems. Basically, pvmove simply
> reports:
>=20
> pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe
>=20
> pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents
>=20
> and nothing is moved :-(
>=20
> Attached is the gzipped output of an example session. Note that I get
> this same problem if I attempt to move any of the other logical volumes
> around as well :-( Any ideas/comments/tips?

It appears from the attached file that you have also applied XFS patches
into the kernel.  Which version of the XFS patches did you apply?  Has
anyone else tried 'pvmove' with that combination of patches successfully?
It's possible we're seeing some kind of conflict between the two.

Also, in which order did you patch the kernel, and did you apply any other
patches?

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Chaos, panic, pandemonium - my work here is done
-----End Obligatory Humorous Quote------------------------------------------

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7IOp5pE6/iGtdjLERAk/iAJ92z3oVSgQqrp4xrdNDfoTi8sQSWQCgg9sV
S2NceraSSmvDju03uuioJQM=
=O70Y
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
