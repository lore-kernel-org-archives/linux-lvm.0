Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
From: "Gregory K. Ade" <gkade@bigbrother.net>
In-Reply-To: <20021029101033.A22193@sistina.com>
References: <1033579350.6468.61.camel@gopher>
	<20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory>
	<20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher>
	<20021028101739.F16452@sistina.com> <1035866273.9074.74.camel@gopher> 
	<20021029101033.A22193@sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-1PbsbUUo89SKed8bAZvu"
Message-Id: <1035921224.1276.24.camel@gopher>
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
Date: Tue Oct 29 13:54:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-1PbsbUUo89SKed8bAZvu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2002-10-29 at 01:10, Heinz J . Mauelshagen wrote:
>=20
> Gregory,
>=20
> as Jon already thought, this seems to be a flaw in the VM subsystem.
>=20
> The ksymoops you provided shows that, because it fails in vmalloc when
> lvm_snapshot_alloc_hash_table() tries to allocated virtual memory for the
> copy-on-write exeception table it needs to track the changes which happen
> to the original logical volume.
>=20
> Is there any chance to prove that by running the system with less than 2G=
B
> of memory and _without_ high memory support for a test run?
>=20
> Regards,
> Heinz    -- The LVM Guy --

Actually, yes, I can run this on several other smaller-memory systems.=20
I've got a machine I've been working on setting up that's 2GB exactly,
and several others running 2.4.19 & LVM 1.0.5 with less than 1GB of
ram.  However, I've not had any of these systems produce errors like
these.  I can run the 2GB system with and without high memory support
and try to induce a similar failure.

Are there any specific tests you'd like me to run on this other system,
in case I can't induce an Oops on it?

Thanks,

Gregory

--=20
Gregory K. Ade <gkade@bigbrother.net>
http://bigbrother.net/~gkade
OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

--=-1PbsbUUo89SKed8bAZvu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA9vudIeQUEYOr0hEsRAs9VAKDLeC5f74pl7W3GVDBDGtJAfTWIGgCggbV4
xPGiM6ezZxPowp2igTnSip0=
=h7Vn
-----END PGP SIGNATURE-----

--=-1PbsbUUo89SKed8bAZvu--
