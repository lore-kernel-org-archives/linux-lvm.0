Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Mon, 29 Jan 2001 09:51:54 -0600
Subject: Re: [linux-lvm] Follow-up 2: Help: lvm 0.9.1_beta3 oops (can't get my data)
Message-ID: <20010129095154.E20423@sistina.com>
References: <3A746B67.4FA4CD18@nortelnetworks.com> <20010128200649.C17449@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3O1VwFp74L81IIeR"
Content-Disposition: inline
In-Reply-To: <20010128200649.C17449@sistina.com>; from lewis@sistina.com on Sun, Jan 28, 2001 at 08:06:49PM -0600
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

--3O1VwFp74L81IIeR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2001 at 08:06:49PM -0600, lewis@sistina.com wrote:
> On Sun, Jan 28, 2001 at 12:56:39PM -0600, Joe Harvell wrote:
> > When I do a 'vgdisplay -vD w0', I don't run into any problems.  Does th=
is rule out the possibility of a vgcfgrestore helping?
> >=20
> > I looked at the man pages for vcfgrestore, but I don't know which desti=
nation I should specify.  Is it /dev/w0, or is it 'dev/hda8' and '/dev/hdb3=
'?
>=20
> I believe you want to do a 'vgcfgrestore -nw0 /dev/hda8; vgcfgrestore -nw0
> /dev/hdb3'.  Let me know if that fixes things.  And remember, do *not* do=
 a
> vgscan right after your vgcfgrestore because it will revert to the previo=
us
> state.  Simply run the vgcfgrestore command, and then try the 'vgchange -=
ay'
> to activate the volume group.

I was told that this is incorrect information by Heinz and that you _should_
run vgscan after running vgcfgrestore because it brings the /etc/lvmtab and
/etc/lvmtab.d/ in sync with the newly restored VGDA.  Sorry about that.  I
was mixed up.

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
THE LESSER-KNOWN PROGRAMMING LANGUAGES #16:
C- This language was named for the grade received by its creator when he
submitted it as a class project in a graduate programming class.  C- is
best described as a "low-level" programming language.  In fact, the
language generally requires more C- statements than machine-code statements
to execute a given task.  In this respect, it is very similar to COBOL.
-----End Obligatory Humorous Quote------------------------------------------

--3O1VwFp74L81IIeR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6dZGapE6/iGtdjLERAoJLAJsHJpnQ5/VOep61WJevxj6Gvoxw2wCfVCiq
fFW7Fa/uc2azkZU9uugAo6I=
=d8op
-----END PGP SIGNATURE-----

--3O1VwFp74L81IIeR--
