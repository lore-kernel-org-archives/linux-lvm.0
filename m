Return-Path: <mjt@tls.msk.ru>
Message-ID: <3AA7B14D.BDC73993@tls.msk.ru>
Date: Thu, 08 Mar 2001 19:20:29 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PB: undefined reference to memset
References: <3A5775ED.32380632@libertysurf.fr>
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

Do not use recent gcc for kernels yet, use egcs instead.
If on redhat (or some others), `kgcc' can help.

Regards,
 Michael

Philippe Lefevre wrote:
>=20
> Hello all,
>=20
> Changing my system release, I patched my kernel 2.2.17 with
> lvm-0.9-2.2.17-stock.patch and linux-2.2.17-rawio.patch
> Apparently, there was no errors.
>=20
> Then compiling my new kernel, I get this message:
>=20
> drivers/block/block.a(lvm.o): In function `lvm_do_vg_rename':
> lvm.o(.text+0x295a): undefined reference to `memset'
> lvm.o(.text+0x2972): undefined reference to `memset'
> make: *** [vmlinux] Erreur 1
>=20
> I didn't find the same problem described in the mailing list.
>=20
> Somebody can help ??
>=20
> In advance thank you !!
> --
> ----------------------------------------------------------------------
> Linux 2.2.17 | Philippe Lefevre   E-mail: ph.l@libertysurf.fr |  =3D=EF=
=BF=BD)
>              |                                                |  /\\
> ----------------------------------------------------------------_\_V--
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
