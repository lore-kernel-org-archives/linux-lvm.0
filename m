From: Adam McDaniel <adamm@array.org>
Subject: Re: [linux-lvm] vg_read_with_pv_and_lv error
Message-ID: <20020822174612.GA8692@grimlock>
References: <XFMail.20020821200341.cfreeze@alumni.clemson.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <XFMail.20020821200341.cfreeze@alumni.clemson.edu>
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
Date: Thu Aug 22 12:46:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2002 at 08:03:41PM -0500, Chris Freeze wrote:
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- only found 33727 of 33556 LEs for LV /dev/diskvg/share (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get =
data
> of volume group "diskvg" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group

=2E..

> Is there any hope of restoring the data?

This is the exact same problem I had last week. So far I've been
trying to hack in a solution by modifying the PV-UUID (which was
lost).. with minimal success.

Let me know if you find a way to fix this, vice-versa :)

--=20
Adam McDaniel
Array Networks
Calgary, AB, Canada

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9ZSNkIHy9fg7fMMMRApeSAJ90eqwKdAudPqUg5sjI/gut8/LaJACfa7sO
YNJh9IRo3Ufqg72ILDGN2HQ=
=AFRy
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
