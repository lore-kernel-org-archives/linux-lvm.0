Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Sat, 6 Jan 2001 22:37:32 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] PB: undefined reference to memset
Message-ID: <20010106223732.A1686@66bassett.freeserve.co.uk>
References: <3A5775ED.32380632@libertysurf.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3A5775ED.32380632@libertysurf.fr>; from ph.l@libertysurf.fr on Sat, Jan 06, 2001 at 06:45:49PM -0100
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

Hi,

I just tried it and it worked fine.

Make sure you start with a vanilla kernel 2.2.17
patch with rawio
patch with lvm
config, build etc.

In my haste I forgot to switch on the lvm procfs output option in make
config.  This did failed to compile (another bug for the list), but
it wasn't your error.

- Joe

On Sat, Jan 06, 2001 at 06:45:49PM -0100, Philippe Lefevre wrote:
> Hello all,
>=20
> Changing my system release, I patched my kernel 2.2.17 with=20
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
> --=20
> ----------------------------------------------------------------------
> Linux 2.2.17 | Philippe Lefevre   E-mail: ph.l@libertysurf.fr |  =3D=EF=
=BF=BD)
>              |                                                |  /\\
> ----------------------------------------------------------------_\_V--
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20
