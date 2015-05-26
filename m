Date: Tue, 26 May 2015 14:05:34 +0200
From: Christian Hesse <list@eworm.de>
Message-ID: <20150526140534.4b04c406@leda.localdomain>
In-Reply-To: <55643397.7010609@redhat.com>
References: <20150521141955.70ebe714@leda.localdomain>
	<5562CC3F.9010901@redhat.com>
	<20150525183650.36634482@leda.localdomain>
	<20150526100620.487e7703@leda.localdomain>
	<55643397.7010609@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/aKihi2Ic8=3yRNH=jsV/5n7";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] autoactivation fails
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Ondrej Kozina <okozina@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--Sig_/aKihi2Ic8=3yRNH=jsV/5n7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ondrej Kozina <okozina@redhat.com> on Tue, 2015/05/26 10:49:
> On 05/26/2015 10:06 AM, Christian Hesse wrote:
> > Christian Hesse <list@eworm.de> on Mon, 2015/05/25 18:36:
> >
> > Actually running v2.02.220 with commit f8bf6410 on top. Volumes are
> > activated, but udev reports:
> >
> > timeout, giving up waiting for workers to finish
> >
> > This adds a boot delay of 30 seconds. Not perfectly sure if this is an
> > lvm2 issue though, chances are that this is caused by systemd v220
> > update. Any ideas?
>
> Could you try to boot with udev in debug mode? I'm not sure if it's same=
=20
> as with Fedora distribution. It should be enough to put 'debug' keyword=20
> among kernel parameters, though I'm not sure about Arch Linux distributio=
n.
>=20
> Paste udev debug messages here. Look for lines containing pvscan but the=
=20
> reason for such timeout may be completely lvm2 unrelated.
>=20
> Also I'm slightly confused here. Do we speak about system w/o systemd=20
> involved at all? Or do Arch Linux boot to initramfs w/o systemd and=20
> switch to systemd after root being actually mounted?
>=20
> And on last question, do you ship upstream udev rules or do you install=20
> Arch Linux specific rules?

First of all... It's not related to lvm2.
Even a system without lvm2 hook in initramfs is effected.

Looks like this is an upstream udev issue:
https://bugs.freedesktop.org/show_bug.cgi?id=3D90051

I will not bother you with any details of my system. ;)

Thanks a lot anyway!
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/aKihi2Ic8=3yRNH=jsV/5n7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVZGGOAAoJEIlFIdfMgPR27BoH/0iwC95ahgfwTuxKB4cempVn
GPLv+U8fZWUEVCvJUiH0AwmZxANCjMK4GB3dVxgkh8r27DShiCvgzPiXupV2d9uU
0RuIa+2/ArXipei7LsfgucEfTlQOAEiKVRcVGxjRAEvCFewNSgeqiIJVAAvAr60x
GI7mDMNus4oP/RleSpbiuBIljZZmc7fjqet6U+40BX5vPAQgWQrCl/Nw28l7bB5Q
Kqk8uDppCPXv1wBO4V1EFVcAwK/YoZswzNWfS7UniHlCWqaZWlsh3Pz6TtsPSF7J
85fCoauetbzAQpbqkUD2TDaHIVaY1qBqJlOw1W4wMCsdc6lo03+jyrIcvTxA1Zo=
=SZY4
-----END PGP SIGNATURE-----

--Sig_/aKihi2Ic8=3yRNH=jsV/5n7--
