Message-ID: <1058505481.3f178309b6592@webmail.phys.unsw.edu.au>
From: Melinda Taylor <melinda@phys.unsw.edu.au>
Subject: Re: [linux-lvm] lvm2 compile errors
References: <1058490566.3f1748c60cb94@webmail.phys.unsw.edu.au> <20030718055640.D31325@uk.sistina.com>
In-Reply-To: <20030718055640.D31325@uk.sistina.com>
MIME-Version: 1.0
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
Date: Fri Jul 18 00:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Alasdair G Kergon <agk@uk.sistina.com>:

> On Fri, Jul 18, 2003 at 11:09:26AM +1000, Melinda Taylor wrote:
> > Anyone have any ideas on this one?
> The lines you quoted just say that make stopped because
> of an earlier error.
>=20
> Look for another error message *earlier* in the output.
> Also useful to know exactly which versions you're compiling
> and which architecture (Intel?).

Ok sure. Its a redhat 7.3 system with dual AMDs. I downloaded the latest =
version
from sistina:

device-mapper.1.00.02-rc3
LVM2.2.00.03-rc4

and I am running kernel 2.4.20

Hopefully this helps more:


make[1]: Leaving directory `/root/lvm2/LVM2.2.00.03-rc4/man'
make[1]: Entering directory `/root/lvm2/LVM2.2.00.03-rc4/lib'
gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strin=
gs
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2
device/dev-io.c -o device/dev-io.o
gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strin=
gs
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2
filters/filter-composite.c -o filters/filter-composite.o
gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strin=
gs
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2
filters/filter-persistent.c -o filters/filter-persistent.o
device/dev-io.c: In function `dev_get_size':
device/dev-io.c:215: `BLKGETSIZE64' undeclared (first use in this functio=
n)
device/dev-io.c:215: (Each undeclared identifier is reported only once
device/dev-io.c:215: for each function it appears in.)
make[1]: *** [device/dev-io.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/root/lvm2/LVM2.2.00.03-rc4/lib'
make: *** [lib] Error 2

and if I type make again and again:

[root@astro LVM2.2.00.03-rc4]# make
make -C include
make[1]: Entering directory `/root/lvm2/LVM2.2.00.03-rc4/include'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/root/lvm2/LVM2.2.00.03-rc4/include'
make -C man
make -C lib
make[1]: Entering directory `/root/lvm2/LVM2.2.00.03-rc4/man'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/root/lvm2/LVM2.2.00.03-rc4/man'
make[1]: Entering directory `/root/lvm2/LVM2.2.00.03-rc4/lib'
gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strin=
gs
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2
device/dev-io.c -o device/dev-io.o
gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strin=
gs
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2
locking/file_locking.c -o locking/file_locking.o
device/dev-io.c: In function `dev_get_size':
device/dev-io.c:215: `BLKGETSIZE64' undeclared (first use in this functio=
n)
device/dev-io.c:215: (Each undeclared identifier is reported only once
device/dev-io.c:215: for each function it appears in.)
gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strin=
gs
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2
locking/locking.c -o locking/locking.o
make[1]: *** [device/dev-io.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/root/lvm2/LVM2.2.00.03-rc4/lib'
make: *** [lib] Error 2

Many Thanks,

Melinda
