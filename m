From: Wade Curry <wcurry@cts.com>
Message-Id: <20020302191257.GB1060@cts.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
Subject: [linux-lvm] lilo or grub patches
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
Date: Sat Mar  2 13:02:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!


I'm experimenting with lvm on a single ide drive. I plan to put the
root on a logical volume as I have before.  This time around I'd
like to try booting directly from the lv.  I've heard that there
was a patch for grub at
ftp://ftp.openlinux.com/pub/people/hch/lvm/
but that directory no longer exists.

For lilo, I have found a patch for an older version of lilo, but
nothing new.  I tried applying the patch to my newer lilo.  It
failed as expected... but I tried :)

Does anyone know of current patches/work in this area?

Thanks!


Man will occasionally stumble over the truth,
but most pick themselves up as if nothing had happened.
                              - Churchill
GPG Fingerprint: 06D0 CCBF 8F1C 4AA2 EA63  5D60 B605 0A0A FA02 6A9D


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8gSQ5tgUKCvoCap0RAmh+AJ4ojMteb7xpjxykATMcUcnZrTmmJgCfb8vg
g7DYuBacEL1TmXC0Cxr9xZY=
=sMqR
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
