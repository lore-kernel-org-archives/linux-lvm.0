Message-ID: <3BBC4E6E.BCA3EE70@promofinarsa.es>
Date: Thu, 04 Oct 2001 13:56:30 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] kernel 2.2.19 support
References: <3BBC4146.51CD437D@promofinarsa.es> <wv669v3b96.fsf@freeze.oslo.dnmi.no>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi, Adrian:

Adrian Phillips wrote:
>=20
> >>>>> "Jesus" =3D=3D Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinar=
sa.es> writes:
>=20
>     Jesus> Hi list: Anyone knows if there's the intention to properly
>     Jesus> support kernel 2.2.19?  There're neither explicit raw-io
>     Jesus> patches nor lvm ones.
>=20
> Just use the 2.2.18 one,
>=20

Well, Adrian, that's what I'm doing... to no avail.  As I told in a
previous post, though patches apply cleanly, compilation fails because
"de" member on lvm_gendisk.part[MINOR(lv_ptr->lv.dev)].de is not
defined.
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
