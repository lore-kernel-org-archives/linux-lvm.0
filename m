From: Adam McDaniel <adamm@array.org>
Subject: Re: [linux-lvm] vg_read_with_pv_and_lv error
Message-ID: <20020823170025.GB24937@grimlock>
References: <20020822174612.GA8692@grimlock> <XFMail.20020822195818.cfreeze@alumni.clemson.edu> <20020823103252.A8639@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <20020823103252.A8639@sistina.com>
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
Date: Fri Aug 23 12:00:05 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2002 at 10:32:52AM +0200, Heinz J . Mauelshagen wrote:
> Have you tried uuid_fixer from ftp://ftp.sistina.com/pub/LVM/contrib/ in
> case it was a missing PV-UUID in the PV-UUID list yet ?

Yes, and I think it has the right idea. The only problem is that it
has too many consistency checks, which I know for a fact that my
scenario will fail upon.

Since I've already practically lost my data, there is probably no
extra risk in disabling those checks and forcing it to do the
modificiation. Working off a dd'd image of the hd via a loopback
device minimizes any further data loss anyways.

> People make backups! ;-)

Yeah.. uhm. That *WAS* the backup :)

Atleast I won't be making this mistake again..=20

--=20
Adam McDaniel
Array Networks
Calgary, AB, Canada

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9ZmopIHy9fg7fMMMRApwcAJ0WlDs3iex1lFqlJcnE1h4kp6AXBgCbBQ8Y
yXWACC/xBkpMzG8WDifXGrs=
=lAHL
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
