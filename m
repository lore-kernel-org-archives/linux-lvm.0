Message-ID: <3BBAFE63.1A5D0631@promofinarsa.es>
Date: Wed, 03 Oct 2001 14:02:43 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problem compiling LVM on 2.2.19
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

Hi, list:

This is my first post, but I didn't see nothing regarding this issue at
the list digests, so I send here:
ENVIRONMENT:
Red Hat 6.2
Kernel 2.2.19 (stock, directly downloaded from linuxkernel.org)
LVM 1.0.1-rc3

I applied the LVM included patch for raw-io: linux-2.2.18-rawio.patch
(as suggested for 2.2.19 somewhere else)
	command I used to patch was `patch -s -p1 < linux-2.2.18-rawio.patch`
	It seemed to apply cleanly.
Then I run `./configure` from base directory for LVM 1.0.1-rc3, and
seemed to run properly (LVM 1.0.1-rc2 had an error on some keywork
substitution)
Then I run `make` from the PATCHES directory, and there appeared the
"lvm-1.0.1-rc3-2.2.19-LVM-Nav01.patch", which I applied to linux sources
the same way than the previous one.
I configured then the kernel, marking LVM support as a module (support
for /proc filesystem was already added to the kernel; the same goes with
linnear support).
Then I run:
make dep
make clean
make bzImage
This seemed to go all well and good
Then, when `make modules`, the compilation stops.  This seems to be the
relevant part:

lvm.c: In function `lvm_do_lv_create':
lvm.c:2192: structure has no member named `de'
lvm.c: In function `lvm_do_lv_remove':
lvm.c:2277: structure has no member named `de'
lvm.c: At top level:
lvm.c:326: warning: `__update_hardsectsize' declared `static' but never
defined
lvm.c:1891: warning: `__update_hardblocksize' defined but not used
make[2]: *** [lvm.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.2.19/drivers/block'
make[1]: *** [_modsubdir_block] Error 2
make[1]: Leaving directory `/usr/src/linux-2.2.19/drivers'
make: *** [_mod_drivers] Error 2

That line 2192, is this one:

lvm_gendisk.part[MINOR(lv_ptr->lv_dev)].de =3D lvm_fs_create_lv(vg_ptr,
lv_ptr);

So, it seems, lvm_gendisk.part structure array lacks of that member "de"
Any hints? Is this a known bug?
TIA
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
