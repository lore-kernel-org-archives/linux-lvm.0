From: Thomas Bader <thomasb@trash.net>
Message-ID: <20011214185558.A11845@trash.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Does LVM compile on Sparc64?
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
Date: Fri Dec 14 11:54:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi Everybody

I got the source of Linux 2.2.20 and applied the patches of
LVM 1.0.1 (including Stephen Tweedie's rawio patch and
linux-2.2.18-sparc64.diff).

The patches do apply well, but it seems like there are some
missing definitions in include/linux/lvm.h:

duke:/usr/src/linux# make vmlinux
[snipped]
sparc64-linux-gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prot=
otypes -O2 -fomit-frame-pointer -fno-strict-aliasing -m64 -pipe -mno-fpu -m=
cpu=3Dultrasparc -mcmodel=3Dmedlow -ffixed-g4 -fcall-used-g5 -fcall-used-g7=
 -Wno-sign-compare   -c -o ioctl32.o ioctl32.c
ioctl32.c: In function `do_lvm_ioctl':
ioctl32.c:2570: warning: assignment makes pointer from integer without a ca=
st
ioctl32.c:2604: structure has no member named `inode'
ioctl32.c:2645: warning: assignment from incompatible pointer type
ioctl32.c:2646: structure has no member named `inode'
ioctl32.c:2653: structure has no member named `inode'
ioctl32.c:2666: structure has no member named `inode'
ioctl32.c:2545: warning: `v' might be used uninitialized in this function
make[1]: *** [ioctl32.o] Error 1
make[1]: Leaving directory `/usr/src/linux-2.2.20-RAID/arch/sparc64/kernel'
make: *** [_dir_arch/sparc64/kernel] Error 2
duke:/usr/src/linux#

ioctl32.c:2604 looks like:

v->pv[i]->pe =3D NULL; v->pv[i]->inode =3D NULL;

v makes use of vg_t and v->pv makes use of pv_t (both
defined in lvm.h)

lvm.h on sparc64 is completly different than on Intel.  I'm
just wondering now, if all the stuff gets fixed, if I apply
the struct member 'inode' to pv_t, like it is done on Intel.

Or are there any other patches, to run LVM 1.0.1 on sparc64?

Thanks & Cheers
Thomas
--=20
  .-.   Thomas Bader =B7 thomasb@trash.net.remove =B7 http://www.t-bader.ch=
/  .-.
  oo|                                                                     o=
o|
 /`'\     Einen Unix-Shellaccount gibt es unter http://www.trash.net/    /`=
'\
(\_;/)       PGP Key-ID: 0x3A4B7F5D (RSA)  0x7584F5D8 (DSA/EG)          (\_=
;/)
