Date: Wed, 5 Sep 2001 15:37:03 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] lvcreate segfaults
Message-ID: <20010905153703.A5914@sistina.com>
References: <20010905121129.I32553@turbolinux.com> <Pine.A41.4.21.0109051323340.22482-300000@gigue.dlib.indiana.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <Pine.A41.4.21.0109051323340.22482-300000@gigue.dlib.indiana.edu>; from jomarqua@indiana.edu on Wed, Sep 05, 2001 at 01:32:34PM -0500
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

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2001 at 01:32:34PM -0500, John Marquart wrote:
> Good afternoon,
> 	I am running LVM 1.0.1rc2 on  2.4.8 kernel ontop of a IBM
> Serverraid 4Mx RAID5 filesystem.  I am trying to create a new lv using
> "lvcreate -n foo -L 4M rootvg" - however that command insists on giving me
> a segfault. =20

Here is a patch that should fix this problem.  It has already been applied
to the CVS.  just save this to a file and apply it to the 1.0.1-rc2 source
with the -p0 flag after cd'ing to the 1.0.1-rc2 directory.

Index: tools/lib/liblvm.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/LVM/tools/lib/liblvm.h,v
retrieving revision 1.26
retrieving revision 1.27
diff -u -b -B -r1.26 -r1.27
--- tools/lib/liblvm.h	2001/08/29 13:13:25	1.26
+++ tools/lib/liblvm.h	2001/09/03 08:14:05	1.27
@@ -214,7 +214,7 @@
 int  vg_create_dir_and_group ( vg_t *);
 int  vg_create_dir_and_group_and_nodes ( vg_t *, int);
 void vg_deactivate ( char *);
-inline int vg_extend ( char *, pv_t *, vg_t *);
+int vg_extend ( char *, pv_t *, vg_t *);
 int  vg_free ( vg_t *, int);
 char *vg_name_of_lv ( char *);
 int  vg_remove ( char *);
@@ -222,7 +222,7 @@
 int  vg_read ( char *, vg_t **);
 int  vg_read_from_pv ( char *, vg_t **);
 int  vg_read_with_pv_and_lv ( char *, vg_t **);
-inline int vg_reduce ( char *, pv_t *, vg_t *);
+int vg_reduce ( char *, pv_t *, vg_t *);
 int  vg_remove_dir_and_group_and_nodes ( char *);
 int  vg_set_extendable ( char*);
 void vg_setup_pointers_for_snapshots ( vg_t*);
@@ -317,10 +317,10 @@
 lv_t      *lv_copy_from_disk ( lv_disk_t *);
 lv_disk_t *lv_copy_to_disk ( lv_t *);
 int    lv_count_pe ( pv_t *, int);
-inline int lv_create ( vg_t *, lv_t *, char *);
+int lv_create ( vg_t *, lv_t *, char *);
 int    lv_create_name ( char *, char *, int);
 int    lv_create_node ( lv_t *);
-inline int lv_extend ( vg_t *, lv_t *, char *);
+int lv_extend ( vg_t *, lv_t *, char *);
 int    lv_get_index_by_kdev_t ( vg_t *, kdev_t);
 int    lv_get_index_by_minor ( vg_t *, int);
 int    lv_get_index_by_name ( vg_t *, char *);
@@ -335,9 +335,9 @@
 int    lv_read_COW_table ( vg_t * vg, lv_t * lv);
 int    lv_read_with_pe ( char *, char *, lv_t **);
 int    lv_read_all_lv ( char *, lv_t ***, int);
-inline int lv_reduce ( vg_t *, lv_t *, char *);
+int lv_reduce ( vg_t *, lv_t *, char *);
 int    lv_release ( vg_t *, char *);
-inline int lv_remove ( vg_t *, lv_t *, char *);
+int lv_remove ( vg_t *, lv_t *, char *);
 int    lv_rename ( char *, lv_t *);
 int    lv_setup_for_create ( char *, vg_t **, char *, int *,
                              uint, uint, uint, uint, uint, uint, char **);
Index: tools/lib/lv_create_remove.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/LVM/tools/lib/lv_create_remove.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -b -B -r1.3 -r1.4
--- tools/lib/lv_create_remove.c	2001/04/24 14:29:21	1.3
+++ tools/lib/lv_create_remove.c	2001/09/03 08:14:05	1.4
@@ -39,12 +39,12 @@
 int lv_create_remove ( vg_t *, lv_t *, char *, int);
