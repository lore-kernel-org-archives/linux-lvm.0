Message-ID: <3BBB34EF.BF31756E@promofinarsa.es>
Date: Wed, 03 Oct 2001 17:55:27 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem compiling LVM on 2.2.19
References: <3BBAFE63.1A5D0631@promofinarsa.es>
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

Hi again:

Jesus Manuel NAVARRO LOPEZ wrote:
>=20
> Hi, list:
>=20

[...]

> Then, when `make modules`, the compilation stops.  This seems to be the
> relevant part:
>=20
> lvm.c: In function `lvm_do_lv_create':
> lvm.c:2192: structure has no member named `de'
> lvm.c: In function `lvm_do_lv_remove':
> lvm.c:2277: structure has no member named `de'
> lvm.c: At top level:
> lvm.c:326: warning: `__update_hardsectsize' declared `static' but never
> defined
> lvm.c:1891: warning: `__update_hardblocksize' defined but not used
> make[2]: *** [lvm.o] Error 1
> make[2]: Leaving directory `/usr/src/linux-2.2.19/drivers/block'
> make[1]: *** [_modsubdir_block] Error 2
> make[1]: Leaving directory `/usr/src/linux-2.2.19/drivers'
> make: *** [_mod_drivers] Error 2
>=20

...Still exactly same problem with lvm-1.0.1-rc4
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
