Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-3--1037601062"
Message-Id: <559B7C6C-C825-4223-805A-BC80BFF4261A@terrascale.net>
From: AJ Lewis <aj@terrascale.net>
Date: Tue, 11 Apr 2006 11:35:23 -0500
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [PATCH] remove stripe chunk size limitation for striped
	volumes in LVM2
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
Cc: Alasdair Kergon <agk@redhat.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--Apple-Mail-3--1037601062
Content-Type: multipart/mixed; boundary=Apple-Mail-2--1037601297


--Apple-Mail-2--1037601297
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

This patch removes the artificial limitation on stripe size that lvm2  
had for backwards compatibility with lvm1.  It is now only limited by  
the size of the variable used to store the chunk size.

o Adds a new flag 'FMT_UNLIMITED_STRIPESZ' and sets it for format_text.
    lvcreate checks the flag and if it is set, ignores the  
MAX_STRIPE_SIZE.
o There is also a check added in lvcreate.c:_read_stripe_params to  
prevent
    lp->stripe_size from overflowing, but this is not absolutely  
necessary for
    the rest of the patch.
o The 2^30 limitation for stripe chunk size in lvm2 is because of the  
32-bit
    variable that holds the chunks size.  See the comment in  
lvcreate.c for more
    details.
o Note that the check for MAX_STRIPE_SIZE has been moved into  
_lvcreate() so
    that the format flag for the VG can be checked - if there's a way  
to get a
    valid flag in _read_stripe_params() it should be moved back  
there, but the
    cmd->fmt structure there always is format_text.


--Apple-Mail-2--1037601297
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="lvm2_stripe_size_unlimited.patch"
Content-Disposition: attachment;
	filename=lvm2_stripe_size_unlimited.patch

 o Adds a new flag 'FMT_UNLIMITED_STRIPESZ' and sets it for format_text.
   lvcreate checks the flag and if it is set, ignores the MAX_STRIPE_SIZE.
 o There is also a check added in lvcreate.c:_read_stripe_params to prevent
   lp->stripe_size from overflowing, but this is not absolutely necessary for
   the rest of the patch.
 o The 2^30 limitation for stripe chunk size in lvm2 is because of the 32-bit
   variable that holds the chunks size.  See the comment in lvcreate.c for more
   details.
 o Note that the check for MAX_STRIPE_SIZE has been moved into _lvcreate() so
   that the format flag for the VG can be checked - if there's a way to get a
   valid flag in _read_stripe_params() it should be moved back there, but the
   cmd->fmt structure there always is format_text.
