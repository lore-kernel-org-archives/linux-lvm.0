Return-Path: <bg@blacknet.de>
Date: Sat, 7 Apr 2001 02:01:59 +0200
From: Goetz Bock <lvm@blacknet.de>
Subject: Re: [linux-lvm] 2.2.19 Patches??
Message-ID: <20010407020159.B22362@dragon.blacknet.de>
References: <Pine.LNX.4.30.0104061930120.1564-100000@leopard.dorfam.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0104061930120.1564-100000@leopard.dorfam.ca>; from gerry@dorfam.ca on Fri, Apr 06, 2001 at 07:34:47PM -0400
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

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Fri, Apr 06 '01 at 19:34, gerry@dorfam.ca wrote:
> I just spent the better part of a week finding out what patches to apply
> in what order to get the 2.2.17 stock kernel working with lvm.  Now that
> I've got that working it seems like I should go all the way and install
> 2.2.19.
Depends on what you want ;-)

If you're fine with out the new RAID patches, all you need is the RAW-IO
Patch ant the LVM patch. The current 0.9.1_beta6 creates fine patches
for stock 2.2.19 + RawIO (what is included as a patch for 2.2.18, but it
works fine with 2.2.19)

> PS.  I'm running Redhat 7.0.  Are there patches available for the RH
> kernels??
While I used to use Redhat, they screwed it with the 7.0 distribution ...
If you want, you can get a patch for the stock 2.2.19 from me (but you
can easyly make it yourself), and you can find a lot of nice patches for
the 2.2.19 kernel mantained by Paul Drain with some additions by me at:
ftp://ftp.earthlink.au.com/private/people/pd/kernels/individual/2.2.19-fnk/

Paul is currently test my LVM patch (integrated with the new RAID
patches) for functionality (I only was able to compile it and have it
boot my diskless workstation ;-) ). He will add it till Monday.

Have fun,
    Goetz.

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6zlj2f5srOMkjkQoRAipwAKC4cbpS3Gswv1/LExScXQobx/kfaACfbf4L
ZnzkAIgFfJvbNK+yaa0ct6s=
=kEhm
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
