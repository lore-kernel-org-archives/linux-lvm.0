Return-Path: <lewis@sistina.com>
Date: Tue, 19 Jun 2001 14:24:01 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM problems
Message-ID: <20010619142401.A517@sistina.com>
References: <200106191212.f5JCC3j06725@mailgate4.cinetic.de> <200106191727.f5JHRB87013198@webber.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <200106191727.f5JHRB87013198@webber.adilger.int>; from adilger@turbolinux.com on Tue, Jun 19, 2001 at 11:27:11AM -0600
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

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2001 at 11:27:11AM -0600, Andreas Dilger wrote:
> I could have sworn this problem was fixed already, but maybe only in CVS?
> Time for a new patch release I guess.  As someone else already mentioned,
> simply change get_hardblocksize to get_hardsect_size() in lvm.c.

I dropped a patch on the FTP site:
ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/lvm_0.9.1_beta7-get_hardblocksize.=
patch

apply this to your LVM source tree and regenerate the kernel patch.

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
A)bort, R)etry, I)nfluence with large hammer.
-----End Obligatory Humorous Quote------------------------------------------

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7L6bRpE6/iGtdjLERAvQ4AJ9/mM++D9TBbmrXwVlBaY+ykBRuhwCfcr30
zj3c6OEo1VgOBVgz3YRNKnQ=
=1WEH
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
