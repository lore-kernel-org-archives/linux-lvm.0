Return-Path: <blutgens@sistina.com>
Date: Mon, 4 Jun 2001 09:21:42 -0500
From: Ben Lutgens <blutgens@sistina.com>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010604092142.A734@minime.sistina.com>
References: <20010604010750.A2560@pc.ilinx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <20010604010750.A2560@pc.ilinx>; from lvm@interlinx.bc.ca on Mon, Jun 04, 2001 at 01:07:50AM -0700
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
To: linux-lvm@sistina.com

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2001 at 01:07:50AM -0700, Brian J. Murrell wrote:
>I know this is starting to become a LILO issue but I think that the
>problem I have is really got to do with LILO and it's interacting with
>LVM.  I have applied Andreas' patch, thanks Andreas.


Just curious, /boot only needs to be like 100 megs tops why would you want
that to be an LV. Isn't it more trouble than it's worth?

>
>When I try to boot with the LVM disk I get "LI" and that is it.  The
>LILO docs say this about "LI":
>
>This means the first-stage loader gained control; it thought it success-
>fully loaded the second-stage loader; but it never got there.  This most
>often occurs when the second-stage loader, '/boot/boot.b', is not load-
>able using the BIOS.
>
>Which would suggest to me that the mapping is not making it through
>LVM correct me.  But I don't really know that much about how LILO
>really works with the underlying device.
>
>My current lilo.conf is:
>
>boot=3D/dev/hdg
>map=3D/boot/map
>install=3D/boot/boot.b
>vga=3D780
>default=3Dlinux
>keytable=3D/boot/us.klt
>lba32
>prompt
>timeout=3D50
>message=3D/boot/message
>
>image=3D/boot/vmlinuz
>    label=3Dlinux
>    root=3D/dev/system/root
>    initrd=3D/boot/initrd-lvm-2.4.5-1.1mdk.gz
>    append=3D" hda=3Dide-scsi devfs=3Dmount video=3Dmatrox:vesa:263"
>    read-only
>
>Anyone got any ideas or run into this before?
>
>b.
>
>--=20
>Brian J. Murrell
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
Ben Lutgens	=09
Sistina Software Inc.=09
MIS Geek / Gentoo Developer=20
http://dolly-llama.org | http://www.gentoo.org/ | http://sistina.com/
Kernel panic: I have no root and I want to scream

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7G5l2LxkxGgLdGQgRAumcAKDNxtw5QoCkub140SUI+TGjuoR4BACfbXRD
FAqU2Ahd6kafxUDe/qVM4Lg=
=ioeW
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