diff -Nurp --exclude '*~' --exclude '#*#' LVM2.2.01.15/lib/format_text/format-text.c LVM2.2.01.15.new/lib/format_text/format-text.c
--- LVM2.2.01.15/lib/format_text/format-text.c	2005-09-01 13:37:22.000000000 -0500
+++ LVM2.2.01.15.new/lib/format_text/format-text.c	2006-04-10 11:18:47.000000000 -0500
@@ -1657,7 +1657,7 @@ struct format_type *create_text_format(s
 	fmt->name = FMT_TEXT_NAME;
 	fmt->alias = FMT_TEXT_ALIAS;
 	fmt->features = FMT_SEGMENTS | FMT_MDAS | FMT_TAGS | FMT_PRECOMMIT |
-			FMT_UNLIMITED_VOLS;
+			FMT_UNLIMITED_VOLS | FMT_UNLIMITED_STRIPESZ;
 
 	if (!(mda_lists = dbg_malloc(sizeof(struct mda_lists)))) {
 		log_error("Failed to allocate dir_list");
diff -Nurp --exclude '*~' --exclude '#*#' LVM2.2.01.15/lib/metadata/metadata.h LVM2.2.01.15.new/lib/metadata/metadata.h
--- LVM2.2.01.15/lib/metadata/metadata.h	2005-08-14 18:18:28.000000000 -0500
+++ LVM2.2.01.15.new/lib/metadata/metadata.h	2006-04-10 12:01:22.000000000 -0500
@@ -72,6 +72,7 @@
 #define FMT_RESTRICTED_LVIDS	0x00000010	/* LVID <= 255 */
 #define FMT_ORPHAN_ALLOCATABLE	0x00000020	/* Orphan PV allocatable? */
 #define FMT_PRECOMMIT		0x00000040	/* Supports pre-commit? */
+#define FMT_UNLIMITED_STRIPESZ	0x00000080	/* Unlimited stripe chunk size? */
 
 typedef enum {
 	ALLOC_INVALID,
diff -Nurp --exclude '*~' --exclude '#*#' LVM2.2.01.15/man/lvcreate.8 LVM2.2.01.15.new/man/lvcreate.8
--- LVM2.2.01.15/man/lvcreate.8	2005-09-29 10:50:51.000000000 -0500
+++ LVM2.2.01.15.new/man/lvcreate.8	2006-04-10 11:53:07.000000000 -0500
@@ -57,7 +57,8 @@ the logical volume.
 .I \-I, \-\-stripesize StripeSize
 Gives the number of kilobytes for the granularity of the stripes.
 .br
-StripeSize must be 2^n (n = 2 to 9)
+StripeSize must be 2^n (n = 2 to 9) for LVM1 formatted metadata
+StripeSize must be 2^n (n = 2 to 30) for LVM2 formatted metadata
 .TP
 .I \-l, \-\-extents LogicalExtentsNumber
 Gives the number of logical extents to allocate for the new
diff -Nurp --exclude '*~' --exclude '#*#' LVM2.2.01.15/tools/lvcreate.c LVM2.2.01.15.new/tools/lvcreate.c
--- LVM2.2.01.15/tools/lvcreate.c	2006-03-10 17:03:25.000000000 -0600
+++ LVM2.2.01.15.new/tools/lvcreate.c	2006-04-10 16:01:09.000000000 -0500
@@ -180,6 +180,11 @@ static int _read_size_params(struct lvcr
 	return 1;
 }
 
+/* The stripe size is limited by the size of a uint32_t, but since the
+ * value given by the user is doubled, and the final result must be a
+ * power of 2, we must divide UINT_MAX by four and add 1 (to round it
+ * up to the power of 2) */
+#define STRIPELIMIT ((UINT_MAX >> 2) + 1)
 static int _read_stripe_params(struct lvcreate_params *lp,
 			       struct cmd_context *cmd,
 			       int *pargc, char ***pargv)
@@ -191,6 +196,11 @@ static int _read_stripe_params(struct lv
 			log_error("Negative stripesize is invalid");
 			return 0;
 		}
+		/* Check to make sure we won't overflow lp->stripe_size */
+		if(arg_uint_value(cmd, stripesize_ARG, 0) > (STRIPELIMIT)) {
+			log_error("Stripe size cannot be larger than %u", (STRIPELIMIT));
+			return 0;
+		}
 		lp->stripe_size = 2 * arg_uint_value(cmd, stripesize_ARG, 0);
 	}
 
@@ -218,8 +228,8 @@ static int _read_stripe_params(struct lv
 		return 0;
 	}
 
+	/* MAX size check is in _lvcreate */
 	if (lp->stripes > 1 && (lp->stripe_size < STRIPE_SIZE_MIN ||
-				lp->stripe_size > STRIPE_SIZE_MAX ||
 				lp->stripe_size & (lp->stripe_size - 1))) {
 		log_error("Invalid stripe size %d", lp->stripe_size);
 		return 0;
@@ -485,6 +495,13 @@ static int _lvcreate(struct cmd_context 
 		lp->stripe_size = vg->extent_size;
 	}
 
+	/* Need to check the vg's format to verify this - the cmd format isn't setup properly yet */
+	if (lp->stripes > 1 && (!(vg->fid->fmt->features & FMT_UNLIMITED_STRIPESZ) &&
+				lp->stripe_size > STRIPE_SIZE_MAX)) {
+		log_error("Stripe size cannot be greater than %uKB", STRIPE_SIZE_MAX / 2);
+		return 0;
+	}
+
 	if (lp->size) {
 		/* No of 512-byte sectors */
 		tmp_size = lp->size;

--Apple-Mail-2--1037601297--

--Apple-Mail-3--1037601062
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFEO9rLn95okVnkz6cRAukgAJ9f3RBZabgh3As1SVVuLDtlk1w26wCfevbT
ErUZ/uzAb44lVP+DGGch7bk=
=QUJq
-----END PGP SIGNATURE-----

--Apple-Mail-3--1037601062--
