Date: Tue, 26 Sep 2000 06:47:44 +0000
From: Charles Duffy <cduffy@mvista.com>
Subject: Re: [linux-lvm] hi
Message-ID: <20000926064744.B13759@mvista.com>
References: <39D06FB7.14535FE3@hananet.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <39D06FB7.14535FE3@hananet.net>; from nalabi@hananet.net on Tue, Sep 26, 2000 at 06:43:19PM +0900
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This may be because your kernel isn't compiled with ramdisk support.

Try loading the appropriate module (and then, before booting w/ the
initrd, compiling/switching to a kernel with initial ramdisk support).

You may also try doing each of the steps of the script by hand, to see
what fails.

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.3 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE50EaQr/O29KUQmJURAro2AJ0S+sWzmDtFweBRjk2bA7yAwGGs0wCdGnPd
bE7dPgGqR1muJQdsH+h09B8=
=VtEO
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
