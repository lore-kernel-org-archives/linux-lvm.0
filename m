Subject: Re: [linux-lvm] file system larger than lv
Message-ID: <20021115134816.GL8377@pc.ilinx>
References: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM> <20021115115831.B11618@sistina.com> <20021115122708.GK8377@pc.ilinx> <20021115135424.A12164@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KQSGybwJm5+gcNx6"
Content-Disposition: inline
In-Reply-To: <20021115135424.A12164@sistina.com>
From: lvm@interlinx.bc.ca
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
Date: Fri Nov 15 07:50:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--KQSGybwJm5+gcNx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2002 at 01:54:24PM +0100, Heinz J . Mauelshagen wrote:
>=20
> Brian,

Hi Heinz.

> yes, at the end of the day you can't prevent people with the necessary
> credentials from shooting themselves in the foot anyways.
> That occasionally includes me.
> At least at ~4pm in the morning ;)

I hear ya.  Me too.  :-)

> Because LVM is a block layer service transparent to filesystems or any ot=
her
> arbitrary block device user, it should just cover the necessary block dev=
ice
> functionality.

I don't disagree with that.

> Putting additional overloading block/filesystem layer services not necess=
arily
> needed there into the kernel is unlikely to be accepted either IMO.

No.  No.  Not in the kernel.  I mean the user space tools can simply
check what data is on the block device (i.e. look for a known
signature of given filesystems) and see if it can determine if it is
indeed a filesystem.

> Controlling LVM block device and filesystem changes in userspace with an
> (e2)fsadm tool is a "helping hand" for the unexperienced, not limiting
> the experienced user.
> This is our prefered way to go.

That is fair enough.  And I don't care that strongly about this issue,
but just thought of how many tools (in their "interactive mode"
anyway) stop and ask a user before they are about to do something
potentially disasterous.

b.

--=20
Brian J. Murrell

--KQSGybwJm5+gcNx6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE91Psbl3EQlGLyuXARAvZNAKC3yofruNgR06pusr0JsNUhtG2l+QCfQHiJ
DJa+MomrHo0beZbm/8LyyWE=
=k2bk
-----END PGP SIGNATURE-----

--KQSGybwJm5+gcNx6--
--KQSGybwJm5+gcNx6--
