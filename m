Date: Sat, 11 Nov 2000 11:59:43 -0600
From: Chewie <chewie@wookimus.net>
Subject: Re: [linux-lvm] 2.2.17 Kernel patch + 0.8 user tools
Message-ID: <20001111115943.A7541@wookimus.net>
References: <C1256993.003852DD.00@icosdmz.icos.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <C1256993.003852DD.00@icosdmz.icos.be>; from dirk.derycke@icos.be on Fri, Nov 10, 2000 at 11:18:22AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2000 at 11:18:22AM +0100, dirk.derycke@icos.be wrote:
> where can I find a 2.2.17 kernel patch (more specific a stock
> kernel) for LVM to use with the 0.8 user tools (I use the latest
> version from Andread Dilger) ???

Did you read the README file at his FTP site?  If you had, you would
know that you have at least two patches you need to apply.  You're
lucky that I'm writing up the LVM Cheat Sheet as we speak. ;-)  I had
to research this stuff.  OK, it's not that difficult to find this
info, but it's not available on the LVM site for all to read.  This is
what you must do:

    Download the following files and patch the stock 2.2.17 kernel in
    the order that you see them.

    1.  Ingo Molnar's RAID Patch
        http://people.redhat.com/mingo/raid-patches/raid-2.2.17-A0

    2.  Stephen Tweedie's RAWIO Patch
        ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io/raw-2.2.17.diff

    3.  Andreas Dilger's LVM Patch
        ftp://ftp.stelias.com/pub/adilger/lvm-0.8final-2.2.16TL.patch

I don't believe there's anything distribution specific to Andrea's
LVM kernel patch.  Download and compile the LVM tools from Andrea's
SRPM or tarball.  Tom Lees also has a Debian package of the slightly
older 0.8final tools.  You may want to download the source tarball
from Andreas, then apply the Debian patch to build the *.deb.  Note:
Tom's diff has all of the changes to use ext2resize (GPL) with the
e2fsadm tool instead of the resize2fs (commercial) tool.  Otherwise,
you have to edit these by hand.

> Andreas Dilger has a patch for Turbo Linux 2.2.16 but it doesn't apply
> nicely to a 2.2.17 stock kernel (lots of rejects)

Actually, I didn't get any rejects.  Since the patches are context
based, they do apply cleanly, if you do them in this order.  You will
see some messages about offsets, but that's it.

I'm compiling my test kernel as we speak, and I've got a full 9.1 GB
HD to play with. ;-)  In three hours, I'll have to make like I know
what I'm talking about, so I figured that I should successfully play
with the tools I'm supposed to be talking about (yeah, right).

--=20
Chad "^chewie, gunnarr" Walstrom <chewie@wookimus.net>
             http://www.wookimus.net/

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6DYkPDMcLGCBsWv0RArcMAJ0XCJaIW+PCgugBFJmsf8JJJ8/rqQCgjq/a
x6lHX0nak2//kh2EDDGISr4=
=Tf2D
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
