Date: Wed, 29 Aug 2001 17:31:24 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Snapshot sizes
Message-ID: <20010829173123.A10331@sistina.com>
References: <E15cDSJ-0002gX-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <E15cDSJ-0002gX-00@hermes.sistina.com>; from gasht@neopets.com on Wed, Aug 29, 2001 at 03:05:30PM -0700
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

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 29, 2001 at 03:05:30PM -0700, Gashaw Teshome wrote:
> I would like to use snapshotting to backup an LVM-based machine.  The fil=
es=20
> that I want to backup total about 20G, while LV is about 100G.  What size=
 do=20
> I need to make the snapshot volume to allow for this much data?
>=20
> Please let me know if I need to add any more information to make myself=
=20
> clearer.

You need enough room in the snapshot to store all the changes written to the
disk from the time you take the snapshot to the time you finish backing it
up.  What happens is that when there is a write pending to the original LV,
we first copy the original data to the snapshot LV, then write the new data
to the original LV.  The snapshot only stores the changed data.  It
redirects any queries of data that hasn't changed back to the data stored on
the original LV.  Make sense?

There is more detailed information at:
http://tech.sistina.com/lvm/doc/lvm_howto/Taking_a_backup_using_sna.html#se=
c:Snapshots_Backup

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://people.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
A computer without a Microsoft operating system is like a dog without bricks
tied to its head.
-----End Obligatory Humorous Quote------------------------------------------

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7jW07pE6/iGtdjLERAhslAJ9AolRALHN+mWB6imZQsieMDj4yzwCfe+Yh
U8itCv7bY0EpEgffCrzc4EI=
=5VBg
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
