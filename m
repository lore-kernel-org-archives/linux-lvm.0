Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2PCsNYN000692
	for <linux-lvm@redhat.com>; Tue, 25 Mar 2008 08:54:24 -0400
Received: from wavehammer.waldi.eu.org (wavehammer.waldi.eu.org
	[82.139.201.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2PCrqW3028650
	for <linux-lvm@redhat.com>; Tue, 25 Mar 2008 08:53:53 -0400
Date: Tue, 25 Mar 2008 13:53:44 +0100
From: Bastian Blank <bastian@waldi.eu.org>
Message-ID: <20080325125344.GA22327@wavehammer.waldi.eu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
Subject: [linux-lvm] [RFC] Allow pesize change to adjust free values
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


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks

I run again over the problem that vgchange is able to change the size of
a PE, but refuses to recalculate certain free values.

The attached patch seems to work for one PV but it it is not safe for
more. It may change the following things:
- Number of extents in VG.
- Free space of VG.
- Number of extents in PV.
- Size of free PV segment.

Fix for the later: Do PV resize as in this patch. Collect numbers of
removed extents and remove them from the VG.

--- lvm2-2.02.33.orig/tools/vgchange.c
+++ lvm2-2.02.33/tools/vgchange.c
@@ -405,14 +405,6 @@
 		return EINVALID_CMD_LINE;
 	}
=20
-	if (extent_size > vg->extent_size) {
-		if ((uint64_t) vg->extent_size * vg->extent_count % extent_size) {
-			/* FIXME Adjust used PV sizes instead */
-			log_error("New extent size is not a perfect fit");
-			return EINVALID_CMD_LINE;
-		}
-	}
-
 	if (!archive(vg))
 		return ECMD_FAILED;
=20
--- lvm2-2.02.33.orig/lib/metadata/metadata.c
+++ lvm2-2.02.33/lib/metadata/metadata.c
@@ -545,18 +545,12 @@
 	return NULL;
 }
=20
-static int _recalc_extents(uint32_t *extents, const char *desc1,
-			   const char *desc2, uint32_t old_size,
-			   uint32_t new_size)
+static int _recalc_extents_adjust(uint32_t *extents, const char *desc1,
+		        	  const char *desc2, uint32_t old_size,
+			          uint32_t new_size)
 {
 	uint64_t size =3D (uint64_t) old_size * (*extents);
=20
-	if (size % new_size) {
-		log_error("New size %" PRIu64 " for %s%s not an exact number "
-			  "of new extents.", size, desc1, desc2);
-		return 0;
-	}
-
 	size /=3D new_size;
=20
 	if (size > UINT32_MAX) {
@@ -570,6 +564,22 @@
 	return 1;
 }
=20
+static int _recalc_extents(uint32_t *extents, const char *desc1,
+			   const char *desc2, uint32_t old_size,
+			   uint32_t new_size)
+{
+	uint64_t size =3D (uint64_t) old_size * (*extents);
+
+	if (size % new_size) {
+		log_error("New size %" PRIu64 " for %s%s not an exact number "
+			  "of new extents.", size, desc1, desc2);
+		return 0;
+	}
+
+	return _recalc_extents_adjust(extents, desc1, desc2, old_size,
+				      new_size);
+}
+
 int vg_change_pesize(struct cmd_context *cmd __attribute((unused)),
 		     struct volume_group *vg, uint32_t new_size)
 {
@@ -588,12 +598,12 @@
 	    !vg->fid->fmt->ops->vg_setup(vg->fid, vg))
 		return_0;
=20
-	if (!_recalc_extents(&vg->extent_count, vg->name, "", old_size,
-			     new_size))
+	if (!_recalc_extents_adjust(&vg->extent_count, vg->name, "", old_size,
+				    new_size))
 		return_0;
=20
-	if (!_recalc_extents(&vg->free_count, vg->name, " free space",
-			     old_size, new_size))
+	if (!_recalc_extents_adjust(&vg->free_count, vg->name, " free space",
+				    old_size, new_size))
 		return_0;
=20
 	/* foreach PV */
@@ -601,8 +611,8 @@
 		pv =3D pvl->pv;
=20
 		pv->pe_size =3D new_size;
-		if (!_recalc_extents(&pv->pe_count, pv_dev_name(pv), "",
-				     old_size, new_size))
+		if (!_recalc_extents_adjust(&pv->pe_count, pv_dev_name(pv), "",
+					    old_size, new_size))
 			return_0;
=20
 		if (!_recalc_extents(&pv->pe_alloc_count, pv_dev_name(pv),
@@ -618,9 +628,9 @@
 					     " PV segment start", old_size,
 					     new_size))
 				return_0;
-			if (!_recalc_extents(&pvseg->len, pv_dev_name(pv),
-					     " PV segment length", old_size,
-					     new_size))
+			if (!_recalc_extents_adjust(&pvseg->len, pv_dev_name(pv),
+						    " PV segment length", old_size,
+						    new_size))
 				return_0;
 		}
 	}

--=20
Each kiss is as the first.
		-- Miramanee, Kirk's wife, "The Paradise Syndrome",
		   stardate 4842.6

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iEYEARECAAYFAkfo9dgACgkQnw66O/MvCNFvnQCdHyhhpZCCTsxioU5neCxoX/2O
1WEAoJ8e00Mvk2bUZBy+DSmClPEsIEPe
=pJBN
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
