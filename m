Subject: Re: [linux-lvm] lvm + slow deleting problem
Message-ID: <20031109221435.GC4425@amphibian.dyndns.org>
References: <64B9CD73757E544DA94024F7984B35843588D8@KOLEX1004.internett.mil.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline
In-Reply-To: <64B9CD73757E544DA94024F7984B35843588D8@KOLEX1004.internett.mil.no>
From: Toad <toad@amphibian.dyndns.org>
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
Date: Mon Nov 10 11:13:06 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2003 at 10:15:35AM +0100, Aleksander Olsen wrote:
> Hello,
> (Sorry if its html formated)
>=20
> Im new to the lvm and know only the basics and after browsing thrugh the =
archives here... i need som help.
>=20
> I got 4 WD120gb 8MB disks put together on a slackware 8.1 box and running=
 lvm that came with 2.4.20.
>=20
> Dont have access to the benchmark info now, but lets just say that I get =
good write performance and good read performance from the volume. The one p=
roblem i know of now is when i delete files from the volume.
>=20
> 700 mb  (isofile) get deleted in 2 minutes. All disks are hdparm'd and th=
is was not a problem on any of them before the lvm merge.

Do you get better performance on any particular filesystem? You might
want to try a few...
>=20
>=20
> Anyone know what im getting at ? Seen the problem before?
>=20
> Thanks for all help :)
>=20
> Aleksander Olsen
>=20

--=20
Matthew J Toseland - toad@amphibian.dyndns.org
Freenet Project Official Codemonkey - http://freenetproject.org/
ICTHUS - Nothing is impossible. Our Boss says so.

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/rrxLr5e+zmpNTm8RAmW+AJ99hfLtn1H84vPFPzq/E4phREty1wCeJWEp
ZBqEtBct3lTrXy0UtM0bKLk=
=aJFT
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
