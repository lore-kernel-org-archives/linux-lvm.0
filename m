Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j68GQdV14006
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:26:39 -0400
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j68GQc7U015211
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 12:26:39 -0400
Date: Fri, 8 Jul 2005 18:26:35 +0200
From: Bastian Blank <bastian@waldi.eu.org>
Subject: Re: [linux-lvm] Moving PEs within a PV for defragmentation
Message-ID: <20050708162635.GC15561@wavehammer.waldi.eu.org>
References: <20050708143331.GA15561@wavehammer.waldi.eu.org>
	<20050708144006.GR12337@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
In-Reply-To: <20050708144006.GR12337@agk.surrey.redhat.com>
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


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2005 at 03:40:06PM +0100, Alasdair G Kergon wrote:
> On Fri, Jul 08, 2005 at 04:33:31PM +0200, Bastian Blank wrote:
> > Is their a reason why pvmove refuses to move PEs within one PV?
> Does --alloc anywhere help?

It generates a segfault.

| Program received signal SIGSEGV, Segmentation fault.
| 0x0807e265 in lv_split_segment (lv=3D0x80f64d0, le=3D1079) at metadata/me=
rge.c:209
| 209                             log_debug("Split %s:%u[%u] at %u: %s PE %=
u", lv->name,
| (gdb) bt
| #0  0x0807e265 in lv_split_segment (lv=3D0x80f64d0, le=3D1079) at metadat=
a/merge.c:209
| #1  0x08081c3a in insert_pvmove_mirrors (cmd=3D0x80b9120, lv_mirr=3D0x80f=
b410, source_pvl=3D0x0, lv=3D0x80f64d0,=20
|     allocatable_pvs=3D0x80fb010, alloc=3DALLOC_ANYWHERE, lvs_changed=3D0x=
80fb4b8) at metadata/mirror.c:220
| #2  0x0805b686 in pvmove (cmd=3D0x80b9120, argc=3D2, argv=3D0xbffff8d8) a=
t pvmove.c:185
| #3  0x08054fda in _run_command (cmd=3D0x80b9120, argc=3D2, argv=3D0xbffff=
8d8) at lvmcmdline.c:858
| #4  0x08055da6 in lvm2_main (argc=3D6, argv=3D0xbffff8c8, is_static=3D0) =
at lvmcmdline.c:1416
| #5  0x08064376 in main (argc=3D7, argv=3D0xbffff8c4) at lvm.c:20

Bastian

--=20
You!  What PLANET is this!
		-- McCoy, "The City on the Edge of Forever", stardate 3134.0

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iEYEARECAAYFAkLOqTsACgkQnw66O/MvCNGY9ACeLawwBLUOMbN3fJqN1Ga/wmeq
kwkAnAtHdPvoJVQraPO7dPAUyCb2SblY
=AkR3
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
