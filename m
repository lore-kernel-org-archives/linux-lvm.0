Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Sun, 28 Jan 2001 23:42:06 -0600
Subject: Re: [linux-lvm] [CVS LVM Mon Jan 29 16:18:57 EST 2001] Device /dev/hdc1 doesn't exist
Message-ID: <20010128234206.D17449@sistina.com>
References: <Pine.LNX.4.21.0101291625150.29156-100000@mordor.parrish.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0101291625150.29156-100000@mordor.parrish.org.au>; from dparrish@excido.com on Mon, Jan 29, 2001 at 04:25:43PM +1100
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

--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2001 at 04:25:43PM +1100, David Parrish wrote:
> I'm trying to get LVM going for the first, time.. I'm getting a few
> errors, I've looked through the FAQs and can't find anything about these.
>=20
> If this is a really stupid commonly found problem and it's just a stupid
> luser doing it, please point me in the appropriate manual, otherwise,
> any help would be appreciated.
>=20
> LVM CVS checked out today Mon Jan 29 16:18:57 EST 2001

Looks to me like you didn't check out the CVS with the LVM_0-9-patches tag.
Use 'cvs co -r LVM_0-9-patches LVM' and see if it does the same thing.  This
is documented on the CVS checkout instructions page at
http://www.sistina.com/Pages/cvs.html
If you didn't specify the tag you got a combination of Cluster LVM and the
old 0.9 stuff...which is pretty broken at this time.

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
Sometimes I have a difficult time handling myself in social situations.
I just start scampering around neurotically, frantically jumping all
over guests. I think it all goes back to when I was raised in the wild
by miniature schnauzers.
-----End Obligatory Humorous Quote------------------------------------------

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6dQKupE6/iGtdjLERAvl7AJ9HjKKEdKAMEhNlQjNWmoTDw55hwwCfUiIS
i5R6FAjDbXxqW3kCe94JMpw=
=G6TA
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
