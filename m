From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Subject: RE: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
Date: Wed, 3 Oct 2001 23:46:56 -0400
Message-ID: <009101c14c87$3705fdc0$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20011003213353.Q8954@turbolinux.com>
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

Wow!  Lots and LOTS of stuff!!  Didn't think it was ever going to end!!

Here's what yer looking for:

#0  lv_create (vg=3D0x8, lv=3D0xbffffb74,=20
    lv_name=3D0xbffffb98
"=A5=FC=FF=BF=AE=FC=FF=BF=BF=FC=FF=BF=E1=FC=FF=BF=EE=FC=FF=BF=B1=FE=FF=BF=
=D0=FE=FF=BF=ED=FE=FF=BF\002=FF=FF=BF!=FF=FF=BF,=FF=FF=BF<=FF=FF=BFD=FF=FF=
=BFT=FF=FF=BFb=FF=FF=BFs=FF=FF=BF\201
=FF=FF=BF\214=FF=FF=BF\227=FF=FF=BF=DA=FF=FF=BF")
    at lv_create_remove.c:42
#1  0x0804b03d in strcpy ()@../sysdeps/generic/strcpy.c:31
#2  0x4006c177 in __libc_start_main (main=3D0x8049390 <strcpy+384>,
argc=3D8, ubp_av=3D0xbffffb74, init=3D0x8048e88 <_init>,=20
    fini=3D0x804b4d0 <_fini>, rtld_fini=3D0x4000e184 <_dl_fini>,
stack_end=3D0xbffffb6c) at ../sysdeps/generic/libc-start.c:129

> -----Original Message-----
> From: linux-lvm-admin@sistina.com=20
> [mailto:linux-lvm-admin@sistina.com] On Behalf Of Andreas Dilger
> Sent: October 3, 2001 11:34 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] lvcreate segfault in=20
> vg_setup_pointers_for_snapshots
>=20
>=20
>=20
> On Oct 03, 2001  23:28 -0400, Jason A. Lixfeld wrote:
> > I'm having the same problem:
> >=20
> > # /sbin/lvcreate -L 111G -n test_lv test_vg
> > Segmentation fault (core dumped)
> > #
> >=20
> > Running:
> > LVM driver LVM version 1.0.1-rc4(03/10/2001)
> > Kernel 2.4.10
> > ext3-2.4-0.9.10-2410
> >=20
> > What's the fix here?!
>=20
> Uh, gdb /sbin/lvcreate (or maybe /lib/lvm-iop10/lvcreate), then
> gdb> r -v -d -L 111G -n test_lv test_vg
> [lots of stuff]
> Segmentation fault (core dumped)
> gdb> info stack
>=20
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound=20
> of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/            =20
>   -- Dogbert
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com=20
> http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> read the=20
> LVM HOW-TO at=20
> http://www.sistina.com/lvm/Pages/howto.html
>=20
