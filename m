Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Mon, 8 Jan 2001 09:49:02 -0600
Subject: Re: [linux-lvm] Once again ... Kernel 2.4.0 - What can I do ?
Message-ID: <20010108094902.A30177@sistina.com>
References: <1504018708.20010108141026@lzer.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <1504018708.20010108141026@lzer.net>; from jan.w@lzer.net on Mon, Jan 08, 2001 at 02:10:26PM +0100
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

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2001 at 02:10:26PM +0100, Jan Walzer wrote:
>   I'm currently using Kernel 2.4.0-test10 with LVM 0.8final ...
>   I have a 55Gig LVM-Partition (with reiserfs) and no backup ....
>   (Yes I know, but there's no money for a poor student to backup ...)
>=20
>   Now I want to use the final 2.4.0 and it is now a fact, that there
>   is v0.9 in it. (why it is, is another question...)
>
>   I ask now, what I can do ...
>   It seems that they both are not compatible, as the vgscan under
>   2.4.0fin brings me a protocol error ...

Look through the linux-lvm mailing list archives for the message with the
subject line "[linux-lvm] Clarification concerning the status of LVM and 2.=
4".
This attempts to explain what is currently going on with LVM and the 2.4.x
linux kernel

>   Is there a way to "downpatch" the kernel to lvm0.8 ???
>   or better:
>   can I convert the volume to 0.9 without data-loss ???

If you are truly worried about your data, stay with 0.8final and do not
upgrade your kernel for the moment.  The LVM team is evaluating the release=
 of
a 0.8final backpatch for 2.4.0, but we obviously want to test this before we
release it to folks like yourselves that have data they don't want to lose.=
=20

> Thanx in advance ... Jan
>=20
>   PS: Please don't tell me all the reasons, why I need a backup.
>       I know it myself, but there is at the moment no way ....

We cannot in any way, shape, or form guarantee the integrity of your data. =
 If
you choose run without backup, that is up to you.

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
Hey! It compiles! Ship it!
-----End Obligatory Humorous Quote------------------------------------------

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6WeFupE6/iGtdjLERAsNaAJ4pAWXEsrmdO+iKAbV5KyebaCHaCQCfZUEY
VBjM9CuDMo5Owx2TIQ1ODqI=
=ec+9
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
