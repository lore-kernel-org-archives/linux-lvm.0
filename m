Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
From: Daniel Whicker <daniel.whicker@solidsystems.com>
In-Reply-To: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
References: <Pine.LNX.4.44.0202061338480.13203-100000@dragon.inside.ntisys.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-zlRZX8vmlIBrbwPMlQI9"
Message-Id: <1013024531.21447.19.camel@Daniel>
MIME-Version: 1.0
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
Date: Wed Feb  6 13:39:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-zlRZX8vmlIBrbwPMlQI9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Ben,
	I think you missed a very important aspect.  The actual investment of
the tape drives.  A SDLT or LTO drive is going to run from about $4000
on up.  According to datacomm warehouse, a HP 230 external LTO drives
runs $3700.  An SDLT drive runs $4300.  You can't compare just the media
costs with that of the drive.  Let's consider a 1TB of data.

SDLT:
$4300 + (10 tapes * $50) =3D $4800

LTO:
$3700 + (10 tapes * $130) =3D $5000

AIT2:
$2800 + (20 tapes * $90) =3D $4600

IDE:
10  Drives * 270 =3D $2700

DDS4:
$900 + (50 tapes * $24) =3D $2100

From these numbers (using DataComm Warehouse pricing), you can see that
to backup 1TB, the IDE drives are actually the second cheapest.  And
from a raw performance point of view, they far exceed all the other
alternatives from a random access standpoint, and they are comparable to
even LTO from a transfer rate point of view.

Sorry... had to address this point.

On Wed, 2002-02-06 at 13:14, Benjamin Scott wrote:
>   Here are some prices from a recent Datacomm Warehouse catalog:
>=20
>   Item            GB   Cost  $/GB
>   --------------  ---  ----  ----
>   IDE HDD         100   270  2.70
>   AIT2             50    90  1.80
>   SuperDLT        110   150  1.36
>   LTO Ultrium     100   130  1.30
>   DDS-4            20    24  1.20
>=20
>   As you can see, hard disk is actually the most expensive media, not the
> least.  This whole "hard disks are cheaper" thing is a myth propagated by
> people who have never actually looked at the numbers.


--=-zlRZX8vmlIBrbwPMlQI9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8YYcS/kvcHM2+TjwRAiioAJ9EkkRbIU7DxTIToiKOJQHDXWXgtgCghv3j
bTUKN8DCXYOBp47yt/MRAuY=
=stlE
-----END PGP SIGNATURE-----

--=-zlRZX8vmlIBrbwPMlQI9--
