From: Wiktor Wodecki <wodecki@gmx.de>
Message-ID: <20030629103226.GA661@gmx.de>
References: <20030627202130.066c183b.akpm@digeo.com> <20030628115033.GA660@gmx.de> <20030628222938.78c16450.akpm@digeo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20030628222938.78c16450.akpm@digeo.com>
Subject: [linux-lvm] Re: 2.5.73-mm2
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
Date: Mon Jun 30 09:51:15 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: Andrew Morton <akpm@digeo.com>

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2003 at 10:29:38PM -0700, Andrew Morton wrote:
> >  I have problems with lvm2 and the 2.5.73-mm2 patchset.
> Could be because -mm uses a 64-bit dev_t.
> Could you please revert=20
> ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.5/2.5.73/2.5.=
73-mm2/broken-out/64-bit-dev_t-kdev_t.patch
> and retest?

yes, reverting this patch fixes the problem. Is it sane to run the -mm2
without this patch?

> I think there's a version of devicemapper userspace which works correctly
> with 64-bit dev_t.  Perhaps the Sistina team can shed some light.
=20
would be nice if somebody else could comment on this..

--=20
Regards,

Wiktor Wodecki

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+/sA56SNaNRgsl4MRAv7BAJ9OmhQ2M/yjhbGPEY5h7zG7CZYJDgCfR6a3
+0AzU/YtvWcnKUyyV7ejHcg=
=jYLU
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
