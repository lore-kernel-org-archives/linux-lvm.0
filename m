Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] rh kernel patches
Date: Wed, 5 Sep 2001 07:34:01 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF404FF4@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I have patched RH 2.4.7 kernel successfully. I understand what you want
to do and must say that it's a *good* thing for 2 reasons:
- having ext3 in the kernel
- having quotas3 in the kernel

To do so, get the redhat sources. Put them in <srcdir> (Ex:
/tmp/linux-2.4.7-rh)
Get the LVM 1.0.1rc2 (not another release) and uncompress them (Ex:
/tmp/LVM/1.0.1rc2)
Then, go in .../LVM/1.0.1-rc2 and run ./configure
--with-kernel_dir=3D<srcdir>
Then make, make install the tools (Note that kernel is not touch at this
point). They yre mandatory to make your LVM system working.
Then go in <srcdir>, and patch your kernel with a patch made by
configure just for your kernel. It's in
.../LVM/1.0.1rc2/PATCHES/lvm_1.0.1rc2-2.4.7.<snip>.patch. It was created
by configure for the kernel you gave in <srcdir>
Then patch it with:
- cd <srcdir>
- patch -p1 < .../LVM/1.0.1rc2/PATCHES/lvm.<snip>.patch

And you are done. (quite...)
Then make bzImage will compile it, except for a little thing: min/max
functions. RH kernel is made from Alan Cox one. And Linus kernel changed
min/max functions. LVM uses Linus min/max functions while -ac (RedHat)
kernel uses old min/max functions.

During the compilation, you'll get errors with files in drivers/md/.
They are lvm.c, lvm-snap.c and perhaps a third I don't remember. To
correct those, just copy the 2 macros in each fault file:
#define min(a,b) (((a)<(b))?(a):(b))
#define max(a,b) (((a)>(b))?(a):(b))
At the beginning of the file (before anything else).

And compile with work.

But if you don't need ext3 nor quotas3, then go with a plain Linus
kernel (available at www.kernel.org), you'll have less problems... :-)

Ask for more help
-jec

> -----Original Message-----
> From: Pierre Lamb [mailto:plamb_98@yahoo.com]=20
> Sent: mardi, 4. septembre 2001 19:56
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] rh kernel patches
>=20
>=20
> Is there a correct way to patch RH kernels. I have
> tried using the "final path" to update 2.4.7 rh kernel
> but just get errors. Is there a work around for this
> problem.
>=20
> Pierre
>=20
> __________________________________________________
> Do You Yahoo!?
> Get email alerts & NEW webcam video instant messaging with=20
> Yahoo! Messenger http://im.yahoo.com
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com=20
> http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> read the=20
> LVM HOW-TO at=20
> http://www.sistina.com/lvm/Pages/howto.html
>=20
