Return-Path: <treed@ultraviolet.org>
Date: Mon, 6 Aug 2001 18:46:31 -0700
From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010806184631.B31054@ultraviolet.org>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com> <20010805202558.A13863@colombina.comedia.it> <20010805234715.A30768@vestdata.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <20010805234715.A30768@vestdata.no>; from lvm@ragnark.vestdata.no on Sun, Aug 05, 2001 at 11:47:16PM +0200
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

--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 05, 2001 at 11:47:16PM +0200, Ragnar Kj=F8rstad wrote:
> If I remember correctly, you configure as "multipath" not "raid1".=20

Cool! I think I've heard about this patch once before. I will have to give
it a try.  Dual-pathing is something we have been wanting for a long time.
Do you think this patch something that is likely to one day be merged with
the kernel such that we can count on it being with us for a while?

> Another alternative is the linux-driver for the SUN T3. I haven't tried
> it myself, but supposedly one can use the same driver for other
> dual-path RAIDs as well.

Does anyone know of any driver for Clariion based disk arrays? I don't
think the Sun T3 uses Clariion does it? We have a ton (many tons,
literally :) that we are currently using with Solaris that we would love
to be able to attach to Linux systems. These things are hardware RAID
arrays with dual RAID controllers in them. When one RAID controller fails
something special has to be done to transfer the LUNs from the dead
controller over to the live one. They call this "ATF" or "Automatic
Transparent Failover" and they don't seem to ship it for Linux. Only NT
and Solaris. I've tried talking them into considering it but not had any
success.

--=20
Tracy Reed      http://www.ultraviolet.org
This is Linux Country. On a quiet night, you can hear Windows NT reboot!

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjtvSHcACgkQ9PIYKZYVAq0oOwCeMha3FI7n7oqdZIdTXgQgolWz
QUkAoIuPfMOBvfBQiY7+cKx5LzyIGh9t
=S2j+
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
