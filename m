Date: Tue, 26 Jul 2005 14:52:50 -0500
From: AJ Lewis <alewis@redhat.com>
Message-ID: <20050726195250.GX4954@null.msp.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tw5XVHq4jmAOFG53"
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] fix pool format handler to work with pvseg code
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
Cc: agk@redhat.com


--Tw5XVHq4jmAOFG53
Content-Type: multipart/mixed; boundary="D85EWoRcDXv1uhH1"
Content-Disposition: inline


--D85EWoRcDXv1uhH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Here's a very small patch that allows the pool format handler to work prope=
rly
with the pv segment code.  It's a similar fix to the one that was necessary
for the format1 handler.

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--D85EWoRcDXv1uhH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="fix_format_pool.patch"

Tue Jul 26 14:27:36 CDT 2005  alewis@redhat.com
  * Fix format pool handler to work with new pv segment code
diff -rN -u old-LVM2-cvs-testing/lib/format_pool/import_export.c new-LVM2-cvs-testing/lib/format_pool/import_export.c
--- old-LVM2-cvs-testing/lib/format_pool/import_export.c	2005-07-26 14:51:40.000000000 -0500
+++ new-LVM2-cvs-testing/lib/format_pool/import_export.c	2005-07-26 14:27:27.000000000 -0500
@@ -45,7 +45,7 @@
 		get_pool_vg_uuid(&vg->id, &pl->pd);
 		vg->extent_size = POOL_PE_SIZE;
 		vg->status |= LVM_READ | LVM_WRITE | CLUSTERED | SHARED;
-		vg->free_count = 0;
+		vg->free_count = vg->extent_count;
 		vg->max_lv = 1;
 		vg->max_pv = POOL_MAX_DEVICES;
 		vg->alloc = ALLOC_NORMAL;


--D85EWoRcDXv1uhH1--

--Tw5XVHq4jmAOFG53
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC5pSS9QxUqFeMhxURAs5hAKCOqE5f8klH7nwj9gpJcUZLR9TINACgrIBC
9svTjY8JYhQ44UdqeqYA338=
=5yjR
-----END PGP SIGNATURE-----

--Tw5XVHq4jmAOFG53--
