Date: Wed, 3 Oct 2001 16:30:57 +0100 (IST)
From: Paul Jakma <paulj@alphyra.ie>
Message-ID: <Pine.LNX.4.33.0110031623270.16480-100000@dunlop.dub.ie.alphyra.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Linux LVM <linux-lvm@sistina.com>

hi,

running lvcreate consistently segfaults on me, eg:

 /lib/lvm-iop10/lvcreate -L 600M -n var_cache_lv Main_VG


#0  0x4004500b in vg_setup_pointers_for_snapshots (vg=3D0x8058038)
    at vg_setup_pointers_for_snapshots.c:37
37	      if ( lv_chain_ptr->lv_access & LV_SNAPSHOT_ORG) {
(gdb) bt
#0  0x4004500b in vg_setup_pointers_for_snapshots (vg=3D0x8058038)
    at vg_setup_pointers_for_snapshots.c:37
#1  0x40045d0d in vg_status_with_pv_and_lv (vg_name=3D0xbffffbe3 "Main_VG=
",=20
    vg=3D0xbffff254) at vg_status_with_pv_and_lv.c:63
#2  0x0804abbd in strcpy ()
#3  0x400767c7 in __libc_start_main (main=3D0x8049370 <strcpy+272>, argc=3D=
6,=20
    ubp_av=3D0xbffffaa4, init=3D0x8048ea8 <_init>, fini=3D0x804beb0 <_fin=
i>,=20
    rtld_fini=3D0x4000db74 <_dl_fini>, stack_end=3D0xbffffa9c)
    at ../sysdeps/generic/libc-start.c:129
(gdb) print *vg         =20
$3 =3D {vg_name =3D "Main_VG", '\000' <repeats 120 times>, vg_number =3D =
0,=20
  vg_access =3D 3, vg_status =3D 5, lv_max =3D 256, lv_cur =3D 6, lv_open=
 =3D 5,=20
  pv_max =3D 256, pv_cur =3D 2, pv_act =3D 2, dummy =3D 0, vgda =3D 0, pe=
_size =3D 8192,=20
  pe_total =3D 3690, pe_allocated =3D 849, pvg_total =3D 0, proc =3D 0x0,=
 pv =3D {
    0xc7c83800, 0xc7c83a00, 0x0 <repeats 255 times>}, lv =3D {0xc7c83c00,=
=20
    0xc7c83e00, 0xc65e3000, 0xc65e3200, 0xc65e3400, 0xc65e3600,=20
    0x0 <repeats 251 times>}, vg_uuid =3D "Main_VG", '\000' <repeats 25 t=
imes>,=20
  dummy1 =3D "\000\000\000`=AE=D0=C7`=AD=D0=C7`=AC=D0=C7", '\000' <repeat=
s 184 times>}
(gdb) print *lv_chain_ptr
Cannot access memory at address 0xc7c83c00

and boom...

any fixes for this? i've tried compiling with both RH's compat-egcs=20
and gcc-2.96-97 compilers, same result each time.

ta,

--paulj
