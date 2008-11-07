Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA7BhsEh010982
	for <linux-lvm@redhat.com>; Fri, 7 Nov 2008 06:43:54 -0500
Received: from wavehammer.waldi.eu.org (wavehammer.waldi.eu.org
	[82.139.201.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA7BhgU7006881
	for <linux-lvm@redhat.com>; Fri, 7 Nov 2008 06:43:42 -0500
Date: Fri, 7 Nov 2008 12:45:15 +0100
From: Bastian Blank <bastian@waldi.eu.org>
Message-ID: <20081107114515.GA16019@wavehammer.waldi.eu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] recalculate free space on PE resize
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


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks

This patch makes it possible to extend the size of PE. It recalculates
free space infos. Also it collects all errors which makes a resize fail
before bailing out.

Bastian

Index: lib/metadata/metadata.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvs/lvm2/LVM2/lib/metadata/metadata.c,v
retrieving revision 1.195
diff -u -r1.195 metadata.c
--- lib/metadata/metadata.c	3 Nov 2008 22:14:29 -0000	1.195
+++ lib/metadata/metadata.c	7 Nov 2008 11:39:57 -0000
@@ -567,18 +567,12 @@
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
@@ -587,15 +581,35 @@
 		return 0;
 	}
=20
+	log_debug("Changed %s%s from %u to %u.", desc1, desc2, *extents,
+		  (uint32_t)size);
+
 	*extents =3D (uint32_t) size;
=20
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
 	uint32_t old_size =3D vg->extent_size;
+	uint32_t new_extent_count =3D 0, new_free_count =3D 0;
 	struct pv_list *pvl;
 	struct lv_list *lvl;
 	struct physical_volume *pv;
@@ -603,6 +617,7 @@
 	struct lv_segment *seg;
 	struct pv_segment *pvseg;
 	uint32_t s;
+        int ret =3D 1;
=20
 	vg->extent_size =3D new_size;
=20
@@ -610,26 +625,21 @@
 	    !vg->fid->fmt->ops->vg_setup(vg->fid, vg))
 		return_0;
=20
-	if (!_recalc_extents(&vg->extent_count, vg->name, "", old_size,
-			     new_size))
-		return_0;
-
-	if (!_recalc_extents(&vg->free_count, vg->name, " free space",
-			     old_size, new_size))
-		return_0;
-
 	/* foreach PV */
 	dm_list_iterate_items(pvl, &vg->pvs) {
 		pv =3D pvl->pv;
=20
 		pv->pe_size =3D new_size;
-		if (!_recalc_extents(&pv->pe_count, pv_dev_name(pv), "",
-				     old_size, new_size))
-			return_0;
+		if (!_recalc_extents_adjust(&pv->pe_count, pv_dev_name(pv), "",
+					    old_size, new_size))
+			ret =3D 0;
=20
 		if (!_recalc_extents(&pv->pe_alloc_count, pv_dev_name(pv),
 				     " allocated space", old_size, new_size))
-			return_0;
+			ret =3D 0;
+
+		new_extent_count +=3D pv->pe_count;
+ 		new_free_count +=3D pv->pe_count - pv->pe_alloc_count;
=20
 		/* foreach free PV Segment */
 		dm_list_iterate_items(pvseg, &pv->segments) {
@@ -639,11 +649,11 @@
 			if (!_recalc_extents(&pvseg->pe, pv_dev_name(pv),
 					     " PV segment start", old_size,
 					     new_size))
-				return_0;
-			if (!_recalc_extents(&pvseg->len, pv_dev_name(pv),
-					     " PV segment length", old_size,
-					     new_size))
-				return_0;
+				ret =3D 0;
+			if (!_recalc_extents_adjust(&pvseg->len, pv_dev_name(pv),
+		        			    " PV segment length", old_size,
+			                	    new_size))
+				ret =3D 0;
 		}
 	}
=20
@@ -653,28 +663,28 @@
=20
 		if (!_recalc_extents(&lv->le_count, lv->name, "", old_size,
 				     new_size))
-			return_0;
+			ret =3D 0;
=20
 		dm_list_iterate_items(seg, &lv->segments) {
 			if (!_recalc_extents(&seg->le, lv->name,
 					     " segment start", old_size,
 					     new_size))
-				return_0;
+				ret =3D 0;
=20
 			if (!_recalc_extents(&seg->len, lv->name,
 					     " segment length", old_size,
 					     new_size))
-				return_0;
+				ret =3D 0;
=20
 			if (!_recalc_extents(&seg->area_len, lv->name,
 					     " area length", old_size,
 					     new_size))
-				return_0;
+				ret =3D 0;
=20
 			if (!_recalc_extents(&seg->extents_copied, lv->name,
 					     " extents moved", old_size,
 					     new_size))
-				return_0;
+				ret =3D 0;
=20
 			/* foreach area */
 			for (s =3D 0; s < seg->area_count; s++) {
@@ -685,32 +695,38 @@
 					     lv->name,
 					     " pvseg start", old_size,
 					     new_size))
-						return_0;
+						ret =3D 0;
 					if (!_recalc_extents
 					    (&seg_pvseg(seg, s)->len,
 					     lv->name,
 					     " pvseg length", old_size,
 					     new_size))
-						return_0;
+						ret =3D 0;
 					break;
 				case AREA_LV:
 					if (!_recalc_extents
 					    (&seg_le(seg, s), lv->name,
 					     " area start", old_size,
 					     new_size))
-						return_0;
+						ret =3D 0;
 					break;
 				case AREA_UNASSIGNED:
 					log_error("Unassigned area %u found in "
 						  "segment", s);
-					return 0;
+					ret =3D 0;
 				}
 			}
 		}
=20
 	}
=20
-	return 1;
+	vg->extent_count =3D new_extent_count;
+	vg->free_count =3D new_free_count;
+
+	if (ret =3D=3D 0)
+		stack;
+
+	return ret;
 }
=20
 /*
Index: tools/vgchange.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvs/lvm2/LVM2/tools/vgchange.c,v
retrieving revision 1.66
diff -u -r1.66 vgchange.c
--- tools/vgchange.c	3 Nov 2008 22:14:30 -0000	1.66
+++ tools/vgchange.c	7 Nov 2008 11:40:00 -0000
@@ -409,14 +409,6 @@
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
--=20
First study the enemy.  Seek weakness.
		-- Romulan Commander, "Balance of Terror", stardate 1709.2

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iEYEARECAAYFAkkUKksACgkQnw66O/MvCNH8fQCfVjn2blUPX3Pd+MrsQjTNcsXd
xHAAnAqESb1oRAMJpnoaU8PH0WUI4xac
=sDcc
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
