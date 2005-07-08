Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j68GeBV18829
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:40:11 -0400
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j68Ge5cJ026688
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:40:05 -0400
Date: Fri, 8 Jul 2005 18:39:58 +0200
From: Bastian Blank <bastian@waldi.eu.org>
Subject: Re: [linux-lvm] Moving PEs within a PV for defragmentation
Message-ID: <20050708163958.GD15561@wavehammer.waldi.eu.org>
References: <20050708143331.GA15561@wavehammer.waldi.eu.org>
	<20050708144006.GR12337@agk.surrey.redhat.com>
	<20050708162635.GC15561@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline
In-Reply-To: <20050708162635.GC15561@wavehammer.waldi.eu.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2005 at 06:26:35PM +0200, Bastian Blank wrote:
> | Program received signal SIGSEGV, Segmentation fault.
> | 0x0807e265 in lv_split_segment (lv=3D0x80f64d0, le=3D1079) at metadata/=
merge.c:209
> | 209                             log_debug("Split %s:%u[%u] at %u: %s PE=
 %u", lv->name,
> | (gdb) bt
> | #0  0x0807e265 in lv_split_segment (lv=3D0x80f64d0, le=3D1079) at metad=
ata/merge.c:209
> | #1  0x08081c3a in insert_pvmove_mirrors (cmd=3D0x80b9120, lv_mirr=3D0x8=
0fb410, source_pvl=3D0x0, lv=3D0x80f64d0,=20
> |     allocatable_pvs=3D0x80fb010, alloc=3DALLOC_ANYWHERE, lvs_changed=3D=
0x80fb4b8) at metadata/mirror.c:220
> | #2  0x0805b686 in pvmove (cmd=3D0x80b9120, argc=3D2, argv=3D0xbffff8d8)=
 at pvmove.c:185
> | #3  0x08054fda in _run_command (cmd=3D0x80b9120, argc=3D2, argv=3D0xbff=
ff8d8) at lvmcmdline.c:858
> | #4  0x08055da6 in lvm2_main (argc=3D6, argv=3D0xbffff8c8, is_static=3D0=
) at lvmcmdline.c:1416
> | #5  0x08064376 in main (argc=3D7, argv=3D0xbffff8c4) at lvm.c:20

| (gdb) info locals
| split_seg =3D (struct lv_segment *) 0x8111cb0
| s =3D 0
| offset =3D 1079
| area_offset =3D 1079
| (gdb) p *split_seg
| $2 =3D {list =3D {n =3D 0x0, p =3D 0x0}, lv =3D 0x810cbe8, segtype =3D 0x=
80f8d04, le =3D 1079, len =3D 201, status =3D 0, stripe_size =3D 0, area_co=
unt =3D 1, area_len =3D 201, origin =3D 0x0, cow =3D 0x0, origin_list =3D {=
n =3D 0x0, p =3D 0x0}, chunk_size =3D 0, region_size =3D 0, extents_copied =
=3D 0, log_lv =3D 0x0, tags =3D {n =3D 0x8111cf8, p =3D 0x8111cf8}, area =
=3D 0x8111d00}
| (gdb) p split_seg.area[0]
| $4 =3D {type =3D AREA_PV, u =3D {pv =3D {pvseg =3D 0x0}, lv =3D {lv =3D 0=
x0, le =3D 0}}}
| (gdb) p *seg
| $6 =3D {list =3D {n =3D 0x810cc68, p =3D 0x810cc68}, lv =3D 0x810cbe8, se=
gtype =3D 0x80f8d04, le =3D 0, len =3D 1079, status =3D 0, stripe_size =3D =
0, area_count =3D 1, area_len =3D 1079, origin =3D 0x0, cow =3D 0x0, origin=
_list =3D {n =3D 0x0, p =3D 0x0}, chunk_size =3D 0, region_size =3D 0, exte=
nts_copied =3D 0, log_lv =3D 0x0, tags =3D {n =3D 0x810d678, p =3D 0x810d67=
8}, area =3D 0x810d680}
| (gdb) p seg.area[0]
| $7 =3D {type =3D AREA_PV, u =3D {pv =3D {pvseg =3D 0x810d290}, lv =3D {lv=
 =3D 0x810d290, le =3D 0}}}

Bastian

--=20
You canna change the laws of physics, Captain; I've got to have thirty minu=
tes!

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iEYEARECAAYFAkLOrF4ACgkQnw66O/MvCNEsZACdH6W2Z4PXK/1XKFhTeN5j07Tf
NikAn0dOa2mDb0205/fBAxeXApvDIroI
=6faf
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
