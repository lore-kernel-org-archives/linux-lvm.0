From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200311301742.37307.arekm@pld-linux.org>
Subject: [linux-lvm] LVM2 compilation problem
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
Date: Sun Nov 30 10:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I'm trying to compile LVM2 2.00.08 tools but:

athlon-pld-linux-gcc -c -I. -I../include -O2 -march=3Dathlon -DLVM1_INTERNA=
L=20
=2DDDEVMAPPER_SUPPORT -DO_DIRECT_SUPPORT -DHAVE_LIBDL -DHAVE_GETOPTLONG -fP=
IC=20
=2DWall -Wundef -Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes=
=20
=2DWmissing-declarations -Wnested-externs -Winline activate/fs.c -o=20
activate/fs.o
activate/dev_manager.c: In function `_info_run':
activate/dev_manager.c:296: error: `DM_DEVICE_MKNODES' undeclared (first us=
e=20
in this function)
activate/dev_manager.c:296: error: (Each undeclared identifier is reported=
=20
only once
activate/dev_manager.c:296: error: for each function it appears in.)
activate/dev_manager.c: In function `_create_dev':
=2E./include/pool.h:112: warning: inlining failed in call to `pool_zalloc'
activate/dev_manager.c:1166: warning: called from here
make[1]: *** [activate/dev_manager.o] B=B3=B1d 1
make[1]: *** Oczekiwanie na niezako=F1czone zadania....
make[1]: Opuszczenie katalogu `/home/users/misiek/rpm/BUILD/LVM2.2.00.08/li=
b'

kernel headers from 2.6.0test10

=2D-=20
Arkadiusz Mi=B6kiewicz    CS at FoE, Wroclaw University of Technology
arekm.pld-linux.org AM2-6BONE, 1024/3DB19BBD, arekm(at)ircnet, PLD/Linux
