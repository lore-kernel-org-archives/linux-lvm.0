Message-ID: <3BBC535B.59D6A5CB@promofinarsa.es>
Date: Thu, 04 Oct 2001 14:17:31 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] kernel 2.2.19 support
References: <3BBC4146.51CD437D@promofinarsa.es>
		<wv669v3b96.fsf@freeze.oslo.dnmi.no> <3BBC4E6E.BCA3EE70@promofinarsa.es> <wvzo771uju.fsf@freeze.oslo.dnmi.no>
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

Hi Again:

Adrian Phillips wrote:
>=20

[...]

> Ah, sorry, you're talking about a newer lvm, I'm still using
> 0.9.1beta7. I couldn't quite follow your previous mails but are you
> saying that the raw-io patch is the one causing problems ?
>=20
> Sincerely,
>=20

I'm trying now lvm-1.0.1rc4 onto kernel 2.2.19
Raw-io patch applied is that for 2.2.18 (I tested both with that from
kernel.org, and the one provided within the lvm tar).  I don't know if
the problem comes from raw-io or lvm itself (I don't even know why or
when raw-io patch is needed on 2.2 kernel series).  What I can say is
that the problem shows up in the making modules phase at the lvm.c
file.  It is used there an struct member that doesn't seem to be defined
anywhere else.

I imagine it can be either a "real" bug/incompatibility with kernel
2.2.19, or one resulting from bad patching (even though both patches
-that for raw-io and the one for lvm, applied cleanly).

I only tested (succesfully) kernel 2.2.18 with lvm 1.0, and (failed)
kernel 2.2.19 agains lvm-1.0.1rc3 & 4; this evening I will try 2.2.19
against 1.0 to see what happens.
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
