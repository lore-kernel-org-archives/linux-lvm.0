Date: Thu, 21 May 2015 20:57:34 +0200
From: Christian Hesse <list@eworm.de>
Message-ID: <20150521205734.58c3cbf4@leda.localdomain>
In-Reply-To: <555DF532.7050904@redhat.com>
References: <20150521141955.70ebe714@leda.localdomain>
	<555DF532.7050904@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/4cLtS4TZmZ4h/v.kmzXUQrq";
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

--Sig_/4cLtS4TZmZ4h/v.kmzXUQrq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ondrej Kozina <okozina@redhat.com> on Thu, 2015/05/21 17:09:
> Hi Christian,
>=20
> On 05/21/2015 02:19 PM, Christian Hesse wrote:
> > Hello everybody,
> >
> > with recent lvm2 I had problems booting an Arch Linux system with
> > non-systemd initramfs. lvmetad is launched, but volumes are not
> > activated. A git bisect reported this bad commit:
> > commit fe30658a4d5fe4e4e6bb346c9c9ee7142a98f49d
> > Author: Ondrej Kozina <okozina@redhat.com>
>=20
> I would like to ask you for more information about the issue. First,=20
> have you managed to collect any error messages during the init phase=20
> where it's supposed to fail?
>=20
> The thing about that particular commit is it could possibly break=20
> background polling, but I don't see (yet) how it could have damaged the=20
> activation code. Have you tried to reboot a system where any operation=20
> like: pvmove, lvconvert --merge or lvconvert mirror conversion was in=20
> progress in background before you rebooted the system by any chance?

No. And I see this on different systems. It's perfectly reproducable.

> Second step would be to unmute the eventual background processes spawned=
=20
> during activation. To do it just uncomment
>=20
> // #define DEBUG_CHILD
>=20
> in tools/toollib.c:76 lvm2 sources and rebuild.
>=20
> This should expose all error messages from within the forked off=20
> processes.

Defining DEBUG_CHILD does not bring any changes... Not sure where output go=
es
if there is any.

However it looks like the issue is not in lvmetad itself but triggers one
in lvm. lvmetad is running with pid 69, but I see a log entry about
segmentation fault of pid 121:

lvm[121]: segfault at 58 ip 00007f2f24197d20 sp 00007ffe3b499b18 error 4 in
libc.so.6[7f2f24161000+1990000]

Not sure what command lvm is running, though. Probably pvscan, no?

BTW, if I run 'vgchange -ay' (well, actually 'lvm vgchange -ay' as it is a
multicall binary) in rescue shell the volumes are activated and boot
continues.

> Also, if you could perhaps give me some hints how to get the=20
> Arch Linux in the same state as when you experienced the issue it would=20
> help us as well.

I could upload a disk image that demonstrates the issue... Any preferences
about the format?
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/4cLtS4TZmZ4h/v.kmzXUQrq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXiqeAAoJEIlFIdfMgPR2fSQH/RLvpewCHHSUlf6VTC0HyXMK
jPWWPKq67tKdvC07MTHqv2nhg5jsK65C62Mtq6YG0u5UHGxIaO/SZ3+9rAF+6fpT
80xBGmu+Xo9bMAyMsQg4GOwPecLtuin4d1Q1+aFZ5EUm7lcs1SK2UOBH7yJmwe2v
+su1n2G02ACkD+Q1w8s5BVDN9ZCxCIb47MVboNwPMFDJD3i71zxFqwTJJOJ64acy
Sjbz9SBGWv4s7m/9M75T9v7n5plUGQyxIF0V51dEt8vkMLeGStXrbk7s7C928FOU
KuurfNx9hTYPXBKp3j5Ob9buQvZL1Dv8RXyR+LFNwXKId+x4sT5qiVonfkCr2zE=
=G2LY
-----END PGP SIGNATURE-----

--Sig_/4cLtS4TZmZ4h/v.kmzXUQrq--
