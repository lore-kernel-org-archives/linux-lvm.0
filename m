Message-ID: <3BBD6A34.439845AA@promofinarsa.es>
Date: Fri, 05 Oct 2001 10:07:16 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] no such member 'de'
References: <20011004170447.A17897@reason.marist.edu>
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

Hi, Michael:

urmk@reason.marist.edu wrote:
>=20
> LVM 1.0.1rc4, Linux 2.2.19 stock kernel:
>=20
> I applied the rawio patch for 2.2.18 (no errors, a few fuzzy offsets).
> Configured LVM, ran make in the PATCHES dir.
> Applied the newly made LVM patch.  Again, no errors, some fuzzy offsets.
> Configured LVM support in the kernel.
>=20
> Make fails, with:
>=20
> cc -D__KERNEL__ -I/usr/src/linux-2.2.19/include -Wall -Wstrict-prototypes=
 -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe -fno-strengt=
h-reduce -m486 -malign-loops=3D2 -malign-jumps=3D2 -malign-functions=3D2 -D=
CPU=3D586   -c -o lvm.o lvm.c
> lvm.c: In function `lvm_do_lv_create':
> lvm.c:2192: structure has no member named `de'
> lvm.c: In function `lvm_do_lv_remove':
> lvm.c:2277: structure has no member named `de'
> make[3]: *** [lvm.o] Error 1
> make[3]: Leaving directory `/usr/src/linux-2.2.19/drivers/block'
> make[2]: *** [first_rule] Error 2
> make[2]: Leaving directory `/usr/src/linux-2.2.19/drivers/block'
> make[1]: *** [_subdir_block] Error 2
> make[1]: Leaving directory `/usr/src/linux-2.2.19/drivers'
>=20

It's have been described.  Look for the thread "kernel 2.2.19 support".
I *hope* this will be repaired on next rc.
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
