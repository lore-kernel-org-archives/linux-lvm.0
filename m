Return-Path: <allanwind@mediaone.net>
Date: Thu, 19 Jul 2001 10:52:15 -0400
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010719105215.A18915@digit-safe.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20010719160607.B29325@sistina.com>
From: Allan M. Wind <allanwind@mediaone.net>
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

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2001-07-19 16:06:07, Heinz J. Mauelshagen wrote:

> as Patrick pointed out, I got the base wrong.
>=20
> Are you sure that the drive is dying?=20
>=20
> You might have one of those nasty SCSI cable length/termination/power pro=
blems
> causing this. Happens quite often after a configuration change on a SCSI =
bus.

The drive started complaining before any changes were made, I suppose the c=
able
could have gone bad (length, termination, power etc should be ok), but...

When does lvm create /dev/sdb1 (I only used /dev/sdb)?

The thing that I find fishy about the hardware problem idea is that (1) vgc=
k did
not see anything wrong before the reboot and (2) I went through the exercis=
e twice=20
(outlined earlier) and got the _same_ I/O error upon reboot.

Supporting evidence for (non-drive) hardware issues is of course that now m=
y new
sdb drive appears effected in addition to sdc which reported media failures=
 earlier.

I really appreciate the help, btw,


/Allan
--=20
Allan M. Wind			email: allanwind@mediaone.net
P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
Woburn, MA 01888-0022
USA

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7VvQeerJrYp1ydncRAo/DAJ4wDxD5dIqj5EXp8nnYe4ra08c8PACfazh6
bSXkLTVYAECfPLpp4hgbzXc=
=Lwvo
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
