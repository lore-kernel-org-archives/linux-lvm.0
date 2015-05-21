Date: Thu, 21 May 2015 21:50:03 +0200
From: Christian Hesse <list@eworm.de>
Message-ID: <20150521215003.06916ff3@leda.localdomain>
In-Reply-To: <20150521205734.58c3cbf4@leda.localdomain>
References: <20150521141955.70ebe714@leda.localdomain>
	<555DF532.7050904@redhat.com>
	<20150521205734.58c3cbf4@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/M=xbk2DnYr9lTaT9OzIeslj";
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

--Sig_/M=xbk2DnYr9lTaT9OzIeslj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Christian Hesse <list@eworm.de> on Thu, 2015/05/21 20:57:
> Ondrej Kozina <okozina@redhat.com> on Thu, 2015/05/21 17:09:
> > Hi Christian,
> >=20
> > On 05/21/2015 02:19 PM, Christian Hesse wrote:
> > > Hello everybody,
> > >
> > > with recent lvm2 I had problems booting an Arch Linux system with
> > > non-systemd initramfs. lvmetad is launched, but volumes are not
> > > activated. A git bisect reported this bad commit:
> > > commit fe30658a4d5fe4e4e6bb346c9c9ee7142a98f49d
> > > Author: Ondrej Kozina <okozina@redhat.com>
> >=20
> > I would like to ask you for more information about the issue. First,=20
> > have you managed to collect any error messages during the init phase=20
> > where it's supposed to fail?
> >=20
> > The thing about that particular commit is it could possibly break=20
> > background polling, but I don't see (yet) how it could have damaged the=
=20
> > activation code. Have you tried to reboot a system where any operation=
=20
> > like: pvmove, lvconvert --merge or lvconvert mirror conversion was in=20
> > progress in background before you rebooted the system by any chance?
>=20
> No. And I see this on different systems. It's perfectly reproducable.
>=20
> > Second step would be to unmute the eventual background processes spawne=
d=20
> > during activation. To do it just uncomment
> >=20
> > // #define DEBUG_CHILD
> >=20
> > in tools/toollib.c:76 lvm2 sources and rebuild.
> >=20
> > This should expose all error messages from within the forked off=20
> > processes.
>=20
> Defining DEBUG_CHILD does not bring any changes... Not sure where output
> goes if there is any.
>=20
> However it looks like the issue is not in lvmetad itself but triggers one
> in lvm. lvmetad is running with pid 69, but I see a log entry about
> segmentation fault of pid 121:
>=20
> lvm[121]: segfault at 58 ip 00007f2f24197d20 sp 00007ffe3b499b18 error 4 =
in
> libc.so.6[7f2f24161000+1990000]
>=20
> Not sure what command lvm is running, though. Probably pvscan, no?
>=20
> BTW, if I run 'vgchange -ay' (well, actually 'lvm vgchange -ay' as it is a
> multicall binary) in rescue shell the volumes are activated and boot
> continues.
>=20
> > Also, if you could perhaps give me some hints how to get the=20
> > Arch Linux in the same state as when you experienced the issue it would=
=20
> > help us as well.
>=20
> I could upload a disk image that demonstrates the issue... Any preferences
> about the format?

Ok, here we go...

http://www.eworm.de/tmp/lvm2.vdi.gz

This is is Virtualbox disk image, compressed with bzip2.

It just contains boot loader, kernel and initramfs, but it demonstrates the
issue. Have fun! ;)
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/M=xbk2DnYr9lTaT9OzIeslj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXjbrAAoJEIlFIdfMgPR2qkAIALXpbkUlfi2JXE7St16XQUXL
vJe1I8LRnW63cUYGDtx3n/nkU0SlCYuZit4+Ch2fMpe+WLAKkKu9vuIf2I/0oA8e
kjjf5xhwz0EUmgFMHGh6R19YSmPL749CUcoGzzO44FrLJ1eFujNQo0guqSSvwjgo
DwG74mE46I27wnOemjyV2gSj96YiHDmTX2Ucswq3xfGDWWqMYywTxc7MEtfyRZaA
FeF+35wz8f1/izRHga4F/k1fHUuERUe0nuuRQFL/1i7DMDZ7O+ytuCzD5+i5dvi+
iI7Nu7qEzqc98UhI6z1hvjcHJz5c1tS5ZiM9sZ5Y4+TmWxvnrxbij0wvGcbJLHw=
=FJkS
-----END PGP SIGNATURE-----

--Sig_/M=xbk2DnYr9lTaT9OzIeslj--
