Return-Path: <lewis@sistina.com>
Date: Tue, 6 Feb 2001 14:39:02 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
Message-ID: <20010206143902.C5041@sistina.com>
References: <20010206132240.E3376@sistina.com> <Pine.LNX.4.21.0102061806370.1535-100000@duckman.distro.conectiva>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0102061806370.1535-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Tue, Feb 06, 2001 at 06:09:15PM -0200
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

--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2001 at 06:09:15PM -0200, Rik van Riel wrote:
> On Tue, 6 Feb 2001, AJ Lewis wrote:
>=20
> > The problem with your bug report on Bugzilla is that it is
> > confusing.  You added to a bug that complained about vgscan
> > seg-faulting.  That bug is obviously fixed.=20
>=20
> It still segfaults ... ;)

Oh, sorry.  That was not obvious from your vgscan -d dump.  Frank didn't say
anything about a segfault either.

> > The problem now is that vgscan no longer finds proper data in
> > the volume group.  This should be posted as a separate bug
> > report, not tacked onto the end of the old one.
>=20
> It's still vg_read_with_pv_and_le() that's spitting out
> errors and causing vgscan to segfault. The error I am
> seeing here hasn't changed in the last month...

Hmm...This appears to be different from the bug posted with the subject
"0.9.1 vgscan doesn't detect upgraded vg's" today.  Can you confirm this?

Have you been able to get to your data since you first posted the bug
report?  What steps did you take to get to this point?  What I'm wondering
is this:  did your attempt to use the LVM tools with the broken kernel patch
in 2.4.0 mess up the on-disk format, or is this a continued problem that can
be reproduced with new VGs created with 0.9.1_beta3 or converted with the
latest tools from 0.8final or 0.8.1?

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
A morning without coffee is like something without something else.
-----End Obligatory Humorous Quote------------------------------------------

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6gGDmpE6/iGtdjLERArZLAJ9o1VKv7NsU/RYYf093t5Pj7yDP+ACfZp2U
e3ajc/wTgOmMgeshkVo0aVQ=
=A3mV
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
