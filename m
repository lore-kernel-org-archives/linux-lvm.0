From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] lvm and md
Message-ID: <20030307141007.GA21686@hcsd.de>
References: <3E6803F3.5060507@exavio.com.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <3E6803F3.5060507@exavio.com.cn>
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
Date: Sun Mar  9 16:59:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2003 at 10:29:07AM +0800, Peter Yao wrote:

> Should we build lvm volumns on top of soft raid(md) or build md on top=20
> of lvm volumns?

I propose to use LVM on top of md because that way you have to deal with
one disk mirror only instead of several mirrors per LV.

Stephan

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+aKg/+QMu5be4tHkRAqxcAKDkBiEblN5+KM9EuZyLB/TKFoLeSQCdGhC9
lxB9Ki1qf6lIITiX5T7n8YA=
=C91S
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
