Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
From: "Gregory K. Ade" <gkade@bigbrother.net>
In-Reply-To: <20021028203549.GA24302@gw.silicide.dk>
References: <1033579350.6468.61.camel@gopher>
	<20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory>
	<20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher> 
	<20021028203549.GA24302@gw.silicide.dk>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-mySNPCcXs/nUFWIzsgCD"
Message-Id: <1035844780.9075.64.camel@gopher>
Mime-Version: 1.0
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
Date: Mon Oct 28 16:40:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-mySNPCcXs/nUFWIzsgCD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-10-28 at 12:35, jon+lvm@silicide.dk wrote:
> On Sun, Oct 27, 2002 at 09:29:35PM -0800, Gregory K. Ade wrote:
>=20
> [cut]
>=20
> > So, who do I give what information to so that we can trace down the bas=
e
> > of this problem, and get a fix?  Ask me for whatever you need from the
> > system, and I'll provide it if I can.
>=20
> I dont know what your problem is, but i run lvm 1.0.5 on a default 2.4.19
> without trouble. (any more).
> I lvcreate once an hour, though it is a snapshot, and remove it again
> the next hour. I've got a script running every minute that extends the
> snapshots if they become too small. So, maybe the problem isnt in lvm, bu=
t
> memory, and it just happens to hit LVM ?

Interesting that you should mention this.  This system has proved to
have several interesting quirks, and most of them that have been
resolved have been resolved by making patches or other fixes in
relationship to the large memory configuration (8GB).  System
performance issues related to the filesystems were actually resolved by
applying a VM/VFS patch (I'm not really sure what it patched, honestly)
that was specifically addressing problems in >2GB RAM systems.

Is it possible that similar issues may be present in LVM?  How many
people here are running LVM on systems with ~100GB available storage or
more and 4GB or more of RAM?

This is the only system exhibiting these problems.  Then again, this is
the only system that requires highmem (64GB) support in order to address
all the memory, too.

I'll be able to generate a ksymoops sometime tonight, which will
hopefully point the LVM developers in the right direction for a fix.

--=20
Gregory K. Ade <gkade@bigbrother.net>
http://bigbrother.net/~gkade
OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

--=-mySNPCcXs/nUFWIzsgCD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA9vbyreQUEYOr0hEsRAkD9AKC6lsm3Seu9HrX7L3IlhoM1rHKHqACfVYUP
khuZt+d80wQULpiWBldNi7Y=
=yq2p
-----END PGP SIGNATURE-----

--=-mySNPCcXs/nUFWIzsgCD--
