Return-Path: <lewis@sistina.com>
Date: Wed, 7 Feb 2001 15:35:15 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: [lvm-commit] cvs commit: LVM/tools/lib pv_read_all_pv_of_vg.c
Message-ID: <20010207153515.O22166@sistina.com>
References: <20010207134128.9EA0716B31@postfix.conectiva.com.br> <Pine.LNX.4.21.0102071814030.1193-100000@duckman.distro.conectiva>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E187YRO8KGM40JwS"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0102071814030.1193-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Wed, Feb 07, 2001 at 06:29:24PM -0200
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

--E187YRO8KGM40JwS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2001 at 06:29:24PM -0200, Rik van Riel wrote:
> On Wed, 7 Feb 2001, Heinz Mauelshagen wrote:
>=20
> >   Modified files:        (Branch: LVM_0-9-patches)
> >     tools/lib            pv_read_all_pv_of_vg.c=20
> >   Log:
> >   fixed multiple access path avoidance problem
> >   leading to removed but valid PV structure;
> >   this could probably be the reason for lost PVs we faced in the past
>=20
> I've gathered a bit more debugging output to see why even
> this fix failed to make vgscan run.
>=20
> It turns out the LVM utilities messed up some of the info
> in the PV headers so badly that there's no way to reasonably
> expect the LVM utilities to pick up their mess ...
>=20
> I have attached the output from pvdata -a on the PVs to:
> 	http://bugzilla.sistina.com/show_bug.cgi?id=3D193
>=20
> Would it be an idea to have some debugging tool around which
> allows us to fix (simple) things like this ourselves ?

It looks like the following *should* fix things for you (this from Patrick):

 o Grab the latest CVS code for LVM.
 o Create a very small LV (or extend an existing one) to force a meta-data
   update.
 o The UUIDs should be cleaned up

If this is not possible with your setup, or does not work for you, let me
know and we'll see what else we can do to fix the problem.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Proofread carefully to see if you any words out.
-----End Obligatory Humorous Quote------------------------------------------

--E187YRO8KGM40JwS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6gb+TpE6/iGtdjLERAl1cAJ9yprkp3MQv52idTjsksKRKOr0SHACghe9S
rMqODMsT1Nv9tCJGZ8kyzeA=
=5DYu
-----END PGP SIGNATURE-----

--E187YRO8KGM40JwS--
