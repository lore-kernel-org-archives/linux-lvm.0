From: David B Harris <david@eelf.ddts.net>
Message-Id: <20030105090400.1d4e61be.david@eelf.ddts.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1"; boundary="=.qo9e.Hbb9Vj?Bc"
Subject: [linux-lvm] Linux 2.4.20 devmapper + userland utilities issue
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
Date: Sun Jan  5 08:03:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=.qo9e.Hbb9Vj?Bc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

First, thanks for the work on devmapper, LVM, and whatnot. Can't say as
I use it yet, but I hope to ;)

Right, anyhoo. I'd like to sub-partition a Linux MD device. Obviously it
can contain a partition table, but there's no way for me to reference
its segments. Enter devmapper.

Attached is the entire log, from creation of the MD device to the error
I get with 'lvcreate'. In short, 'lvcreate -L400M -n src willow-1' works
fine if it isn't "on top of" my Linux MD array; I get the following
error:

  Aborting. Failed to wipe snapshot exception store. Remove new LV and
retry.

Hopefully the log isn't too much. :) I ran the problem by Patrick
Caulfield in #lvm on irc.openprojects.net, he and I went through some
basic debugging (nothing I hadn't done, but just double-checking).
Nothing obvious was apparent.

Thanks again, and please feel free to ask for more information, if you
need it.

--=.qo9e.Hbb9Vj?Bc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+GDtQuCQ/g7GxJcARAgzOAJ4pWeLkD5OHrD64mxBWsAgwlIg0ywCeJ+7C
XkqisreoMbFOrP3FTkFgGpY=
=myyp
-----END PGP SIGNATURE-----

--=.qo9e.Hbb9Vj?Bc--