=20
=20
-inline int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
+int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
    return lv_create_remove ( vg, lv, lv_name, LV_CREATE);
 }
=20
=20
-inline int lv_remove ( vg_t *vg, lv_t *lv, char *lv_name) {
+int lv_remove ( vg_t *vg, lv_t *lv, char *lv_name) {
    return lv_create_remove ( vg, lv, lv_name, LV_REMOVE);
 }
=20
Index: tools/lib/lv_extend_reduce.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/LVM/tools/lib/lv_extend_reduce.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -b -B -r1.3 -r1.4
--- tools/lib/lv_extend_reduce.c	2001/04/24 14:29:21	1.3
+++ tools/lib/lv_extend_reduce.c	2001/09/03 08:14:05	1.4
@@ -36,15 +36,15 @@
 #include <liblvm.h>
=20
 /* internal function */
-inline int lv_extend_reduce ( vg_t *, lv_t *, char *, int);
+int lv_extend_reduce ( vg_t *, lv_t *, char *, int);
=20
=20
-inline int lv_extend ( vg_t *vg, lv_t *lv, char *lv_name) {
+int lv_extend ( vg_t *vg, lv_t *lv, char *lv_name) {
    return lv_extend_reduce ( vg, lv, lv_name, LV_EXTEND);
 }
=20
=20
-inline int lv_reduce ( vg_t *vg, lv_t *lv, char *lv_name) {
+int lv_reduce ( vg_t *vg, lv_t *lv, char *lv_name) {
    return lv_extend_reduce ( vg, lv, lv_name, LV_REDUCE);
 }
=20
Index: tools/lib/system_id.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/LVM/tools/lib/system_id.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -b -B -r1.3 -r1.4
--- tools/lib/system_id.c	2001/04/24 14:29:21	1.3
+++ tools/lib/system_id.c	2001/09/03 08:14:05	1.4
@@ -36,7 +36,7 @@
 #include <liblvm.h>
 #include <sys/utsname.h>
=20
-inline int system_id_set ( char *system_id) {
+int system_id_set ( char *system_id) {
    int ret =3D 0;
    struct utsname uts;
=20
@@ -52,7 +52,7 @@
 }
=20
=20
-inline int system_id_set_exported ( char *system_id) {
+int system_id_set_exported ( char *system_id) {
    int ret =3D 0;
    struct utsname uts;
=20
@@ -69,7 +69,7 @@
 }
=20
=20
-inline int system_id_set_imported ( char *system_id) {
+int system_id_set_imported ( char *system_id) {
    int ret =3D 0;
=20
    debug_enter ( "system_id_set_imported -- CALLED\n");
@@ -84,7 +84,7 @@
 }
=20
=20
-inline int system_id_check_exported ( char *system_id) {
+int system_id_check_exported ( char *system_id) {
    int ret =3D UNDEF;
=20
    debug_enter ( "system_id_check_exported -- CALLED\n");
@@ -101,7 +101,7 @@
 }
=20
=20
-inline int system_id_check_imported ( char *system_id) {
+int system_id_check_imported ( char *system_id) {
    int ret =3D UNDEF;
=20
    debug_enter ( "system_id_check_imported -- CALLED\n");
Index: tools/lib/vg_extend_reduce.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/LVM/tools/lib/vg_extend_reduce.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -b -B -r1.3 -r1.4
--- tools/lib/vg_extend_reduce.c	2001/04/24 14:29:21	1.3
+++ tools/lib/vg_extend_reduce.c	2001/09/03 08:14:05	1.4
@@ -39,12 +39,12 @@
 int vg_extend_reduce ( char *, pv_t *, vg_t *, int);
=20
=20
-inline int vg_extend ( char *vg_name, pv_t *pv, vg_t *vg) {
+int vg_extend ( char *vg_name, pv_t *pv, vg_t *vg) {
    return vg_extend_reduce ( vg_name, pv, vg, VG_EXTEND);
 }
=20
=20
-inline int vg_reduce ( char *vg_name, pv_t *pv, vg_t *vg) {
+int vg_reduce ( char *vg_name, pv_t *pv, vg_t *vg) {
    return vg_extend_reduce ( vg_name, pv, vg, VG_REDUCE);
 }
=20

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
File not found. Should I fake it? (Y/N)
-----End Obligatory Humorous Quote------------------------------------------

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7lozvb2fpvETN3pURAp3VAJ4y0BawCjmAo7O7B2Zll4/WEEnQtQCgtZ9o
kn8rCsb/o00hTb5S2z6EeUU=
=u6oe
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
