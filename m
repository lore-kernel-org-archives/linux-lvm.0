Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20020510072608.GA1001@tykepenguin.com>
References: <20020510072608.GA1001@tykepenguin.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-PcmUBRq9vOmwsP5DHya9"
Message-Id: <1021071171.17474.44.camel@UberGeek>
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
Date: Fri May 10 17:51:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-PcmUBRq9vOmwsP5DHya9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From what I understand you *can* mount the LVM volumes on multiple hosts
at the same time, but you should be *readonly* on the hosts which do not
*own* the data on the disks. You could then *remount* the volume on the
target failover host.=20
The only draw back is you will need to have monitoring, in the end
anyway, that will allow you to see:

1. What hosts have what volumes mounted
2. and in what mode(ro/rw?)

Also, you would need to use a filesystem that supports:

1. multiple hosts mounting it
2. filesystem 'remount' option

Talk to the guys on the Linux FailSafe list, they might be able to help
point you as well.

On Fri, 2002-05-10 at 02:26, Patrick Caulfield wrote:
> On Thu, May 09, 2002 at 09:54:40AM -0700, Au, Richard wrote:
> > Hi,
> >=20
> > I'm wondering if anyone has used LVM in a high-availibility
> cluster
> > where two servers are connected to shared storage (the physical
> > volumes).  If so, which cluster solution did you use?  Will there
> be
> > problems if the logical volumes are visable to both servers, even
> if
> > only one of them has them mounted?  Thanks!
>=20
> Provided you're either using GFS as the file system or being VERY
> careful to
> mount the filesystem on only one node at a time you can do this.
>=20
> The key is just to be VERY careful. If you need to do any LVM
> commands you MUST
>=20
> umount filesystems on all other nodes
> vgchange -an on all other nodes
>=20
> do the LVM metadata changes
>=20
> vgscan on all nodes
> vgchange -ay on all nodes.
>=20
> The safe thing to do is to have only one node have the LVM commands
> available to
> it (apart from vgscan & vgchange) and be VERY careful.
>=20
> I'll say that again: Be VERY careful !
>=20
> patrick
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"One ought never to turn one's back on a threatened danger and=20
try to run away from it. If you do that, you will double the danger.=20
But if you meet it promptly and without flinching, you will=20
reduce the danger by half."
Sir Winston Churchill

--=-PcmUBRq9vOmwsP5DHya9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA83E9D94g6ZVmFMoIRAkpsAJwLep4KqzwQ1ZHsTK6GojgB7aPiBACgyTBK
UxtzwHvKrL+1pk+XYGC8j/o=
=uqt/
-----END PGP SIGNATURE-----

--=-PcmUBRq9vOmwsP5DHya9--
