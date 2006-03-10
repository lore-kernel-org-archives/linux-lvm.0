Mime-Version: 1.0 (Apple Message framework v746.2)
Message-Id: <D7950931-6BB6-4FC5-A7E4-3ED09EC2FDA3@terrascale.net>
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-16-516942532"
From: AJ Lewis <aj@terrascale.net>
Date: Fri, 10 Mar 2006 17:21:39 -0600
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Patch to increase the valid stripe sizes for a striped
	volume
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
--Apple-Mail-16-516942532
Content-Type: multipart/mixed; boundary=Apple-Mail-15-516942093


--Apple-Mail-15-516942093
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Hey all,

The following patch increases the maximum stripe size that an LV can  
have from 512k to 128MB.  Would it be possible to apply this to the  
tree (or something like this)?

128MB is fairly arbitrary, but for the application I'm using this  
for, I'd like to be able to have the stripe size at least that big.    
If there is a reason we can't have the stripe size that large, it  
would be helpful to know why - it doesn't appear to be a device- 
mapper limitation - at least not an obvious one.

Thanks,
AJ Lewis

--Apple-Mail-15-516942093
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="increase_stripe_size.patch"
Content-Disposition: attachment;
	filename=increase_stripe_size.patch

diff -Nurp --exclude '*~' LVM2.2.01.15/lib/metadata/metadata.h LVM2.2.01.15.new/lib/metadata/metadata.h
--- LVM2.2.01.15/lib/metadata/metadata.h	2005-08-14 18:18:28.000000000 -0500
+++ LVM2.2.01.15.new/lib/metadata/metadata.h	2006-03-10 17:18:52.000000000 -0600
@@ -30,7 +30,7 @@
 #define SECTOR_SHIFT 9L
 #define SECTOR_SIZE ( 1L << SECTOR_SHIFT )
 #define STRIPE_SIZE_MIN ( getpagesize() >> SECTOR_SHIFT)	/* PAGESIZE in sectors */
-#define STRIPE_SIZE_MAX ( 512L * 1024L >> SECTOR_SHIFT)	/* 512 KB in sectors */
+#define STRIPE_SIZE_MAX ( 131072L * 1024L >> SECTOR_SHIFT)	/* 128 MB in sectors */
 #define PV_MIN_SIZE ( 512L * 1024L >> SECTOR_SHIFT)	/* 512 KB in sectors */
 #define PE_ALIGN (65536UL >> SECTOR_SHIFT)	/* PE alignment */
 #define MAX_RESTRICTED_LVS 255	/* Used by FMT_RESTRICTED_LVIDS */
diff -Nurp --exclude '*~' LVM2.2.01.15/man/lvcreate.8 LVM2.2.01.15.new/man/lvcreate.8
--- LVM2.2.01.15/man/lvcreate.8	2005-09-29 10:50:51.000000000 -0500
+++ LVM2.2.01.15.new/man/lvcreate.8	2006-03-10 17:05:38.000000000 -0600
@@ -57,7 +57,7 @@ the logical volume.
 .I \-I, \-\-stripesize StripeSize
 Gives the number of kilobytes for the granularity of the stripes.
 .br
-StripeSize must be 2^n (n = 2 to 9)
+StripeSize must be 2^n (n = 2 to 17)
 .TP
 .I \-l, \-\-extents LogicalExtentsNumber
 Gives the number of logical extents to allocate for the new

--Apple-Mail-15-516942093--

--Apple-Mail-16-516942532
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFEEgoDn95okVnkz6cRAmt3AKCE7vl0h8emxdMxE0L//trTRsNMogCfZAEM
R7xhHEGBjSYMdb6mHTDuKig=
=NIjE
-----END PGP SIGNATURE-----

--Apple-Mail-16-516942532--
